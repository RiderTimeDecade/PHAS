from flask import Blueprint, render_template, request, redirect, url_for, flash, jsonify
from flask_login import login_required, current_user
from app.models.consultation.counselor_model import Counselor
from app.models.consultation.appointment_model import Appointment
from app.models.consultation.message_model import Message
from app import db
from datetime import datetime, time, timedelta
from sqlalchemy import and_, or_

consultation_bp = Blueprint('consultation', __name__, url_prefix='/consultation')

@consultation_bp.route('/')
@login_required
def index():
    """在线咨询首页，显示咨询师列表"""
    counselors = Counselor.query.filter_by(status='active').all()
    return render_template('consultation/index.html', counselors=counselors)

@consultation_bp.route('/appointment/<int:counselor_id>')
@login_required
def appointment(counselor_id):
    """预约页面"""
    counselor = Counselor.query.get_or_404(counselor_id)
    # 创建表单的CSRF令牌
    from flask_wtf import FlaskForm
    form = FlaskForm()
    return render_template('consultation/appointment.html', counselor=counselor, form=form)

@consultation_bp.route('/appointments')
@login_required
def my_appointments():
    """我的预约列表"""
    appointments = Appointment.query.filter_by(user_id=current_user.id).order_by(Appointment.appointment_date.desc()).all()
    # 创建表单的CSRF令牌
    from flask_wtf import FlaskForm
    form = FlaskForm()
    return render_template('consultation/my_appointments.html', appointments=appointments, form=form)

@consultation_bp.route('/create_appointment', methods=['POST'])
@login_required
def create_appointment():
    """创建预约"""
    counselor_id = request.form.get('counselor_id')
    appointment_date = datetime.strptime(request.form.get('appointment_date'), '%Y-%m-%d').date()
    time_slot = request.form.get('time_slot').split('-')
    start_time = datetime.strptime(time_slot[0], '%H:%M').time()
    end_time = datetime.strptime(time_slot[1], '%H:%M').time()
    consultation_type = request.form.get('type')
    notes = request.form.get('notes', '')
    
    # 检查时间段是否已被预约
    existing_appointment = Appointment.query.filter(
        and_(
            Appointment.counselor_id == counselor_id,
            Appointment.appointment_date == appointment_date,
            or_(
                and_(
                    Appointment.start_time <= start_time,
                    Appointment.end_time > start_time
                ),
                and_(
                    Appointment.start_time < end_time,
                    Appointment.end_time >= end_time
                ),
                and_(
                    Appointment.start_time >= start_time,
                    Appointment.end_time <= end_time
                )
            )
        )
    ).first()
    
    if existing_appointment:
        flash('该时间段已被预约，请选择其他时间', 'danger')
        return redirect(url_for('consultation.appointment', counselor_id=counselor_id))
    
    # 创建新预约
    new_appointment = Appointment(
        user_id=current_user.id,
        counselor_id=counselor_id,
        appointment_date=appointment_date,
        start_time=start_time,
        end_time=end_time,
        type=consultation_type,
        notes=notes
    )
    
    db.session.add(new_appointment)
    
    # 更新咨询师的咨询次数
    counselor = Counselor.query.get(counselor_id)
    counselor.consultation_count += 1
    
    db.session.commit()
    
    flash('预约成功！请按时参加咨询', 'success')
    return redirect(url_for('consultation.my_appointments'))

@consultation_bp.route('/chat/<int:id>')
@login_required
def chat(id):
    """文字咨询页面"""
    appointment = Appointment.query.get_or_404(id)
    
    # 检查是否是当前用户的预约
    if appointment.user_id != current_user.id:
        flash('您无权访问此咨询会话', 'danger')
        return redirect(url_for('consultation.my_appointments'))
    
    # 获取消息记录
    messages = Message.query.filter_by(appointment_id=id).order_by(Message.created_at).all()
    
    # 获取用户的其他咨询历史
    chat_history = Appointment.query.filter_by(user_id=current_user.id).filter(Appointment.id != id).order_by(Appointment.appointment_date.desc()).limit(10).all()
    
    return render_template('consultation/chat.html', 
                          appointment=appointment, 
                          messages=messages, 
                          chat_history=chat_history)

@consultation_bp.route('/send_message', methods=['POST'])
@login_required
def send_message():
    """发送消息"""
    appointment_id = request.form.get('appointment_id')
    content = request.form.get('content')
    
    appointment = Appointment.query.get_or_404(appointment_id)
    
    # 检查是否是当前用户的预约
    if appointment.user_id != current_user.id:
        return jsonify({'status': 'error', 'message': '无权发送消息'}), 403
    
    # 创建消息
    message = Message(
        appointment_id=appointment_id,
        sender_id=current_user.id,
        receiver_id=appointment.counselor_id,
        content=content
    )
    
    db.session.add(message)
    db.session.commit()
    
    return jsonify({
        'status': 'success',
        'message': {
            'id': message.id,
            'content': message.content,
            'created_at': message.created_at.strftime('%H:%M')
        }
    })

@consultation_bp.route('/get_available_slots', methods=['GET'])
@login_required
def get_available_slots():
    """获取可用时间段"""
    counselor_id = request.args.get('counselor_id')
    date_str = request.args.get('date')
    date = datetime.strptime(date_str, '%Y-%m-%d').date()
    
    # 预定义的时间段
    time_slots = [
        {'start': time(9, 0), 'end': time(10, 0)},
        {'start': time(10, 0), 'end': time(11, 0)},
        {'start': time(11, 0), 'end': time(12, 0)},
        {'start': time(14, 0), 'end': time(15, 0)},
        {'start': time(15, 0), 'end': time(16, 0)},
        {'start': time(16, 0), 'end': time(17, 0)},
        {'start': time(17, 0), 'end': time(18, 0)}
    ]
    
    # 查询该日期已被预约的时间段
    booked_appointments = Appointment.query.filter(
        Appointment.counselor_id == counselor_id,
        Appointment.appointment_date == date
    ).all()
    
    # 标记已被预约的时间段
    available_slots = []
    for slot in time_slots:
        is_available = True
        for appointment in booked_appointments:
            if (slot['start'] <= appointment.start_time and slot['end'] > appointment.start_time) or \
               (slot['start'] < appointment.end_time and slot['end'] >= appointment.end_time) or \
               (slot['start'] >= appointment.start_time and slot['end'] <= appointment.end_time):
                is_available = False
                break
        
        available_slots.append({
            'start': slot['start'].strftime('%H:%M'),
            'end': slot['end'].strftime('%H:%M'),
            'available': is_available
        })
    
    return jsonify(available_slots)

@consultation_bp.route('/cancel_appointment/<int:id>', methods=['POST'])
@login_required
def cancel_appointment(id):
    """取消预约"""
    from flask_wtf import FlaskForm
    form = FlaskForm()
    if form.validate_on_submit():
        appointment = Appointment.query.get_or_404(id)
        
        # 检查是否是当前用户的预约
        if appointment.user_id != current_user.id:
            flash('您无权取消此预约', 'danger')
            return redirect(url_for('consultation.my_appointments'))
        
        appointment.status = 'canceled'
        db.session.commit()
        
        flash('预约已成功取消', 'success')
    return redirect(url_for('consultation.my_appointments'))



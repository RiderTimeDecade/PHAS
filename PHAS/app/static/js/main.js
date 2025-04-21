// 页面加载完成后执行
document.addEventListener('DOMContentLoaded', function() {
    // 初始化提示框
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    tooltipTriggerList.map(function(tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });

    // 初始化弹窗
    var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'));
    popoverTriggerList.map(function(popoverTriggerEl) {
        return new bootstrap.Popover(popoverTriggerEl);
    });

    // 设置警告消息自动消失
    var alertList = document.querySelectorAll('.alert');
    alertList.forEach(function(alert) {
        setTimeout(function() {
            var bsAlert = new bootstrap.Alert(alert);
            bsAlert.close();
        }, 5000);
    });

    // 添加导航栏活动项目标记
    var currentLocation = window.location.pathname;
    var navLinks = document.querySelectorAll('.navbar-nav .nav-link');
    
    navLinks.forEach(function(link) {
        var linkPath = link.getAttribute('href');
        if (linkPath && (currentLocation === linkPath || currentLocation.startsWith(linkPath) && linkPath !== '/')) {
            link.classList.add('active');
        }
    });
});

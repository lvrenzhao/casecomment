

//============================================================
$(function () {
    //初始化jquery.step组件，分步骤引导用户发起评查活动
    $("#wizard").steps({
        enableCancelButton: false,
        enableFinishButton: true,
        onStepChanging: function (event, currentIndex, newIndex) {
            if(currentIndex == 1){
                $(".subforms").css("cssText","background-color:#1AB394 !important;color:#fff !important");
            }
            return true;
        },
        onFinishing:function (event, currentIndex) {
            if(currentIndex < 2){
                return false;
            }
            return true;
        }
    });
    $(".content").css("height",($('body').height()-110)+"px");

    //icheck 初始化
    $('.i-checks').iCheck({
        radioClass : 'iradio_square-green',
        checkboxClass : 'icheckbox_square-green',
    });

});
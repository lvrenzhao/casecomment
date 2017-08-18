var mode ;
$(function(){
    mode = $.getUrlParam("mode");

    if(mode == 2){
        $("#btn_submit").hide();
        $("#btn_pass").show();
        $("#btn_reject").show();
    }else {
        $("#btn_submit").show();
        $("#btn_pass").hide();
        $("#btn_reject").hide();
    }

    $('.i-checks').iCheck({
        radioClass : 'iradio_square-green',
        checkboxClass : 'icheckbox_square-green',
    });

    $('.summernote').summernote({
        lang: 'zh-CN'
    });

    $('#selectuser').click(function() {
        layer.open({
            type : 2,
            title : '添加要提醒的人员',
            shadeClose : false,
            shade : 0.3,
            area : [ '500px', '300px' ],
            content : ahcourt.ctx + '/views/basic/select_user.jsp?ele=user_name&hid=user_id&mult=1',
            cancel : function(index) {
                layer.close(index);
            }
        });
    })
});
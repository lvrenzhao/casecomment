
//获取评分表接口
var URL_PFB = ahcourt.ctx + '/chosen/pfb.do';
//发布公告接口
// var URL_SUBMIT = ahcourt.ctx + '/chosen/publish.do';

var mode ;
$(function(){
    mode = $.getUrlParam("mode");

    if(mode == 1){
        $("#selectuser").attr("disabled","disabled");
        $("input").attr("disabled","disabled");
        $("#btn_submit").hide();
        $("#btn_pass").show();
        $("#btn_reject").show();
    }else if(mode == 2){
        $("#selectuser").attr("disabled","disabled");
        $("input").attr("disabled","disabled");
        $("#btn_submit").hide();
        $("#btn_pass").hide();
        $("#btn_reject").hide();
    }else {
        $("#btn_submit").show();
        $("#btn_pass").hide();
        $("#btn_reject").hide();
    }

    //设置评分表
    $.ajax({
        type : 'POST',
        url : URL_PFB,
        datatype : 'json',
        // async : false,
        success : function(data) {
            if (data && data.rows && data.rows.length > 0) {
                $("#form_sel_pfb").each(function() {
                    var html = '<option value="">--请选择--</option>';
                    for (var i = 0; i < data.rows.length; i++) {
                        html += '<option ' + 'value="' + data.rows[i].tableid + '">' + data.rows[i].mbmc + '</option>'
                    }
                    $(this).html(html);
                });
            } else {
                $("#form_sel_pfb").each(function() {
                    $(this).html('<option value="">--请选择--</option>');
                })
            }
        }
    });

    $('.i-checks').iCheck({
        radioClass : 'iradio_square-green',
        checkboxClass : 'icheckbox_square-green',
    });

    $('.summernote').summernote({
        lang: 'zh-CN',
        height:300
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
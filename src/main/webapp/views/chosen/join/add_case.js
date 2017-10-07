//###需要检查案件是否被推荐，不能重复评选
var URL_SUBMIT = ahcourt.ctx+"/chosen/tbal.do";
var ggid;
$(function () {
    ggid = $.getUrlParam("ggid");
    $("#btn_submit").click(function () {
        if($("#form_inp_ah").val() && $("#form_inp_tjly").val()){
            $.ajax({
                type : 'POST',
                url : URL_SUBMIT,
                datatype : 'json',
                data:{
                    ah:$("#form_inp_ah").val(),
                    tjly:$("#form_inp_tjly").val()
                },
                success : function(data) {
                    if(data == "9"){
                        top.layer.msg("案件填报成功！",{icon:1});
                        parent.reloadGrid1();
                        var index = parent.layer.getFrameIndex(window.name);
                        parent.layer.close(index);
                    }else{
                        top.layer.msg(["找不到该案号，请确认案号是否正确。","案件已在本次评选中被推荐，请勿重复推荐。","输入案号查询出多个案件，请确认案号唯一。"][parseInt(data)],{icon:2});
                    }
                }
            });
        }else{
            layer.msg("请填写所有必填项后再提交。");
        }
    });
});

//获取评分表接口
var URL_PFB = ahcourt.ctx + '/chosen/pfb.do';
//发布公告接口
var URL_SUBMIT = ahcourt.ctx + '/chosen/publish.do';


var URL_DOVERIFY = ahcourt.ctx + '/chosen/dovefify.do';
var URL_GETCHOSEN = ahcourt.ctx + '/chosen/getchosen.do';

var mode ,ggid;
$(function(){
    mode = $.getUrlParam("mode");
    ggid = $.getUrlParam("ggid");

    //设置评分表
    $.ajax({
        type : 'POST',
        url : URL_PFB,
        datatype : 'json',
        async : false,
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

    $("#a_refresh_pfb").click(function () {
        $.ajax({
            type : 'POST',
            url : URL_PFB,
            datatype : 'json',
            async : false,
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
    });

    if(ggid){
        $.ajax({
            type : 'POST',
            url : URL_GETCHOSEN,
            data:{
                ggid:ggid
            },
            datatype : 'json',
            success : function(data) {
                if(data){
                    $("#form_inp_bt").val(data.bt);
                    if(data.btys == "red"){
                        $("#btys2").iCheck('check');
                    }else{
                        $("#btys1").iCheck('check');
                    }
                    $("#form_inp_jzsj").val(data.jzrq);
                    if(data.pclx == "案件评选"){
                        $("#type1").iCheck('check');
                    }else if(data.pclx == "庭审影像评选"){
                        $("#type2").iCheck('check');
                    }else{
                        $("#type3").iCheck('check');
                    }
                    $("#form_sel_pfb").val(data.pfb);
                    $('#xxnr').code(data.nr);
                    $("#viewTable").show();
                    $("#viewTable").attr("data-id",data.pfb);
                    $("#user_name").val(data.msgtonames);
                }
            }
        });
    }

    if(mode == 1){
        $("#selectuser").attr("disabled","disabled");
        $("input").attr("disabled","disabled");
        $("#form_sel_pfb").attr("disabled","disabled");
        $("#btn_submit").hide();
        $("#btn_pass").show();
        $("#btn_reject").show();
    }else if(mode == 2){
        $("#selectuser").attr("disabled","disabled");
        $("#form_sel_pfb").attr("disabled","disabled");
        $("input").attr("disabled","disabled");
        $("#btn_submit").hide();
        $("#btn_pass").hide();
        $("#btn_reject").hide();
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
    
    $("#btn_submit").click(function () {
        if($("#form_inp_bt").val() && $("#form_sel_pfb").val() && $("#form_inp_jzsj").val()){
            $.ajax({
                type : 'POST',
                url : URL_SUBMIT,
                datatype : 'json',
                data:{
                    bt:$("#form_inp_bt").val(),
                    btys:$("#btys1").is(':checked')?"black":"red",
                    pclx:$("#type1").is(':checked')?"案件评选":($("#type2").is(':checked')?"庭审影像评选":"裁判文书评选"),
                    pfb:$("#form_sel_pfb").val(),
                    jzrq:$("#form_inp_jzsj").val(),
                    nr:$('#xxnr').code(),
                    msgtoids:$("#user_id").val(),
                    msgtonames:$("#user_name").val()
                },
                success : function(data) {
                    if(data == "1"){
                        window.location.reload(true);
                        top.loadBadges();
                        top.layer.msg("公告发布成功! 正在等待审核。",{icon:1});
                    }else{
                        window.location.reload(true);
                        top.layer.msg("公告发布失败！请联系系统管理员......",{icon:2});
                    }
                }
            });
        }else{
            layer.msg("请将所有必填项填写完整");
            return false;
        }
    });

    $("#btn_reject").click(function () {
        layer.open({
            type : 1,
            shift : 5,
            title : '审核不同意',
            shadeClose : false,
            shade : 0.3,
            area : [ '480px', '250px' ],
            content : $("#div_reject"),
            cancel : function(index) {
                layer.close(index);
            }
        });
    });

    $("#btn_pass").click(function () {
        layer.confirm('确定审核通过此评查活动公告吗？', {
            btn : [ '确认', '取消' ]
        }, function(lo) {
            $.ajax({
                type : 'POST',
                url : URL_DOVERIFY,
                data:{
                    ggid:ggid,
                    passorreject:"1"
                },
                datatype : 'json',
                success : function(data) {
                    try{
                        parent.reloadTable1();
                        parent.reloadTable2();
                    }catch (e){}
                    top.layer.msg("审核通过!",{icon:1});
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);

                }
            });
        });
    });

    $("#btn_reject_confirm").click(function () {
        if($("#form_inp_shyj").val()){
            $.ajax({
                type : 'POST',
                url : URL_DOVERIFY,
                data:{
                    ggid:ggid,
                    passorreject:"2",
                    shyj:$("#form_inp_shyj").val()
                },
                datatype : 'json',
                success : function(data) {
                    try{
                        parent.reloadTable1();
                        parent.reloadTable2();
                    }catch (e){}
                    top.layer.msg("操作成功，已退回此次评查活动!",{icon:7});
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);
                }
            });
        }else{
            layer.msg("请输入审核不同意的理由。");
        }
    });


    $("#viewTable").click(function () {
        var id = $(this).attr("data-id");
        layer.open({
            type : 2,
            shift : 5,
            title : '查看评分表',
            shadeClose : false,
            shade : 0.3,
            area : [ '90%', '90%' ],
            content : ahcourt.ctx+"/views/check/configscore/view_table.jsp?id="+id,
            cancel : function(index) {
                layer.close(index);
            }
        });
    });

});

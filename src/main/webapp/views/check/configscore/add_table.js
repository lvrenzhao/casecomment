var URL_GET = ahcourt.ctx + "/case/getscore.do";
var URL_GETDETAILS = ahcourt.ctx + "/case/getscoredetails.do";
var URL_SUBMIT =ahcourt.ctx + "/case/savescoretable.do";


var tableid,tableinfo;
var lo;
$(function () {
    tableid = $.getUrlParam("tableid");
    if(tableid){
        //编辑模式
        $("#form_hid_tableid").val(tableid);
        $.ajax({
            type : 'POST',
            url : URL_GET,
            data:{
                tableid:tableid
            },
            datatype : 'json',
            // async : false,
            success : function(data) {
                if(data){
                    $("#form_inp_mbmc").val(data.mbmc);
                    $("#form_inp_mbms").val(data.mcms);
                    $("#label_mf").html(data.mf);
                    tableinfo = data;
                }
            }
        });
        $.ajax({
            type : 'POST',
            url : URL_GETDETAILS,
            data:{
                tableid:tableid
            },
            datatype : 'json',
            success : function(data) {
                if(data && data.rows && data.rows.length > 0){
                    var html = "";
                    for(var i = 0 ; i < data.rows.length; i ++){
                        var item = data.rows[i];
                        html += '<tr class="XH_'+item.xh+'" id="TR_'+i+'"><td>'+item.xh+'</td><td style="text-align: center"><button class="btn btn-link btn-xs xdelete" type="button" data-row="TR_'+ i +'"><i class="fa fa-trash"></i> 删除</button><button class="btn btn-link btn-xs xedit" type="button"  data-row="TR_'+i+'" data-xh="'+item.xh+'" data-psnr="'+item.psnr+'" data-pfbz="'+item.pfbz+'" data-fz="'+item.fz+'" ><i class="fa fa-edit"></i> 编辑</button></td><td>'+item.psnr+'</td><td>'+item.pfbz+'</td><td class="xscore" style="text-align: right">'+item.fz+'</td></tr>';
                    }
                    $("#table_score_tbody").html(html);
                }
                _w_table_rowspan("#table_score", 3);
            }
        });
        //
    }

    $("#btn_additem").click(function () {
        $("#form_item")[0].reset();
        lo = layer.open({
            type : 1,
            shift : 5,
            title : '新增评分项',
            shadeClose : false,
            shade : 0.3,
            area : [ '600px', '350px' ],
            content : $("#item_form"),
            cancel : function(index) {
                layer.close(index);
            }
        });
    });

    $("body").delegate(".xdelete", "click", function () {
        var row = $(this).attr("data-row");
        layer.confirm('确定要删除该项？', {
            btn: ['确定','取消'] //按钮
        }, function(o){
            $("#table_score_tbody td").removeAttr("rowSpan");
            $("#table_score_tbody td").show();
            $("#"+row).remove();
            _w_table_rowspan("#table_score", 3);
            layer.close(o)
            calcTotalScore();
        }, function(){
        });
    });
    $("body").delegate(".xedit", "click", function () {
        $("#form_item")[0].reset();
        lo = layer.open({
            type : 1,
            shift : 5,
            title : '编辑评分项',
            shadeClose : false,
            shade : 0.3,
            area : [ '600px', '350px' ],
            content : $("#item_form"),
            cancel : function(index) {
                layer.close(index);
            }
        });
        $("#form_hid_rowid").val($(this).attr("data-row"));
        $("#form_inp_xh").val($(this).attr("data-xh"));
        $("#form_inp_psnr").val($(this).attr("data-psnr"));
        $("#form_inp_pfbz").val($(this).attr("data-pfbz"));
        $("#form_inp_fz").val($(this).attr("data-fz"));
    });

    var igloble = 9999999;
    $("#btn_save_item").click(function () {
        if($("#form_inp_xh").val() && $("#form_inp_psnr").val() && $("#form_inp_pfbz").val() && $("#form_inp_fz").val()) {
            if( isNaN($("#form_inp_xh").val()) ){
                layer.msg("序号 必填数字");
                return false;
            }
            if( isNaN($("#form_inp_fz").val()) ){
                layer.msg("分值 必填数字");
                return false;
            }

        }else{
            layer.msg("请填写完整....");
        }

        var html = '<tr class="XH_'+$("#form_inp_xh").val()+'" id="TR_'+igloble+'"><td>'+$("#form_inp_xh").val()+'</td><td style="text-align: center"><button class="btn btn-link btn-xs xdelete" type="button" data-row="TR_'+ igloble +'"><i class="fa fa-trash"></i> 删除</button><button class="btn btn-link btn-xs xedit" type="button"  data-row="TR_'+igloble+'" data-xh="'+$("#form_inp_xh").val()+'" data-psnr="'+$("#form_inp_psnr").val()+'" data-pfbz="'+$("#form_inp_pfbz").val()+'" data-fz="'+$("#form_inp_fz").val()+'" ><i class="fa fa-edit"></i> 编辑</button></td><td>'+$("#form_inp_psnr").val()+'</td><td>'+$("#form_inp_pfbz").val()+'</td><td style="text-align: right" class="xscore">'+$("#form_inp_fz").val()+'</td></tr>';
        igloble++;

        $("#table_score_tbody td").removeAttr("rowSpan");
        $("#table_score_tbody td").show();
        if($("#form_hid_rowid").val()){
            //编辑
            $("#"+$("#form_hid_rowid").val()).after(html);
            $("#"+$("#form_hid_rowid").val()).remove();
        }else{
            //新增
            var rn = parseInt($.trim($("#form_inp_xh").val()));
            var rowobject;
            for(var i = rn ; i >= 0 ; i --){
                if($(".XH_"+i)[0]){
                    rowobject = $(".XH_"+i)[0];
                    break;
                }
            }
            if(rowobject){
                $(rowobject).after(html);
            }else{
                $("#remindRow").remove();
                $("#table_score_tbody").prepend(html);
            }
        }
        _w_table_rowspan("#table_score", 3);
        layer.close(lo);
        calcTotalScore();
    });

    $("#btn_saveall").click(function () {
       if($("#form_inp_mbmc").val()){
           $.ajax({
               type : 'POST',
               url : URL_SUBMIT,
               data:{
                   tableid:tableid,
                   mbmc:"",
                   mcms:"",

               },
               datatype : 'json',
               // async : false,
               success : function(data) {
                   if(data == "1"){
                       parent.reloadTable();
                       top.layer.msg("保存成功!",{icon:1});
                       var index = parent.layer.getFrameIndex(window.name);
                       parent.layer.close(index);
                   }else{
                       parent.reloadTable();
                       top.layer.msg("操作失败!请联系管理员协助解决。",{icon:2});
                       var index = parent.layer.getFrameIndex(window.name);
                       parent.layer.close(index);
                   }
               }
           });


       } else{
           layer.msg("模板名称必填..");
       }
    });

});

function calcTotalScore(){
    var total = 0;
    $(".xscore").each(function () {
        total += parseInt($.trim($(this).text()));
    });
    $("#label_mf").html(total);
}
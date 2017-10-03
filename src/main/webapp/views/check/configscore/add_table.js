var URL_GET = ahcourt.ctx + "/case/getscore.do";
var URL_GETDETAILS = ahcourt.ctx + "/case/getscoredetails.do";

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
                        html += '<tr id="TR_'+i+'"><td>'+item.xh+'</td><td style="text-align: center"><button class="btn btn-link btn-xs xdelete" type="button" data-row="TR_'+ i +'"><i class="fa fa-trash"></i> 删除</button><button class="btn btn-link btn-xs xedit" type="button"  data-row="TR_'+i+'" data-xh="'+item.xh+'" data-psnr="'+item.psnr+'" data-pfbz="'+item.pfbz+'" data-fz="'+item.fz+'" ><i class="fa fa-edit"></i> 编辑</button></td><td>'+item.psnr+'</td><td>'+item.pfbz+'</td><td style="text-align: right">'+item.fz+'</td></tr>';
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
        $("#form_inp_xh").val($(this).attr("data-xh"));
        $("#form_inp_psnr").val($(this).attr("data-psnr"));
        $("#form_inp_pfbz").val($(this).attr("data-pfbz"));
        $("#form_inp_fz").val($(this).attr("data-fz"));
    });

});
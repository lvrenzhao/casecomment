var URL_GET = ahcourt.ctx + "/case/getscore.do";
var URL_GETDETAILS = ahcourt.ctx + "/case/getscoredetails.do";

var tableid,tableinfo;
$(function () {
    tableid = $.getUrlParam("id");

    if(tableid){
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
                    $("#label_title").html(data.mbmc);
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
                        html += '<tr><td>'+item.xh+'</td><td>'+item.psnr+'</td><td>'+item.pfbz+'</td><td style="text-align: right">'+item.fz+'</td></tr>';
                    }
                    $("#table_score_tbody").html(html);
                }
                _w_table_rowspan("#table_score", 2);
            }
        });
    }

});
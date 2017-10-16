var URL_GETPROS=ahcourt.ctx+"/case/getProsByCCID.do";
var URL_GET = ahcourt.ctx+"/case/getcc.do";

var mode,ccid,type;
var collength=0;
var tableid ;
$(function () {
    mode = $.getUrlParam("mode");
    ccid = $.getUrlParam("ccid");
    type = $.getUrlParam("type");
    if(mode == 1){
        $("#btn_submit").show();
    }
    if(ccid && type){
        //先获组员信息 已构建表头和表footer
        $.ajax({
            type : 'POST',
            url : URL_GETPROS,
            data:{
                ccid:ccid,
                type:type
            },
            datatype : 'json',
            async : false,
            success : function(data) {
                if(data && data.rows && data.rows.length > 0){
                    for(var i  = 0 ; i < data.rows.length ; i ++){
                        $("#increseColumn").after('<th class="width250" colspan="2" style="text-align:center;">'+data.rows[i].proname+'</th>');
                        $("#increseColumnDetails").append('<th class="width50" style="text-align: center">扣分</th>');
                        $("#increseColumnDetails").append('<th class="width200" style="text-align: center">扣分理由</th>');
                    }
                }
                collength = data.rows.length;
                var length = (1000+250*data.rows.length)+"px";
                $("#table_score").css("width",length);
            }
        });
        $.ajax({
            type : 'POST',
            url : URL_GET,
            data:{
                ccid:ccid,
                type:type
            },
            datatype : 'json',
            async : false,
            success : function(data) {
                $("#tfooter1").append('<tr style="background: #e0e0e0"><td>总分</td><td colspan="'+(3+2*collength)+'"></td><td style="text-align: right">'+data.zzpcdf+'分</td></tr>')
            }
        });
        //获取评分表 构建表内容


        //获取每个组员的打分，填充表内容 ，计算平均列

    }else{
        alert("系统故障啦.....");
    }
});
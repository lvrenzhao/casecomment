var URL_GETPROS=ahcourt.ctx+"/case/getProsByCCID.do";
var URL_GET = ahcourt.ctx+"/case/getcc.do";
var URL_GETENTITY = [ahcourt.ctx + "/case/getcheckbyccid.do",ahcourt.ctx + "/case/getchosenbyccid.do"];
var URL_GETDETAILS = ahcourt.ctx + "/case/getscoredetails.do";
var URL_GETDETAILS_PRO = ahcourt.ctx + "/case/getscoredetailsforpro.do";
var URL_SUBMIT = ahcourt.ctx+"/case/submitjydp.do";

var mode,ccid,type;
var collength=0;
var tableid ;
var pros=[];
var ajid;
var ggid;
$(function () {
    var firstitem=$(".home-righttab .nav-tabs li");
    var secitem=$(".tabrightmenu .bmbox_tool");
    doubletab(firstitem,secitem);

    mode = $.getUrlParam("mode");
    ccid = $.getUrlParam("ccid");
    type = $.getUrlParam("type");

    if(type==1){
        $("#div_level").show();
    }
    if(mode == 1){
        $("#btn_submit").show();
    }
    if(ccid && type){

        $.ajax({
            type : 'POST',
            url : URL_GETENTITY[type-1],
            data:{
                ccid:ccid
            },
            datatype : 'json',
            async : false,
            success : function(data) {
                if(data){
                    if(type == 1){
                        ggid = data.checkid;
                    }else{
                        ggid = data.chosenid;
                    }
                    tableid = data.pfb;
                }
            }
        });

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
                ajid = data.ajid;
                if(data && data.jydp){
                    $("#form_inp_jydp").val(data.jydp);
                }
                // console.log(data.ajid);
                if(data && data.rows && data.rows.length > 0){
                    pros = data.rows;
                    for(var i  = 0 ; i < data.rows.length ; i ++){
                        $("#increseColumn").before('<th class="width250" colspan="2" style="text-align:center;">'+data.rows[i].proname+'</th>');
                        $("#increseColumnDetails").append('<th class="width50" style="text-align: center">扣分</th>');
                        $("#increseColumnDetails").append('<th class="width200" style="text-align: center">扣分理由</th>');
                        $("#div_advice").append('<div class="form_item wb100 fl"><label>'+data.rows[i].proname+'：</label><label id="advice_'+data.rows[i].proid+'"></label></div>');
                        //advice..
                        getAdvice(type,ggid,ajid,data.rows[i].proid);
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
            async : false,
            data:{
                ccid:ccid,
                type:type
            },
            datatype : 'json',
            success : function(data) {
                if(data.zzzldj){
                    $("#form_sel_level").val(data.zzzldj);
                    $("#form_sel_level").attr("disabled","disabled");
                }
                $("#tfooter1").append('<tr style="background: #e0e0e0"><td>总分</td><td colspan="'+(3+2*collength)+'"></td><td id="total_avg" style="text-align: right">'+(data.zzpcdf?data.zzpcdf:'-')+'</td></tr>')
            }
        });
        //获取评分表 构建表内容
        $.ajax({
            type : 'POST',
            url : URL_GETDETAILS,
            async : false,
            data:{
                tableid:tableid
            },
            datatype : 'json',
            success : function(data) {
                if(data && data.rows && data.rows.length > 0){
                    var html = "";
                    for(var i = 0 ; i < data.rows.length; i ++){
                        var item = data.rows[i];
                        html += '<tr><td>'+item.xh+'</td><td>'+item.psnr+'</td><td>'+item.pfbz+'</td><td id="fz_'+item.itemid+'" style="text-align: right">'+item.fz+'</td>';
                        for(var p = 0; p<pros.length; p++){
                            html+="<td class='kf_"+item.itemid+"' id='kf_"+item.itemid+"_"+pros[p].proid+"'></td><td id='kfyy_"+item.itemid+"_"+pros[p].proid+"'></td>"
                        }
                        html += '<td class="xavg" data-id="'+item.itemid+'" id="avg_'+item.itemid+'"></td></tr>';
                    }
                    $("#tbody1").html(html);
                }
                _w_table_rowspan("#table_score", 2);
            }
        });
        var isallwrited = true;
        //获取每个组员的打分，填充表内容
        for(var i = 0 ; i < pros.length ; i ++){
            var proid = pros[i].proid;
            $.ajax({
                type : 'POST',
                url : URL_GETDETAILS_PRO,
                async : false,
                data:{
                    ggid:ggid,
                    ajid:ajid,
                    pcr:proid,
                    type:type
                },
                datatype : 'json',
                success : function(data) {
                    // console.log(data)
                    if(data && data.rows && data.rows.length > 0){
                        for(var i = 0 ; i < data.rows.length; i ++) {
                            // console.log($("#kf_" + data.rows[i].itemid + "_" + proid), "#kf_" + data.rows[i].itemid + "_" + proid)
                            $("#kf_" + data.rows[i].itemid + "_" + proid).text(data.rows[i].kf);
                            $("#kfyy_" + data.rows[i].itemid + "_" + proid).text(data.rows[i].kfyy);
                        }
                    }else{
                        isallwrited = false;
                    }
                }
            });
        }
        //计算平均列
        var avg_all = 0;
        $(".xavg").each(function () {
            var itemid = $(this).attr("data-id");
            var fz = parseInt($("#fz_"+itemid).text());
            var kftotal = 0;
            var kfx = $(".kf_"+itemid);
            // console.log(kfx)
            for(var i = 0 ; kfx && i <kfx.length ; i ++){
                var ikf = parseInt($(kfx[i]).text());
                if(!isNaN(ikf)){
                    kftotal += ikf;
                }
            }
            var itemavg = fz-kftotal/pros.length;
            $("#avg_"+itemid).text(itemavg.toFixed(2));
            avg_all+=itemavg;
        });

        //计算总平均值
        if(!isNaN(avg_all)){
            $("#total_avg").html(avg_all.toFixed(2));
        }

        //提交
        $("#btn_submit").click(function () {
            if(!isallwrited){
                layer.msg("尚有组员未完成打分。");
                return;
            }

            if(!$("#div_level").is(":hidden")){
                if(!$("#form_sel_level").val()){
                    layer.msg("请选择质量等级.");
                    return ;
                }
            }
            if($("#form_inp_jydp").val()){
                $.ajax({
                    type : 'POST',
                    url : URL_SUBMIT,
                    async : false,
                    data:{
                        ccid:ccid,
                        type:type,
                        jydp:$("#form_inp_jydp").val(),
                        zldj:$("#form_sel_level").val(),
                        zzdf:$("#total_avg").text()
                    },
                    datatype : 'json',
                    success : function(data) {
                        if(data == "-1"){
                            top.layer.msg("系统故障，请联系系统管理员协助解决!",{icon:2});
                        }else {
                            top.layer.msg("点评成功!", {icon: 1});
                            parent.reloadUnCheckGrid();
                            parent.reloadCheckedGrid();
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(index);
                        }
                    }
                });
            }else{
                layer.msg("合议点评不能为空");
            }

        })
        
    }else{
        alert("系统故障啦.....");
    }
});

function getAdvice(type,ggid,ajid,pcr) {
    $.ajax({
        type : 'POST',
        url : ahcourt.ctx+"/case/advice.do",
        data:{
            type:type,
            ggid:ggid,
            ajid:ajid,
            pcr:pcr
        },
        datatype : 'json',
        success : function(data) {
            if(data) {
                $("#advice_" + pcr).text(data.remarks);
            }
        }
    });
}
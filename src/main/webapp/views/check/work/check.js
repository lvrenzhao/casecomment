var URL_AJZL = ahcourt.ctx + "/case/files.do";
var URL_AJZLWS = ahcourt.ctx + "/case/filesFromWs.do";
var URL_AJZLUPDATEWS = ahcourt.ctx + "/case/filesUpdateFromWs.do";
var URL_GET = [ahcourt.ctx + "/case/getcheckbyccid.do",ahcourt.ctx + "/case/getchosenbyccid.do"];
var URL_GETDETAILS = ahcourt.ctx + "/case/getscoredetails.do";
var URL_SUBMIT = [ahcourt.ctx+"/case/submitCheckScore.do",ahcourt.ctx+"/case/submitChosenScore.do"];
var URL_GETWRITEDSCORE = ahcourt.ctx+"/case/getWritedScores.do";

var ajid , mode,type,ccid,tableid;//type1:评查type2:评选
var crid;
var ggid;
var setting = {
    data: {simpleData: {enable: true}},
    callback: {onClick: selectCd}
};
var ah,fydm,fbs;
$(function () {
    ajid = $.getUrlParam("ajid");
    type = $.getUrlParam("type");
    ccid = $.getUrlParam("ccid");
    mode = $.getUrlParam("mode");

    if(ajid){
        $.ajax({
            type: 'POST',
            url: ahcourt.ctx+"/case/getAjDetails.do",
            async : false,
            data: {
                ajid: ajid
            },
            datatype: 'json',
            success: function (data) {
                if(data){
                    ah = data.ah;
                    fydm = data.fydm;
                    fbs = data.remarks;
                }
            }
        });

        var lox;
        var lot;
        lox = layer.msg("正在加载档案中,请稍后...",{icon:6,time:100000000});
        $.ajax({
            type : 'POST',
            url : URL_AJZL,
            data:{
                ajid:ajid
            },
            datatype : 'json',
            success : function(data) {
                layer.close(lox);
                if(data && data.rows){
                    if(data.rows.length <=2){
                        lot = layer.msg("首次查看该案件档案，正在从远程服务器下载，可能需要一点时间，请稍等。",{icon:6,time:100000000});
                        $.ajax({
                            type : 'POST',
                            url : URL_AJZLWS,
                            data:{
                                ajid:ajid,
                                fbs:fbs,
                                ah:ah,
                                fydm:fydm
                            },
                            datatype : 'json',
                            success : function(data) {
                                layer.close(lot);
                                if (data && data.rows && data.rows.length>0) {
                                    $.fn.zTree.init($("#pTree"), setting, data.rows);
                                }else{
                                    layer.msg("同步成功，但未获取到档案，请联系该案件承办人及时归档。",{icon:5});
                                }
                            }
                        });
                    }else{
                        $.fn.zTree.init($("#pTree"), setting, data.rows);
                    }
                }
            }
        });
    }
    //mode=2被取消，原作为可顺带查看评分表
    if(mode == 1){
        if(!type || !ccid){
            alert("程序错误");
            return ;
        }
        $("#btn_submit").show();
        $("#btn_save").show();

        $.ajax({
            type : 'POST',
            url : URL_GET[type-1],
            data:{
                ccid:ccid
            },
            datatype : 'json',
            async : false,
            success : function(data) {
                if(data){
                    tableid = data.pfb;
                    if(type == 1){
                        ggid = data.checkid;
                    }else{
                        ggid = data.chosenid;
                    }
                }
            }
        });

        if(tableid){
            $.ajax({
                type : 'POST',
                url : URL_GETDETAILS,
                data:{
                    tableid:tableid
                },
                datatype : 'json',
                async : false,
                success : function(data) {
                    if(data && data.rows && data.rows.length > 0){
                        var html = "";
                        for(var i = 0 ; i < data.rows.length; i ++){
                            var item = data.rows[i];
                            html += '<tr class="xdatarow" dataid="'+item.itemid+'"><td>'+item.xh+'</td><td>'+item.psnr+'</td><td>'+item.pfbz+'</td>' +
                                '<td class="xfzlabel" style="text-align: right">'+item.fz+'</td>' +
                                '<td><input id="kf_'+item.itemid+'" class="xkf" data-maxkf="'+item.fz+'" type="text" style="width: 50px;" /></td>' +
                                '<td><input id="kfyy_'+item.itemid+'" class="xkfly" data-itemid="'+item.itemid+'" type="text" style="width: 100%;" /></td></tr>';
                        }
                        $("#table_score_tbody").html(html);
                    }
                    _w_table_rowspan("#table_score", 2);

                    getDf();
                }
            });
        }
        //todo 加载之前已经评查的分数情况
        $.ajax({
            type : 'POST',
            url : URL_GETWRITEDSCORE,
            data:{
                ggid:ggid,
                ajid:ajid,
                type:type
            },
            datatype : 'json',
            async : false,
            success : function(data) {
                if(data && data.rows && data.rows.length > 0){
                    crid = data.rows[0].crid;
                    for(var i = 0 ; i < data.rows.length; i ++){
                        var item = data.rows[i];
                        $("#kf_"+item.itemid).val(item.kf);
                        $("#kfyy_"+item.itemid).val(item.kfyy);
                    }
                }
            }
        });
    }else if(mode == 3){
        $("#btn_open_score_table").hide();
    }

    $("#btn_open_score_table").click(function () {
        openScoreTable();
    });

    $("#btn_close_score_table").click(function() {
        closerightslide();
    });
    $(document).keyup(function(e) {
        var curKey = e.which;
        if (curKey === 27 || curKey === 27) {
            closerightslide();
        }
    });
    // initTree();


    $("body").delegate(".xkf", "change", function () {
        var maxfz = parseInt($(this).attr("data-maxkf"));
        var fz = parseInt($.trim($(this).val()));
        if(isNaN(fz)){
            layer.msg("填写数值类型，谢谢。");
            $(this).val("");
            $(this).focus();
            return;
        }
        if(fz > maxfz){
            layer.msg("扣分不能超出该项的分值，请重新填写~");
            $(this).val("");
            $(this).focus();
        }
        getDf();
    });
    
    $("#btn_submit").click(function () {
        save(2);
    });
    $("#btn_save").click(function () {
        save(1);
    });
    $("#btn_close_score_table").click(function () {
        save(3);
    });
    
    $("#btn_tongbu").click(function () {
        var lo ;
        lo = layer.msg("正在从远程服务器下载更新,请稍后...",{icon:6,time:100000000});
        $.ajax({
            type : 'POST',
            url : URL_AJZLUPDATEWS,
            data:{
                ajid:ajid,
                fbs:fbs,
                ah:ah,
                fydm:fydm
            },
            datatype : 'json',
            success : function(data) {
                layer.close(lo);
                if (data && data.rows && data.rows.length>0) {
                    layer.msg("同步成功！",{icon:1});
                    $.fn.zTree.init($("#pTree"), setting, data.rows);
                }else{
                    layer.msg("同步成功，但未获取到档案，请联系该案件承办人及时归档。",{icon:5});
                }
            }
        });
    });
    
});

//type:1暂存，2：提交,3:暂存(但收起表单)
function save(xtype) {

    if(xtype == "2"){
        //检查必填
        var isAllWriten = true;
        $(".xkf").each(function () {
            if($(this).val().length==0){
                isAllWriten = false;
            }
        });
        if(!isAllWriten){
            layer.msg("所有扣分项都必须填写，如不扣分请填数字0");
            return;
        }
        var isALlKflyWriten = true;
        $(".xkfly").each(function () {
            // console.log($(this),$(this).val(),$("#kf_"+$(this).attr("data-itemid")).val())
            if($("#kf_"+$(this).attr("data-itemid")).val() > 0 && $(this).val().length == 0 ) {
                isALlKflyWriten = false;
            }
        });
        if(!isALlKflyWriten){
            layer.msg("扣分不等于0时，必须填写扣分理由！");
            return;
        }
        if(!$("#txt_jydp").val()){
            layer.msg("个人点评不能为空！");
            return;
        }
    }
    var items = [];
    $(".xdatarow").each(function () {
        var item = {};
        item.itemid = $(this).attr("dataid");
        item.tableid = tableid;
        item.kf = $.trim($(this).find(".xkf").val());
        item.kfyy = $.trim($(this).find(".xkfly").val());
        item.df =parseInt($.trim($(this).find(".xkf").attr("data-maxkf"))) - parseInt($.trim($(this).find(".xkf").val()));
        if(!isNaN(item.kf)){
            items.push(item);
        }
    });
    var xdata = [{crid:crid,ajid:ajid,checkid:ggid,tableid:tableid,itemJson:JSON.stringify(items)},{crid:crid,ajid:ajid,chosenid:ggid,tableid:tableid,itemJson:JSON.stringify(items)}];
    xdata[type-1].pczt=(xtype==2?"2":"1");
    xdata[type-1].pcfs=$("#label_mf").text();
    xdata[type-1].remarks=$("#txt_jydp").val();
    $.ajax({
        type : 'POST',
        url : URL_SUBMIT[type-1],
        data:xdata[type-1],
        datatype : 'json',
        async : false,
        success : function(data) {
            // console.log(data);
            if(data != -1){
                crid = data;
                top.layer.msg(xtype==2?"提交成功!":"暂存成功!",{icon:1});
            }else{
                top.layer.msg("操作失败，请联系管理员协助解决。",{icon:2});
            }
        }
    });

    if(xtype == "3"){
        closerightslide();
    }
    if(xtype == "2"){
        //关闭当前窗口 刷新父窗口
        parent.reloadUnCheckGrid();
        parent.reloadCheckedGrid();
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    }
}

function getDf() {
    var total = 0;
    $(".xfzlabel").each(function () {
        total += parseInt($(this).text());
    });
    $(".xkf").each(function () {
        if($(this).val().length>0){
            total -= parseInt($.trim($(this).val()));
        }
    });
    $("#label_mf").text(total+"分");
}

// function initTree() {
//     $.ajax({
//         type: 'POST',
//         url: URL_AJZL,
//         data:{
//             "ajid":ajid
//         },
//         datatype: 'json',
//         async: false,
//         success: function (data) {
//             if (data && data.rows) {
//                 var setting = {
//                     data: {simpleData: {enable: true}},
//                     callback: {onClick: selectCd}
//                 };
//                 $.fn.zTree.init($("#pTree"), setting, data.rows);
//             }
//         }
//     });
// }
var isshowed = false;
function selectCd() {
    if(!isshowed){
        $("#displayOnce").hide();
        $("#viewframe").show();
        isshowed = true;
    }
    var treeObj = $.fn.zTree.getZTreeObj("pTree");
    var nodes = treeObj.getSelectedNodes();
    // window.frames["iframe0"].location = "viewer.jsp?fid="+nodes[0].id;
    if(nodes[0].ftpserver&&nodes[0].filename){
        // window.frames["iframe0"].location = ahcourt.ctx+"/case/getonefile.do?fbs="+fbs+"&fydm="+fydm+"&ftpserver="+nodes[0].ftpserver+"&filename="+nodes[0].filename;
        layer.msg("加载中....");
        // console.log(ahcourt.ctx+"/case/getonefile.do?fbs="+fbs+"&fydm="+fydm+"&ftpserver="+nodes[0].ftpserver+"&filename="+nodes[0].filename)
        $("#viewer_img").attr("src",ahcourt.ctx+"/case/getonefile.do?fbs="+fbs+"&fydm="+fydm+"&ftpserver="+nodes[0].ftpserver+"&filename="+nodes[0].filename);
    }
}



function openScoreTable() {
    if (!$(".rightslide_menu").hasClass("menu_transitioning") && !$(".rightslide_menu").hasClass("warpslide_active")) {
        $(".rightslide_menu").addClass("menu_transitioning");
        $(".warpslide").addClass("warpslide_active");
        $(".rightslide_menu").css("-webkit-transform", "translate3d(0px, 0px, 0px)");
    }
}
// 关闭右边菜单
function closerightslide() {
    $(".rightslide_menu").css("-webkit-transform", "translate3d(100%, 0px, 0px)");
    $(".warpslide").removeClass("warpslide_active");
    $(".rightslide_menu").removeClass("menu_transitioning");
};
var URL_AJZL = ahcourt.ctx + "/case/files.do";
var URL_GET = [ahcourt.ctx + "/case/getcheckbyccid.do",ahcourt.ctx + "/case/getchosenbyccid.do"];
var URL_GETDETAILS = ahcourt.ctx + "/case/getscoredetails.do";
var URL_SUBMIT = [ahcourt.ctx+"/case/submitCheckScore.do",ahcourt.ctx+"/case/submitChosenScore.do"];

var ajid , mode,type,ccid,tableid;//type1:评查type2:评选
var crid;
var ggid;
$(function () {
    ajid = $.getUrlParam("ajid");
    type = $.getUrlParam("type");
    ccid = $.getUrlParam("ccid");
    mode = $.getUrlParam("mode");
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
                                '<td><input class="xkf" data-maxkf="'+item.fz+'" type="text" style="width: 50px;" /></td>' +
                                '<td><input class="xkfly" type="text" style="width: 100%;" /></td></tr>';
                        }
                        $("#table_score_tbody").html(html);
                    }
                    _w_table_rowspan("#table_score", 2);

                    getDf();
                }
            });
        }
        //todo 加载之前已经评查的分数情况

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
    initTree();


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
});

//type:1暂存，2：提交,3:暂存(但收起表单)
function save(xtype) {
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
    var items = [];
    $(".xdatarow").each(function () {
        var item = {};
        item.itemid = $(this).attr("dataid");
        item.tableid = tableid;
        item.kf = $.trim($(this).find(".xkf").val());
        item.kfyy = $.trim($(this).find(".xkfly").val());
        item.df =parseInt($.trim($(this).find(".xkf").attr("data-maxkf"))) - parseInt($.trim($(this).find(".xkf").val()));
        items.push(item);
    });
    var xdata = [{crid:crid,ajid:ajid,checkid:ggid,tableid:tableid,itemJson:JSON.stringify(items)},{crid:crid,ajid:ajid,chosenid:ggid,tableid:tableid,itemJson:JSON.stringify(items)}];
    $.ajax({
        type : 'POST',
        url : URL_SUBMIT[type-1],
        data:xdata[type-1],
        datatype : 'json',
        async : false,
        success : function(data) {
            if(data){
                console.log(data);
                crid = data;
            }
        }
    });

    top.layer.msg(xtype==2?"提交成功!":"暂存成功!",{icon:1});

    if(xtype == "3"){
        closerightslide();
    }
    if(xtype == "2"){
        //关闭当前窗口 刷新父窗口
        parent.reloadUnCheckGrid();
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

function initTree() {
    $.ajax({
        type: 'POST',
        url: URL_AJZL,
        data:{
            "ajid":ajid
        },
        datatype: 'json',
        async: false,
        success: function (data) {
            if (data && data.rows) {
                var setting = {
                    data: {simpleData: {enable: true}},
                    callback: {onClick: selectCd}
                };
                $.fn.zTree.init($("#pTree"), setting, data.rows);
            }
        }
    });
}
var isshowed = false;
function selectCd() {
    if(!isshowed){
        $("#displayOnce").hide();
        $("#viewframe").show();
        isshowed = true;
    }
    var treeObj = $.fn.zTree.getZTreeObj("pTree");
    var nodes = treeObj.getSelectedNodes();
    window.frames["iframe0"].location = "viewer.jsp?fid="+nodes[0].id;
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
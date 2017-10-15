var URL_AJZL = ahcourt.ctx + "/case/files.do";
var URL_GET = ahcourt.ctx + "/case/getcheckbyccid.do";
var URL_GETDETAILS = ahcourt.ctx + "/case/getscoredetails.do";

var ajid , mode,type,ccid,tableid;
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
            url : URL_GET,
            data:{
                ccid:ccid
            },
            datatype : 'json',
            async : false,
            success : function(data) {
                if(data){
                    tableid = data.pfb;
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
                success : function(data) {
                    if(data && data.rows && data.rows.length > 0){
                        var html = "";
                        for(var i = 0 ; i < data.rows.length; i ++){
                            var item = data.rows[i];
                            html += '<tr><td>'+item.xh+'</td><td>'+item.psnr+'</td><td>'+item.pfbz+'</td>' +
                                '<td class="xfzlabel" style="text-align: right">'+item.fz+'</td>' +
                                '<td><input class="xkf" type="text" style="width: 50px;" /></td>' +
                                '<td><input class="xkfly" type="text" style="width: 100%;" /></td></tr>';
                        }
                        $("#table_score_tbody").html(html);
                    }
                    _w_table_rowspan("#table_score", 2);

                    getDf();
                }
            });
        }
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
        getDf();
    });
});

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
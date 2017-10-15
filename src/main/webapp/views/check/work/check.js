var URL_AJZL = ahcourt.ctx + "/assets/data/check_ajzl.json"

var ajid , mode,type,ccid;
$(function () {
    type = $.getUrlParam("type");
    ccid = $.getUrlParam("ccid");
    // if(!type){
    //     alert("程序错误");
    //     return ;
    // }
    mode = $.getUrlParam("mode");
    //### mode=2被取消，原作为可顺带查看评分表
    if(mode == 1){
        $("#btn_submit").show();
        $("#btn_save").show();
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
});

function initTree() {
    $.ajax({
        type: 'POST',
        url: URL_AJZL,
        data:{ajid:ajid},
        datatype: 'json',
        async: false,
        success: function (data) {
            if (data) {
                var setting = {
                    data: {simpleData: {enable: true}},
                    callback: {onClick: selectCd}
                };
                $.fn.zTree.init($("#pTree"), setting, data);
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
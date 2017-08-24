var URL_AJZL = ahcourt.ctx + "/assets/data/check_ajzl.json"

var ajid , mode;
$(function () {

    mode = $.getUrlParam("mode");
    //### mode=2被取消，原作为可顺带查看评分表
    if(mode == 1){
        $("#btn_submit").show();
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

function selectCd() {
    var treeObj = $.fn.zTree.getZTreeObj("pTree");
    var nodes = treeObj.getSelectedNodes();
    if(nodes[0].name == "1.mp4"){
        window.frames["iframe0"].location = ahcourt.ctx+"/files/1.mp4";
    }else if (nodes[0].name == "一审裁定书.pdf"){
        window.frames["iframe0"].location = ahcourt.ctx+"/files/一审裁定书.pdf";
    }else if (nodes[0].name == "上诉案件移送函.pdf"){
        window.frames["iframe0"].location = ahcourt.ctx+"/files/上诉案件移送函.pdf";
    }else if (nodes[0].name == "二审裁定书.pdf"){
        window.frames["iframe0"].location = ahcourt.ctx+"/files/二审裁定书.pdf";
    }else if (nodes[0].name == "备考表.pdf"){
        window.frames["iframe0"].location = ahcourt.ctx+"/files/备考表.pdf";
    }else if (nodes[0].name == "封面.pdf"){
        window.frames["iframe0"].location = ahcourt.ctx+"/files/封面.pdf";
    }else if (nodes[0].name == "目录.pdf"){
        window.frames["iframe0"].location = ahcourt.ctx+"/files/目录.pdf";
    }else if (nodes[0].name == "行政上诉状.pdf"){
        window.frames["iframe0"].location = ahcourt.ctx+"/files/行政上诉状.pdf";
    }else if (nodes[0].name == "退卷函.pdf"){
        window.frames["iframe0"].location = ahcourt.ctx+"/files/退卷函.pdf";
    }else if (nodes[0].name == "送达回证.pdf"){
        window.frames["iframe0"].location = ahcourt.ctx+"/files/送达回证.pdf";
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
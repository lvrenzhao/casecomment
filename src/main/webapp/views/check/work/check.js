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
    console.log(123);
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
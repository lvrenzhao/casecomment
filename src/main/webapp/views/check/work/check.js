$(function () {
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
});


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
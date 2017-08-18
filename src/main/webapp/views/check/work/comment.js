var mode,ajid;

$(function () {
    mode = $.getUrlParam("mode");
    if(mode == 1){
        $("#btn_submit").show();
    }
});
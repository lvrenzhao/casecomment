

//============================================================
$(function () {

    $("#wizard").steps({
        enableCancelButton: false,
        enableFinishButton: false,
        onStepChanging: function (event, currentIndex, newIndex) {
            return true;
        }
    });
    $(".content").css("height",($('body').height()-110)+"px");

});
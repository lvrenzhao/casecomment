//###需要检查案件是否被推荐，不能重复评选
var URL_SUBMIT = ahcourt.ctx+"/chosen/tbal.do";
var URL_JC = ahcourt.ctx+"/chosen/tbaljc.do";
var ggid;
var ajid;
var errorcount = 0;
var baseURL = ahcourt.ctx+'/chosen/upload.do';
$(function () {

    $(".dropdown-menu li").click(function () {
        $("#btn_nf").text($(this).text());
    });

    ggid = $.getUrlParam("ggid");

    $("#form_inp_ah").change(function () {
        if($("#form_inp_ah").val()){
            var lo = layer.msg("正在检测案号，请稍等。",{time:999999999})
            $.ajax({
                type : 'POST',
                url : URL_JC,
                datatype : 'json',
                data:{
                    ah:$("#btn_nf").text()+$("#form_inp_ah").val(),
                    ggid:ggid
                },
                success : function(data) {
                    layer.close(lo);
                    if(data && data.length > 1){
                        ajid = data;
                        $("#btn_submit").removeAttr("disabled");
                    }else{
                        top.layer.msg(["找不到该案号，请确认案号是否正确。","输入案号查询出多个案件，请确认案号唯一。","案件已在本次评选中被推荐，请勿重复推荐。"][parseInt(data)],{icon:2});
                        $("#form_inp_ah").val("");
                        $("#btn_submit").attr("disabled","disabled");
                    }
                }
            });
        }
    });

    var uploader = WebUploader.create({
        swf: ahcourt.ctx+'/assets/thirdparty/webuploader/Uploader.swf',
        server: baseURL,
        pick: '#picker',
        resize: true,
        accept: {
            extensions: 'pdf'
        }
    });

    uploader.on("error",function (type){
        if(type == "F_DUPLICATE"){
            layer.msg("请不要重复选择文件！");
        }else if(type == "Q_TYPE_DENIED"){
            layer.msg("该文件格式不被支持，仅支持PDF格式文件。");
        }

    });

    var $list = $('#thelist');

    uploader.on( 'fileQueued', function( file ) {
        $list.append( '<div id="' + file.id + '" class="item">' +
            '<h4 class="info">' + file.name + '</h4>' +
            '<p class="state">等待上传...</p>' +
            '</div>' );
    });

    uploader.on( 'uploadProgress', function( file, percentage ) {
        var $li = $( '#'+file.id ),
            $percent = $li.find('.progress .progress-bar');

        // 避免重复创建
        if ( !$percent.length ) {
            $percent = $('<div class="progress progress-striped active">' +
                '<div class="progress-bar" role="progressbar" style="width: 0%">' +
                '</div>' +
                '</div>').appendTo( $li ).find('.progress-bar');
        }

        $li.find('p.state').text('上传中');

        $percent.css( 'width', percentage * 100 + '%' );
    });

    uploader.on( 'uploadSuccess', function( file ) {
        $( '#'+file.id ).find('p.state').text('已上传');
    });

    uploader.on( 'uploadError', function( file ) {
        errorcount++;
        $( '#'+file.id ).find('p.state').text('上传出错');
    });

    uploader.on( 'uploadComplete', function( file ) {
        $( '#'+file.id ).find('.progress').fadeOut();
    });

    uploader.on( 'all', function( type ) {
        var stats;
        switch( type ) {
            case 'startUpload':
                uploader.options.server=baseURL+"?ggid="+ggid+"&ajid="+ajid;
                break;
            case 'uploadFinished':
                if(errorcount > 0){
                    layer.msg("上传失败，请联系管理员协助解决。",{icon:2});
                    return;
                }
                var newah =$("#btn_nf").text() + $("#form_inp_ah").val();
                //上传结束代码
                $.ajax({
                    type : 'POST',
                    url : URL_SUBMIT,
                    datatype : 'json',
                    data:{
                        // ah:$("#form_inp_ah").val(),
                        ah:newah,
                        tjly:$("#form_inp_tjly").val(),
                        ggid:ggid
                    },
                    success : function(data) {
                        if(data == "9"){
                            top.layer.msg("案件填报成功！",{icon:1});
                            parent.reloadGrid1();
                            parent.reloadGrid();
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(index);
                        }else{
                            top.layer.msg(["找不到该案号，请确认案号是否正确。","输入案号查询出多个案件，请确认案号唯一。","案件已在本次评选中被推荐，请勿重复推荐。"][parseInt(data)],{icon:2});
                        }
                    }
                });
                break;
        }
    });




    $("#btn_submit").click(function () {
        layer.confirm('案例填报后将不能撤销或修改，确定要填报吗？', {
            btn : [ '确认', '我再想想' ]
        }, function(lo) {
            layer.close(lo);
            layer.msg("正在提交数据，请稍等.");
            if($("#form_inp_ah").val() && $("#form_inp_tjly").val()){
                uploader.upload();
            }else{
                layer.msg("请填写所有必填项后再提交。");
            }
        });
    });
});
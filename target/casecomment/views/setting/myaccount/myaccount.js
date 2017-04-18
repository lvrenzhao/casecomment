$(function() {

	$('.i-checks').iCheck({
		radioClass : 'iradio_square-green',
		checkboxClass : 'icheckbox_square-green',
	});

	if ($('#tx').val() != null && $('#tx').val() != '') {
		var id = $('#tx').val();
		var initialPreview = [ "<img src="+ahcourt.ctx+"/setting/file/download/" + id + ".do +class='kv-preview-data file-preview-image'  style='width:auto;height:160px;'>" ];
		
		var fileinput = initFileInput("#inputimage",1, initialPreview)
	} else {
		var fileinput = initFileInput("#inputimage",1, '', '');
	}

	$(".sub_file").click(function() {
		
		if ($("#tx").val() == null || $("#tx").val() == '') {
			layer.msg("头像不能为空！");
			return;
		}
		$.ajax({
			type : 'POST',
			url : ahcourt.ctx + '/setting/user/updatemm.do',
			datatype : 'json',
			data : {
				yhid : $("#yhid").val(),
				//ygid : $("#ygid").val(),
				tx : $("#tx").val(),
				ymm : $("#ymm").val(),
				mm : $("#xmm").val()
			},
			success : function(data) {
				// console.log(data);
				if (data == '9') {
					layer.msg('原密码不对，请重新输入！');
					return;
				}else if (data == '1') {
					layer.confirm('修改密码成功，请重新登录？', {
						btn : [ '确定' ]
					}, function() {

						top.window.location.href = top.window.location.protocol+"//"+top.window.location.hostname+":"+top.window.location.port +ahcourt.ctx+"/logout.do";
					});
				}else if (data == '2') {
					layer.msg("修改头像成功！");
					//closeWindow();
				}else if (data == '3') {
					layer.msg("头像未变化！");
					return;
				} else {
					layer.msg('保存失败');
					return;
				}
			}
		});

	})

})

// 上传头像
function initFileInput(id, maxcount, initialPreview) {
	if (initialPreview != '') {
		if (initialPreview.length) {
			maxcount = maxcount - initialPreview.length;
		}
	}
	var fileinput = $(id).fileinput({
		language : 'zh',
		uploadUrl : ahcourt.ctx + '/setting/file/fileupload.do',
		enctype : 'multipart/form-data',
		mainClass : 'file-caption-main',
		// 单位kb
		maxFileSize : 51200,
		maxFileCount : maxcount,
		showPreview : true,
		autoReplace : false,
		showUpload : false,
		showCaption : false,
		msgFilesTooMany : "选择上传的文件数量 超过允许的最大数值！",
		initialPreview : initialPreview,
		dropZoneTitle : '请上传头像',
		allowedFileExtensions : [ 'jpg', 'png', 'gif' ]
	}).on("fileuploaded", function(event, data, previewId, index) {
		var result = data.response;
		$("#tx").val(result.id);
	}).on("fileuploaderror", function(event, data, msg) {
		//console.log("faild....")
	}).on("filebatchselected", function(event, files) {
		$(this).fileinput("upload");
	}).on("filepredelete", function(event, files) {
		$("#tx").val("");
	})
	return fileinput;
}

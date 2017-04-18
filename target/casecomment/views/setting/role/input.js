$(document).ready(function() {
	checkmyblur();
	$(".sub_role").click(function() {
		if (checkmyform($("#role_form"))) {
			var flag=checkjsmc($("#jsmc").val())
			if(flag.length>0){
				layer.msg('角色名称重复');
				return;
			}else{
				$.ajax({
					type : 'POST',
					url : ahcourt.ctx + "/setting/role/saveRole.do",
					datatype : 'json',
					data : {
						jsmc : $("#jsmc").val(),
						jssm : $("#jssm").val()
					},
					success : function(data) {
						if (data > 0) {
							layer.msg('保存角色成功');
							parent.$("#table1").jqGrid().setGridParam({}).trigger("reloadGrid");
							var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引
							parent.layer.close(index);

						} else {
							layer.msg('保存角色失败');
						}
					}
				});
			}
		} else {
			layer.msg("验证失败请重新填写！");
		}

	})
})
function checkjsmc(jsmc){
	var flag;
	$.ajax({
		type : 'POST',
		url : ahcourt.ctx + "/setting/role/roleList.do",
		datatype : 'json',
		async:false,
		data : {
			jsmc:jsmc,
		},
		success : function(data) {
				flag=data;
		}
	});
	return flag
}
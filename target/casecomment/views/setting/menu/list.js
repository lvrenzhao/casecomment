var addbtnbox, addgridbox, zNodes;
$(function() {

	initTree();

	$('#save_item').click(function(e) {
		if ($("#sjcdmc").val() == "") {
			$("#sjcdid").val("0");
		}

		if (checkmyform($("#add_form"), true)) {
			$.ajax({
				type : 'POST',
				url : ahcourt.ctx + '/setting/menu/saveOrupdateMenu.do',
				datatype : 'json',
				data : {
					cdid : $("#cdid").val(),
					sjcdid : $("#sjcdid").val(),
					cdmc : $("#cdmc").val(),
					cdurl : $("#cdurl").val(),
					tb : $("#tb").val(),
					px : $("#px").val(),
					ymkd : $("#ymkd").val(),
					ymgd : $("#ymgd").val(),
					bz : $("#bz").val()
				},
				success : function(data) {
					if (data > 0) {
						layer.msg('保存成功');
						location.reload(true);
					} else {
						layer.msg('保存失败');
					}
				}
			});

		} else {
			layer.msg("验证失败请重新填写！");
		}
	});

	$('#cencle_item').click(function(e) {
		dohide()
	})
	$('#add_item').click(function(e) {
		$('#add_form')[0].reset();
		$("#cdid").val("");
		var treeObj = $.fn.zTree.getZTreeObj("pTree");
		var nodes = treeObj.getSelectedNodes();
		if (nodes.length > 0) {
			$("#sjcdid").val(nodes[0].id);
			$("#sjcdmc").val(nodes[0].name);
		}
		doshow()
	})
	$('#edit_item').click(function(e) {
		var treeObj = $.fn.zTree.getZTreeObj("pTree");
		var nodes = treeObj.getSelectedNodes();
		if (!nodes || nodes.length == 0) {
			layer.msg('请选择一个菜单')
			return;
		}
		doshow();
	})
	$('#del_item').click(function(e) {
		delmenu()
	})

})

function initTree() {
    $.ajax({
        type: 'POST',
        url: ahcourt.ctx + "/setting/menu/selectTreeList.do",
        datatype: 'json',
        async: false,
        success: function (data) {
            if (data) {
                var setting = {
                    data: {
                        simpleData: {
                            enable: true
                        }
                    },
                    callback: {
                        onClick: selectCd
                    },
                    edit: {
                        enable: false
                    }

                };

                $.fn.zTree.init($("#pTree"), setting, data);
            }
        }
    });
}

	function selectCd() {
		var treeObj = $.fn.zTree.getZTreeObj("pTree");
		var nodes = treeObj.getSelectedNodes();
		$.ajax({
			type : 'POST',
			url : ahcourt.ctx + "/setting/menu/getById.do",
			data : {
				cdid : nodes[0].id
			},
			datatype : 'json',
			success : function(data) {
				$("#sjcdid").val(nodes[0].pId);
				$("#cdid").val(data.cdid);
				$("#sjcdmc").val(data.sjcdid);
				$("#cdmc").val(data.cdmc);
				$("#cdurl").val(data.cdurl);
				$("#tb").val(data.tb);
				$("#px").val(data.px);
				$("#ymkd").val(data.ymkd);
				$("#ymgd").val(data.ymgd);
				$("#bz").val(data.bz);
				dohide();
				jQuery("#table1").jqGrid().setGridParam({
					postData : {
						cdid : nodes[0].id
					}
				}).trigger("reloadGrid");

				jQuery("#table2").jqGrid().setGridParam({
					postData : {
						cdid : nodes[0].id
					}
				}).trigger("reloadGrid");

			}
		});
	}

function doshow() {
	$('#save_item').show()
	$('#cencle_item').show()
	$('#edit_item').hide()
	$('#add_form').find('.form-control').each(function() {
		$(this).removeAttr('disabled');
	})
	$("#sjcdmc").attr("disabled", true)
}

function dohide() {
	$('#save_item').hide()
	$('#cencle_item').hide()
	$('#edit_item').show()
	$('#add_form').find('.form-control').each(function() {
		$(this).attr('disabled', 'disabled');
		$(this).removeClass("border-red");
	})
	$("#sjcdmc").attr("disabled", true)
}


function delmenu() {
	var treeObj = $.fn.zTree.getZTreeObj("pTree");
	var nodes = treeObj.getSelectedNodes();
	if (!nodes || nodes.length == 0) {
		layer.msg('请选择一个菜单')
		return;
	}
	layer.confirm('确认删除吗？', {
		btn : [ '确认', '取消' ]
	}, function() {
		$.ajax({
			type : 'POST',
			url : ahcourt.ctx + "/setting/menu/deleteById.do",
			datatype : 'json',
			data : {
				'cdid' : nodes[0].id
			},
			success : function(data) {
				if (data > 0) {
					layer.msg('删除成功');
					treeObj.removeNode(nodes[0]);
				} else {
					layer.msg('删除失败');
				}
			}
		});
	})
}

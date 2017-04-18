var zNodes;

$(document).ready(function() {

	$("#table1").jqGrid({
		url : ahcourt.ctx + "/setting/role/roleList.do",
		datatype : "json",
		mtype : "post",
		width : $('.rolelist').outerWidth()-5,
		height : $('body').height() - 80,
		shrinkToFit : false,
		colModel : [ {
			label : 'id',
			name : 'id',
			hidden : true
		}, {
			label : '角色名称',
			name : 'jsmc',
			width : ($('.rolelist').outerWidth()-5)*0.3,
			align : "left",
			sortable : false
		}, {
            label : '角色描述',
            name : 'jssm',
            width : ($('.rolelist').outerWidth()-5)*0.5,
            align : "left",
            sortable : false
        },{
			label : '操作 ',
			name : 'option',
			width : ($('.rolelist').outerWidth()-5)*0.2,
			align : "center",
			sortable : false,
			formatter : function(cellvalue, options, rowObject) {
				return '<button class="btn btn-white btn-xs" type="button" onclick="deleteRole(\'' + rowObject.id + '\')"><i class="fa fa-remove"></i>&nbsp;删除</button>&nbsp;';
			}
		} ],
		hidegrid : false,
		loadComplete : function(ids) {
			if(ids && ids[0] && ids[0].id){
                $("#table1").setSelection(ids[0].id);
			}
		},
		onSelectRow : function(id) {
			$.ajax({
				type : 'POST',
				url : ahcourt.ctx + "/setting/menu/selectTreeList.do",
				data : {
					jsid : id
				},
				datatype : 'json',
				async : false,
				success : function(data) {
					zNodes = data;
				}
			});
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		}
	});

	$(window).bind('resize', function() {
		$('#table1').setGridWidth($('.rolelist').outerWidth()-5);
		$('#table1').setGridHeight($('body').height() - 80);
	});

	$('.i-checks').iCheck({
		radioClass : 'iradio_square-green',
		checkboxClass : 'icheckbox_square-green',
	});

	var config = {
		'.chosen-select' : {},
		'.chosen-select-deselect' : {
			allow_single_deselect : true
		},
		'.chosen-select-no-single' : {
			disable_search_threshold : 10
		},
		'.chosen-select-no-results' : {
			no_results_text : 'Oops, nothing found!'
		},
		'.chosen-select-width' : {
			width : "95%"
		}
	}
	for ( var selector in config) {
		$(selector).chosen(config[selector]);
	}

	$("#new_role").click(function() {
		layer.open({
			type : 2,
			title : '新建角色',
			shadeClose : false,
			shade : 0.3,
			area : [ '60%', '40%' ],
			shift : -1,
			content : ahcourt.ctx + '/views/setting/role/input.jsp',
		});
	})

	$("#save_menu").click(function() {
		var cdids = "";
		// 选中的菜单
		var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
		var nodes = treeObj.getCheckedNodes(true);
		for (var i = 0; i < nodes.length; i++) {
			cdids += nodes[i].id + ";";
		}

		// 获取jqgrid选中行的角色id
		var jsid = $('#table1').jqGrid('getGridParam', 'selrow');

		$.ajax({
			type : 'POST',
			url : ahcourt.ctx + "/setting/role/saveRoleMenu.do",
			datatype : 'json',
			data : {
				jsid : jsid,
				cdids : cdids.substring(0, cdids.length - 1)
			},
			success : function(data) {
				if (data > 0 || data == -1) {
					layer.msg('保存成功');
				}else {
					layer.msg('保存失败');
					location.reload(true);
				}
			}
		});
	})

	// $("#save_btn").click(function() {
	// 	var cdid = "", anids = "";
	// 	// 获取点击行ztree的菜单id
	// 	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	// 	var nodes = treeObj.getSelectedNodes();
    //
	// 	if (nodes.length == 0) {
	// 		layer.msg('请选择一个菜单')
	// 		return;
	// 	} else {
	// 		cdid = nodes[0].id
	// 	}
    //
	// 	// 获取jqgrid选中行的角色id
	// 	var jsid = $('#table1').jqGrid('getGridParam', 'selrow');
	// 	// 选中的按钮
	// 	$("input:checkbox").each(function(index, element) {
	// 		var val = element.value;
	// 		var check = element.checked
	// 		if (check == true) {
	// 			anids += val + ";";
	// 		}
	// 	});
    //
	// 	$.ajax({
	// 		type : 'POST',
	// 		url : ahcourt.ctx + "/setting/role/saveRoleBtn.do",
	// 		datatype : 'json',
	// 		data : {
	// 			jsid : jsid,
	// 			cdid : cdid,
	// 			anids : anids.substring(0, anids.length - 1),
	// 		},
	// 		success : function(data) {
	// 			if (data > 0 || data == -1) {
	// 				layer.msg('保存成功');
	// 			} else {
	// 				layer.msg('保存失败');
	// 				location.reload(true);
	// 			}
	// 		}
	// 	});
	// })
    //
	// $("#save_sj").click(function() {
	// 	var cdid = "", bgids = "", sjqxs = "";
	// 	// 获取点击行ztree的菜单id
	// 	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
	// 	var nodes = treeObj.getSelectedNodes();
    //
	// 	if (nodes.length == 0) {
	// 		layer.msg('请选择一个菜单')
	// 		return;
	// 	} else {
	// 		cdid = nodes[0].id
	// 	}
    //
	// 	// 获取jqgrid选中行的角色id
	// 	var jsid = $('#table1').jqGrid('getGridParam', 'selrow');
	// 	// 选中表格的数据权限
	// 	$("#archive_table_form tr:gt(0)").each(function(index, element) {
	// 		bgids += $(this).find('td:eq(0)').text()+";";
	// 		sjqxs += $(this).find('td:eq(2)').find('select').val()+";";
	// 	})
    //
	// 	$.ajax({
	// 		type : 'POST',
	// 		url : ahcourt.ctx + "/setting/role/saveRoleGridRange.do",
	// 		datatype : 'json',
	// 		data : {
	// 			jsid : jsid,
	// 			cdid : cdid,
	// 			bgids : bgids.substring(0, bgids.length - 1),
	// 			sjqxs : sjqxs.substring(0, sjqxs.length - 1)
	// 		},
	// 		success : function(data) {
	// 			if (data > 0 || data == -1) {
	// 				layer.msg('保存成功');
	// 			} else {
	// 				layer.msg('保存失败');
	// 				location.reload(true);
	// 			}
	// 		}
	// 	});
	// });
	
	//全选可操作按钮
	$(".selectall_menu_btn").click(function(){
		selectall($(this));
	});
	
	//反选可操作按钮
	$(".selectreverse_btn").click(function(){
		selectreverse($(this));
	});
})

function selectreverse(ele){
	var _i=ele.closest(".bmbox_layout").find(".role_wrap label .icheckbox_square-green"),
		_input=_i.find("input");
	_i.each(function(){
		var _this=$(this);
		if(_this.hasClass("checked")){
			_this.removeClass("checked");
			_this.find("input").attr("checked",false);
		}else{
			_this.addClass("checked");
			_this.find("input").attr("checked",true);
		}
	});
};

function selectall(ele){
	var _i=ele.closest(".bmbox_layout").find(".role_wrap label .icheckbox_square-green"),
		_input=_i.find("input");
	_i.addClass("checked");
	_input.attr("checked",true);
};

function deleteRole(id) {
	layer.confirm('确认该角色删除吗？', {
		btn : [ '确认', '取消' ]
	}, function() {
		$.ajax({
			type : 'POST',
			url : ahcourt.ctx + "/setting/role/deleteRole.do",
			datatype : 'json',
			data : {
				id : id
			},
			success : function(data) {
				if (data > 0) {
					layer.msg('删除角色成功');
					jQuery("#table1").jqGrid().setGridParam({}).trigger("reloadGrid");
				} else {
					layer.msg('删除角色失败');
				}
			}
		});
	})
}

var setting = {
	data : {
		simpleData : {
			enable : true
		}
	},
	check : {
		enable : true
	},
	callback : {
		// onClick : selectCd
	}
};

// function selectCd() {
//
// 	// 获取点击行ztree的菜单id
// 	var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
// 	var nodes = treeObj.getSelectedNodes();
//
// 	// 获取jqgrid选中行的角色id
// 	var jsid = $('#table1').jqGrid('getGridParam', 'selrow');
//
// 	if (nodes.length == 0) {
// 		layer.msg('请选择一个菜单')
// 		return;
// 	}
// 	if (jsid.length == 0) {
// 		layer.msg('请选择一个角色')
// 		return;
// 	}
//
// 	$.ajax({
// 		type : 'POST',
// 		url : ahcourt.ctx + "/setting/menu/getMenuBtn.do",
// 		data : {
// 			cdid : nodes[0].id,
// 			jsid : jsid
// 		},
// 		datatype : 'json',
// 		success : function(data) {
// 			var html = "";
// 			if (data.length > 0) {
// 				for (var i = 0; i < data.length; i++) {
// 					html += '<label><input type="checkbox" value="' + data[i].anid + '" ' + data[i].checked + ' ><i></i> ' + data[i].anmc + '</label> ';
// 				}
// 			}
// 			$("#kczan").html(html);
// 			$('.i-checks').iCheck({
// 				radioClass : 'iradio_square-green',
// 				checkboxClass : 'icheckbox_square-green',
// 			});
// 		}
// 	});
//
// 	$.ajax({
// 		type : 'POST',
// 		url : ahcourt.ctx + "/setting/menu/getMenuGrid.do",
// 		data : {
// 			cdid : nodes[0].id,
// 			jsid : jsid
// 		},
// 		datatype : 'json',
// 		success : function(data) {
// 			$("#archive_table_form tr:gt(0)").remove();
// 			var html = "";
// 			if (data.length > 0) {
// 				for (var i = 0; i < data.length; i++) {
// 					html += '<tr><td class="hidden">' + data[i].cdbgid + '</td><td align="right">' + data[i].bgmc + '</td><td><select class="form-control input-sm bmrequire" retype="select"><option value="">--请选择--</option>';
// 					if (data[i].sjqx == 1) {
// 						html += '<option value="1" selected>仅访问自己的数据</option>';
// 					} else {
// 						html += '<option value="1" >仅访问自己的数据</option>';
// 					}
// 					if (data[i].sjqx == 2) {
// 						html += '<option value="2" selected>访问所在部门的数据</option>';
// 					} else {
// 						html += '<option value="2" >访问所在部门的数据</option>';
// 					}
//
// 					if (data[i].sjqx == 3) {
// 						html += '<option value="3" selected>访问所在部门及子部门的数据</option>';
// 					} else {
// 						html += '<option value="3" >访问所在部门及子部门的数据</option>';
// 					}
// 					if (data[i].sjqx == 4) {
// 						html += '<option value="4" selected>访问全公司数据</option>';
// 					} else {
// 						html += '<option value="4" >访问全公司数据</option>';
// 					}
//
// 					html += '</select></td></tr> ';
// 				}
// 			}
// 			$("#archive_table_form").append(html);
//
// 		}
// 	});
// }

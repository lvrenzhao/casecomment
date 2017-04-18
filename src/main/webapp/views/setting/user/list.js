var zNodes;
$(function() {
	$.ajax({
		type : 'POST',
		url : ahcourt.ctx + "/setting/organization/getlist.do",
		datatype : 'json',
		async : false,
		success : function(data) {
			zNodes = data;
		}
	});
	$.fn.zTree.init($("#organization_menu"), setting, zNodes);
	$("#organization_btn").click(function() {
		showMenu();
		return false;
	});
	acountlistgrid();// 初始化员工信息列表
	$(window).on('resize', function() {
		$('#acounttable_grid').setGridWidth(gridWidth());
		$('#acounttable_grid').setGridHeight(gridHeight());
	});
	$('#serch').click(function() {
		$("#acounttable_grid").jqGrid().setGridParam({
            page:1,
            postData : {
				xm : $('#xm').val(),
				zh : $("#zh").val(),
				zzid : $("#zzjgids").val(),
				zhlx : $("#zhlx").val(),
				zhzt : $('#zhzt').val(),
			}
		}).trigger("reloadGrid");
	})
})
// 员工信息列表
function acountlistgrid() {
	$("#acounttable_grid").jqGrid({
		url : ahcourt.ctx + "/setting/user/zhgllist.do",
		datatype : "json",
		mtype:'post',
		width : gridWidth(),
		height : gridHeight(),
		rownumbers : true,
		shrinkToFit : false,
		rowNum : 20,
		rowList : [   10,15,20,30 ],
		colModel : [ {
			label : 'id',
			name : 'yhid',
			hidden : true,
			key : true,
			frozen : true
		}, {
			label : '操作',
			name : 'operations',
			align : 'center',
			width : 200,
			sortable : false,
			formatter : gridmenu,
			frozen : true
		}, {
			label : '姓名',
			name : 'xm',
			width : 100
		}, {
			label : '账户状态',
			name : 'zhzt',
			align : 'center',
			width : 80,
			formatter : acountstate
		}, {
			label : '帐号',
			name : 'zh',
			width : 80
		}, {
			label : '密码',
			name : 'mm',
			width : 80
		}, {
			label : '角色',
			name : 'jsid',
			width : 150
		}, {
			label : '组织机构',
			name : 'zzid',
			width : 150
		}, {
			label : '邮件',
			name : 'dzyx',
			width : 120
		}, {
			label : '电话',
			name : 'dh',
			align : 'center',
			width : 120
		}, {
			label : '手机',
			name : 'sj',
			align : 'center',
			width : 120
		}, ],
		pager : "#acounttable_page"
	}).jqGrid('setFrozenColumns');
	function gridmenu(cellvalue, options, rowObject) {
		var edit = '<button class="btn btn-white btn-xs mr5" type="button" onclick="editstaff(\'' + rowObject.yhid + '\')"><i class="fa fa-edit"></i>&nbsp;编辑</button>&nbsp;';
		var enable = '<button class="btn btn-white btn-xs mr5" type="button" onclick="enablestate(\'' + rowObject.yhid + '\',\'' + 1 + '\')"><i class="fa fa-play"></i>&nbsp;启用</button>';
		var disable = '<button class="btn btn-white btn-xs" type="button" onclick="enablestate(\'' + rowObject.yhid + '\',\'' + 2 + '\')"><i class="fa fa-pause"></i>&nbsp;禁用</button>';
		return edit + enable + disable;
	};
	function acountstate(cellvalue, options, rowObject) {
		var label_types = {
			"1" : "label-success",
			"2" : "label-danger",
		};
		var label_texts = {
			"1" : "启用",
			"2" : "禁用",
		};
		var imageHtml;
		imageHtml = "<span class=\"label " + label_types[cellvalue] + "\">" + label_texts[cellvalue] + "</span>";
		return imageHtml;
	};
	function staffstate(cellvalue, options, rowObject) {
		var imageHtml = "";
		if (cellvalue != null && cellvalue != '') {
			var label_types = {
				"实习期" : "label-primary",
				"试用期" : "label-danger",
				"正式员工" : "label-success",
				"离职员工" : "label-info",
			};
			
			imageHtml = "<span class=\"label " + label_types[cellvalue] + "\">" + cellvalue + "</span>";
		}
		return imageHtml;
	}
	function stafflink(cellvalue, options, rowObject) {
		var strlink = '<button class="btn btn-link btn-xs color_green" type="button" onclick="viewstaffinfo(\'' + rowObject.ygid + '\')">' + '查看简历' + '</button>';
		return strlink;
	}
}
// 编辑账号
function editstaff(id) {
	layer.open({
		type : 2,
		shift : 5,
		title : '编辑用户账号',
		shadeClose : false,
		shade : 0.3,
		area : [ '90%', '85%' ],
		content : ahcourt.ctx + '/setting/user/input.do?id='+id+"&mode=edit",
		end : function(index) {
//			layer.close(index);
			$("#acounttable_grid").jqGrid().trigger("reloadGrid")
		}
	});
}


function newstaff(id) {
    layer.open({
        type : 2,
        shift : 5,
        title : '新建用户账号',
        shadeClose : false,
        shade : 0.3,
        area : [ '90%', '85%' ],
        content : ahcourt.ctx + '/setting/user/input.do?&mode=new',
        end : function(index) {
//			layer.close(index);
            $("#acounttable_grid").jqGrid().trigger("reloadGrid")
        }
    });
}

// 查看简历
function viewstaffinfo(id) {
	layer.open({
		type : 2,
		shift : 5,
		title : '查看简历详情',
		shadeClose : false,
		shade : 0.3,
		area : [ '95%', '90%' ],
		content : ahcourt.ctx + '/office/hrjoin/addStaff.do?id='+id+'&&mode=view',
		cancel : function(index) {
			layer.close(index);
		}
	});
}
var setting = {
	check : {
		enable : true,
		chkboxType : {
			"Y" : "ps",
			"N" : "ps"
		}
	},
	data : {
		simpleData : {
			enable : true
		}
	},
	callback : {
		onCheck : zTreeOnCheck
	}
};
function zTreeOnCheck(event, treeId, treeNode) {
	var nodes = getTreeSelected();
	var newNodes = [];
	var _length;
	var vals = "", zzjgids = "";
	_length = nodes.length;
	for (var i = 0; i < nodes.length; i++) {
		if (!nodes[i].isParent) {
			newNodes.push(nodes[i]);
			if (_length === 1) {
				vals = nodes[i].name+ ';';
				zzjgids = nodes[i].id+ ';';
			} else {
				vals += nodes[i].name + ';';
				zzjgids += nodes[i].id + ';';
			}
		}
	}
	vals = vals.substring(0, vals.length - 1);	
	var inputele = $("#organization_input");
	inputele.val(vals);
	$("#zzjgids").val(zzjgids.substring(0, zzjgids.length - 1));
	hideMenu();
};

function getTreeSelected() {
	var ztree = $.fn.zTree.getZTreeObj('organization_menu')
	var nodes = ztree.getCheckedNodes(true)
	return nodes;
};

function showMenu() {
	$("#organization_Content").slideDown("fast");
	$("body").bind("mousedown", onBodyDown);
};

function hideMenu() {
	$("#organization_Content").fadeOut("fast");
	$("body").unbind("mousedown", onBodyDown);
};

function onBodyDown(event) {
	if (!(event.target.id == "organization_btn" || event.target.id == "organization_Content" || $(event.target).parents("#organization_Content").length > 0)) {
		hideMenu();
	}
};

function gridWidth() {
	return $(".acountlist").outerWidth() - 2;
}

function gridHeight() {
	return $(".acountlist").outerHeight() - 85 - 80;
}

function enablestate(id, state) {
	$.ajax({
		type : 'POST',
		url : ahcourt.ctx + "/setting/user/update.do",
		datatype : 'json',
		data : {
			yhid : id,
			zhzt : state,
		},
		success : function(data) {
			if (data > 0) {

				$("#acounttable_grid").jqGrid().trigger("reloadGrid");
			} else
				layer.msg('修改失败');
		}
	});
}

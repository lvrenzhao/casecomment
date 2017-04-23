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
		shrinkToFit : true,
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
			width : 180,
			sortable : false,
			formatter : gridmenu,
			frozen : true
		}, {
			label : '专家姓名',
			name : 'xm',
			width : 100
		}, {
            label : '组织机构',
            name : 'zzid',
            width : 150
        }, {
            label : '头衔',
            name : 'jsid1',
            width : 100
        },  {
            label : '专业',
            name : 'jsid1',
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
		}, {
            label : '介绍',
            name : 'sssj',
            formatter:formatter_grid2_shyj,
            width : 200
        }],
		pager : "#acounttable_page"
        ,viewrecords: true
	}).jqGrid('setFrozenColumns');
	function gridmenu(cellvalue, options, rowObject) {
		var btn_edit = '<button class="btn btn-white btn-xs mr5" type="button" onclick=""><i class="fa fa-edit"></i>&nbsp;编辑</button>&nbsp;';
		var btn_delete = '<button class="btn btn-white btn-xs mr5" type="button" onclick=""><i class="fa fa-trash"></i>&nbsp;删除</button>';
		return btn_edit + btn_delete ;
	};

    function formatter_grid2_shyj(cellvalue, options, rowObject) {
        return '<a href="javascript:void(0)">...</a>';
    }
}


function newstaff(id) {
    layer.open({
        type : 2,
        shift : 5,
        title : '添加专家',
        shadeClose : false,
        shade : 0.3,
        area : [ '90%', '85%' ],
        content : ahcourt.ctx + '/setting/professional/input.do?&mode=new',
        end : function(index) {
//			layer.close(index);
            $("#acounttable_grid").jqGrid().trigger("reloadGrid")
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

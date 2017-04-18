var nowztreeid,pid,ztreeobject;
$(document).ready(function() {
	var zNodes = getdate();
	ztreeobject=$.fn.zTree.init($("#treeDemo"), setting, zNodes);
	$("#new_dept").click(function() {
		layer.open({
			type : 2,
			title : '新建组织或机构',
			shadeClose : false,
			shade : 0.3,
			area : [ '60%', '75%' ],
			shift : -1,
			content : ahcourt.ctx + '/views/setting/organization/organization_input.jsp',
		});
	});
	loadUser();
});
var setting = {
	view : {
		addHoverDom : addHoverDom,
		removeHoverDom : removeHoverDom
	},
	edit : {
		enable : true,
		showRemoveBtn : true,
		showRenameBtn : true,
	},
	data : {
		simpleData : {
			enable : true
		}
	},
	callback : {
		beforeDrag : beforeDrag,
		beforeRemove : beforeRemove,
		beforeRename : beforeRename,
		onClick : onClick
	}
};
var log, className = "dark";
function beforeDrag(treeId, treeNodes) {
	return false;
}
function beforeRename(treeId, treeNode, newName) {
	if (newName.length == 0) {
		layer.msg("节点名称不能为空.");
		return false;
	} else {
		var flag = updateandaddorg(treeNode.id, newName, treeNode.pId)
		if (flag == 1) {
			layer.msg("修改成功");
		} else if (flag == 2) {
			layer.msg("修改失败");
		} else if (flag == 3) {
			layer.msg("新增成功");
		} else if (flag == 4) {
			layer.msg("新增失败");
		}
	}
}
function beforeRemove(treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("treeDemo");
	className = (className === "dark" ? "" : "dark");
	//showLog("[ " + getTime() + " beforeRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
	if (treeNode.isParent) {
		layer.confirm("该节点有子节点，如果删除则子节点将一起被删除，确认删除节点 -- " + treeNode.name + " 吗？", {
			btn : [ '确认', '取消' ]
		}, function() {
			var state = del(treeNode.id);
			if (state > 0) {
				layer.msg('删除成功');
				zTree.removeNode(treeNode);
				layer.close();
			}
		});
	} else {
		layer.confirm("确认删除节点 -- " + treeNode.name + " 吗？", {
			btn : [ '确认', '取消' ]
		}, function() {
			var state = del(treeNode.id);
			if (state > 0) {
				layer.msg('删除成功');
				zTree.removeNode(treeNode);
				layer.close();
			}
		});
	}
	return false;
}


function getTime() {
	var now = new Date(), h = now.getHours(), m = now.getMinutes(), s = now.getSeconds(), ms = now.getMilliseconds();
	return (h + ":" + m + ":" + s + " " + ms);
}
var newCount = 1;
function addHoverDom(treeId, treeNode) {
	var sObj = $("#" + treeNode.tId + "_span");
	if (treeNode.editNameFlag || $("#addBtn_" + treeNode.tId).length > 0)
		return;
	var addStr = "<span class='button add' id='addBtn_" + treeNode.tId + "' title='add node' onfocus='this.blur();'></span>";
	sObj.after(addStr);
	nowztreeid = treeNode.id;
	var btn = $("#addBtn_" + treeNode.tId);
	if (btn){
		btn.bind("click", function() {
			var pId = treeNode.id;
			pid = pId;
			var name = "new node" + (newCount++);
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			treeNode = zTree.addNodes(treeNode, {
				pId : pId,
				name : name,
			});

			zTree.editName(treeNode[0]);
			return false;
		});
	}
};
function removeHoverDom(treeId, treeNode) {
	$("#addBtn_" + treeNode.tId).unbind().remove();
};
function onClick(e, treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("treeDemo"), nodes = zTree.getSelectedNodes(), id = "";
	for (var i = 0, l = nodes.length; i < l; i++) {
		id += nodes[i].id + ",";
	}
	if (id.length > 0) {
		id = id.substring(0, id.length - 1);
	}
	$("#table1").jqGrid().setGridParam({
		postData : {
			zzid : id,
		}
	}).trigger("reloadGrid");
}
function loadUser() {
	$("#table1").jqGrid({
		url : ahcourt.ctx + "/setting/organization/getuserlist.do",
		datatype : "json",
		mtype : "post",
		height : gridHeight() ,
		width : gridWidth(),
		shrinkToFit : true,
		rowNum : 20,
		rowList : [20,30,40], 
		pager : "#pager1",
		viewrecords : true,
		rownumbers : true,
		colModel : [ {
			label : 'yhid',
			name : 'yhid',
			hidden : true
		}, {
			label : '姓名',
			name : 'xm',
			width : 80,
			align : "left",
		},  {
			label : '登录名',
			name : 'zh',
			width : 100,
			align : "left",
		}, {
			label : '邮箱',
			name : 'dzyx',
			width : 100,
			align : "left",
		}, {
			label : '手机号',
			name : 'sj',
			width : 100,
			align : "center",
		},
		{
			label : '组织机构名称',
			name : 'zzid',
			width : 100,
			align : "center",
		} ],
		hidegrid : false,
	});
	$(window).bind('resize', function() {
		$('#table1').setGridWidth(gridWidth());
		$('#table1').setGridHeight(gridHeight());
	});
	function gridWidth() {
		return $('body').width()-$('body').width()*0.3-10;
	}
	function gridHeight() {
		return $('body').height()-120;
	}
}
function getdate() {
	var zNodes = [];
	$.ajax({
		type : 'POST',
		url : ahcourt.ctx + "/setting/organization/getlist.do",
		datatype : 'json',
		async : false,
		success : function(data) {
			zNodes = data;
		}
	});
	return zNodes;
}
function del(ztreeid) {
	var zNodes;
	$.ajax({
		type : 'POST',
		url : ahcourt.ctx + "/setting/organization/delorg.do",
		data : {
			zzjgid : ztreeid,
		},
		datatype : 'json',
		async : false,
		success : function(data) {
			zNodes = data;
		}
	});
	return zNodes;
}

function updateandaddorg(zzjgid, zzjgmc, sjzzjgid) {
	var zNodes;
	$.ajax({
		type : 'POST',
		url : ahcourt.ctx + "/setting/organization/updateandaddorg.do",
		data : {
			zzjgid : zzjgid,
			zzjgmc : zzjgmc,
			sjzzjgid : sjzzjgid,
		},
		datatype : 'json',
		async : false,
		success : function(data) {
			location.reload(true);
            // getdate();
            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
            // zTree.reAsyncChildNodes(null, "refresh");
            // console.log("refresh..")
			zNodes = data;
		}
	});
	return zNodes;
}


function reloadtable() {
	$("#table1").jqGrid().trigger("reloadGrid");
}
var add_box;
function gridWidth() {
	return $('.jqGrid_wrapper').width();
}
function gridHeight() {
	return $('body').height() - $('.form-horizontal').height() - 125;
}

$(document).ready(function() {
	$("#table1").jqGrid({
		url : ahcourt.ctx + "/setting/file/getList.do",
		datatype : "json",
		height : gridHeight(),
		width : gridWidth(),
		autowidth : true,
		shrinkToFit : true,
		multiselect : true,
		pager : "#pager1",
		mtype : "post",
		viewrecords : true,
		caption : "文件列表",
		hidegrid : false,
		sortname : 'id',
		sortorder : "desc",
		rowNum : 20,
		rowList : [ 10, 20, 50 ],
		colNames : [ 'id', '是否公开', '文件名', '存储名称', '文件大小', 'md5', '关键字', '下载次数', '操作' ],
		colModel : [ {
			name : 'id',
			index : 'id',
			key : true,
			hidden : true
		}, {
			name : 'is_pub',
			index : 'is_pub',
			formatter : formatpub,
			width : 50,
			sortable : true
		}, {
			name : 'file_name',
			index : 'file_name',
			width : 80,
			sortable : false
		}, {
			name : 'save_name',
			index : 'save_name',
			width : 60,
			sortable : true
		}, {
			name : 'file_size',
			index : 'file_size',
			width : 60,
			sortable : false
		}, {
			name : 'md5',
			index : 'md5',
			width : 60,
			align : "right",
			sortable : true
		}, {
			name : 'keywords',
			index : 'keywords',
			width : 80,
			sortable : true
		}, {
			name : 'download_count',
			index : 'download_count',
			width : 60,
			sortable : true
		}, {
			name : 'option',
			index : 'option',
			width : 80,
			align : "center",
			sortable : false,
			formatter : formatoption
		} ]
	});

	$(window).bind('resize', function() {
		$('#table1').setGridWidth(gridWidth());
		$('#table1').setGridHeight(gridHeight());
	});

	$("#table1").jqGrid('navGrid', '#pager1', {
		edit : false,
		add : false,
		del : false,
		search : false,
		refresh : false
	});

	initDictType();
});

function formatpub(cellvalue, options, rowdata) {
	if (cellvalue == '0') {
		return '不公开';
	} else {
		return '公开';
	}
}

function formatoption(cellvalue, options, rowdata) {
	var down = '<a class="btn btn-default btn-xs" href="' + ahcourt.ctx + '/setting/file/download/' + rowdata.id + '.do"><i class="fa fa-edit"></i>&nbsp;下载</a>&nbsp;';
	var del = '<a class="btn btn-default btn-xs" href="javascript:delFile(\'' + rowdata.id + '\')"><i class="fa fa-edit"></i>&nbsp;删除</a>';
	return down + del;
}

function reloadtable() {
	$("#table1").jqGrid().trigger("reloadGrid");
}

function getselects() {
	return ids = $('#table1').jqGrid('getGridParam', 'selarrrow');
}

function search() {
	$("#table1").jqGrid().setGridParam({
		postData : {
			file_type : $("#file_type").val(),
			file_name : $("#name_like").val()
		}
	}).trigger("reloadGrid");
}

function delPage() {
	var ids = getselects();
	if (!ids || ids.length == 0) {
		return alert('请选择至少一行数据')
	}
	var con = confirm("确定删除多条记录？");
	if (con) {
		var count = 0;
		for (var i = 0; i < ids.length; i++) {
			$.ajax({
				type : 'POST',
				url : ahcourt.ctx + '/setting/file/delFile.do',
				datatype : 'json',
				async : false,
				data : {
					'id' : ids[i]
				},
				success : function(data) {
					if (data > 0)
						count++;
				}
			});
		}
		if (count == ids.length)
			$("#table1").jqGrid().trigger("reloadGrid");
		else
			layer.msg('删除失败');
	}
}

function delFile(id) {
	var con = confirm("确定删除该文件？");
	if (con) {
		$.ajax({
			type : 'POST',
			url : ahcourt.ctx + '/setting/file/delFile.do',
			datatype : 'json',
			data : {
				'id' : id
			},
			success : function(data) {
				if (data > 0)
					$("#table1").jqGrid().trigger("reloadGrid");
				else
					layer.msg('删除失败');
			}
		});
	}
}

function initDictType() {
	$.get(ahcourt.ctx + '/setting/file/getTypeList.do', function(data) {
		if (data) {
			var a = '';
			a = a + '<option value="">全部</option>'
			for (var i = 0; i < data.length; i++) {
				a = a + '<option value="' + data[i] + '">' + data[i] + '</option>'
			}
			$('#file_type').html(a);
		}
	});
}
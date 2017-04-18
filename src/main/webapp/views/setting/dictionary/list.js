var add_box, lastselect, tabindex;
$(function() {
	document.getElementById("div1").style.width=$('body').width()*0.45+"px";
	document.getElementById("div2").style.width=$('body').width()*0.55+"px";
	document.getElementById("div2").style.left=$('body').width()*0.45+"px";
	
	document.getElementById("div1").style.height=$('body').height() - 220+'px';
	document.getElementById("div2").style.height=$('body').height() - 220+'px';
	initGrid1()
	checkmyblur();
	$(window).on('resize', function() {
		$('#table1').setGridWidth(gridWidth1());
		$('#table1').setGridHeight(gridHeight());
		
		$('#table2').setGridWidth(gridWidth2());
		$('#table2').setGridHeight(gridHeight());
	});
})

function gridWidth1() {
	return $('body').width()*0.45-10+"px";	
}
function gridWidth2() {
	return $('body').width()*0.55-10+"px";
}

function gridHeight() {
	return $('body').height() - 220+'px';
}

function initGrid1() {
	$("#table1").jqGrid({
		url : ahcourt.ctx + "/setting/dict/getGroupList.do",
		datatype : "json",
		mtype : "post",
		height : gridHeight(),
		width : gridWidth1(),
		autowidth : true,
		rownumbers : true,
		shrinkToFit : false,
		hidegrid : false,
		pager : '#pager1',
		rowNum : 10,
		rowList : [ 10, 20, 30 ],
		colModel : [ {
			label : '操作',
			name : 'operations',
			width : 140,
			align : 'center',
			sortable : false,
			formatter : formatoption1
		}, {
			label : '字典组名称',
			name : 'zdmc',
			width : 150
		}, {
			label : '字典组编号',
			name : 'zdbh',
			key : true,
			width : 120
		} ],
        loadComplete : function(ids) {
			// console.log(ids);
			if(ids && ids.rows && ids.rows[0]){
                initGrid2({
                    "sjzdbh" : ids.rows[0].zdbh
                })
			}

		},
		onSelectRow : function(rowid, status) {
			var rowdata = $('#table1').jqGrid('getRowData', rowid)
			lastselect = rowid;
			$("#table2").jqGrid().setGridParam({
				postData : {
					"sjzdbh" : rowdata.zdbh
				}
			}).trigger("reloadGrid");
		}
	});
}

function initGrid2(postData) {
	$("#table2").jqGrid({
		url : ahcourt.ctx + "/setting/dict/getList.do",
		datatype : "json",
		postData : postData,
		height : gridHeight(),
		width : gridWidth2(),
		autowidth : true,
		rownumbers : true,
		shrinkToFit : true,
		hidegrid : false,
		viewrecords : true,
		sortname : 'sort',
		sortorder : "asc",
		rowNum : 10,
		rowList : [ 10, 20, 30 ],
		colModel : [ {
			label : '操作',
			name : 'operations',
			width : 200,
			align : 'center',
			sortable : false,
			formatter : formatoption2
		}, {
			label : '字典项名称',
			name : 'zdmc',
			width : 150,
			sortable : true
		}, {
			label : '字典项编号',
			name : 'zdbh',
			width : 150,
			key : true,
			sortable : false
		}, {
			label : '排序',
			name : 'sort',
			width : 80,
			align : "right",
			sortable : true
		}, {
			label : '备注',
			name : 'remarks',
			width : 100,
			sortable : false
		} ],
		pager : '#pager2'
	});
}

function formatoption1(cellvalue, options, rowdata) {
	var edit = '<button class="btn btn-default btn-xs" type="button" onclick="openGroupBox(\'' + rowdata.zdbh + '\',\'edit\')"><i class="fa fa-edit"></i>&nbsp;修改</button>&nbsp;';
	var del = '<button class="btn btn-default btn-xs" type="button" onclick="delDictId(\'' + rowdata.zdbh + '\',1)"><i class="fa fa-edit"></i>&nbsp;删除</button>';
	return edit + del;
}

function formatoption2(cellvalue, options, rowdata) {
	var edit = '<button class="btn btn-default btn-xs" type="button" onclick="openItemBox(\'' + rowdata.zdbh + '\',\'edit\')"><i class="fa fa-edit"></i>&nbsp;修改</button>&nbsp;';
	var del = '<button class="btn btn-default btn-xs" type="button" onclick="delDictId(\'' + rowdata.zdbh + '\',2)"><i class="fa fa-edit"></i>&nbsp;删除</button>';
	return edit + del;
}

function search() {
	$("#table1").jqGrid().setGridParam({
		postData : {
			"zdmc" : $('#search_zdmc').val(),
			"zdbh" : $('#search_zdbh').val()
		}
	}).trigger("reloadGrid");

    $("#table2").jqGrid().setGridParam({
        postData : {
            "sjzdbh" : "xxxx"
        }
    }).trigger("reloadGrid");
}

function openGroupBox(zdbh, mode) {
	tabindex = 1
	$('#name_label').html('字典组名称')
	if (mode == "add") {
		$('#save').show();
		$('#edit').hide();
		$("#sjzdbh").val('0')
		$("#zdbh").val('')
		$("#zdmc").val('')
		$("#sort").val('')
		$("#remarks").val('')
	} else if (mode == "edit") {
		$('#edit').show();
		$('#save').hide();

		var rowdata = $('#table1').jqGrid('getRowData', zdbh)
		$("#zdbh").val(rowdata.zdbh)
		$("#sjzdbh").val(rowdata.sjzdbh)
		$("#zdmc").val(rowdata.zdmc)
		$("#sort").val(rowdata.sort)
		$("#remarks").val(rowdata.remarks)
	} else {
		return;
	}
	add_box = layer.open({
		type : 1,
		shift : 5,
		title : '添加字典组',
		shadeClose : false,
		shade : 0.3,
		area : [ '40%', '40%' ],
		content : $('#add_dict_box'),
		cancel : function(index) {
			layer.close(index);
		}
	});
}

function closeaddbox() {
	layer.close(add_box);
}

function openItemBox(zdbh, mode) {
	if(lastselect==101){
		layer.msg("请选择字典组！");
		return;
	}
	tabindex = 2;
	$('#name_label').html('字典项名称')
	if (mode == "add") {
		$('#save').show();
		$('#edit').hide();
		$("#sjzdbh").val(lastselect);
		$("#zdbh").val('')
		$("#zdmc").val('')
		$("#sort").val('')
		$("#remarks").val('')
	} else if (mode == "edit") {
		$('#edit').show();
		$('#save').hide();

		var rowdata = $('#table2').jqGrid('getRowData', zdbh)
		$("#sjzdbh").val(rowdata.sjzdbh)
		$("#zdbh").val(rowdata.zdbh)
		$("#zdmc").val(rowdata.zdmc)
		$("#sort").val(rowdata.sort)
		$("#remarks").val(rowdata.remarks)
	} else {
		return;
	}
	add_box = layer.open({
		type : 1,
		shift : 5,
		title : '添加字典项',
		area : [ '40%', '40%' ],
		content : $('#add_dict_box'),
		cancel : function(index) {
			layer.close(index);
		}
	});
}

function addDict() {
	if (checkmyform($("#add_dict_box"))) {
		var flag = check();
		if (flag.length > 0) {
			layer.msg($('#sjzdbh').val() == '字典组名称' ? "字典组名称重复！" : "字典项名称重复！");
			return;
		} else {
			$.ajax({
				type : 'POST',
				url : ahcourt.ctx + '/setting/dict/addDict.do',
				datatype : 'json',
				async : false,
				data : {
					'sjzdbh' : $('#sjzdbh').val(),
					'zdmc' : $('#zdmc').val(),
					'sort' : $('#sort').val(),
					'remarks' : $('#remarks').val()
				},
				success : function(data) {
					if (data > 0) {
						$("#table" + tabindex).jqGrid().trigger("reloadGrid");
						layer.msg('添加成功');
						if(tabindex==1){
							cleartable2();
						}
					} else {
						layer.msg('添加失败');
					}
				}
			});
			closeaddbox();
		}

	} else {
		layer.msg("验证失败重新填写！");
	}
}

function cleartable2(){
	$("#table2").jqGrid().setGridParam({		
		postData : {
			'sjzdbh':'000'
		}
	}).trigger("reloadGrid");
}

function editDict() {
	if (checkmyform($("#add_dict_box"))) {
		$.ajax({
			type : 'POST',
			url : ahcourt.ctx + '/setting/dict/editDict.do',
			datatype : 'json',
			async : false,
			data : {
				'sjzdbh' : $('#sjzdbh').val(),
				'zdbh' : $('#zdbh').val(),
				'zdmc' : $('#zdmc').val(),
				'sort' : $('#sort').val(),
				'remarks' : $('#remarks').val()
			},
			success : function(data) {
				if (data > 0) {
					layer.msg('修改成功');
					$("#table" + tabindex).jqGrid().trigger("reloadGrid");
				} else {
					layer.msg('修改失败');
				}
			}
		});
		closeaddbox();
	} else {
		layer.msg("验证失败重新填写！");
	}
}

function delDictId(id, tid) {
	var con = confirm("确定删除该字典及其所有字典项？");
	if (con) {
		$.ajax({
			type : 'POST',
			url : ahcourt.ctx + '/setting/dict/delDict.do',
			datatype : 'json',
			data : {
				'zdbh' : id
			},
			success : function(data) {
				if (data > 0) {
					if (tid == 1) {
						$("#table1").jqGrid().trigger("reloadGrid");
						$("#table2").jqGrid().trigger("reloadGrid");
					} else if (tid == 2) {
						$("#table2").jqGrid().trigger("reloadGrid");
					}
					layer.msg('删除成功');
				} else {
					layer.msg('删除失败');
				}
			}
		});
	}
}
function check() {
	var flag = 0;
	$.ajax({
		type : 'POST',
		url : ahcourt.ctx + '/setting/dict/check.do',
		datatype : 'json',
		async : false,
		data : {
			'sjzdbh' : $('#sjzdbh').val(),
			'zdmc' : $('#zdmc').val(),
		},
		success : function(data) {
			flag = data;
		}
	});
	return flag;
}
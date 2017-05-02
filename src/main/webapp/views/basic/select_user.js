$(document).ready(function() {
	var ele = $.getUrlParam('ele');
	var hid = $.getUrlParam('hid');
	var mult = $.getUrlParam('mult');// mult的值为"0"表示不能多选，为"1"表示能多选
	var sfyzdw = $.getUrlParam('sfyzdw');
	var useto = $.getUrlParam('useto');
	Staffgrid(ele, hid, mult,sfyzdw,useto);

	$("#search").click(function() {
		search();
	})

	$("#staff_name").keyup(function(event) {
		var e = event || window.event || arguments.callee.caller.arguments[0];
		if (e && e.keyCode == 13) { // enter 键
			search();
		}
	});

})

function search() {
	jQuery("#staff_jqGrid").jqGrid().setGridParam({
		postData : {
			xm : $("#staff_name").val(),
		}
	}).trigger("reloadGrid");
}

// 初始化人员jqGrid
function Staffgrid(ele, hid, mult,_sfyzdw,useto) {
    //console.log(useto);
	if (mult == "0") {
		/*$(".no-padding").removeClass("wb75");
		$(".no-padding").addClass("wb100");
*/
		if(!useto){
            useto="";
		}
		console.log(useto);
		$("#staff_jqGrid").jqGrid({
			url : ahcourt.ctx + "/userlist"+useto+".do",
			datatype : "json",
			mtype : "post",
			width : gridWidth(),
			height : gridHeight(),
			rowNum : 10000,
			colModel : [ {
				label : '编号',
				name : 'yhid',
				hidden : true
			}, {
				label : '机构名称',
				name : 'zzid',
				align : 'left',
				sortable : false
			}, {
				label : '员工姓名',
				name : 'xm',
				align : 'left',
				sortable : false
			} ],
			sortable : false,
			// grouping : true,
			// groupingView : {
			// 	groupField : [ 'zzid' ]
			// },
			ondblClickRow : function(id) {
				var celldata = $("#staff_jqGrid").jqGrid('getCell', id, 2);
				var id = $("#staff_jqGrid").jqGrid('getCell', id, 0);
				parent.$("#" + ele).val(celldata);
				parent.$("#" + hid).val(id);
				parent.$("#" + hid).change();
				parent.$("#" + ele).removeClass("border-red");

				var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引
				parent.layer.close(index);
			}
		});
		
		$("#staff_select").on("click", function() {
			// 点击确定多次选择的员工
			var arrid, _name, _length, ids;
			var _val = "";
			var _ids = "";
			arrid = $("#staff_jqGrid").jqGrid("getGridParam", "selrow");
			if (arrid == null) {
				layer.confirm('请先选择员工!', {
					btn : [ '确定' ],
					closeBtn : false,
					yes : function(index) {
						layer.close(index); // 进行手工关闭
					}
				});
			} else {
				for (var i = 0; i < arrid.length; i++) {
					_name = $("#staff_jqGrid").jqGrid("getRowData", arrid[i]).xm;
					ids = $("#staff_jqGrid").jqGrid("getRowData", arrid[i]).yhid;
					_val += _name + ";";
					_ids += ids + ";";
				}
				_val = _val.substring(0, _val.length - 1);
				_ids = _ids.substring(0, _ids.length - 1);
				parent.$("#" + ele).val(_val);
				parent.$("#" + hid).val(_ids);
				parent.$("#" + hid).change();
				_val = "";
				parent.$("#" + ele).removeClass("border-red");
				var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引
				parent.layer.close(index);
			}
		});
	} else if (mult == "1") {
//		$("#staff_select").removeClass("hidden");
		$("#staff_jqGrid").jqGrid({
			url : ahcourt.ctx + "/userlist"+useto+".do",

			datatype : "json",
			mtype : "post",
			width : gridWidth(),
			height : gridHeight(),
			rowNum : 10000,
			colModel : [ {
				label : 'yhid',
				name : 'yhid',
				hidden : true
			}, {
				label : '机构名称',
				name : 'zzid',
				sortable : false
			}, {
				label : '员工姓名',
				name : 'xm',
				align : 'center',
				sortable : false
			} ],
			//grouping : true,
			sortable : false,
			// groupingView : {
			// 	groupField : [ 'zzid' ]
			// },
			multiselect : true
		});

		// 点击确定多次选择的员工
		var arrid, _name, _length, ids;
		var _val = "";
		var _ids = "";

		$("#staff_select").on("click", function() {
			arrid = $("#staff_jqGrid").jqGrid("getGridParam", "selarrrow");
			_length = arrid.length;
			if (_length == "0") {
				layer.confirm('请先选择员工!', {
					btn : [ '确定' ],
					closeBtn : false,
					yes : function(index) {
						layer.close(index); // 进行手工关闭
					}
				});
			} else {
				for (var i = 0; i < arrid.length; i++) {
					_name = $("#staff_jqGrid").jqGrid("getRowData", arrid[i]).xm;
					ids = $("#staff_jqGrid").jqGrid("getRowData", arrid[i]).yhid;
					_val += _name + ";";
					_ids += ids + ";";
				}
				_val = _val.substring(0, _val.length - 1);
				_ids = _ids.substring(0, _ids.length - 1);
				parent.$("#" + ele).val(_val);
				parent.$("#" + hid).val(_ids);
				parent.$("#" + hid).change();
				_val = "";
				parent.$("#" + ele).removeClass("border-red");
				var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引
				parent.layer.close(index);
			}
		});
	}
}

// 动态获取宽度
function gridWidth() {
	return $('BODY').outerWidth() - 22;
}
// 动态获取高度
function gridHeight() {
	return $('BODY').outerHeight() - 90;
}
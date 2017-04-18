var mode, zNodes;
$(function() {
	mode = $("#mode").val();
	// mode值只有“new”和“edit""
	if (mode == "edit") {
		//$(".info_getway").remove();
		//$(".linkinfo").remove();
		// $(".writedoiwn_layout").find("input").prop("disabled", false);
		$('#zh').attr("disabled",true);
	}
    $(".writedoiwn_layout").find("input").prop("disabled", false);

	$.ajax({
		type : 'POST',
		url : ahcourt.ctx + "/setting/organization/getlist.do",
		datatype : 'json',
		async : false,
		success : function(data) {
			zNodes = data;
		}
	});

	/** chosen初始化
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

     $('.i-checks').iCheck({
		radioClass : 'iradio_square-green',
	});
     $(".default_radio").find(".iradio_square-green").addClass("checked");

     */

	$.fn.zTree.init($("#treeDemo"), setting, zNodes);
	$("#menuBtn").click(function() {
		showMenu();
		return false;
	});

	/** 点击选择人员
	$("#staff").change(function() {
		$.ajax({
			type : 'POST',
			url : ahcourt.ctx + "/setting/account/getById.do",
			datatype : 'json',
			data : {
				ygid : $("#staff").val(),
			},
			success : function(data) {
				$("#ygid").val(data.ygid);
				$("#truename").val(data.ygxm);
				$("#mail").val(data.dzyx);
				$("#phonenum").val(data.sjhm);
				$("#telnum").val(data.bgdh);
				$("#tx").val(data.tx);
			}
		});

	});

	// 点击打开员工入职登记
	checkmyblur();
	$(".addstaff_btn").click(function() {
		layer.open({
			type : 2,
			title : '新员工登记',
			shade : 0.3,
			shadeClose : false,
			shade : 0.3,
			area : [ '95%', '90%' ],
			content : ahcourt.ctx + '/office/hrjoin/addStaff.do?mode=new'
		});
	});

	$(".i-checkslayout .i-checks label").click(function() {
		var way = $(this).find("input[type='radio']").val();
		// way等于”1“则方式为“关联员工信息获取”,等于“2”则为“填写帐号信息”
		if (way == 2) {
			$("#ygid").val("");
			$("#truename").val("");
			$("#mail").val("");
			$("#phonenum").val("");
			$("#telnum").val("");
			$("#staff").val("");
			$("#staff").attr("disabled", true);

			$("#rzdj").attr("disabled", true);
			$(".writedoiwn_layout").find("input").prop("disabled", false);
			$(".linkinfo input").removeClass("border-red");

		} else if (way == 1) {
			$("#staff").attr("disabled", false);

			$("#rzdj").attr("disabled", false);
			$(".writedoiwn_layout").find("input").prop("disabled", true);
			$(".writedoiwn_layout input").removeClass("border-red");
		}
	});

	$(".iCheck-helper").click(function() {
		var way = $(this).closest(".iradio_square-green").find("input[type='radio']").val();
		if (way == 2) {
			$("#ygid").val("");
			$("#truename").val("");
			$("#mail").val("");
			$("#phonenum").val("");
			$("#telnum").val("");
			$("#staff").val("");
			$("#staff").attr("disabled", true);

			$("#rzdj").attr("disabled", true);
			$(".writedoiwn_layout").find("input").prop("disabled", false);
			$(".linkinfo input").removeClass("border-red");
		} else if (way == 1) {
			$("#staff").attr("disabled", false);
			$("#rzdj").attr("disabled", false);
			$(".writedoiwn_layout").find("input").prop("disabled", true);
			$(".writedoiwn_layout input").removeClass("border-red");
		}
	});
     */
	//保存
	$(".subcount_btn").click(function() {
		var state_1, state_2, state_3, way;
		way = $(".i-checkslayout .i-checks label .checked input").val();
		// way等于”1“则方式为“关联员工信息获取”,等于“2”则为“填写帐号信息”
		stepcheck(mode);
	});


})
function checktxt(){
	if(mode!='edit'){
		if($("#zh").val()==''){
			$("#zh").addClass("border-red");
		}else{
			var flag=checkzh($("#zh").val());
			if(flag.length!=0){
			$("#zh").addClass("border-red");
			layer.confirm('账户重复！请重新输入', {
				btn : ['确认','取消'],
			}, function() {
				$("#zh").removeClass("border-red");
				$("#zh").val('');
				$("#zh").focus();
				layer.closeAll('dialog');
			})
			}else{
				$("#zh").removeClass("border-red");
			}
		}
	}
}
function checkpass(){
	if($("#mm").val()==''){
		$("#mm").addClass("border-red");
	}else{
		$("#mm").removeClass("border-red");
	}
}
function stepcheck(mode) {
	way = $(".i-checkslayout .i-checks label .checked input").val();
	// way等于”1“则方式为“关联员工信息获取”,等于“2”则为“填写帐号信息”
	// if (mode == "new"||mode == "ktzh") {
	// 	if (way == 1) {
	// 		checkfir(way);
	// 	} else if (way == 2) {
	// 		checktwo(way);
	// 	}
	// } else if (mode == "edit") {
		checktwo(way);
	// }
};

// function checkfir(way) {
// 	var state_1, state_2;
// 	state_1 = checkmyform($(".accountbasic"),true);
// 	state_2 = checkmyform($(".linkinfo"),true);
// 	if (state_1 && state_2&&$("#zh").val()!=''&&$("#mm").val()!=''&&$(".border-red").length<1) {
// 		var str1 = $("#jsid").val() + "";
// 		var jsids = str1.replace(/,/g, ';');
// 		$.ajax({
// 			type : 'POST',
// 			url : ahcourt.ctx + "/setting/account/saveOrUpdate.do",
// 			datatype : 'json',
// 			data : {
// 				yhid : $("#yhid").val(),
// 				zh : $("#zh").val(),
// 				mm : $("#mm").val(),
// 				jsid : jsids,
// 				zzid : $("#zzid").val(),
// 				xm : $("#truename").val(),
// 				dzyx : $("#mail").val(),
// 				sj : $("#phonenum").val(),
// 				dh : $("#telnum").val(),
// 				ygid:$("#ygid").val(),
// 				ygxm:$("#truename").val(),
// 				tx:$("#tx").val()
// 			},
// 			success : function(data) {
// 				if (data > 0) {
// 					top.layer.msg("保存成功！");
// 					parent.$("#acounttable_grid").jqGrid().setGridParam({}).trigger("reloadGrid");
// //					var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引
// //					parent.layer.close(index);
// 					closeWindow();
// 				} else {
// 					layer.msg("保存失败");
// 				}
// 			}
// 		});
// 	} else {
// 		checktxt();
// 		checkpass();
// 		layer.msg("验证失败请重新填写！");
// 	}
// };

function checktwo(way) {
	//console.log("123");
	var state_1, state_3;
	state_1 = checkmyform($(".accountbasic"),true);
	state_3 = checkmyform($(".writedoiwn_layout"),true);
	if (state_1 && state_3&&$("#zh").val()!=''&&$("#mm").val()!=''&&$(".border-red").length<1) {
		var str1 = $("#jsid").val() + "";
		var jsids = str1.replace(/,/g, ';');
		$.ajax({
			type : 'POST',
			url : ahcourt.ctx + "/setting/user/saveOrUpdate.do",
			datatype : 'json',
			data : {
				yhid : $("#yhid").val(),
				zh : $("#zh").val(),
				mm : $("#mm").val(),
				jsid : jsids,
				zzid : $("#zzid").val(),
				xm : $("#truename").val(),
				dzyx : $("#mail").val(),
				sj : $("#phonenum").val(),
				dh : $("#telnum").val(),
				tx:$("#tx").val()
			},
			success : function(data) {
				if (data > 0) {
					layer.msg("保存成功！");
					parent.$("#acounttable_grid").jqGrid().setGridParam({}).trigger("reloadGrid");
					var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引
					parent.layer.close(index);
					//closeWindow();
				} else {
					layer.msg("保存失败");
				}
			}
		});
	} else {
		checktxt();
		checkpass();
		layer.msg("验证失败请重新填写！");
	}
};
// 选择组织机构
var setting = {
	view : {
		dblClickExpand : false
	},
	data : {
		simpleData : {
			enable : true
		}
	},
	callback : {
		onClick : onClick
	}
};
function onClick(e, treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("treeDemo"), nodes = zTree.getSelectedNodes(), v = "", zzid = "";
	nodes.sort(function compare(a, b) {
		return a.id - b.id;
	});
	v += nodes[0].name;
	zzid = nodes[0].id;
	if (v.length > 0)
		v = v.substring(0, v.length);
	var cityObj = $("#citySel");
	cityObj.val(v);
	$("#zzid").val(zzid);
	cityObj.removeClass("border-red");
	hideMenu();
}
function showMenu() {
	$("#menuContent").slideDown("fast");
	$("body").bind("mousedown", onBodyDown);
}
function hideMenu() {
	$("#menuContent").fadeOut("fast");
	$("body").unbind("mousedown", onBodyDown);
}
function onBodyDown(event) {
	if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length > 0)) {
		hideMenu();
	}
}
function checkzh(zh){
	var flag;
	$.ajax({
		type : 'POST',
		url : ahcourt.ctx + "/setting/user/checkzh.do",
		datatype : 'json',
		async:false,
		data : {
			zh:zh,
		},
		success : function(data) {
				flag=data;
		}
	});
	return flag
}
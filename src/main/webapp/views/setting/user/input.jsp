<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>开通账户</title>
<jsp:include page="/header.jsp?libs=jqgrid;ztree;layer;chosen;icheck" />
<script type="text/javascript" src="${ctx}/views/setting/user/input.js"></script>
<script type="text/javascript">
	$(function() {
		chose_mult_set_ini('#jsid', '${bean.jsid}');
		//初始化
		$("#jsid").chosen();

	});

	function chose_mult_set_ini(select, values) {
		var arr = values.split(';');
		var length = arr.length;
		var value = '';
		for (i = 0; i < length; i++) {
			value = arr[i];
			$(select + " option[value='" + value + "']").attr('selected', 'selected');
		}
		$(select).trigger("chosen:updated");
	}
</script>
	<style>
		.menuContent{z-index: 100;}
	</style>
</head>
<body> 
	<input type="hidden" id="mode" value="${mode}" />
	<input type="hidden" id="yhid" value="${bean.yhid }" />
	<div class="bmbox_layout clearfix">
		<div class="bmbox_title">
			<div class="bmbox_tool">
				<button class="btn btn-primary btn-sm btn-smx subcount_btn" type="button">
					<i class="fa fa-check-circle-o mr5"></i>提交
				</button>
			</div>
		</div>
		<div class="bmbox_content count_layout pdt_10 ">
			<div class="accountbasic clearfix">
				<div class="form_item wb25 fl">
					<label>帐号名<span>*</span></label> 
					<input type="text" onblur="checktxt()" class="form-control input-sm"  id="zh" value="${bean.zh }">
				</div>
				<div class="form_item wb25 fl">
					<label>密码<span>*</span></label>
					<input type="text" onblur="checkpass()" class="form-control input-sm" id="mm" value="${bean.mm }">
				</div>
				<div class="form_item wb25 fl zindex5 ">
					<label>组织机构<span>*</span></label>
					<div style="position: relative;">
						<div class="input-group">
							<input id="zzid" value="${bean.zzid }" type="hidden" /> <input type="text" class="form-control input-sm bmrequire" retype="text" readonly id="citySel" value="${bean.zzjgmc }"> <span class="input-group-btn">
								<button type="button" class="btn btn-primary btn-sm" id="menuBtn">选择</button>
							</span>
						</div>
						<div id="menuContent" class="menuContent">
							<ul id="treeDemo" class="ztree"></ul>
						</div>
					</div>
				</div>
				<div class="form_item wb100 fl">
					<label>角色<span>*</span></label> 
					<select data-placeholder="--选择--" class="chosen-select form-control bmrequire" retype="multiselect" multiple id="jsid">
						<c:forEach items="${roleList }" var="role">
							<option value="${role.id }">${role.jsmc }</option>
						</c:forEach>
					</select>
				</div>
				<!--<div class="form_item wb50 info_getway ">
					<label>账户信息获取方式<span>*</span></label>
					<div class="i-checkslayout">
						<div class="radio i-checks">
							<label class="default_radio"> <input type="radio" value="1" name="way" style="position: absolute; opacity: 0;"> <i></i> 关联员工信息获取
							</label> <label class=""> <input type="radio" value="2" name="way" style="position: absolute; opacity: 0;"> <i></i> 填写帐号信息
							</label>
						</div>
					</div>
				</div>
			</div>
			<div class="linkinfo pdt_10 clearfix">
				<div class="form_item wb25 fl">
					<select class="form-control input-sm mt5" id="staff">
						<option value="">全部</option>
						<c:forEach items="${staffList }" var="item">
							<option value="${item.ygid }">${item.ygxm}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form_item wb75 fl clearfix" style="line-height: 30px;">
					<span class="mr10 fl">找不到员工？请点击</span>
					<button type="button" class="btn btn-primary btn-sm addstaff_btn mr10 fl" id="rzdj">
						<i class="fa fa-plus mr5"></i>入职登记
					</button>
					<span class="fl">新增员工</span>
				</div>
			</div>-->
			<div class="writedoiwn_layout wb100 fl pdt_10">
				<input id="ygid" type="hidden" value="${bean.ygid }"/>
				<div class="form_item wb25 fl">
					<label>姓名<span>*</span></label> <input type="text" class="form-control input-sm bmrequire" id="truename" value="${bean.xm }" disabled="disabled" retype="text">
				</div>
				<div class="form_item wb25 fl">
					<label>邮箱<span>*</span></label> <input type="text" class="form-control input-sm bmrequire" id="mail" value="${bean.dzyx }" disabled="disabled" retype="text">
				</div>

				<div class="form_item wb25 fl">
					<label>手机<span>*</span></label> <input type="text" class="form-control input-sm bmrequire" id="phonenum" value="${bean.sj }" disabled="disabled" retype="text">
				</div>
				<div class="form_item wb25 fl">
					<label>电话</label><input type="text" class="form-control input-sm" id="telnum" disabled="disabled" value="${bean.dh }">
				</div>
				<input id="tx" type="hidden"/>
			</div>
		</div>
	</div>
</body>
</html>
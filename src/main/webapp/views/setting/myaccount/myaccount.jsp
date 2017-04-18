<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的帐号</title>
<jsp:include page="/header.jsp?libs=layer;bsfileinput;icheck" />
<script type="text/javascript" src="${ctx}/views/setting/myaccount/myaccount.js"></script>
</head>
<body>
	<input id="yhid" value="${user.yhid }" type="hidden" />
	<input id="ygid" value="${user.ygid }" type="hidden" />
	<div class="bmbox_layout clearfix">
		<div class="clearfix pdt_10 pdb_55">
			<div class="wb50 fl">
				<div class="form_item">
					<label>帐号名</label> <input type="text" class="form-control input-sm" value="${user.zh }" disabled="disabled">
				</div>
				<div class="form_item">
					<label>角色</label> <input type="text" class="form-control input-sm" value="${user.jsid }" disabled="disabled">
				</div>
				<div class="form_item">
					<label>部门</label> <input type="text" class="form-control input-sm" value="${user.zzid }" disabled="disabled">
				</div>
				<div class="form_item">
					<label>原密码</label> <input type="text" class="form-control input-sm" value="" id="ymm">
				</div>
				<div class="form_item">
					<label>新密码</label> <input type="text" class="form-control input-sm" value="" id="xmm">
				</div>
			</div>
			<div class="wb50 fl pdr_15">
				<label>设置头像</label>
				<input type="hidden" id="tx" value="${user.tx }"> <input id="inputimage" type="file" name="file">
			</div>
		</div>
		<div class="fixed_bot shaow_top pdt_10 pdb_10" style="text-align: center;">
			<button type="button" class="btn btn-primary input-sm sub_file width80">
				<i class="fa fa-check"></i>保存
			</button>
		</div>
	</div>
</body>
</html>
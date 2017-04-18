<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新建角色</title>
<jsp:include page="/header.jsp?libs=layer;jqgrid" />
<script type="text/javascript" src="${ctx}/views/setting/role/input.js"></script>

</head>
<body>
	<div class="bmbox_layout clearfix">
		<div class="bmbox_title">
			<h5>
			（带<i class="color-red ml5 mr5">*</i>为必填）
			</h5>
			<div class="bmbox_tool">
				<button type="button" class="btn btn-primary input-sm sub_role width80">
					<i class="fa fa-check"></i>提交
				</button>
			</div>
		</div>
		<div class="bmbox_content clearfix">
			<form id="role_form">
				<div class="form_item wb90  acount_name">
					<label>角色名称<span>*</span></label> 
					<input type="text" class="form-control input-sm bmrequire" id="jsmc" retype="text" />
				</div>
				<div class="form_item wb90">
					<label>角色说明</label>
					<textarea class="form-control" id="jssm" placeholder="请输入角色说明"></textarea>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
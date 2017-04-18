<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新建部门</title>
<jsp:include page="/header.jsp?libs=layer;icheck" />
<script type="text/javascript" src="${ctx}/views/setting/organization/organization_input.js"></script>
</head>
<body>
	<div class="bmbox_layout clearfix">
		<div class="bmbox_title">
			<h5>
			（带<i class="color-red ml5 mr5">*</i>为必填）
			</h5>
			<div class="bmbox_tool">
			<button type="button" class="btn btn-primary btn-sm sub_role width80">
				<i class="fa fa-check"></i>提交
			</button>
			</div>
		</div>
		<div class="bmbox_content clearfix">
			<form id="role_form">
				<div class="form_item">
					<label>组织或机构名称<span>*</span></label> <input type="text" class="form-control input-sm bmrequire" retype="text" id="zzjgmc"/>
				</div>
				<div class="form_item">
                    <label>法院内部组织或机构<span>*</span></label>
	                <div class="i-checkslayout">
						<div class="radio i-checks">
							<label> <input type="radio" value="true" name="sex" style="position: absolute; opacity: 0;"> <i></i> 是</label> 
							<label> <input type="radio" checked value="" name="sex" style="position: absolute; opacity: 0;"> <i></i> 否</label>
						</div>
					</div>
				</div>
				<div class="form_item">
					<label>部门描述</label>
					<textarea class="form-control" placeholder="请输入部门描述"></textarea>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
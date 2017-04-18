<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>选择人员</title>
<jsp:include page="/header.jsp?libs=jqgrid;layer" />
<script type="text/javascript" src="${ctx}/views/setting/verifyflow/selectuser/select_user.js"></script>
<style>

</style>
</head>
<body>
	<div class="form_center clearfix pdt_5 pdl_10 pdr_10">
		<div class="form_item wb75 fl no-padding">
			<div class="input-group">
				<input type="text" class="form-control input-sm input_staff" id="staff_name"> 
				<span class="input-group-btn">
					<button type="button" class="btn btn-smx btn-primary" id="search">
						<i class="fa fa-search mr5"></i>搜索
					</button>
				</span>
			</div>
		</div>
		<div class="form_item wb25 fl" id="staff_select">
			<span class="input-group-btn">
				<button type="button" class="btn btn-smx btn-primary">
					<i class="fa fa-check mr5"></i>选择
				</button>
			</span>
		</div>
	</div>
	<div class="pdl_10 pdr_10">
		<table id="staff_jqGrid"></table>
		<div id="pager_staff"></div>
	</div>
</body>
</html>
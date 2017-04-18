<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>业务管理</title>
<jsp:include page="/header.jsp?libs=jqgrid;ztree;layer" />
<script type="text/javascript" src="${ctx}/views/setting/organization/organization_list.js"></script>
</head>
<body>
	<div class="bmbox_layout clearfix fl wb30 no-borders" >
		<div class="bmbox_title ">
			<h5>组织机构列表</h5>
			<div class="bmbox_tool">
				<button class="btn btn-primary btn-sm btn-smx" type="button" id="new_dept">
					<i class="fa fa-plus"></i>&nbsp;新建一级组织机构
				</button>
			</div>
		</div>
		<div class="bmbox_content">
			<ul id="treeDemo" class="ztree"></ul>
		</div>
	</div>

	<div class="bmbox_layout clearfix wb70 fl no-borders">
		<div class="bmbox_title">
			<h5>人员列表</h5>
		</div>
		<div class="bmbox_content">
			<div id="jqGrid1" class="jqGrid_wrapper">
				<table id="table1"></table>
				<div id="pager1"></div>
			</div>
		</div>
	</div>
</body>
</html>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>角色管理</title>
<jsp:include page="/header.jsp?libs=jorgchart;jqgrid;ztree;icheck;chosen;layer;" />
<script type="text/javascript" src="${ctx}/views/setting/role/list.js"></script>
<style>
	#table1 button{ overflow: hidden; max-width: 100%;}
	.ui-jqgrid{ border: none; width: 100%!important; margin: 0;}
	.ui-jqgrid-view,.ui-jqgrid-bdiv{ width: 100%!important; margin-bottom: 0;}
	.role_layout{ position: relative;}
	.role_title{ position: absolute; width: 100%; top: 0;}
	.role_content{ height: 100%; padding-top: 40px;}
	.role_wrap{ height: 100%; overflow: auto;}
</style>
</head>
<body>
	<div class="bmbox_layout wb60 fl clearfix no-right-border">
		<div class="bmbox_title">
			<h5>角色列表</h5>
			<div class="bmbox_tool">
				<button class="btn btn-primary btn-sm btn-smx" type="button" id="new_role">
					<i class="fa fa-plus"></i>&nbsp;新建
				</button>
			</div>
		</div>
		<div class="bmbox_content rolelist">
			<div id="jqGrid1" class="jqGrid_wrapper">
				<table id="table1"></table>
				<div id="pager1"></div>
			</div>
		</div>
	</div>


	<div class="bmbox_layout role_layout wb40 fl clearfix no-right-border">
		<div class="bmbox_title role_title">
			<h5>可见菜单</h5>
			<div class="bmbox_tool">
				<button class="btn btn-primary btn-sm btn-smx" type="button" id="save_menu">
					<i class="fa fa-plus"></i>&nbsp;保存
				</button>
			</div>
		</div>
		<div class="bmbox_content role_content">
			<div class="role_wrap">
				<ul id="treeDemo" class="ztree"></ul>
			</div>
		</div>
	</div>
	<!--
	<div class="bmbox_layout wb40 fl clearfix no-right-border">
		<div class="bmbox_content" style="height: 98%;">
			<div class="bmbox_layout role_layout wb100 fl clearfix no-left-border" style="height: 30%">
				<div class="bmbox_title role_title">
					<h5>可操作按钮</h5>
					<div class="bmbox_tool">
						<button class="btn btn-white btn-sm btn-smx selectall_menu_btn" type="button">全&nbsp;选</button>
						<button class="btn btn-white btn-sm btn-smx selectreverse_btn" type="button">反&nbsp;选</button>
						<button class="btn btn-primary btn-sm btn-smx" type="button" id="save_btn">
							<i class="fa fa-plus"></i>&nbsp;保存
						</button>
					</div>
				</div>
				<div class="bmbox_content role_content">
					<div class="role_wrap">
						<div class="form_item wb100 fl">
							<div class="i-checkslayout">
								<div class="checkbox i-checks" id="kczan"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="bmbox_layout role_layout wb100 fl clearfix no-left-border" style="height: 70%; overflow: auto !important">
				<div class="bmbox_title role_title">
					<h5>可访问数据</h5>
					<div class="bmbox_tool">
						<button class="btn btn-primary btn-sm btn-smx" type="button" id="save_sj">
							<i class="fa fa-plus"></i>&nbsp;保存
						</button>
					</div>
				</div>
				<div class="bmbox_content role_content">
					<div class="role_wrap">
						<table class="table table-bordered" id="archive_table_form">
							<tr>
								<td align="center">表格名称</td>
								<td align="center">数据权限</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>-->
</body>
</html>
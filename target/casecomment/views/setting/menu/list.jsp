<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的项目</title>
<jsp:include page="/header.jsp?libs=jqgrid;layer;ztree" />
<script type="text/javascript" src="${ctx}/views/setting/menu/list.js"></script>
</head>
<body>
	<div class="warpslide fullbox">
		<div class="bmbox_layout wb30 fl pdb_50" style="height: 100%">
			<div class="bmbox_title">
				<label id="grid_label">菜单结构</label>
				<div class="bmbox_tool">
					<a id="add_item"> <i class="fa fa-plus"></i> 添加菜单
					</a><a id="del_item"> <i class="fa fa-trash"></i> 删除菜单
					</a>
				</div>
			</div>
			<div class="bmbox_content " style="height: 100%; overflow: auto;">
				<ul id="pTree" class="ztree"></ul>
			</div>
		</div>
		<div class="bmbox_layout wb70 fl no-left-border pdb_50" style="height: 100%;">
			<div class="bmbox_title">
				<label id="grid_label">菜单项</label>
				<div class="bmbox_tool">
					<a id="save_item" style="display: none;"> <i class="fa fa-save"></i> 保存
					</a><a id="cencle_item" style="display: none;"> <i class="fa fa-trash"></i> 取消
					</a> <a id="edit_item"> <i class="fa fa-pencil"></i> 编辑菜单项
					</a>
				</div>
			</div>
			<div class="bmbox_content" style="height: 100%; overflow: auto;">
				<form id="add_form" class="form_center clearfix">
					<input id="sjcdid" type="hidden" />
					<input id="cdid" type="hidden" />
					<div class="form_item">
						<label>上级菜单*</label> <input type="text" id="sjcdmc" class="form-control input-sm " disabled="disabled" />
					</div>
					<div class="form_item">
						<label>菜单名称*</label> <input type="text" id="cdmc" class="form-control input-sm bmrequire" disabled="disabled" retype="text" />
					</div>
					<div class="form_item">
						<label>链接</label> <input type="text" id="cdurl" class="form-control input-sm" disabled="disabled" />
					</div>
					<div class="form_item">
						<label>图标</label> <input type="text" id="tb" class="form-control input-sm" disabled="disabled" />
					</div>
					<div class="form_item">
						<label>排序</label> <input type="text" id="px" class="form-control input-sm" disabled="disabled" />
					</div>
					<div class="form_item">
						<label>宽度</label> <input type="text" id="ymkd" class="form-control input-sm" disabled="disabled" />
					</div>
					<div class="form_item">
						<label>高度</label> <input type="text" id="ymgd" class="form-control input-sm" disabled="disabled" />
					</div>
					<div class="form_item">
						<label>备注</label>
						<textarea class="form-control" disabled="disabled" id="bz"></textarea>
					</div>
				</form>
			</div>
		</div>

	</div>

</body>
</html>
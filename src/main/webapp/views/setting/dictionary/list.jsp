<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>字典管理</title>
<jsp:include page="/header.jsp?libs=jqgrid;layer" />
<script type="text/javascript" src="${ctx}/views/setting/dictionary/list.js"></script>
</head>
<body>
	<div class="warpslide fullbox">
		<div class="bmbox_layout leftslide_layout clearfix">
			<div class="bmbox_content">
				<div id="search_box" class="clearfix pdt_10 mb10">
					<div class="form_item wb25 fl">
						<label>字典组名称</label> <input type="text" id="search_zdmc" class="form-control input-sm" placeholder="请输入字典名称">
					</div>
					<div class="form_item wb25 fl">
						<label>字典组编码</label> <input type="text" id="search_zdbh" class="form-control input-sm" placeholder="请输入字典编码">
					</div>
					<div class="form_item wb25 fr">
						<label>&nbsp;</label>
						<div class="clearfix">
							<button type="button" class="btn btn-primary btn-sm mr10 fr" onclick="search()">
								<i class="fa fa-search mr5"></i>查询
							</button>

						</div>
					</div>
				</div>
				<div id="div1" class="bmbox_layout fl" style="position: absolute;">
					<div class="bmbox_title">
						<label id="grid_label">字典组</label>
						<div class="bmbox_tool" onclick="openGroupBox('0','add')">
							<a id="add_group"> <i class="fa fa-plus"></i> 添加字典组
							</a>
						</div>
					</div>
					<div class="bmbox_content pd5">
						<table id="table1" class="table table-striped"></table>
						<div id="pager1"></div>
					</div>
				</div>
				<div id="div2" class="bmbox_layout fl" style="position: absolute;">
					<div class="bmbox_title">
						<label id="grid_label">字典项</label>
						<div class="bmbox_tool" onclick="openItemBox('0','add')">
							<a id="add_group_item"> <i class="fa fa-plus"></i> 添加字典项
							</a>
						</div>
					</div>
					<div class="bmbox_content pd5">
						<table id="table2" class="table table-striped"></table>
						<div id="pager2"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="add_dict_box" style="display: none">
		<div class="form_center clearfix">
			<input id="zdbh" type="hidden"> <input id="sjzdbh" type="hidden">
			<div class="form_item">
				<label id="name_label">字典名称*</label> <input id="zdmc" type="text" class="form-control input-sm bmrequire" retype="text" maxlength="100" />
			</div>
			<div class="form_item">
				<label>排序</label> <input id="sort" type="text" class="form-control input-sm checknum" maxlength="10" />
			</div>
			<div class="form_item">
				<label>备注</label>
				<textarea id="remarks" class="form-control" maxlength="255"></textarea>
			</div>
			<div class="form_item text-center">
				<button id="save" class="btn btn-primary btn-sm" type="button" onclick="addDict()">
					<i class="fa fa-save pdr_5"></i> 保存
				</button>
				<button id="edit" class="btn btn-primary btn-sm" type="button" onclick="editDict()">
					<i class="fa fa-save pdr_5"></i> 确定修改
				</button>
				<button class="btn btn-white btn-sm" type="button" onclick="closeaddbox()">
					<i class="fa fa-close pdr_5"></i> 取消
				</button>
			</div>
		</div>
	</div>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>文件管理</title>
<jsp:include page="/header.jsp?libs=jqgrid;layer" />
<script type="text/javascript" src="${ctx}/views/setting/file/list.js"></script>
</head>
<body style="width: 100%; padding: 5px;">
	<form id="toobar1" class="form-horizontal">
		<div class="row">
			<div class="col-md-9">
				<div class="row">
					<div class="col-sm-4">
						<div class="row form-group">
							<label class="col-md-4 control-label">文件类型</label>
							<div class="col-sm-8">
								<select id="file_type" class="form-control input-sm">
								</select>
							</div>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="row form-group">
							<label class="col-md-4 control-label">文件名称</label>
							<div class="col-sm-8">
								<input type="text" class="form-control input-sm" id="name_like" placeholder="文件名关键字">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3  text-center">
				<button class="btn btn-primary" type="button" onclick="search()">
					<i class="fa fa-search"></i>&nbsp;查询
				</button>
				<button class="btn btn-default" type="button" onclick="delPage()">
					<i class="fa fa-minus-square"></i>&nbsp;删除
				</button>
			</div>
		</div>
	</form>

	<div class="ibox-content">
		<div class="jqGrid_wrapper">
			<table id="table1"></table>
			<div id="pager1"></div>
		</div>
	</div>

	<div id="layer_box" style="display: none; padding: 15px;">
		<form class="form-horizontal" id="addForm" action="javascript:add();">
			<input type="hidden" id="dicid">
			<div class="form-group">
				<label class="col-sm-3 control-label">键值</label>
				<div class="col-sm-8">
					<input type="text" class="form-control input-sm" required="" id="value">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">标签</label>
				<div class="col-sm-8">
					<input type="text" class="form-control input-sm" required="" id="label">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">类型</label>
				<div class="col-sm-8">
					<input type="text" class="form-control input-sm" required="" id="type">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">描述</label>
				<div class="col-sm-8">
					<input type="text" class="form-control input-sm" required="" id="description">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">排序</label>
				<div class="col-sm-8">
					<input type="text" class="form-control input-sm" id="sort">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">备注</label>
				<div class="col-sm-8">
					<textarea id="remarks" class="form-control" name="remarks"></textarea>
				</div>
			</div>
			<div class="form-group">
				<div id="btns" class="col-sm-6 col-sm-offset-3 text-center">
					<button id="submit_btn" class="btn btn-primary" type="submit">保存</button>
					<button id="edit-btn" class="btn btn-primary" type="button" onclick="edit()">修改</button>
					<button class="btn btn-primary" type="button" onclick="closebox()">取消</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
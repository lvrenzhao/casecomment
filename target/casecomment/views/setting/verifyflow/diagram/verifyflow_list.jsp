<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>审核流程管理</title>
<jsp:include page="/header.jsp?libs=jqgrid;layer" />
<script src="${ctx}/views/setting/verifyflow/diagram/verifyflow_list.js"></script>
<style type="text/css">
	body{background-image: url(${ctx}/views/setting/verifyflow/diagram/img/bg.png);}
</style>
</head>
<body>
	<div class="bmbox_layout title_fixed clearfix">
		<div class="bmbox_title" style="height:50px;background-color:#fcf8e3">
			<h5>
				<select class="form-control input-sm bmrequire" retype="select" id="lclx" style="margin-top:9px;width:200px;">
				</select>
				
			</h5>
			<h5 style="margin-left:10px;">
				<select class="form-control input-sm bmrequire" retype="select" id="lcbb" style="margin-top:9px;width:200px;">
					<option value="">--请选择流程版本--</option>
				</select>
			</h5>
			<div class="bmbox_tool">
				<button id="btn_input" class="btn btn-primary btn-sm btn-smx subbusiness_btn" type="button" style="margin-top:12px;">
					<i class="fa fa-save pdr_5"></i> 创建新版本工作流
				</button>
			</div>
		</div>
		<div class="bmbox_content clearfix fullbox" style="overflow:hidden">
			<iframe class="flow_iframe" name="flow_iframe" id="flow_iframe" width="100%" height="100%" frameborder="0" seamless style="background-image: url(${ctx}/views/setting/verifyflow/diagram/img/bg.png)"></iframe>
		</div>
	</div>
</body>
</html>
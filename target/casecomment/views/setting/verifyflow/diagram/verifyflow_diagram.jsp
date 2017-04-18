<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>审核流程设置</title>
<script language="JavaScript" type="text/JavaScript">
	var ahcourt = {ctx:"${ctx}"}
</script>
	<link type="text/css" href="${ctx}/views/setting/verifyflow/diagram/lib/jquery-ui-1.8.4.custom/css/smoothness/jquery-ui-1.8.4.custom.css" rel="stylesheet" />
	<script type="text/javascript" src="${ctx}/views/setting/verifyflow/diagram/lib/raphael-min.js"></script>
	<script type="text/javascript" src="${ctx}/views/setting/verifyflow/diagram/lib/jquery-ui-1.8.4.custom/js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="${ctx}/views/setting/verifyflow/diagram/lib/jquery-ui-1.8.4.custom/js/jquery-ui-1.8.4.custom.min.js"></script>
	<script type="text/javascript" src="${ctx}/views/setting/verifyflow/diagram/lib/myflow.js"></script>
	<script type="text/javascript" src="${ctx}/views/setting/verifyflow/diagram/lib/myflow.editors.js"></script>
	<script src="${ctx}/assets/thirdparty/laydate/laydate.js"></script>
	<script src="${ctx}/assets/thirdparty/layer/layer.min.js"></script>
	<link href="${ctx}/assets/thirdparty/chosen/chosen.css?v=${v}" rel="stylesheet" />
	<script src="${ctx}/assets/thirdparty/chosen/chosen.jquery.js?v=${v}"></script>
	
	<style type="text/css">
		body {margin: 0; pading: 0; text-align: left; font-family: Arial, sans-serif, Helvetica, Tahoma;font-size: 12px; line-height: 1.5; color: black; background-image: url(${ctx}/views/setting/verifyflow/diagram/img/bg.png);}
		.node {width: 70px; text-align: center; vertical-align: middle; border: 1px solid #fff;}
		.mover { border: 1px solid #ddd; background-color: #ddd; }
		.selected {background-color: #ddd; }
		.state {}
		#myflow_props table {}
		#myflow_props th {letter-spacing: 2px;text-align: left;padding: 6px;background: #ddd;}
		#myflow_props td {background: #fff;padding: 6px;}
		#pointer {background-repeat: no-repeat;background-position: center;}
		#path {background-repeat: no-repeat;background-position: center;}
		#task {background-repeat: no-repeat;background-position: center;}
		#state {background-repeat: no-repeat;background-position: center;}
		.layui-layer {
			top: 10px;
			left: 10px;
		}
	</style>
	<script src="${ctx}/views/setting/verifyflow/diagram/verifyflow_diagram.js"></script>
</head>
<body>
	<div id="myflow_tools" style="position: absolute; top: 10; left: 10; background-color: #fff; width: 70px; cursor: default; padding: 3px;" class="ui-widget-content">
		<div id="myflow_tools_handle" style="text-align: center;" class="ui-widget-header">工具</div>
		<c:if test="${mode == 'input' }">
		<div class="node" id="myflow_save"><img src="${ctx}/views/setting/verifyflow/diagram/img/save.gif" />&nbsp;&nbsp;保存</div>
		</c:if>
		<div><hr /></div>
		<div class="node selectable" id="pointer"><img src="${ctx}/views/setting/verifyflow/diagram/img/select16.gif" />&nbsp;&nbsp;选择</div>
		<div class="node state" id="task" type="task"><img src="${ctx}/views/setting/verifyflow/diagram/img/16/task_empty.png" />&nbsp;&nbsp;任务</div>
		<div class="node selectable" id="path"><img src="${ctx}/views/setting/verifyflow/diagram/img/16/flow_sequence.png" />&nbsp;&nbsp;连接</div>
	</div>
	
	<div id="myflow_props" style="position: absolute; top: 30; right: 50; background-color: #fff; width: 320px; padding: 3px;" class="ui-widget-content">
		<div id="myflow_props_handle" class="ui-widget-header">属性</div>
		<table border="1" width="100%" cellpadding="0" cellspacing="0"></table>
		<div>&nbsp;</div>
	</div>
	
	<div id="myflow"></div>
	<input type="hidden" id="mode" value="${mode}" />
	<input type="hidden" id="lcmkid" value="${lcmkid}" />
	<input type="hidden" id="lcbb" value="${lcbb}" />
	<input type="hidden" id="lcmkmc" value="${lcmkmc}" />
	<input type="hidden" id="lcqyrq" value="${lcqyrq}" />
</body>
</html>
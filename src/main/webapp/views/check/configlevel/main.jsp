<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>双评工作平台</title>
  <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
  <jsp:include page="/header.jsp?libs=jqgrid;layer" />
  <script src="main.js"></script>
  <style>
    #table_score th{text-align: center}
    #table_score td,#table_score th{vertical-align: middle}
  </style>
</head>
<body>
<div class="bmbox_layout clearfix">
  <div class="bmbox_title">
    <h5>案件评查评分项设置</h5>
    <div class="bmbox_tool">
      <button class="btn btn-primary btn-sm btn-smx" type="button"><i class="fa fa-plus"></i> 新增</button>
    </div>
  </div>
  <div class="bmbox_content clearfix">
    <div class="clearfix pd10">
      <table id="table1" class="table table-striped"></table>
      <div id="pager1"></div>
    </div>
  </div>
</div>
</body>
</html>
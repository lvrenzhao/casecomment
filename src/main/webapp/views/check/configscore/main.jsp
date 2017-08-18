<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
    <jsp:include page="/header.jsp?libs=jqgrid;layer" />
    <script type="text/javascript" src="main.js"></script>
  </head>
  <body>
  <div class="bmbox_layout title_fixed clearfix">
    <div class="bmbox_title">
      <h5>评分表模板列表</h5>
      <div class="bmbox_tool">
        <button class="btn btn-primary btn-sm btn-smx" id="btn_add" type="button"><i class="fa fa-plus"></i> 新增</button>
      </div>
    </div>
    <div class="bmbox_content clearfix">
      <table id="table1"></table>
      <div id="pager1"></div>
    </div>
  </div>
  </body>
</html>
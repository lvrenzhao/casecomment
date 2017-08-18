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
  <div class="bmbox_layout clearfix">
    <div class="bmbox_title">
      <h5>审核未通过的评查公告</h5>
    </div>
    <div class="bmbox_content clearfix">
      <table id="table1" class="table table-striped"></table>
      <div id="pager1"></div>
    </div>
  </div>
  </body>
</html>
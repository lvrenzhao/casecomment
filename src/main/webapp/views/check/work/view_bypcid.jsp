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
    <script src="view_bypcid.js"></script>
</head>
<body>
<div class="bmbox_layout title_fixed clearfix">
    <div class="bmbox_title">
        <h5>本次评查公告的标题</h5>
        <div class="bmbox_tool">

        </div>
    </div>
    <div class="bmbox_content clearfix">
        <table id="table1" class="table table-striped"></table>
        <div id="pager1"></div>
    </div>
</div>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
    <jsp:include page="/header.jsp?libs=" />
    <script type="text/javascript" src="check.js"></script>
</head>
<body class="warpslide fullbox">
<div class="rightslide_menu">
    <div class="fullbox ">
        <div class="rightslide_close" title="关闭">
            <i class="fa fa-close"></i>
        </div>
        <div class="project_timeline m15"></div>
    </div>
</div>
<div class="bmbox_layout wb30 clearfix fl">
    <div class="bmbox_title">
        <h5>案件资料</h5>
        <div class="bmbox_tool">
        </div>
    </div>
    <div class="bmbox_content clearfix">

    </div>
</div>
<div class="bmbox_layout wb70 clearfix fl">
    <div class="bmbox_title">
        <h5>查看器</h5>
        <div class="bmbox_tool">
            <button class="btn btn-primary btn-sm btn-smx" id="btn_open_score_table" type="button"><i class="fa fa-hand-o-left"></i> 打开评分表</button>
        </div>
    </div>
    <div class="bmbox_content clearfix">

    </div>
</div>
</body>
</html>
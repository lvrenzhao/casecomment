<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>双评工作平台</title>
    <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
    <jsp:include page="/header.jsp?libs=" />
</head>
<body>
<div class="bmbox_layout clearfix" style="height:100px;">
    <div class="bmbox_title">
        <h5>评查结果报告</h5>
    </div>
    <div class="bmbox_content clearfix fullbox pd20">
        <a href="javascript:;" onclick="alert('与文件服务器连接中断，请通知管理员重新连接。')"><i class="fa fa-file-word-o"></i> 2016年度全省法院案件评查报告</a>
    </div>
</div>
<div class="bmbox_layout clearfix" style="height:100px;">
    <div class="bmbox_title">
        <h5>评查活动通报</h5>
    </div>
    <div class="bmbox_content clearfix fullbox pd20">
        <a href="${ctx}/files/17.pdf" target="_blank"><i class="fa fa-file-word-o"></i> 全省法院 "五类案件" 评查活动通报</a>
    </div>
</div>
<div class="bmbox_layout clearfix" >
    <div class="bmbox_title">
        <h5>问题案件分类</h5>
    </div>
    <div class="bmbox_content clearfix fullbox pd20">
        <a href="javascript:;" onclick="alert('与文件服务器连接中断，请通知管理员重新连接。')"><i class="fa fa-file-word-o"></i> 合肥市中级人民法院问题案件汇总表</a><br/>
        <a href="javascript:;" onclick="alert('与文件服务器连接中断，请通知管理员重新连接。')"><i class="fa fa-file-word-o"></i> 六安市中级人民法院问题案件汇总表</a><br/>
        <a href="javascript:;" onclick="alert('与文件服务器连接中断，请通知管理员重新连接。')"><i class="fa fa-file-word-o"></i> 芜湖市中级人民法院问题案件汇总表</a>
    </div>
</div>
</body>
</html>
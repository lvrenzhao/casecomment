<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>XXX案件-庭审影像播放</title>
    <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
    <jsp:include page="/header.jsp?libs=" />
  </head>
  <body>
    <video width="100%" height="100%" controls>
    <source src="${ctx}/assets/movie.mp4" type="video/mp4">
    您的浏览器不支持 HTML5 video 标签。
    </video>
  <script>
  </body>
</html>
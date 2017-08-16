<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
    <jsp:include page="/header.jsp?libs=steps;jqgrid;layer" />
    <script type="text/javascript" src="main.js"></script>
    <style>
      .wizard > .actions {text-align: center !important; }
      .step-content{padding:0px !important;width:100% !important;height:100% !important; }
    </style>
  </head>
  <body>
  <div id="wizard" style="padding-top:10px;">
    <h1>抽取案件</h1>
    <div class="step-content">



    </div>

    <h1>分配案件</h1>
    <div class="step-content">

    </div>

    <h1>发布公告</h1>
    <div class="step-content" style="background-color: #fff">

    </div>
  </div>
  </body>
</html>
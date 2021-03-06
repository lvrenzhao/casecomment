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
  <%--<div class="bmbox_layout clearfix">--%>
    <%--<div class="bmbox_title">--%>
      <%--<h5>审核未通过的评查公告</h5>--%>
    <%--</div>--%>
    <%--<div class="bmbox_content clearfix">--%>
      <%--<table id="table1" class="table table-striped"></table>--%>
      <%--<div id="pager1"></div>--%>
    <%--</div>--%>
  <%--</div>--%>
  <div class="bmbox_layout">
    <div class="bmbox_title home-righttab">
      <ul class="nav nav-tabs navs-3">
        <li class="active">
          <a data-toggle="tab" href="#tab-1">
            正在审核中
          </a>
        </li>
        <li class="">
          <a data-toggle="tab" href="#tab-2">
            审核不同意&nbsp;&nbsp;<span id="label_remind" class="label label-primary"></span>
          </a>
        </li>
      </ul>
      <div class="bmbox_tool">
        <button id="xbtn_refresh" class="btn btn-white btn-sm btn-smx" type="button"><i class="fa fa-refresh"></i> 刷新</button>
      </div>
    </div>
    <div class="bmbox_content">
      <div class="tab-content">
        <div id="tab-1" class="tab-pane active">
          <table id="table1" class="table table-striped"></table>
          <div id="pager1"></div>
        </div>
        <div id="tab-2" class="tab-pane">
          <table id="table2" class="table table-striped"></table>
          <div id="pager2"></div>
        </div>
      </div>
    </div>
  </div>
  </body>
</html>
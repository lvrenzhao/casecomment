<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>双评工作平台</title>
  <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
  <jsp:include page="/header.jsp?libs=jqgrid;layer;laydate" />
  <script type="text/javascript" src="main.js"></script>
</head>
<body>
<div class="bmbox_layout">
  <div class="bmbox_title home-righttab">
    <ul class="nav nav-tabs navs-3">
      <li class="active">
        <a data-toggle="tab" href="#tab-1">
          <i class="fa fa-bell"></i> 待审核评选公告
        </a>
      </li>
      <li class="">
        <a data-toggle="tab" href="#tab-2">
          <i class="fa fa-history"></i> 已审核评选公告
        </a>
      </li>
    </ul>
  </div>
  <div class="bmbox_content">
    <div class="tab-content">
      <div id="tab-1" class="tab-pane active">
        <div class="clearfix pd10">
          <table id="table1" class="table table-striped"></table>
          <div id="pager1"></div>
        </div>
      </div>
      <div id="tab-2" class="tab-pane">
        <div id="search_box1" class="form_center clearfix">
          <div class="form_item wb25 fl">
            <label>公告标题</label>
            <input type="text" id="form_inp_bt" class="form-control input-sm" placeholder="请输入公告标题" maxlength="255" />
          </div>
          <div class="form_item wb15 fl">
            <label>状态</label>
            <select class="form-control input-sm" id="form_sel_zt">
              <option value="">--请选择--</option>
              <option value="1">同意</option>
              <option value="2">不同意</option>
            </select>
          </div>
          <div class="form_item wb35 fl">
            <label>发布日期</label>
            <div>
              <input type="text" id="form_inp_fqsj1" class="form-control input-sm wb45 fl" placeholder="" maxlength="255" onclick="laydate({istime: true,format: 'YYYY/MM/DD'})" />
              <span style="display: inline-block;float: left;padding: 5px 10px 0px 10px;">~</span>
              <input type="text" id="form_inp_fqsj2" class="form-control input-sm wb45 fl" placeholder="" maxlength="255" onclick="laydate({istime: true,format: 'YYYY/MM/DD'})" />
            </div>

          </div>
          <div class="form_item wb10 fl">
            <button id="btn_query" class="btn btn-primary btn-sm" type="button" style="margin-top: 30px;"><i class="fa fa-search"></i> 查询</button>
          </div>
        </div>
        <div class="clearfix pd10">
          <table id="table2" class="table table-striped"></table>
          <div id="pager2"></div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
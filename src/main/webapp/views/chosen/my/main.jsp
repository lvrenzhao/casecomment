<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
    <jsp:include page="/header.jsp?libs=jqgrid;layer;laydate" />
    <script src="main.js"></script>
  </head>
  <body>
  <div class="bmbox_layout title_fixed clearfix">
    <div class="bmbox_title">
      <h5>由我发起的三精评选案件</h5>
      <div class="bmbox_tool">
      </div>
    </div>
    <div class="bmbox_content clearfix">
      <div id="search_box1" class="form_center clearfix">
        <div class="form_item wb30 fl">
          <label>公告标题</label>
          <input type="text" id="form_inp_bt" class="form-control input-sm" placeholder="请输入公告标题" maxlength="255" />
        </div>
        <div class="form_item wb15 fl">
          <label>评选类型</label>
          <select class="form-control input-sm" id="form_sel_pclx">
            <option value="">--请选择--</option>
            <option value="案件评选">案件评选</option>
            <option value="庭审影像评选">庭审影像评选</option>
            <option value="裁判文书评选">裁判文书评选</option>
          </select>
        </div>
        <div class="form_item wb25 fl">
          <label>填报日期</label>
          <div>
            <input type="text" id="form_inp_fqsj1" class="form-control input-sm wb40 fl" placeholder="" maxlength="255" onclick="laydate({istime: true,format: 'YYYY/MM/DD'})" />
            <span style="display: inline-block;float: left;padding: 5px 10px 0px 10px;">~</span>
            <input type="text" id="form_inp_fqsj2" class="form-control input-sm wb40 fl" placeholder="" maxlength="255" onclick="laydate({istime: true,format: 'YYYY/MM/DD'})" />
          </div>

        </div>
        <div class="form_item wb10 fl">
          <button id="btn_query" class="btn btn-primary btn-sm" type="button" style="margin-top: 30px;"><i class="fa fa-search"></i> 查询</button>
        </div>
      </div>
      <div class="clearfix pd10">
        <table id="table1" class="table table-striped"></table>
        <div id="pager1"></div>
      </div>
    </div>
  </div>
  </body>
</html>
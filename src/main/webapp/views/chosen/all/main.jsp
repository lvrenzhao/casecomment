<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
    <jsp:include page="/header.jsp?libs=laydate;jqgrid;layer" />
    <script type="text/javascript" src="main.js"></script>
  </head>
  <body>
  <div class="bmbox_layout title_fixed clearfix">
    <div class="bmbox_title">
      <h5>所有评查案件</h5>
      <div class="bmbox_tool">
      </div>
    </div>
    <div class="bmbox_content clearfix">
      <div class="form_center clearfix">
        <div class="form_item wb30 fl">
          <label>公告标题</label>
          <input type="text" id="khmc" class="form-control input-sm" placeholder="请输入公告标题" maxlength="255" />
        </div>
        <div class="form_item wb15 fl">
          <label>发布人</label>
          <input type="text" class="form-control input-sm" placeholder=""/>
        </div>
        <div class="form_item wb25 fl">
          <label>发布日期</label>
          <div>
            <input type="text" id="" class="form-control input-sm wb40 fl" placeholder="" maxlength="255" onclick="laydate({istime: true,format: 'YYYY/MM/DD'})" />
            <span style="display: inline-block;float: left;padding: 5px 10px 0px 10px;">~</span>
            <input type="text" id="" class="form-control input-sm wb40 fl" placeholder="" maxlength="255" onclick="laydate({istime: true,format: 'YYYY/MM/DD'})" />
          </div>
        </div>

        <div class="form_item wb15 fl">
          <label>评选类型</label>
          <select class="form-control input-sm">
            <option value="">--请选择--</option>
          </select>
        </div>

        <div class="form_item wb15 fl">
          <label>案件性质</label>
          <select class="form-control">
            <option value="">--请选择--</option>
          </select>
        </div>

        <div class="form_item wb15 fl">
          <label>所属法院</label>
          <input type="text" id="" class="form-control input-sm" placeholder="" maxlength="255" />
        </div>

        <div class="form_item wb15 fl">
          <label>承办部门</label>
          <input type="text" id="" class="form-control input-sm" placeholder="" maxlength="255" />
        </div>
        <div class="form_item wb15 fl">
          <label>承办人</label>
          <input type="text" id="" class="form-control input-sm" placeholder="" maxlength="255" />
        </div>
        <div class="form_item wb15 fl">
          <label>案号</label>
          <input type="text" id="" class="form-control input-sm" placeholder="" maxlength="255" />
        </div>
        <div class="form_item wb15 fl">
          <label>评选成员</label>
          <input type="text" id="" class="form-control input-sm" placeholder="" maxlength="255" />
        </div>
        <div class="form_item wb10 fl" style="text-align: right">
          <button id="" class="btn btn-primary btn-sm" type="button" style="margin-top: 30px;"><i class="fa fa-search"></i> 查询</button>
        </div>
      </div>
      <div>
        <table id="table1" class="table table-striped"></table>
        <div id="pager1"></div>
      </div>
    </div>
  </div>
  </body>
</html>
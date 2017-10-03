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
  <script src="main.js"></script>
  <style>
    #table_score th{text-align: center}
    #table_score td,#table_score th{vertical-align: middle}
  </style>
</head>
<body>
<div class="bmbox_layout clearfix">
  <div class="bmbox_title">
    <h5>案件评查评分项设置</h5>
    <div class="bmbox_tool">
      <button id="btn_new" class="btn btn-primary btn-sm btn-smx" type="button"><i class="fa fa-plus"></i> 新增</button>
    </div>
  </div>
  <div class="bmbox_content clearfix">
    <div class="clearfix pd10">
      <table id="table1" class="table table-striped"></table>
      <div id="pager1"></div>
    </div>
  </div>
</div>




<div style="display: none" id="level_form">
  <div class="bmbox_layout clearfix">
    <div class="bmbox_title">
      <h5>备注(* 为必填)</h5>
      <div class="bmbox_tool">
        <button class="btn btn-primary btn-sm btn-smx" type="button" id="btn_save"><i class="fa fa-save"></i> 保存</button>
      </div>
    </div>
    <div class="bmbox_content clearfix">

      <form id="form_level">
        <input type ="hidden" id="form_hid_levelid" />
        <div class="form_item wb100 fl">
          <label>序号 <span style="color:darkred;">*</span></label>
          <input type="text" id="form_inp_xh" class="form-control input-sm" />
        </div>

        <div class="form_item wb100 fl">
          <label>等级名称 <span style="color:darkred;">*</span></label>
          <input type="text" id="form_inp_mc" class="form-control input-sm" />
        </div>

        <div class="form_item wb100 fl">
          <label>分值下线 <span style="color:darkred;">*</span></label>
          <input type="text" id="form_inp_xx" class="form-control input-sm"  />
        </div>

        <div class="form_item wb100 fl">
          <label>分值上线 <span style="color:darkred;">*</span></label>
          <input type="text" id="form_inp_sx" class="form-control input-sm"  />
        </div>

      </form>

    </div>
  </div>
</div>


</body>
</html>
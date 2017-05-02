<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>帐号列表</title>
  <jsp:include page="/header.jsp?libs=jqgrid;ztree;layer;chosen;icheck" />
  <script type="text/javascript" src="${ctx}/views/setting/professional/list.js"></script>
  <style type="text/css">
    .acount_top{ z-index: 10; position: relative; padding-right: 100px;}
  </style>
</head>
<body>
<div class="bmbox_layout acountlist clearfix fullbox">
  <div class="bmbox_content clearfix">
    <div class="acount_top clearfix pdt_10">
      <div class="form_item wb15 fl">
        <label>专家姓名</label>
        <input type="text" id="xm" class="form-control input-sm">
      </div>

      <div class="form_item wb15 fl">
        <label>组织机构</label>
        <input type="text" id="zzjgmc" class="form-control input-sm">
      </div>


      <div class="form_item wb20 fl pdt_30 " style="text-align: right">
        <button type="button" id="serch" class="btn btn-primary btn-sm "><i class="fa fa-search mr5"></i>查询</button>
        <button type="button" id="new" class="btn btn-defualt btn-sm " onclick="newProfessional()"><i class="fa fa-plus mr5"></i>添加专家</button>
      </div>
    </div>
    <div class="pdt_10">
      <table id="table1"></table>
      <div id="pager1"></div>
    </div>
  </div>
</div>
<script>
  $(function(){
      $('.i-checks').iCheck({
          radioClass : 'iradio_square-green',
          checkboxClass : 'icheckbox_square-green',
      });
  })
</script>
</body>
</html>
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
    .accountsearch_btn{ position: absolute; right: 15px; top: 40px;}
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
        <label>专家来自</label>
        <input type="text" id="xm" class="form-control input-sm">
      </div>

      <div class="form_item wb50 fl">
        <label>专业</label>
        <div class="i-checkslayout">
          <div class="checkbox i-checks">
            <label class="default_radio">
              <input type="checkbox" value="1" name="service" style="position: absolute; opacity: 0;"> <i></i> 刑事
            </label>
            <label>
              <input type="checkbox" value="2" name="service" style="position: absolute; opacity: 0;"> <i></i> 民事
            </label>
            <label>
              <input type="checkbox" value="3" name="service" style="position: absolute; opacity: 0;"> <i></i> 行政
            </label>
            <label>
              <input type="checkbox" value="3" name="service" style="position: absolute; opacity: 0;"> <i></i> 赔偿
            </label>
            <label>
              <input type="checkbox" value="3" name="service" style="position: absolute; opacity: 0;"> <i></i> 执行
            </label>
            <label>
              <input type="checkbox" value="3" name="service" style="position: absolute; opacity: 0;"> <i></i> 其他
            </label>
          </div>
        </div>
      </div>

      <div class="form_item wb20 fl pdt_30 " style="text-align: right">
        <button type="button" id="serch" class="btn btn-primary btn-sm "><i class="fa fa-search mr5"></i>查询</button>
        <button type="button" id="new" class="btn btn-defualt btn-sm " onclick="newstaff()"><i class="fa fa-plus mr5"></i>添加专家</button>
      </div>
    </div>
    <div class="acount_table pdt_10">
      <table id="acounttable_grid"></table>
      <div id="acounttable_page"></div>
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
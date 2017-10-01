<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>双评工作平台</title>
  <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
  <jsp:include page="/header.jsp?libs=icheck" />
  <style>
    #table_score th{text-align: center;vertical-align: middle}
    #table_score td{vertical-align: middle}
  </style>
</head>
<body>
<div id="search_box1" class="form_center clearfix">
  <div class="form_item 40 fl">
    <label>统计类型</label>
    <div class="i-checkslayout">
      <div class="checkbox i-checks">
        <label class="default_radio">
          <input type="radio" checked value="1" name="service" style="position: absolute; opacity: 0;"> <i></i> 总计
        </label>
        <label>
          <input type="radio" value="2" name="service" style="position: absolute; opacity: 0;"> <i></i> 年度
        </label>
        <label>
          <input type="radio" value="3" name="service" style="position: absolute; opacity: 0;"> <i></i> 季度
        </label>
        <label>
          <input type="radio" value="3" name="service" style="position: absolute; opacity: 0;"> <i></i> 月度
        </label>
      </div>
    </div>
  </div>
  <div class="form_item wb15 fl">
    <label>选择年度</label>
    <select class="form-control ">
      <option>2017年</option>
    </select>
  </div>

  <div class="form_item wb15 fl">
    <label>选择季度</label>
    <select class="form-control ">
      <option>第四季度</option>
    </select>
  </div>

  <div class="form_item wb15 fl">
    <label>选择月份</label>
    <select class="form-control ">
      <option>12月</option>
    </select>
  </div>
</div>
<div class="bmbox_layout">
  <div class="bmbox_title home-righttab">
    <ul class="nav nav-tabs navs-3">
      <li class="active">
        <a data-toggle="tab" href="#tab-1">
          按案件性质
        </a>
      </li>
      <li class="">
        <a data-toggle="tab" href="#tab-2">
          按案件类型
        </a>
      </li>
    </ul>
  </div>
  <div class="bmbox_content">
    <div class="tab-content">
      <div id="tab-1" class="tab-pane active">
        <table class="table table-bordered" id="table_score">
          <thead>
          <tr>
            <th class="wb20">法院</th>
            <th class="wb5">刑事</th>
            <th class="wb5">民事</th>
            <th class="wb5">行政</th>
            <th class="wb5">赔偿</th>
            <th class="wb5">执行</th>
            <th class="wb7">总计</th>
            <th class="wb5">优秀</th>
            <th class="wb7">优秀率</th>
            <th class="wb5">合格</th>
            <th class="wb7">合格率</th>
            <th class="wb5">瑕疵</th>
            <th class="wb7">瑕疵率</th>
            <th class="wb5">差错</th>
            <th class="wb7">差错率</th>
          </tr>
          </thead>
          <tbody>
          <tr style="background-color:#B1D2EC">
            <td class="wb20">安徽省高级人民法院</td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
          </tr>
          <tr>
            <td class="wb20">合肥市中级人民法院</td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
          </tr>
          <tr>
            <td class="wb20">肥东县人民法院</td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
          </tr>
          <tr>
            <td class="wb20">长丰人民法院</td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
          </tr>
          <tr style="background-color: #B1D2EC">
            <td class="wb20">小计</td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
          </tr>
          <tr>
            <td class="wb20">宣城市中级人民法院</td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
          </tr>
          <tr>
            <td class="wb20">广德县人民法院</td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
          </tr>
          <tr>
            <td class="wb20">绩溪县人民法院</td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
          </tr>
          <tr style="background-color: #B1D2EC">
            <td class="wb20">小计</td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
          </tr>
          <tr style="background-color:#1c94c4">
            <td class="wb20">总计</td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
          </tr>
          </tbody>
        </table>
      </div>
      <div id="tab-2" class="tab-pane">
        <table class="table table-bordered" id="table_score">
          <thead>
          <tr>
            <th class="wb20">法院</th>
            <th class="wb5">抗诉</th>
            <th class="wb5">发回改判</th>
            <th class="wb5">再审</th>
            <th class="wb5">审理周期一年半以上</th>
            <th class="wb5">执行异议复议</th>
            <th class="wb7">总计</th>
            <th class="wb5">优秀</th>
            <th class="wb7">优秀率</th>
            <th class="wb5">合格</th>
            <th class="wb7">合格率</th>
            <th class="wb5">瑕疵</th>
            <th class="wb7">瑕疵率</th>
            <th class="wb5">差错</th>
            <th class="wb7">差错率</th>
          </tr>
          </thead>
          <tbody>
          <tr style="background-color:#B1D2EC">
            <td class="wb20">安徽省高级人民法院</td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
          </tr>
          <tr>
            <td class="wb20">合肥市中级人民法院</td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
          </tr>
          <tr>
            <td class="wb20">肥东县人民法院</td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
          </tr>
          <tr>
            <td class="wb20">长丰人民法院</td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
          </tr>
          <tr style="background-color: #B1D2EC">
            <td class="wb20">小计</td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
          </tr>
          <tr>
            <td class="wb20">宣城市中级人民法院</td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
          </tr>
          <tr>
            <td class="wb20">广德县人民法院</td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
          </tr>
          <tr>
            <td class="wb20">绩溪县人民法院</td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
          </tr>
          <tr style="background-color: #B1D2EC">
            <td class="wb20">小计</td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
          </tr>
          <tr style="background-color:#1c94c4">
            <td class="wb20">总计</td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
            <td class="wb5"></td>
            <td class="wb7"></td>
          </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
<script>
    $(function () {
        $('.i-checks').iCheck({
            radioClass : 'iradio_square-green',
            checkboxClass : 'icheckbox_square-green',
        });
    })
</script>
</body>
</html>
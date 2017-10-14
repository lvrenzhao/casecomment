<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>双评工作平台</title>
  <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
  <jsp:include page="/header.jsp?libs=icheck;layer;" />
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
          <input id="check1" type="radio" checked value="1" name="service" style="position: absolute; opacity: 0;"> <i></i> 总计
        </label>
        <label>
          <input id="check2" type="radio" value="2" name="service" style="position: absolute; opacity: 0;"> <i></i> 年度
        </label>
        <label>
          <input id="check3" type="radio" value="3" name="service" style="position: absolute; opacity: 0;"> <i></i> 季度
        </label>
        <label>
          <input id="check4" type="radio" value="3" name="service" style="position: absolute; opacity: 0;"> <i></i> 月度
        </label>
      </div>
    </div>
  </div>
  <div class="form_item wb15 fl">
    <label style="visibility: hidden">选择年度</label>
    <select class="form-control xsel xyear" id="form_sel_year" style="display: none;">
    </select>
  </div>

  <div class="form_item wb15 fl">
    <label style="visibility: hidden">选择季度</label>
    <select class="form-control xsel" id="form_sel_session" style="display: none;">
      <option value="3">第四季度</option>
      <option value="2">第三季度</option>
      <option value="1">第二季度</option>
      <option value="0">第一季度</option>
    </select>
  </div>

  <div class="form_item wb15 fl">
    <label style="visibility: hidden">选择月份</label>
    <select class="form-control xsel" id="form_sel_month" style="display: none;">
      <option value="11">12月</option>
      <option value="10">11月</option>
      <option value="9">10月</option>
      <option value="8">09月</option>
      <option value="7">08月</option>
      <option value="6">07月</option>
      <option value="5">06月</option>
      <option value="4">05月</option>
      <option value="3">04月</option>
      <option value="2">03月</option>
      <option value="1">02月</option>
      <option value="0">01月</option>
    </select>
  </div>
</div>
<div class="bmbox_layout">
  <div class="bmbox_title home-righttab">
    <ul class="nav nav-tabs navs-3">
      <li id="t1" class="active">
        <a data-toggle="tab" href="#tab-1">
          按案件性质
        </a>
      </li>
      <li id="t2" class="">
        <a data-toggle="tab" href="#tab-2">
          按案件类型
        </a>
      </li>
    </ul>
  </div>
  <div class="bmbox_content">
    <div class="tab-content">
      <div id="tab-1" class="tab-pane active">
        <table class="table table-bordered" id="table1">
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
          <tbody id="tbody1">

          </tbody>
        </table>
      </div>
      <div id="tab-2" class="tab-pane">
        <table class="table table-bordered" id="table2">
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
          <tbody id="tbody2">

          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
<script>
  var currentTab = 1;
  var URL_CHECKDATA = ahcourt.ctx+"/static/checkdata.do";
  $(function () {
      var tenyears = getRecent10Years();
      var html = "";
      for(var i = 0 ; i < tenyears.length ; i ++){
          html += '<option value="'+tenyears[i]+'">'+tenyears[i]+'年</option>'
      }
      $(".xyear").html(html);


      $('.i-checks').iCheck({
          radioClass : 'iradio_square-green',
          checkboxClass : 'icheckbox_square-green'
      });

      $('#check1').on('ifChecked', function(event){
          $(".xsel").hide();
          reloadData();
      });
      $('#check2').on('ifChecked', function(event){
          $(".xsel").hide();
          $("#form_sel_year").show();
          reloadData();
      });
      $('#check3').on('ifChecked', function(event){
          $(".xsel").hide();
          $("#form_sel_year").show();
          $("#form_sel_session").show();
          reloadData();
      });
      $('#check4').on('ifChecked', function(event){
          $("#form_sel_year").show();
          $("#form_sel_session").show();
          $("#form_sel_month").show();
          reloadData();
      });

      $(".xsel").change(function () {
          reloadData();
      });

      $("#t1").click(function () {
          currentTab = 1;
          reloadData();
      });
      $("#t2").click(function () {
          currentTab = 2;
          reloadData();
      });

      reloadData();
  });

  var monthbegin = ["01/01",'02/01','03/01','04/01','05/01','06/01','07/01','08/01','09/01','10/01','11/01','12/01'];
  var monthend = ["01/31","02/28","03/31","04/30","05/31","06/30","07/31","08/31","09/30","10/31","11/30","12/31"];
  var sessionbegin = ["01/01",'04/01','07/01','10/01'];
  var sessionend = ["03/31",'06/30','09/30','12/31'];
  function reloadData() {
      var ltip = layer.msg("正在实时进行统计，请稍等....",{time: 50000000,icon:6});
      var kssj = "";
      var jssj = "";
      if(!$("#form_sel_month").is(":hidden")){
          kssj=$("#form_sel_year").val()+"/"+ monthbegin[$("#form_sel_month").val()];
          jssj=$("#form_sel_year").val()+"/"+ monthend[$("#form_sel_month").val()];
      }else if(!$("#form_sel_session").is(":hidden")){
          kssj=$("#form_sel_year").val()+"/"+ sessionbegin[$("#form_sel_session").val()];
          jssj=$("#form_sel_year").val()+"/"+ sessionbegin[$("#form_sel_session").val()];
      }else if(!$("#form_sel_year").is(":hidden")){
          kssj=$("#form_sel_year").val()+"/01/01";
          jssj=$("#form_sel_year").val()+"/12/31";
      }else{
          kssj="";
          jssj="";
      }
      $.ajax({
          type : 'POST',
          url : URL_CHECKDATA,
          data:{
              type:currentTab,
              kssj:kssj,
              jssj:jssj
          },
          datatype : 'json',
          success : function(data) {
              if(data && data.data){
                  
              }
          }
      });
      layer.close(ltip);
  }

  function getRecent10Years() {
      var cy = new Date().getFullYear();
      var arr = [cy];
      for(var i = cy-1; i> cy-5; i-- ){
          arr.push(i);
      }
      return arr;
  }

</script>
</body>
</html>
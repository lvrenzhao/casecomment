<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
    <jsp:include page="/header.jsp?libs=steps;jqgrid;layer;icheck;ztree;laydate" />
    <script type="text/javascript" src="main.js"></script>
    <style>
      .wizard > .actions {text-align: center !important; }
      .step-content{padding:0px !important;width:100% !important;height:100% !important;background-color: #fff; }
      .subforms{background: #eee !important;color: #aaa !important;}
    </style>
  </head>
  <body>
  <div id="wizard" style="padding-top:10px;">
    <h1>设置抽案条件</h1>
    <div class="step-content">
      <div class="form_center wb70 clearfix" >

        <div class="form_item wb100 fl ">
          <label>案件性质</label>
          <div class="i-checkslayout">
            <div class="checkbox i-checks">
              <label class="default_radio">
                <input type="checkbox" id="ajxz80401" value="80401" name="ajxz" style="position: absolute; opacity: 0;"> <i></i> 刑事
              </label>
              <label>
                <input type="checkbox" id="ajxz80402" value="80402" name="ajxz" style="position: absolute; opacity: 0;"> <i></i> 民事
              </label>
              <label>
                <input type="checkbox" id="ajxz80403" value="80403" name="ajxz" style="position: absolute; opacity: 0;"> <i></i> 行政
              </label>
              <label>
                <input type="checkbox" id="ajxz80404" value="80404" name="ajxz" style="position: absolute; opacity: 0;"> <i></i> 赔偿
              </label>
              <label>
                <input type="checkbox" id="ajxz80405" value="80405" name="ajxz" style="position: absolute; opacity: 0;"> <i></i> 执行
              </label>
              <label>
                <input type="checkbox" id="ajxz80406" value="80406" name="ajxz" style="position: absolute; opacity: 0;"> <i></i> 其他
              </label>
            </div>
          </div>
        </div>

        <div class="form_item wb100 fl ">
          <label>案件类型</label>
          <div class="i-checkslayout">
            <div class="checkbox i-checks">
              <label class="default_radio">
                <input type="checkbox" id="ajlx80601" value="80601" name="ajlx" style="position: absolute; opacity: 0;"> <i></i> 抗诉
              </label>
              <label>
                <input type="checkbox" id="ajlx80602" value="80602" name="ajlx" style="position: absolute; opacity: 0;"> <i></i> 发回改判
              </label>
              <label>
                <input type="checkbox" id="ajlx80603" value="80603" name="ajlx" style="position: absolute; opacity: 0;"> <i></i> 再审
              </label>
              <label>
                <input type="checkbox" id="ajlx80604" value="80604" name="ajlx" style="position: absolute; opacity: 0;"> <i></i> 审理周期超过一年半以上
              </label>
              <label>
                <input type="checkbox" id="ajlx80605" value="80605" name="ajlx" style="position: absolute; opacity: 0;"> <i></i> 执行异议复议
              </label>
            </div>
          </div>
        </div>

        <div class="form_item wb60 fl ">
          <label>归属法院</label>
          <div style="position: relative;">
            <div class="input-group">
              <input id="zzid" value="${bean.zzid }" type="hidden" />
              <input type="text" class="form-control input-sm bmrequire" retype="text" readonly id="citySel" value="${bean.zzjgmc }">
              <span class="input-group-btn">
                  <button type="button" class="btn btn-primary btn-sm" id="menuBtn">选择</button>
              </span>
            </div>
            <button type="button" class="btn btn-white btn-sm " style="float: right;margin-top: -30px;margin-right: -50px;" id="btn_clearorgs">清空</button>
            <div id="menuContent" class="menuContent">
              <ul id="treeDemo" class="ztree"></ul>
            </div>
          </div>
        </div>

        <div class="form_item wb40 fl " style="padding-left: 60px;" >
          <label>&nbsp;</label>
          <div class="i-checkslayout">
            <div class="checkbox i-checks">
              <label class="default_radio">
                <input type="checkbox" value="1" id="chx_sfbhxjfy" name="sfbhxjfy" style="position: absolute; opacity: 0;"> <i></i> 是否包含下级法院案件
              </label>
            </div>
          </div>
        </div>

        <div class="form_item wb30 fl ">
          <label>承办部门</label>
          <input type="text" id="txt_cbbm" name="cbbm" class="form-control input-sm" placeholder="" maxlength="255" />
        </div>
        <div class="form_item wb30 fl ">
          <label>承办人</label>
          <input type="text" id="txt_cbr" name="cbr" class="form-control input-sm" placeholder="" maxlength="255" />
        </div>
        <div class="form_item wb40 fl " style="height:60px;">
        </div>

        <div class="form_item wb30 fl ">
          <label>案号</label>
          <input type="text" id="txt_ah" name="ah" class="form-control input-sm"  placeholder="" maxlength="255" />
        </div>

        <div class="form_item wb30 fl ">
          <label>案由</label>
          <input type="text" id="txt_ay" name="ay" class="form-control input-sm" placeholder="" maxlength="255" />
        </div>

        <div class="form_item wb40 fl ">
          <label>结案日期</label>
          <div>
            <input type="text" id="txt_jarq1" class="form-control input-sm wb48 fl" placeholder="" maxlength="255"  onclick="laydate({istime: true,format: 'YYYY/MM/DD'})" />
            <span style="display: inline-block;float: left;padding: 5px 0px 0px 0px;"> ~ </span>
            <input type="text" id="txt_jarq2" class="form-control input-sm wb48 fl" placeholder="" maxlength="255"  onclick="laydate({istime: true,format: 'YYYY/MM/DD'})" />
          </div>
        </div>

      </div>
    </div>
    <h1>抽取案件</h1>
    <div class="step-content">

    </div>

    <h1>分配案件&nbsp;<span class="label label-warning">0</span></h1>
    <div class="step-content">

    </div>

    <h1>发布公告</h1>
    <div class="step-content">

    </div>
  </div>
  </body>
</html>
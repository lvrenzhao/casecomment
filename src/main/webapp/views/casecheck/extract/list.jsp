<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>双评工作平台</title>
    <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
    <jsp:include page="/header.jsp?libs=icheck;jqgrid;ztree;layer;laydate" />
    <script type="text/javascript" src="${ctx}/views/casecheck/extract/list.js"></script>
    <style>
      .moreview,.viewmore2{ display: none;}

    </style>
  </head>
  <body>
  <div class="bmbox_layout">
    <div class="bmbox_title home-righttab" style="padding-right: 0px;margin-right: 0px;">
      <ul class="nav nav-tabs navs-3" style="width: 100%;">
        <li class="active">
          <a data-toggle="tab" href="#tab-1">
            <i class="fa fa-flag"></i> 案件抽取
          </a>
        </li>
        <li class="pull-right">
          <a data-toggle="tab" href="#tab-2" class="pull-right">
            <i class="fa fa-cart-plus"></i> 已抽取案件 <span class="badge badge-primary">0</span>
          </a>
        </li>
      </ul>
    </div>
    <div class="bmbox_content">
      <div class="tab-content">
        <div id="tab-1" class="tab-pane active">
          <div class="backdrop"></div>
          <div id="search_box1" class=" business_search form_center clearfix">
            <div class="form_item wb100 fl pdt_10" >
              <span style="font-size: 14px;font-weight: 800;line-height: 26px" class="pull-left moreview"><i class="fa fa-sliders"></i> 配置抽取规则</span>

              <button id="btn-endextract" class="btn btn-white  fr mr5" type="button" style="display: none;">收起 <i class="fa fa-arrow-up "></i></button>
              <button id="btn-open" class="btn btn-white  fr mr5" type="button" style="display: none;">展开 <i class="fa fa-arrow-down "></i></button>

              <button id="btn-extract-checked" class="btn btn-primary fr mr10" type="button" style="display: none;"><i class="fa fa-cart-plus"></i> 抽取选中案件</button>
              <div id="btn-extract-group" class="input-group fr mr10" style="width:200px;display: none;">
                <input type="text" id="txt_radom" class="form-control" placeholder="案件数">
                <span class="input-group-btn">
                  <button class="btn btn-primary" id="btn_extract_radom" type="button"><i class="fa fa-cart-plus"></i> 系统随机抽取</button>
                </span>
              </div>

              <button id="btn-beginextract" class="btn btn-primary fr mr5" type="button">开始抽取案件 <i class="fa fa-arrow-down "></i></button>
            </div>
            <div class="form_item wb100 fl moreview">
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

            <div class="form_item wb100 fl moreview">
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

            <div class="form_item wb40 fl moreview">
              <label>归属法院</label>
              <div style="position: relative;">
                <div class="input-group">
                  <input id="zzid" value="${bean.zzid }" type="hidden" /> <input type="text" class="form-control input-sm bmrequire" retype="text" readonly id="citySel" value="${bean.zzjgmc }"> <span class="input-group-btn">
								<button type="button" class="btn btn-primary btn-sm" id="menuBtn">选择</button>
							</span>
                </div>
                <button type="button" class="btn btn-white btn-sm " style="float: right;margin-top: -30px;margin-right: -50px;" id="btn_clearorgs">清空</button>
                <div id="menuContent" class="menuContent">
                  <ul id="treeDemo" class="ztree"></ul>
                </div>
              </div>
            </div>
            <div class="form_item wb60 fl moreview" style="padding-left: 60px;" >
              <label>&nbsp;</label>
              <div class="i-checkslayout">
                <div class="checkbox i-checks">
                  <label class="default_radio">
                    <input type="checkbox" value="1" id="chx_sfbhxjfy" name="sfbhxjfy" style="position: absolute; opacity: 0;"> <i></i> 是否包含下级法院案件
                  </label>
                </div>
              </div>
            </div>

            <div class="form_item wb15 fl moreview">
              <label>承办部门</label>
              <input type="text" id="txt_cbbm" name="cbbm" class="form-control input-sm" placeholder="" maxlength="255" />
            </div>
            <div class="form_item wb15 fl moreview">
              <label>承办人</label>
              <input type="text" id="txt_cbr" name="cbr" class="form-control input-sm" placeholder="" maxlength="255" />
            </div>

            <div class="form_item wb15 fl moreview">
              <label>案号</label>
              <input type="text" id="txt_ah" name="ah" class="form-control input-sm"  placeholder="" maxlength="255" />
            </div>

            <div class="form_item wb20 fl moreview">
              <label>案由</label>
              <input type="text" id="txt_ay" name="ay" class="form-control input-sm" placeholder="" maxlength="255" />
            </div>

            <div class="form_item wb25 fl moreview">
              <label>结案日期</label>
              <div>
                <input type="text" id="txt_jarq1" class="form-control input-sm wb48 fl" placeholder="" maxlength="255"  onclick="laydate({istime: true,format: 'YYYY/MM/DD'})" />
                <span style="display: inline-block;float: left;padding: 5px 0px 0px 0px;"> ~ </span>
                <input type="text" id="txt_jarq2" class="form-control input-sm wb48 fl" placeholder="" maxlength="255"  onclick="laydate({istime: true,format: 'YYYY/MM/DD'})" />
              </div>

            </div>

            <div class="form_item wb10 fl moreview">
              <button id="btn_query" class="btn btn-primary btn-sm " type="button" style="margin-top: 30px;"><i class="fa fa-search"></i> 查询</button>
            </div>

          </div>
          <div class="clearfix pd10">
            <table id="table1" class="table table-striped"></table>
            <div id="pager1"></div>
          </div>
        </div>
        <div id="tab-2" class="tab-pane">
          <div id="search_box2" class="form_center clearfix">



            <div class="form_item wb70 fl ">
              <label>归属法院占比</label>
              <div class="i-checkslayout">
                <div class="checkbox i-checks">
                  <label class="default_radio">
                    <input type="radio" value="1" name="service" style="position: absolute; opacity: 0;" checked> <i></i> 全部
                  </label>
                  <label>
                    <input type="radio" value="2" name="service" style="position: absolute; opacity: 0;"> <i></i> 合肥(20%)
                  </label>
                  <label>
                    <input type="radio" value="3" name="service" style="position: absolute; opacity: 0;"> <i></i> 芜湖(20%)
                  </label>
                  <label>
                    <input type="radio" value="3" name="service" style="position: absolute; opacity: 0;"> <i></i> 安庆(20%)
                  </label>
                  <label>
                    <input type="radio" value="3" name="service" style="position: absolute; opacity: 0;"> <i></i> 淮南(20%)
                  </label>
                  <label>
                    <input type="radio" value="3" name="service" style="position: absolute; opacity: 0;"> <i></i> 淮北(20%)
                  </label>
                </div>
              </div>
            </div>

            <div class="form_item wb30 fl pdt_10">

              <button id="btn-endextract2" class="btn btn-white  fr mr5" type="button" style="display: none;margin-top: 20px">收起 <i class="fa fa-arrow-up "></i></button>
              <button id="btn-open2" class="btn btn-white  fr mr5" type="button" style="margin-top: 20px">展开 <i class="fa fa-arrow-down "></i></button>
              <button id="" class="btn btn-primary fr mr5" type="button" style="margin-top: 20px" onclick="openpcgg()">发起评查活动</button>
            </div>

            <div class="form_item wb100 fl ">
              <label>案件性质占比</label>
              <div class="i-checkslayout">
                <div class="checkbox i-checks">
                  <label class="default_radio">
                    <input type="radio" value="1" checked name="x1" style="position: absolute; opacity: 0;"> <i></i> 全部
                  </label>
                  <label class="default_radio">
                    <input type="radio" value="1" name="x1" style="position: absolute; opacity: 0;"> <i></i> 刑事(18%)
                  </label>
                  <label>
                    <input type="radio" value="2" name="x1" style="position: absolute; opacity: 0;"> <i></i> 民事(22%)
                  </label>
                  <label>
                    <input type="radio" value="3" name="x1" style="position: absolute; opacity: 0;"> <i></i> 行政(20%)
                  </label>
                  <label>
                    <input type="radio" value="3" name="x1" style="position: absolute; opacity: 0;"> <i></i> 赔偿(20%)
                  </label>
                  <label>
                    <input type="radio" value="3" name="x1" style="position: absolute; opacity: 0;"> <i></i> 执行(20%)
                  </label>
                  <label>
                    <input type="radio" value="3" name="x1" style="position: absolute; opacity: 0;"> <i></i> 其他(0%)
                  </label>
                </div>
              </div>
            </div>


            <div class="form_item wb100 fl viewmore2">
              <label>案件类型</label>
              <div class="i-checkslayout">
                <div class="checkbox i-checks">
                  <label class="default_radio">
                    <input type="checkbox" value="1" name="service" style="position: absolute; opacity: 0;"> <i></i> 抗诉
                  </label>
                  <label>
                    <input type="checkbox" value="2" name="service" style="position: absolute; opacity: 0;"> <i></i> 发回改判
                  </label>
                  <label>
                    <input type="checkbox" value="3" name="service" style="position: absolute; opacity: 0;"> <i></i> 再审
                  </label>
                  <label>
                    <input type="checkbox" value="3" name="service" style="position: absolute; opacity: 0;"> <i></i> 审理周期超过一年半以上
                  </label>
                  <label>
                    <input type="checkbox" value="3" name="service" style="position: absolute; opacity: 0;"> <i></i> 执行异议复议
                  </label>
                </div>
              </div>
            </div>

            <div class="form_item wb15 fl viewmore2">
              <label>承办部门</label>
              <input type="text" id="txt_cbbm2" name="cbbm2" class="form-control input-sm" placeholder="" maxlength="255" />
            </div>
            <div class="form_item wb15 fl viewmore2">
              <label>承办人</label>
              <input type="text" id="txt_cbr2" name="cbr2" class="form-control input-sm" placeholder="" maxlength="255" />
            </div>

            <div class="form_item wb15 fl viewmore2">
              <label>案号</label>
              <input type="text" id="txt_ah2" name="ah2" class="form-control input-sm"  placeholder="" maxlength="255" />
            </div>

            <div class="form_item wb20 fl viewmore2">
              <label>案由</label>
              <input type="text" id="txt_ay2" name="ay2" class="form-control input-sm" placeholder="" maxlength="255" />
            </div>

            <div class="form_item wb25 fl viewmore2">
              <label>结案日期<span style="color: red;"></span></label>
              <div>
                <input type="text" id="txt_jarq21" class="form-control input-sm wb48 fl" placeholder="" maxlength="255"  onclick="laydate({istime: true,format: 'YYYY/MM/DD'})"/>
                <span style="display: inline-block;float: left;padding: 5px 0px 0px 0px;"> ~ </span>
                <input type="text" id="txt_jarq22" class="form-control input-sm wb48 fl" placeholder="" maxlength="255"  onclick="laydate({istime: true,format: 'YYYY/MM/DD'})"/>
              </div>

            </div>

            <div class="form_item wb10 fl viewmore2">
              <button id="btn_query2" class="btn btn-primary btn-sm " type="button" style="margin-top: 30px;"><i class="fa fa-search"></i> 查询</button>
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

<div id="fqpchd" style="display:none;">

  <div class="alert alert-warning" role="alert">系统将将会自动短信通知各级法院及时查看公告，同时将短信通知各评审专家准备评审。</div>
  <div class="form_item wb100 fl">
    <label>评查活动标题</label>
    <input type="text" id="khmc" class="form-control input-sm" placeholder="" maxlength="255" />
  </div>

  <div class="form_item wb100 fl">
    <label>标题颜色</label>
    <div class="i-checkslayout">
      <div class="radio i-checks">
        <label class="default_radio">
          <input type="radio" value="1" name="btys" checked style="position: absolute; opacity: 0;"> <i></i> 黑色（普通）
        </label>
        <label>
          <input type="radio" value="2" name="btys" style="position: absolute; opacity: 0;"> <i></i> 红色（重要）
        </label>
      </div>
    </div>
  </div>

  <div class="form_item wb100 fl">
    <label>评查类型</label>
    <div class="i-checkslayout">
      <div class="radio i-checks">
        <label class="default_radio">
          <input type="radio" value="1" name="types" checked style="position: absolute; opacity: 0;"> <i></i> 常规评查
        </label>
        <label>
          <input type="radio" value="2" name="types" style="position: absolute; opacity: 0;"> <i></i> 专项评查
        </label>
        <label>
          <input type="radio" value="2" name="types" style="position: absolute; opacity: 0;"> <i></i> 重点评查
        </label>
      </div>
    </div>
  </div>

  <div class="form_item wb100 fl" style="text-align: center">
    <button id="btn_submit" class="btn btn-primary" type="button" style=""> <i class="fa fa-check "></i> 提交</button>
  </div>

</div>
<input type="hidden" id="hid_zzid" name="hid_zzid" value="${zzid}" />

  </body>
</html>
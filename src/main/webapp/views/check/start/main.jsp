<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
    <jsp:include page="/header.jsp?libs=steps;jqgrid;layer;icheck;ztree;laydate;summernote;chosen" />
    <script type="text/javascript" src="main.js"></script>
    <style>
      .wizard > .actions {text-align: center !important; }
      .step-content{padding:0px !important;width:100% !important;height:100% !important;background-color: #fff; }
      .subforms{background: #eee !important;color: #aaa !important;}
      .chosen-container{width:100% !important;}
      .menuContent{
        height:300px;
        overflow: auto;
      }
    </style>
  </head>
  <body>
  <div id="wizard" style="padding-top:10px;">
    <h1>设置抽案条件</h1>
    <div class="step-content">
      <div class="form_center wb75 clearfix" >

        <div class="form_item wb100 fl ">
          <label>案件性质</label>
          <div class="i-checkslayout">
            <div class="checkbox i-checks">
              <label class="1">
                <input type="checkbox" id="checkAllAjxz" style="position: absolute; opacity: 0;"> <i></i> 全选
              </label>
              <label class="default_radio">
                <input type="checkbox" id="ajxz80401" value="刑事" name="ajxz" style="position: absolute; opacity: 0;"> <i></i> 刑事
              </label>
              <label>
                <input type="checkbox" id="ajxz80402" value="民事" name="ajxz" style="position: absolute; opacity: 0;"> <i></i> 民事
              </label>
              <label>
                <input type="checkbox" id="ajxz80403" value="行政" name="ajxz" style="position: absolute; opacity: 0;"> <i></i> 行政
              </label>
              <label>
                <input type="checkbox" id="ajxz80404" value="赔偿" name="ajxz" style="position: absolute; opacity: 0;"> <i></i> 赔偿
              </label>
              <label>
                <input type="checkbox" id="ajxz80405" value="执行" name="ajxz" style="position: absolute; opacity: 0;"> <i></i> 执行
              </label>
              <%--<label>--%>
                <%--<input type="checkbox" id="ajxz80406" value="其他" name="ajxz" style="position: absolute; opacity: 0;"> <i></i> 其他--%>
              <%--</label>--%>
            </div>
          </div>
        </div>

        <div class="form_item wb100 fl ">
          <label>案件类型</label>
          <div class="i-checkslayout">
            <div class="checkbox i-checks">
              <label class="1">
                <input type="checkbox" id="checkAllAjlx" style="position: absolute; opacity: 0;"> <i></i> 全选
              </label>
              <label class="default_radio">
                <input type="checkbox" id="ajlx80601" value="抗诉" name="ajlx" style="position: absolute; opacity: 0;"> <i></i> 抗诉
              </label>
              <label>
                <input type="checkbox" id="ajlx80602" value="发回改判" name="ajlx" style="position: absolute; opacity: 0;"> <i></i> 发回改判
              </label>
              <label>
                <input type="checkbox" id="ajlx80603" value="再审" name="ajlx" style="position: absolute; opacity: 0;"> <i></i> 再审
              </label>
              <label>
                <input type="checkbox" id="ajlx80604" value="审理周期超过一年半以上" name="ajlx" style="position: absolute; opacity: 0;"> <i></i> 审理周期超过一年半以上
              </label>
              <label>
                <input type="checkbox" id="ajlx80605" value="执行异议复议" name="ajlx" style="position: absolute; opacity: 0;"> <i></i> 执行异议复议
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
      <div class="form_center clearfix" style="padding-bottom: 10px;">
        <button id="btn_extract_checked" class="btn btn-primary fr mr10" type="button" >抽取选中案件</button>
        <div id="btn-extract-group" class="input-group fr mr10" style="width:250px;">
          <input type="text" id="txt_random" class="form-control" placeholder="抽取案件数" style="border:1px solid #1c84c6;" />
          <span class="input-group-btn">
                  <button class="btn btn-primary" id="btn_extract_random" type="button">系统随机抽取</button>
                </span>
        </div>
      </div>
      <table id="table1" class="table table-striped"></table>
      <div id="pager1"></div>
    </div>

    <h1>分配案件&nbsp;<span class="label label-warning" id="lbl_joined_case_count">0</span></h1>
    <div class="step-content">
      <div class="wb50 fullbox fl">
        <div class="bmbox_layout clearfix">
          <div class="bmbox_title">
            <h5>待分配案件</h5>
            <div class="bmbox_tool">
            </div>
          </div>
          <div class="bmbox_content clearfix">
            <div class="alert alert-warning" role="alert">带有 <i class="fa fa-warning"></i> 图表的案件则表示系统检测到有资料缺失（点击案号查看卷宗），请联系案件负责人务必在评查前通过【案件管理系统】补齐资料以免影响评查分数。
              <%--<button class="btn btn-danger btn-xs" type="button"><i class="fa fa-warning"></i> 档案检测</button>--%>
            </div>
            <div class="form_center clearfix" style="padding: 10px 0px;">

              <div class="form_item wb25 fl">
                <select class="form-control" id="form_sel_region">
                  <option value="">归属法院</option>
                </select>
              </div>

              <div class="form_item wb25 fl">
                <select class="form-control" id="form_sel_xz">
                  <option value="">案件性质</option>
                </select>
              </div>

              <div class="form_item wb25 fl">
                <select class="form-control" id="form_sel_lx">
                  <option value="">案件类型</option>
                </select>
              </div>

              <div class="form_item wb25 fl" style="text-align: right">
                <button class="btn btn-warning" type="button" id="btn_deletebatch"><i class="fa fa-trash"></i></button>
                <button class="btn btn-white" type="button" id="btn_chooseTo"><i class="fa fa-long-arrow-right"></i> 分配</button>
              </div>

            </div>
            <table id="table2" class="table table-striped"></table>
            <div id="pager2"></div>
          </div>
        </div>
      </div>
      <div class="bmboxexchange wb5 fullbox fl" style="text-align: center;padding-top:22%">
        <i class="iexchange fa fa-exchange" style="font-size: 20px;color: #336699;"></i>
      </div>
      <div class="wb45 fullbox fl">
        <div class="bmbox_layout clearfix">
          <div class="bmbox_title">
            <h5>专家组</h5>
            <div class="bmbox_tool">
              <button class="btn btn-white btn-sm btn-smx pullright" id="btn_newGroup" type="button"><i class="fa fa-plus"></i> 新增组</button>
            </div>
          </div>
          <div class="bmbox_content clearfix">
            <table id="table3" class="table table-striped"></table>
            <div id="pager3"></div>
          </div>
        </div>
      </div>
    </div>

    <h1>发布公告</h1>
    <div class="step-content" style="overflow: auto">
      <div class="form_center wb75 clearfix" >

        <div class="alert alert-warning" role="alert">系统将会自动短信通知各评审专家准备评审。</div>
        <div class="form_item wb60 fl">
          <label>评查公告标题<span>*</span></label>
          <input type="text" id="txt_bt" class="form-control input-sm" placeholder="" maxlength="255" />
        </div>

        <div class="form_item wb40 fl">
          <label>标题颜色</label>
          <div class="i-checkslayout">
            <div class="radio i-checks">
              <label class="default_radio">
                <input id="btys1" type="radio" value="1" name="btys" checked style="position: absolute; opacity: 0;"> <i></i> 黑色（普通）
              </label>
              <label>
                <input id="btys2" type="radio" value="2" name="btys" style="position: absolute; opacity: 0;"> <i></i> 红色（重要）
              </label>
            </div>
          </div>
        </div>

        <div class="form_item wb45 fl">
          <label>评查类型<span>*</span></label>
          <div class="i-checkslayout">
            <div class="radio i-checks">
              <label class="default_radio">
                <input id="type1" type="radio" value="1" name="types" checked style="position: absolute; opacity: 0;"> <i></i> 常规评查
              </label>
              <label>
                <input id="type2" type="radio" value="2" name="types" style="position: absolute; opacity: 0;"> <i></i> 专项评查
              </label>
              <label>
                <input id="type3" type="radio" value="3" name="types" style="position: absolute; opacity: 0;"> <i></i> 重点评查
              </label>
            </div>
          </div>
        </div>

        <div class="form_item wb35 fl">
          <label>评查任务<span>*</span></label>
          <div class="i-checkslayout">
            <div class="radio i-checks">
              <label class="default_radio">
                <input id="task1" type="radio" value="1" name="task" checked style="position: absolute; opacity: 0;"> <i></i> 案件
              </label>
              <label>
                <input id="task2" type="radio" value="2" name="task" style="position: absolute; opacity: 0;"> <i></i> 文书
              </label>
              <label>
                <input id="task3" type="radio" value="3" name="task" style="position: absolute; opacity: 0;"> <i></i> 庭审
              </label>
            </div>
          </div>
        </div>

        <div class="form_item wb20 fl">
          <label>选择评分表<span>*</span></label>
          <select class="form-control" id="form_sel_pfb" style="width: 85%;float: left;">
            <option value="">--请选择--</option>
          </select>
          <a href="javascript:;" id="a_refresh_pfb" style="display: block;float: left;padding-top:10px;color:#369 !important;">&nbsp;<span class="fa fa-refresh"></span></a>
        </div>

        <div class="form_item wb100 fl">
          <label>公告内容<span>*</span></label>
          <div class="summernote bmrequire" id="xxnr" name="xxnr" style="">

          </div>

        </div>

      </div>
    </div>
  </div>

  <div id="div_chooseTo" style="display: none;padding-top: 20px;">
    <div class="form_item wb75 fl">
      <label>选则专家组</label>
      <select class="form-control" id="from_sel_groups">
        <option value="">--请选择--</option>
      </select>
    </div>
    <div class="form_item wb25 fl" style="text-align: right;padding-top: 30px;">
      <button class="btn btn-primary" type="button" id="btn_chosenCaseToGroup">确定</button>
    </div>
  </div>

  <div id="div_newGroup" style="display: none;">
    <input type="hidden" id="form_ipt_groupid" />
    <div class="form_item wb100 fl">
      <label>组名<span>*</span></label>
      <input type="text" class="form-control" placeholder="" id="from_ipt_groupname"/>
    </div>

    <div class="form_item wb100 fl">
      <label>组长<span>*</span></label>
      <select data-placeholder=""  class="chosen-select form-control "  id="form_sel_teamleader" style="width: 200px;">
        <option value="">--选择组长--</option>
        <option value="1" >张三</option>
        <option value="2">李四</option>
      </select>
    </div>

    <div class="form_item wb100 fl">
      <label>组员</label>
      <select data-placeholder="--选择组员--" class="chosen-select form-control " retype="multiselect" multiple id="form_sel_teammate">
        <option value="1">张三</option>
        <option value="2">李四</option>
      </select>
    </div>
    <div class="form_item wb100 fl" style="text-align: center;padding-top: 30px;">
      <button class="btn btn-primary btn-sm" type="button" id="btn_savegroup">确定</button>
    </div>
  </div>

  </body>
</html>
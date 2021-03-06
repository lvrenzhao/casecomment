<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
    <jsp:include page="/header.jsp?libs=icheck;jqgrid;layer" />
    <script type="text/javascript" src="details.js"></script>
  </head>
  <body style="overflow: hidden">
  <div class="bmbox_layout">
    <div class="bmbox_title home-righttab">
      <ul class="nav nav-tabs navs-3">
        <li class="active">
          <a data-toggle="tab" href="#tab-1">
            公告基本信息
          </a>
        </li>
        <li class="">
          <a data-toggle="tab" href="#tab-2">
            案件分配情况
          </a>
        </li>
      </ul>
      <div class="bmbox_tool">
        <button class="btn btn-primary btn-sm btn-smx" id="btn_pass" type="button" style="display: none;"><i class="fa fa-check"></i> 同意</button>
        <button class="btn btn-danger btn-sm btn-smx" id="btn_reject" type="button" style="display: none;"><i class="fa fa-close"></i> 不同意</button>
      </div>
    </div>
    <div class="bmbox_content">
      <div class="tab-content">
        <div id="tab-1" class="tab-pane active pd15">
          <div class="form_center clearfix" style="">
            <div class="form_item wb100 fl">
              <label>公告标题：</label>
              <span id="label_bt"></span>
            </div>
            <div class="form_item wb33 fl">
              <label>评查类型：</label>
              <span id="label_pclx"></span>
            </div>
            <div class="form_item wb33 fl">
              <label>评查任务：</label>
              <span id="label_pcrw"></span>
            </div>
            <div class="form_item wb33 fl">
              <label>评分表模板：</label>
              <a id="viewTable"></a>
            </div>
            <div class="form_item wb33 fl">
              <label>发布人：</label>
              <span id="label_fbrmc"></span>
            </div>
            <div class="form_item wb33 fl">
              <label>发布机构：</label>
              <span id="label_orgname"></span>
            </div>
            <div class="form_item wb33 fl">
              <label>发布时间：</label>
              <span id="label_fbsj"></span>
            </div>
          </div>
          <div class="bmbox_layout  clearfix">
            <div class="bmbox_title">
              <h5>公告内容</h5>
              <div class="bmbox_tool">
              </div>
            </div>
            <div class="bmbox_content clearfix" id="div_noticeconent" style="overflow: auto;padding: 15px;">

            </div>
          </div>
        </div>
        <div id="tab-2" class="tab-pane pd10">

          <div class="bmbox_layout wb40 clearfix fl">
            <div class="bmbox_title">
              <h5>分配情况</h5>
              <div class="bmbox_tool">
              </div>
            </div>
            <div class="bmbox_content clearfix">

              <div class="form_center clearfix" style="padding: 10px 0px;">
                <div class="form_item wb100 fl">
                  <select class="form-control xselect" id="form_sel_gsfy" data-lx="1">
                    <option value="">归属法院</option>
                  </select>
                </div>

                <div class="form_item wb100 fl">
                  <select class="form-control xselect" id="form_sel_xz" data-lx="2">
                    <option value="">案件性质</option>
                  </select>
                </div>

                <div class="form_item wb100 fl">
                  <select class="form-control xselect" id="form_sel_lx" data-lx="3">
                    <option value="">案件类型</option>
                  </select>
                </div>
              </div>

              <div class="bmbox_layout  clearfix no-borders">
                <div class="bmbox_title">
                  <h5>专家组分配</h5>
                  <div class="bmbox_tool">
                    <button id="btn_clear" class="btn btn-white btn-sm btn-smx" type="button"><i class="fa fa-refresh"></i> 清空专家组选择</button>
                  </div>
                </div>
                <div class="bmbox_content clearfix">
                  <table id="table3" class="table table-striped"></table>
                  <div id="pager3"></div>
                </div>
              </div>

            </div>
          </div>

          <div class="bmbox_layout wb60 clearfix fl">
            <div class="bmbox_title">
              <h5>案件列表</h5>
              <div class="bmbox_tool">
              </div>
            </div>
            <div class="bmbox_content clearfix">
              <table id="table1" class="table table-striped"></table>
              <div id="pager1"></div>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>


  <div id="div_reject" style="display: none;">
    <div class="form_item wb100 fl">
      <label>&nbsp;</label>
      <textarea id="form_inp_shyj" class="form-control" placeholder="请输入审核意见" style="height: 100px;"></textarea>
    </div>
    <div class="form_item wb100 fl" style="text-align: center;padding-top: 10px;">
      <button id="btn_reject_confirm" class="btn btn-primary" type="button" >确定</button>
    </div>
  </div>
  </body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>双评工作平台</title>
    <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
    <jsp:include page="/header.jsp?libs=icheck;jqgrid" />
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
            <i class="fa fa-cart-plus"></i> 已抽取案件 <span class="badge badge-primary"> 100 </span>
          </a>
        </li>
      </ul>
    </div>
    <div class="bmbox_content">
      <div class="tab-content">
        <div id="tab-1" class="tab-pane active">
          <div id="search_box1" class="form_center clearfix">



            <div class="form_item wb45 fl">
              <label>案件性质</label>
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
            <div class="form_item wb55 fl">
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

            <div class="form_item wb12_0 fl">
              <label>归属法院</label>
              <input type="text" id="khmc" class="form-control input-sm" placeholder="" maxlength="255" />
            </div>
            <div class="form_item wb12_0 fl">
              <label>承办部门</label>
              <input type="text" id="khmc" class="form-control input-sm" placeholder="" maxlength="255" />
            </div>
            <div class="form_item wb12_0 fl">
              <label>承办人</label>
              <input type="text" id="khmc" class="form-control input-sm" placeholder="" maxlength="255" />
            </div>
            <div class="form_item wb12_0 fl">
              <label>案号</label>
              <input type="text" id="khmc" class="form-control input-sm" placeholder="" maxlength="255" />
            </div>

            <div class="form_item wb23 fl">
              <label>结案日期</label>
              <div>
                <input type="text" id="" class="form-control input-sm wb48 fl" placeholder="" maxlength="255" />
                <span style="display: inline-block;float: left;padding: 5px 0px 0px 0px;">~</span>
                <input type="text" id="" class="form-control input-sm wb48 fl" placeholder="" maxlength="255" />
              </div>

            </div>
            <div class="form_item wb27 fl">
              <button id="" class="btn btn-danger btn-sm " type="button" style="margin-top: 30px;">远程抽取</button>
              <button id="" class="btn btn-white btn-sm " type="button" style="margin-top: 30px;">本地查询</button>
              <button id="" class="btn btn-white btn-sm " type="button" style="margin-top: 30px;">添加到已抽取</button>
            </div>
          </div>
          <div class="clearfix pd10">
            <table id="table1" class="table table-striped"></table>
            <div id="pager1"></div>
          </div>
        </div>
        <div id="tab-2" class="tab-pane">

        </div>
      </div>
    </div>
  </div>
  <script>
    $(function(){
        $('.i-checks').iCheck({
            radioClass : 'iradio_square-green',
            checkboxClass : 'icheckbox_square-green',
        });


        $("#table1").jqGrid({
            url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
            datatype : "json",
            mtype : "post",
            multiselect : true,
            height : gridHeight(),
            width : gridWidth(),
            rownumbers : true,
            shrinkToFit : true,
            rowNum : 1000000,
            colModel : [ {
                label : 'ajid',
                name : 'ajid',
                hidden : true,
                key : true,
                frozen : true
            }, {
                label : 'ggid',
                name : 'ggid',
                hidden : true,
                frozen : true
            },{
                label : '操作',
                name : 'ggid',
                width : 100,
                align : 'center',
                sortable : false,
                formatter :formatter_grid1_opt_1 ,
                frozen : true
            },{
                label : '案号',
                name : 'xmmc',
                frozen : true,
                width : 100
            }, {
                label : '归属法院',
                name : 'xmzt',
                width : 150
            }, {
                label : '承办部门',
                name : 'htmc',
                width : 100
            }, {
                label : '承办人',
                name : 'xmlxmc',
                width : 80
            }, {
                label : '案件性质',
                name : 'zylbmc',
                width : 80
            }, {
                label : '案由',
                name : 'xmfzrmc',
                width : 120
            }, {
                label : '结案方式',
                name : 'xmjlmc',
                width : 80
            }, {
                label : '结案时间',
                name : 'xmcymc',
                width : 80
            }
            ],
            pager:"#pager1",
            viewrecords: true
        });
    });
    function gridWidth() {
        return $('body').width() - 22;
    }
    function gridHeight() {
        return $('body').height() -270;
    }

    function formatter_grid1_opt_1(cellvalue, options, rowObject) {
        return '<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="添加"><i class="fa fa-cart-plus"></i> 添加到已抽取</button>';
    }
  </script>
  </body>
</html>
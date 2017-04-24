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
    <style>
      #table_score th{text-align: center;vertical-align: middle}
      #table_score td{vertical-align: middle}
    </style>
  </head>
  <body>

  <div class="bmbox_layout title_fixed">
    <div class="bmbox_title home-righttab">
      <ul class="nav nav-tabs navs-3">
        <li class="active">
          <a data-toggle="tab" href="#tab-1">
            邀请专家
          </a>
        </li>
        <li class="">
          <a data-toggle="tab" href="#tab-2">
            参选案例排名
          </a>
        </li>
        <li>
          <a data-toggle="tab" href="#tab-4">
            质量情况
          </a>
        </li>
      </ul>
    </div>
    <div class="bmbox_content">
      <div class="tab-content">
        <div id="tab-1" class="tab-pane active">
          <div class="alert alert-info">
            本次评查活动共邀请专家 _____ 人，其中人大代表______人，政协委员______人，资深检察官_______人，专家学者______人，其他院外人士_______人。
          </div>
          <div class="clearfix pd10">
            <table id="table1" class="table table-striped"></table>
            <div id="pager1"></div>
          </div>
        </div>
        <div id="tab-2" class="tab-pane">
          <div class="clearfix pd10">
            <table id="table2" class="table table-striped"></table>
            <div id="pager2"></div>
          </div>
        </div>
        <div id="tab-4" class="tab-pane">
          <table class="table table-bordered" id="table_score" >
            <thead>
            <tr>
              <th class="wb5">序号</th>
              <th class="wb20">评审内容</th>
              <th class="wb45">评分标准</th>
              <th class="wb5">分值</th>
              <th class="wb5">累计扣分</th>
              <th class="wb5">扣分案件</th>
              <th class="wb5">平均扣分</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td class="wb5">1</td>
              <td class="wb20">事实证据与实体处理</td>
              <td class="wb45">审理查明的事实是否全面、客观、清楚</td>
              <td class="wb5">8</td>
              <td class="wb5">30</td>
              <td class="wb5">5</td>
              <td class="wb5">6</td>
            </tr>

            <tr>
              <td class="wb5">1</td>
              <td class="wb20">事实证据与实体处理</td>
              <td class="wb45">是否有其他不规范情形</td>
              <td class="wb5">8</td>
              <td class="wb5">30</td>
              <td class="wb5">5</td>
              <td class="wb5">6</td>
            </tr>

            <tr>
              <td class="wb5">1</td>
              <td class="wb20">审理程序</td>
              <td class="wb45">是否严格遵守规定</td>
              <td class="wb5">8</td>
              <td class="wb5">30</td>
              <td class="wb5">5</td>
              <td class="wb5">6</td>
            </tr>

            <tr>
              <td class="wb5">1</td>
              <td class="wb20">审理程序</td>
              <td class="wb45">庭审是否规范严谨，能否有序组织举证，质证，认证和辩论。</td>
              <td class="wb5">8</td>
              <td class="wb5">30</td>
              <td class="wb5">5</td>
              <td class="wb5">6</td>
            </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>



  <script>
    $(function () {
        $("#table1").jqGrid({
            url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
            datatype : "json",
            mtype : "post",
            height : $('body').height()-175,
            width : $('body').width()-22,
            rownumbers : true,
            shrinkToFit : true,
            rowNum : 20,
            colModel : [ {
                label : '操作',
                name : 'ggid',
                width : 50,
                align : 'center',
                sortable : false,
                formatter :formatter_grid1_opt_1 ,
                frozen : true
            },{
                label : '专家',
                name : 'xmmc',
                frozen : true,
                width : 100
            },{
                label : '来自',
                name : 'xmmc',
                frozen : true,
                width : 150
            },{
                label : '本次评查案件',
                name : 'xmmc',
                frozen : true,
                width : 100
            },{
                label : '本次评查活动寄语',
                name : 'xmmc',
                frozen : true,
                width : 500
            }
            ],
            pager:"#pager1"
            //,viewrecords: true
        });


        $("#table2").jqGrid({
            url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
            datatype : "json",
            mtype : "post",
            height : $('body').height()-135,
            width : $('body').width()-22,
            rownumbers : true,
            shrinkToFit : true,
            rowNum : 20,
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
            },{
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
            },{
                label : '评审专家',
                name : 'pszj',
                width : 80
            }
                ,{label : '评审时间',name : 'pcsj',width : 80}
                ,{label : '得分',name : 'yqgq',width : 80}
            ],
            pager:"#pager2"
            ,viewrecords: true
        });


    })


    function formatter_grid1_opt_1(cellvalue, options, rowObject) {
        return '<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="专家介绍"><i class="fa fa-info-circle"></i></button>';
    }
  </script>
  </body>
</html>
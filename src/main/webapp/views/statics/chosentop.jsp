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
</head>
<body>
<div class="bmbox_layout">
  <div class="bmbox_title home-righttab">
    <ul class="nav nav-tabs navs-3">
      <li class="active">
        <a data-toggle="tab" href="#tab-1">
          总排行榜
        </a>
      </li>
      <li class="">
        <a data-toggle="tab" href="#tab-2">
          年度排行榜
        </a>
      </li>
      <li class="">
        <a data-toggle="tab" href="#tab-3">
          季度排行榜
        </a>
      </li>
      <li class="">
        <a data-toggle="tab" href="#tab-4">
          月度排行榜
        </a>
      </li>
    </ul>
    <div class="tabrightmenu">
      <div class="bmbox_tool active">

      </div>
      <div class="bmbox_tool">
        <select>
          <option>2017年</option>
          <option>2016年</option>
        </select>

      </div>
      <div class="bmbox_tool">
        <select>
          <option>2017年</option>
          <option>2016年</option>
        </select>
        <select>
          <option>第四季度</option>
          <option>第三季度</option>
          <option>第二季度</option>
          <option>第一季度</option>
        </select>
      </div>
      <div class="bmbox_tool">
        <select>
          <option>2017年</option>
          <option>2016年</option>
        </select>
        <select>
          <option>12月</option>
          <option>11月</option>
          <option>..</option>
        </select>
      </div>
    </div>
  </div>
  <div class="bmbox_content">
    <div class="tab-content">
      <div id="tab-1" class="tab-pane active">
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
      <div id="tab-3" class="tab-pane">
        <div class="clearfix pd10">
          <table id="table3" class="table table-striped"></table>
          <div id="pager3"></div>
        </div>
      </div>
      <div id="tab-4" class="tab-pane">
        <div class="clearfix pd10">
          <table id="table4" class="table table-striped"></table>
          <div id="pager4"></div>
        </div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
    $(function(){
        //双tab联动
        var firstitem=$(".home-righttab .nav-tabs li");
        var secitem=$(".tabrightmenu .bmbox_tool");
        doubletab(firstitem,secitem);


        $("#table1").jqGrid({
            url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
            datatype : "json",
            mtype : "post",
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
                label : '公告标题',
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
                label : '评审专家',
                name : 'pszj',
                width : 80
            }
                ,{label : '评审时间',name : 'pcsj',width : 80}
                ,{label : '得分',name : 'yqgq',width : 80}
            ],
            pager:"#pager1",
            viewrecords: true
        });

        $("#table2").jqGrid({
            url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
            datatype : "json",
            mtype : "post",
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
                label : '公告标题',
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
                label : '评审专家',
                name : 'pszj',
                width : 80
            }
                ,{label : '评审时间',name : 'pcsj',width : 80}
                ,{label : '得分',name : 'yqgq',width : 80}
            ],
            pager:"#pager2",
            viewrecords: true
        });

        $("#table3").jqGrid({
            url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
            datatype : "json",
            mtype : "post",
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
                label : '公告标题',
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
                label : '评审专家',
                name : 'pszj',
                width : 80
            }
                ,{label : '评审时间',name : 'pcsj',width : 80}
                ,{label : '得分',name : 'yqgq',width : 80}
            ],
            pager:"#pager3",
            viewrecords: true
        });


        $("#table4").jqGrid({
            url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
            datatype : "json",
            mtype : "post",
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
                label : '公告标题',
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
                label : '评审专家',
                name : 'pszj',
                width : 80
            }
                ,{label : '评审时间',name : 'pcsj',width : 80}
                ,{label : '得分',name : 'yqgq',width : 80}
            ],
            pager:"#pager4",
            viewrecords: true
        });


    })

    function gridWidth() {
        return $('body').width() - 22;
    }
    function gridHeight() {
        return $('body').height() -135;
    }

    function formatter_grid1_opt_1(cellvalue, options, rowObject) {
        return '<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="openDetails()" title="评审信息"><i class="fa fa-info-circle"></i> 评审信息</button>';
    }


    function openDetails(){
        layer.open({
            type : 2,
            shift : 5,
            title : '评审信息',
            shadeClose : false,
            shade : 0.3,
            area : [ '90%', '90%' ],
            content : ahcourt.ctx + "/casecheck/check/checkinfo.do",
            cancel : function(index) {
                layer.close(index);
            }
        });
    }
</script>
</body>
</html>
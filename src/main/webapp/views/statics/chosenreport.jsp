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
<div class="bmbox_layout  clearfix wb33 fl">
  <div class="bmbox_title">
    <h5>精品案件评选报告</h5>
    <div class="bmbox_tool">
      <input type="text" class="form-control fl" placeholder="评选公告标题" style="width:150px;margin-top: 3px;margin-right: 10px;" /><button class="btn btn-white btn-sm btn-smx" type="button"><i class="fa fa-search"></i> 查询</button>
    </div>
  </div>
  <div class="bmbox_content clearfix">
    <div class="clearfix pd10">
      <table id="table1" class="table table-striped"></table>
      <div id="pager1"></div>
    </div>
  </div>
</div>

<div class="bmbox_layout  clearfix wb33 fl">
  <div class="bmbox_title">
    <h5>精品庭审评选报告</h5>
    <div class="bmbox_tool">
      <input type="text" class="form-control fl" placeholder="评选公告标题" style="width:150px;margin-top: 3px;margin-right: 10px;" /><button class="btn btn-white btn-sm btn-smx" type="button"><i class="fa fa-search"></i> 查询</button>
    </div>
  </div>
  <div class="bmbox_content clearfix">
    <div class="clearfix pd10">
      <table id="table2" class="table table-striped"></table>
      <div id="pager2"></div>
    </div>
  </div>
</div>

<div class="bmbox_layout  clearfix wb33 fl">
  <div class="bmbox_title">
    <h5>精品裁判文书报告</h5>
    <div class="bmbox_tool">
      <input type="text" class="form-control fl" placeholder="评选公告标题" style="width:150px;margin-top: 3px;margin-right: 10px;" /><button class="btn btn-white btn-sm btn-smx" type="button"><i class="fa fa-search"></i> 查询</button>
    </div>
  </div>
  <div class="bmbox_content clearfix">
    <div class="clearfix pd10">
      <table id="table3" class="table table-striped"></table>
      <div id="pager3"></div>
    </div>
  </div>
</div>
<script>
    $(function(){

        $("#table1").jqGrid({
            url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
            datatype : "json",
            mtype : "post",
            height : gridHeight(),
            width : gridWidth(),
            //rownumbers : true,
            shrinkToFit : true,
            rowNum : 1000000,
            colModel : [ {
                label : '报表',
                name : 'ggid',
                width : 50,
                align : 'center',
                sortable : false,
                formatter :formatter_grid1_opt_1 ,
                frozen : true
            },{
                label : '评选公告标题',
                name : 'xmmc',
                frozen : true,
                width : 200
            }
            ],
            pager:"#pager1"
            //,viewrecords: true
        });
        $("#table2").jqGrid({
            url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
            datatype : "json",
            mtype : "post",
            height : gridHeight(),
            width : gridWidth(),
            //rownumbers : true,
            shrinkToFit : true,
            rowNum : 1000000,
            colModel : [ {
                label : '报表',
                name : 'ggid',
                width : 50,
                align : 'center',
                sortable : false,
                formatter :formatter_grid1_opt_1 ,
                frozen : true
            },{
                label : '评选公告标题',
                name : 'xmmc',
                frozen : true,
                width : 200
            }
            ],
            pager:"#pager2"
            //,viewrecords: true
        });
        $("#table3").jqGrid({
            url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
            datatype : "json",
            mtype : "post",
            height : gridHeight(),
            width : gridWidth(),
            //rownumbers : true,
            shrinkToFit : true,
            rowNum : 1000000,
            colModel : [ {
                label : '报表',
                name : 'ggid',
                width : 50,
                align : 'center',
                sortable : false,
                formatter :formatter_grid1_opt_1 ,
                frozen : true
            },{
                label : '评选公告标题',
                name : 'xmmc',
                frozen : true,
                width : 200
            }
            ],
            pager:"#pager3"
            //,viewrecords: true
        });
    });
    function gridWidth() {
        return $('body').width()*0.33 - 22;
    }
    function gridHeight() {
        return $('body').height() -135;
    }

    function formatter_grid1_opt_1(cellvalue, options, rowObject) {
        return '<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="openDetails()" title="查看报表"><i class="fa fa-bar-chart"></i></button>';
    }
    function openDetails(){
        layer.open({
            type : 2,
            shift : 5,
            title : '详细评选报告',
            shadeClose : false,
            shade : 0.3,
            area : [ '90%', '90%' ],
            content : ahcourt.ctx + "/statics/chosenreportitem.do",
            cancel : function(index) {
                layer.close(index);
            }
        });
    }
</script>
</body>
</html>
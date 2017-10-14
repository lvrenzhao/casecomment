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
      </ul>
    </div>
    <div class="bmbox_content">
      <div class="tab-content">
        <div id="tab-1" class="tab-pane active">
          <%--<div class="alert alert-info">--%>
            <%--本次评查活动共邀请专家 2 人，其中人大代表 0 人，政协委员 0 人，资深检察官 2 人，专家学者 0 人。--%>
          <%--</div>--%>
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

      </div>
    </div>
  </div>



  <script>
    var ggid;
    $(function () {
        ggid = $.getUrlParam("ggid");
        $("#table1").jqGrid({
            url : ahcourt.ctx + '/static/chosenpros.do',
            postData:{ggid:ggid},
            datatype : "json",
            mtype : "post",
            height : $('body').height()-135,
            width : $('body').width()-22,
            rownumbers : true,
            shrinkToFit : true,
            rowNum : 1000000,
            colModel : [
                {
                    label : '专家姓名',
                    name : 'xm',
                    width : 100
                },
                {
                    label : '来自',
                    name : 'zzjgmc',
                    frozen : true,
                    width : 300
                },
                {
                    label : '头衔',
                    name : 'tx',
                    width : 100
                },  {
                    label : '专业',
                    name : 'zymc',
                    width : 150
                },  {
                    label : '标签',
                    name : 'bqmc',
                    width : 150
                },
                {
                    label : '本次评查案件',
                    name : 'pcs',
                    frozen : true,
                    width : 100
                }
            ],
            pager:"#pager1"
            ,viewrecords: true
        });


        $("#table2").jqGrid({
            url : ahcourt.ctx + '/chosen/chosencases.do',
            postData:{
                ggid:ggid
            },
            datatype : "json",
            mtype : "post",
            height : $('body').height()-135,
            width : $('body').width()-22,
            rownumbers : true,
            shrinkToFit : true,
            rowNum : 20,
            colModel : [
                {label : 'ccid',name : 'ccid',hidden : true, key : true,frozen:true},
                {
                label : '案号',
                name : 'ah',
                frozen : true,
                width : 100
            },{
                label : '归属法院',
                name : 'gsfy',
                width : 150
            }, {
                label : '承办部门',
                name : 'cbbm',
                width : 100
            }, {
                label : '承办人',
                name : 'cbr',
                width : 80
            }, {
                label : '案件性质',
                name : 'xz',
                width : 80
            }, {
                label : '案由',
                name : 'ay',
                width : 120
            }, {
                label : '结案方式',
                name : 'jafs',
                width : 80
            },{
                label : '评审组长',
                name : 'teamleadername',
                width : 80
            },{
                    label : '评审组员',
                    name : 'teammatenames',
                    width : 180
                },
                {label : '评选时间',name : 'dpsj',sortable:false,width : 100},
                {label : '评选得分',name : 'zzpxdf',sortable:false, width : 100}
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
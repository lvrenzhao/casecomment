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
        <select class="xyear xsel" id="year1">
        </select>

      </div>
      <div class="bmbox_tool">
        <select class="xyear xsel" id="year2">
        </select>
        <select class="xsel" id="session2">
          <option value="3">第四季度</option>
          <option value="2">第三季度</option>
          <option value="1">第二季度</option>
          <option value="0">第一季度</option>
        </select>
      </div>
      <div class="bmbox_tool">
        <select class="xyear xsel" id="year3">
        </select>
        <select class="xsel" id="month3">
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
    var URL_ALLTABLE = ahcourt.ctx+"/static/topchosen.do";
    var monthbegin = ["01/01",'02/01','03/01','04/01','05/01','06/01','07/01','08/01','09/01','10/01','11/01','12/01'];
    var monthend = ["01/31","02/28","03/31","04/30","05/31","06/30","07/31","08/31","09/30","10/31","11/30","12/31"];
    var sessionbegin = ["01/01",'04/01','07/01','10/01'];
    var sessionend = ["03/31",'06/30','09/30','12/31'];
    $(function(){
        //双tab联动
        var firstitem=$(".home-righttab .nav-tabs li");
        var secitem=$(".tabrightmenu .bmbox_tool");
        doubletab(firstitem,secitem);

        var tenyears = getRecent10Years();
        var html = "";
        for(var i = 0 ; i < tenyears.length ; i ++){
            html += '<option value="'+tenyears[i]+'">'+tenyears[i]+'年</option>'
        }
        $(".xyear").html(html);

        var cols = [
            {label : 'ccid',name : 'ccid',hidden : true,key : true,frozen : true},
            {label : '案号',name : 'ah',frozen : true,width : 100},
            {label : '归属法院',name : 'gsfy',width : 150},
            {label : '公告标题',name : 'bt',width : 150},
            {label : '承办部门',name : 'cbbm',width : 100},
            {label : '承办人',name : 'cbr',width : 80},
            {label : '案件性质', name : 'xz', width : 80 },
            {label : '案件类型', name : 'xz', width : 80 },
            {label : '案由',name : 'ay',width : 120 },
            {label : '结案方式',name : 'jafs',width : 80},
            {label : '评查组长',name : 'teamleadername',width : 80},
            {label : '评查组员',name : 'teammatenames',width : 80},
            {label : '评查分数',name : 'zzpcdf',width : 80},
            {label : '评查时间',name : 'dpsj',width : 80}
        ];


        $("#table1").jqGrid({
            url : URL_ALLTABLE,
            datatype : "json",
            mtype : "post",
            height : gridHeight(),
            width : gridWidth(),
            rownumbers : true,
            shrinkToFit : true,
            rowNum : 50,
            colModel : cols,
            pager:"#pager1",
            viewrecords: true
        });

        $("#table2").jqGrid({
            url : URL_ALLTABLE,
            postData:{
                fqsj1:$("#year1").val()+"/01/01",
                fqsj2:$("#year1").val()+"/12/31"
            },
            datatype : "json",
            mtype : "post",
            height : gridHeight(),
            width : gridWidth(),
            rownumbers : true,
            shrinkToFit : true,
            rowNum : 50,
            colModel : cols,
            pager:"#pager2",
            viewrecords: true
        });

        $("#table3").jqGrid({
            url : URL_ALLTABLE,
            postData:{
                fqsj1:$("#year2").val()+"/"+sessionbegin[$("#session2").val()],
                fqsj2:$("#year2").val()+"/"+sessionend[$("#session2").val()]
            },
            datatype : "json",
            mtype : "post",
            height : gridHeight(),
            width : gridWidth(),
            rownumbers : true,
            shrinkToFit : true,
            rowNum : 50,
            colModel :  cols,
            pager:"#pager3",
            viewrecords: true
        });


        $("#table4").jqGrid({
            url : URL_ALLTABLE,
            postData:{
                fqsj1:$("#year3").val()+"/"+monthbegin[$("#month3").val()],
                fqsj2:$("#year3").val()+"/"+monthend[$("#month3").val()]
            },
            datatype : "json",
            mtype : "post",
            height : gridHeight(),
            width : gridWidth(),
            rownumbers : true,
            shrinkToFit : true,
            rowNum : 50,
            colModel :  cols,
            pager:"#pager4",
            viewrecords: true
        });

        $(".xsel").change(function () {
            reloadGrid();
        });

    });

    function reloadGrid() {
        if ($.trim($(".nav li.active").text()) == "年度排行榜"){
            $("#table2").jqGrid().setGridParam({
                url : URL_ALLTABLE,
                postData:{
                    fqsj1:$("#year1").val()+"/01/01",
                    fqsj2:$("#year1").val()+"/12/31"
                },
                page : 1
            }).trigger("reloadGrid");

        }else if ($.trim($(".nav li.active").text()) == "季度排行榜"){
            $("#table3").jqGrid().setGridParam({
                url : URL_ALLTABLE,
                postData:{
                    fqsj1:$("#year2").val()+"/"+sessionbegin[$("#session2").val()],
                    fqsj2:$("#year2").val()+"/"+sessionend[$("#session2").val()]
                },
                page : 1
            }).trigger("reloadGrid");
        }else if ($.trim($(".nav li.active").text()) == "月度排行榜"){
            $("#table4").jqGrid().setGridParam({
                url : URL_ALLTABLE,
                postData:{
                    fqsj1:$("#year3").val()+"/"+monthbegin[$("#month3").val()],
                    fqsj2:$("#year3").val()+"/"+monthend[$("#month3").val()]
                },
                page : 1
            }).trigger("reloadGrid");
        }
    }

    function getRecent10Years() {
        var cy = new Date().getFullYear();
        var arr = [cy];
        for(var i = cy-1; i> cy-5; i-- ){
            arr.push(i);
        }
        return arr;
    }

    function gridWidth() {
        return $('body').width() - 22;
    }
    function gridHeight() {
        return $('body').height() -135;
    }

</script>
</body>
</html>
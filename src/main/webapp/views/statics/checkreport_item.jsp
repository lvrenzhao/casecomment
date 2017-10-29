<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>双评工作平台</title>
    <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
    <jsp:include page="/header.jsp?libs=jqgrid;layer;ztree" />
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
            评查案件
          </a>
        </li>
        <li>
          <a data-toggle="tab" href="#tab-3">
            五类案件
          </a>
        </li>
        <li>
          <a data-toggle="tab" href="#tab-4">
            质量情况
          </a>
        </li>
        <li>
          <a data-toggle="tab" href="#tab-5">
            评查排名
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
          <table class="table table-bordered" id="table2">
            <thead>
            <tr>
              <th class="wb20">法院</th>
              <th class="wb5">刑事</th>
              <th class="wb5">民事</th>
              <th class="wb5">行政</th>
              <th class="wb5">赔偿</th>
              <th class="wb5">执行</th>
              <th class="wb7">总计</th>
              <th class="wb5">优秀</th>
              <th class="wb7">优秀率</th>
              <th class="wb5">合格</th>
              <th class="wb7">合格率</th>
              <th class="wb5">瑕疵</th>
              <th class="wb7">瑕疵率</th>
              <th class="wb5">差错</th>
              <th class="wb7">差错率</th>
            </tr>
            </thead>
            <tbody id="tbody1">

            </tbody>
          </table>
        </div>
        <div id="tab-3" class="tab-pane">
          <table class="table table-bordered" id="table3">
            <thead>
            <tr>
              <th class="wb20">法院</th>
              <th class="wb5">抗诉</th>
              <th class="wb5">发回改判</th>
              <th class="wb5">再审</th>
              <th class="wb5">审理周期一年半以上</th>
              <th class="wb5">执行异议复议</th>
              <th class="wb7">总计</th>
              <th class="wb5">优秀</th>
              <th class="wb7">优秀率</th>
              <th class="wb5">合格</th>
              <th class="wb7">合格率</th>
              <th class="wb5">瑕疵</th>
              <th class="wb7">瑕疵率</th>
              <th class="wb5">差错</th>
              <th class="wb7">差错率</th>
            </tr>
            </thead>
            <tbody id="tbody2">

            </tbody>
          </table>
        </div>
        <div id="tab-4" class="tab-pane">
          <table class="table table-bordered" id="table4" >
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
            <tbody id="tbody4">

            </tbody>
          </table>
        </div>
        <div id="tab-5" class="tab-pane">

          <div id="search_box1" class=" form_center clearfix">
            <div class="form_item wb30 fl moreview">
              <label>归属法院</label>
              <div style="position: relative;">
                <div class="input-group">
                  <input id="zzid" value="${bean.zzid }" type="hidden" /> <input type="text" class="form-control input-sm bmrequire" retype="text" readonly id="citySel" value="${bean.zzjgmc }"> <span class="input-group-btn">
                                  <button type="button" class="btn btn-primary btn-sm" id="menuBtn">选择</button>
                              </span>

                </div>
                <button type="button" class="btn btn-white btn-sm " style="float: right;margin-top: -30px;margin-right: -50px;" id="btn_clearorgs">清空</button>
                <div id="menuContent" class="menuContent" style="z-index: 9999999">
                  <ul id="treeDemo" class="ztree"></ul>
                </div>
              </div>
            </div>

            <div class="form_item wb20 fl moreview" style="padding-left: 60px;">
              <label>案件性质</label>
              <select class="form-control input-sm" id="form_sel_xz">
                <option value="">--请选择--</option>
                <option value="刑事">刑事</option>
                <option value="民事">民事</option>
                <option value="行政">行政</option>
                <option value="赔偿">赔偿</option>
                <option value="执行">执行</option>
              </select>
            </div>
            <div class="form_item wb15 fl moreview" style="">
              <label>案件类型</label>
              <select class="form-control input-sm" id="form_sel_lx">
                <option value="">--请选择--</option>
                <option value="抗诉">抗诉</option>
                <option value="发回改判">发回改判</option>
                <option value="再审">再审</option>
                <option value="审理周期超过一年半以上">审理周期超过一年半以上</option>
                <option value="执行异议复议">执行异议复议</option>
              </select>
            </div>
            <div class="form_item wb15 fl moreview" style="">
              <label>质量等级</label>
              <select class="form-control input-sm" id="form_sel_level">
                <option value="">--请选择--</option>
                <option value="优秀">优秀</option>
                <option value="合格">合格</option>
                <option value="瑕疵">瑕疵</option>
                <option value="差错">差错</option>
              </select>
            </div>
            <div class="form_item wb20 fl moreview" style="padding-left: 60px;">
              <label>&nbsp;</label>
              <button id="btn_query" class="btn btn-primary btn-sm" type="button" style="margin-top: 30px;"><i class="fa fa-search"></i> 查询</button>
            </div>

            <%--<div class="form_item wb20 fl moreview">--%>
              <%--<label>排名依据</label>--%>
              <%--<select class="form-control input-sm">--%>
                <%--<option>总分</option>--%>
                <%--<option>审理程序</option>--%>
                <%--<option>事实证据与实体处理	</option>--%>
              <%--</select>--%>
            <%--</div>--%>

          </div>

          <div class="clearfix pd10">
            <table id="table5" class="table table-striped"></table>
            <div id="pager5"></div>
          </div>

        </div>
      </div>
    </div>
  </div>



  <script>
    var ggid;
    $(function () {

        ggid=$.getUrlParam("ggid");
        //#####此处根据用户所在机构加载所在机构及以下机构。
        $.ajax({
            type : 'POST',
            url : ahcourt.ctx + "/setting/organization/getlist.do",
            datatype : 'json',
            async : false,
            success : function(data) {
                zNodes = data;
            }
        });

        $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        $("#menuBtn").click(function() {
            showMenu();
            return false;
        });

        $.ajax({
            type : 'POST',
            url : ahcourt.ctx+"/static/checkdatabyggid.do",
            data:{
                type:1,
                ggid:ggid
            },
            datatype : 'json',
            success : function(data) {
                if(data&&data.data){
                    var html  = "";
                    for(var i  = 0 ;  i < data.data.length ; i ++){
                        html += "<tr><td>"+data.data[i].zzjgmc+"</td><td align='right'>"+data.data[i].c1+"</td><td align='right'>"+data.data[i].c2+"</td><td align='right'>"+data.data[i].c3+"</td><td align='right'>"+data.data[i].c4+"</td><td align='right'>"+data.data[i].c5+"</td><td align='right'>"+data.data[i].c6+"</td><td align='right'>"+data.data[i].c7+"</td><td align='right'>"+docal(data.data[i].c7,data.data[i].c6)+"%</td><td align='right'>"+data.data[i].c8+"</td><td align='right'>"+docal(data.data[i].c8,data.data[i].c6)+"%</td><td align='right'>"+data.data[i].c9+"</td><td align='right'>"+docal(data.data[i].c9,data.data[i].c6)+"%</td><td align='right'>"+data.data[i].c10+"</td><td align='right'>"+docal(data.data[i].c10,data.data[i].c6)+"%</td></tr>";
                    }
                    $("#tbody1").html(html);
                }
            }
        });

        $.ajax({
            type : 'POST',
            url : ahcourt.ctx+"/static/checkdatabyggid.do",
            data:{
                type:2,
                ggid:ggid
            },
            datatype : 'json',
            success : function(data) {
                if(data&&data.data){
                    var html  = "";
                    for(var i  = 0 ;  i < data.data.length ; i ++){
                        html += "<tr><td>"+data.data[i].zzjgmc+"</td><td align='right'>"+data.data[i].c1+"</td><td align='right'>"+data.data[i].c2+"</td><td align='right'>"+data.data[i].c3+"</td><td align='right'>"+data.data[i].c4+"</td><td align='right'>"+data.data[i].c5+"</td><td align='right'>"+data.data[i].c6+"</td><td align='right'>"+data.data[i].c7+"</td><td align='right'>"+docal(data.data[i].c7,data.data[i].c6)+"%</td><td align='right'>"+data.data[i].c8+"</td><td align='right'>"+docal(data.data[i].c8,data.data[i].c6)+"%</td><td align='right'>"+data.data[i].c9+"</td><td align='right'>"+docal(data.data[i].c9,data.data[i].c6)+"%</td><td align='right'>"+data.data[i].c10+"</td><td align='right'>"+docal(data.data[i].c10,data.data[i].c6)+"%</td></tr>";
                    }
                    $("#tbody2").html(html);
                }
            }
        });

        $.ajax({
            type : 'POST',
            url : ahcourt.ctx+"/static/quality.do",
            data:{
                ggid:ggid
            },
            datatype : 'json',
            success : function(data) {
                if(data&&data.data){
                    var html  = "";
                    for(var i  = 0 ;  i < data.data.length ; i ++){
                        html += "<tr><td>"+(i+1)+"</td><td>"+data.data[i].psnr+"</td><td>"+data.data[i].pfbz+"</td><td>"+data.data[i].fz+"</td><td>"+data.data[i].ljkf+"</td><td>"+data.data[i].kfaj+"</td><td>"+data.data[i].pjkf+"</td></tr>";
                    }
                    $("#tbody4").html(html);
                }
            }
        });

        $("#table1").jqGrid({
            url : ahcourt.ctx + '/static/checkpros.do',
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

        $("#table5").jqGrid({
            url : ahcourt.ctx + "/case/checkcases.do",
            postData:{ggid:ggid},
            datatype : "json",
            mtype : "post",
            height : $('body').height()-200,
            width : $('body').width()-22,
            rownumbers : true,
            shrinkToFit : true,
            rowNum : 1000000,
            colModel : [ {
                label : '案号',
                name : 'ah',
                frozen : true,
                width : 100
            },{
                label : '归属法院',
                name : 'gsfy',
                frozen : true,
                width : 150
            },{
                label : '承办部门',
                name : 'cbbm',
                frozen : true,
                width : 100
            },{
                label : '承办人',
                name : 'cbr',
                frozen : true,
                width : 80
            },{
                label : '案件性质',
                name : 'xz',
                frozen : true,
                width : 100
            },{
                label : '案件类型',
                name : 'lx',
                frozen : true,
                width : 100
            },{
                label : '评查组长',
                name : 'teamleadername',
                frozen : true,
                width : 80
            },{
                label : '评查组员',
                name : 'teammatenames',
                frozen : true,
                width : 150
            },{
                label : '得分',
                name : 'zzpcdf',
                frozen : true,
                width : 80
            },{
                label : '质量等级',
                name : 'zzzldj',
                frozen : true,
                width : 80
            }
            ],
            pager:"#pager5"
            ,viewrecords: true
        });
        
        $("#btn_query").click(function () {
//            var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
//            var node = treeObj.getSelectedNodes()[0];
            $("#table5").jqGrid().setGridParam({
                url : ahcourt.ctx + "/case/checkcases.do",
                page : 1,
                postData:{
                    ggid:ggid,
                    gsfy:$('#citySel').val(),
                    xz:$("#form_sel_xz").val(),
                    lx:$("#form_sel_lx").val(),
                    zzzldj:$("#form_sel_level").val()
                }
            }).trigger("reloadGrid");
        });

    });

    // 选择组织机构
    var setting = {
        view : {
            dblClickExpand : false
        },
        data : {
            simpleData : {
                enable : true
            }
        },
        callback : {
            onClick : onClick
        }
    };
    function onClick(e, treeId, treeNode) {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo"), nodes = zTree.getSelectedNodes(), v = "", zzid = "";
        nodes.sort(function compare(a, b) {
            return a.id - b.id;
        });
        v += nodes[0].name;
        zzid = nodes[0].id;
        if (v.length > 0)
            v = v.substring(0, v.length);
        var cityObj = $("#citySel");
        cityObj.val(v);
        $("#zzid").val(zzid);
        cityObj.removeClass("border-red");
        hideMenu();
    }
    function showMenu() {
        $("#menuContent").slideDown("fast");
        $("body").bind("mousedown", onBodyDown);
    }
    function hideMenu() {
        $("#menuContent").fadeOut("fast");
        $("body").unbind("mousedown", onBodyDown);
    }
    function onBodyDown(event) {
        if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length > 0)) {
            hideMenu();
        }
    }

    function formatter_grid1_opt_1(cellvalue, options, rowObject) {
        return '<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="专家介绍"><i class="fa fa-info-circle"></i></button>';
    }
    function docal(c1,c2) {
        if(c2>0){
            return (c1/c2).toFixed(2);
        }else{
            return "0.00";
        }
    }
    $('#btn_clearorgs').click(function(){
        $('#citySel').val("");
        $("#zzid").val("");
//        $('#chx_sfbhxjfy').iCheck('uncheck');
    });
  </script>
  </body>
</html>
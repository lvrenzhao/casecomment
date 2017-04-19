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
<div id="search_box1" class="form_center clearfix">
  <div class="form_item wb25 fl">
    <label>公告标题</label>
    <input type="text" id="khmc" class="form-control input-sm" placeholder="请输入公告标题" maxlength="255" />
  </div>
  <div class="form_item wb15 fl">
    <label>案号</label>
    <input type="text" id="khmc" class="form-control input-sm" placeholder="" maxlength="255" />
  </div>
  <div class="form_item wb15 fl">
    <label>归属法院</label>
    <input type="text" id="khmc" class="form-control input-sm" placeholder="" maxlength="255" />
  </div>
  <div class="form_item wb15 fl">
    <label>承办部门</label>
    <input type="text" id="khmc" class="form-control input-sm" placeholder="" maxlength="255" />
  </div>
  <div class="form_item wb15 fl">
    <label>承办人</label>
    <input type="text" id="khmc" class="form-control input-sm" placeholder="" maxlength="255" />
  </div>
  <div class="form_item wb15 fl">
    <label>评查类型</label>
    <select class="form-control input-sm">
      <option value="">--请选择--</option>
      <option value="">待审核</option>
    </select>
  </div>

  <div class="form_item wb15 fl">
    <label>案件类型</label>
    <select class="form-control input-sm">
      <option value="">--请选择--</option>
      <option value="">民事</option>
    </select>
  </div>
  <div class="form_item wb15 fl">
    <label>案由</label>
    <input type="text" id="khmc" class="form-control input-sm" placeholder="" maxlength="255" />
  </div>

  <div class="form_item wb15 fl">
    <label>案由</label>
    <input type="text" id="khmc" class="form-control input-sm" placeholder="" maxlength="255" />
  </div>

  <div class="form_item wb30 fl">
    <label>发布日期</label>
    <div>
      <input type="text" id="" class="form-control input-sm wb45 fl" placeholder="" maxlength="255" />
      <span style="display: inline-block;float: left;padding: 5px 10px 0px 10px;">~</span>
      <input type="text" id="" class="form-control input-sm wb45 fl" placeholder="" maxlength="255" />
    </div>

  </div>

  <div class="form_item wb15 fl">
    <label>评查专家</label>
    <input type="text" id="khmc" class="form-control input-sm" placeholder="" maxlength="255" />
  </div>

  <div class="form_item wb10 fl">
    <button id="" class="btn btn-primary btn-sm pull-right" type="button" style="margin-top: 30px;"><i class="fa fa-search"></i> 查询</button>
  </div>
</div>

<div class="clearfix pd10">
  <table id="table1" class="table table-striped"></table>
  <div id="pager1"></div>
</div>
<script>
    $(function(){

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
                label : '承办部门',
                name : 'htmc',
                width : 100
            }, {
                label : '承办人',
                name : 'xmlxmc',
                width : 80
            }, {
                label : '案件类型',
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
            }, {
                label : '评查专家',
                name : 'pszj',
                width : 80
            }
                ,{label : '评查时间',name : 'pcsj',width : 80}
                ,{label : '质量等级',name : 'yqgq',width : 80}
            ],
            pager:"#pager1"
            ,viewrecords: true
        });
    });
    function gridWidth() {
        return $('body').width() - 22;
    }
    function gridHeight() {
        return $('body').height() -230;
    }

    function formatter_grid1_opt_1(cellvalue, options, rowObject) {
        return '<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="openDetails()" title="评查信息"><i class="fa fa-info-circle"></i> 评查信息</button>';
    }
    function openDetails(){
        layer.open({
            type : 2,
            shift : 5,
            title : '评查信息',
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
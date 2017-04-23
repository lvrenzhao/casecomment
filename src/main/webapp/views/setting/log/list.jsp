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
    <label>操作菜单</label>
    <input type="text" id="khmc" class="form-control input-sm" placeholder="" maxlength="255" />
  </div>
  <div class="form_item wb15 fl">
    <label>操作人</label>
    <input type="text" id="khmc" class="form-control input-sm" placeholder="" maxlength="255" />
  </div>
  <div class="form_item wb15 fl">
    <label>操作类型</label>
    <select class="form-control input-sm">
      <option value="">--请选择--</option>
      <option value="">删除</option>
      <option value="">增加</option>
      <option value="">修改</option>
    </select>
  </div>
  <div class="form_item wb35 fl">
    <label>操作日期</label>
    <div>
      <input type="text" id="" class="form-control input-sm wb45 fl" placeholder="" maxlength="255" />
      <span style="display: inline-block;float: left;padding: 5px 10px 0px 10px;">~</span>
      <input type="text" id="" class="form-control input-sm wb45 fl" placeholder="" maxlength="255" />
    </div>

  </div>
  <div class="form_item wb10 fl">
    <button id="" class="btn btn-primary btn-sm" type="button" style="margin-top: 30px;"><i class="fa fa-search"></i> 查询</button>
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
            height : gridHeight()-65,
            width : gridWidth(),
            rownumbers : true,
            shrinkToFit : true,
            rowNum : 20,
            rowList : [ 10, 20, 30 ],
            colModel : [ {
                label : 'ggid',
                name : 'ggid',
                hidden : true,
                key : true
            },{
                label : '操作菜单',
                name : 'ggbt',
                width : 150
            }, {
                label : '操作人',
                name : 'ggzt',
                align : 'center',
                width : 80
            }, {
                label : '操作类型',
                name : 'pclx',
                align : 'center',
                width : 80
            }, {
                label : '操作日期',
                name : 'fbsj',
                width : 100
            },{
                label : '详细情况',
                name : 'fbsj',
                width : 300
            }],
            pager : '#pager1'
            ,viewrecords: true
        });
    })

    function gridWidth() {
        return $('body').width() - 22;
    }
    function gridHeight() {
        return $('body').height() -100;
    }
</script>
</body>
</html>
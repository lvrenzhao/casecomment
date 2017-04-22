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
<div class="clearfix pd10">
  <table id="table1" class="table table-striped"></table>
  <div id="pager1"></div>
</div>
<script type="text/javascript">
    $(function(){

        $("#table1").jqGrid({
            url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
            datatype : "json",
            mtype : "post",
            height : gridHeight(),
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
                label : '操作',
                name : 'ggid',
                width : 50,
                align : 'center',
                sortable : false,
                formatter : formatter_grid1_opts
            }, {
                label : '公告标题',
                name : 'ggbt',
                width : 300
            }, {
                label : '状态',
                name : 'ggzt',
                align : 'center',
                width : 100
            }, {
                label : '评选类型',
                name : 'pclx',
                align : 'center',
                width : 100
            }, {
                label : '发起人',
                name : 'lxrmc',
                width : 100
            }, {
                label : '发布时间',
                name : 'fbsj',
                width : 100
            }, {
                label : '上传截止日期',
                name : 'fbsj',
                width : 100
            } ],
            pager : '#pager1'
            ,viewrecords: true

        });

    })


    function formatter_grid1_opts(cellvalue, options, rowObject) {
        return '<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="addcase()" title="办理"><i class="fa fa-hand-grab-o"></i> 办理</button>';
    }

    function gridWidth() {
        return $('body').width() - 22;
    }
    function gridHeight() {
        return $('body').height() -135;
    }

    function addcase(){
        layer.open({
            type : 2,
            shift : 5,
            title : "处理三精评选公告",
            shadeClose : false,
            shade : 0.3,
            area : [ '95%', '90%' ],
            content : ahcourt.ctx + '/casechosen/notice/addcase.do',
            cancel : function(index) {
                layer.close(index);
            }
        });
    }

</script>
</body>
</html>
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
<body style="overflow: hidden">

<div style="height: 100%;">
    <div class="bmbox_layout  clearfix">
        <div class="bmbox_title">
            <h5><i class="fa fa-bullhorn"></i> 未阅读的系统信息</h5>
            <div class="bmbox_tool">
                <button class="btn btn-white btn-sm btn-smx" type="button"><i class="fa fa-refresh"></i></button>
            </div>
        </div>
        <div class="bmbox_content clearfix fullbox">
            <div class="clearfix pd10">
                <table id="table1" class="table table-striped"></table>
                <div id="pager1"></div>
            </div>
        </div>
    </div>
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
                label : '操作',
                name : 'ggid',
                width : 80,
                align : 'center',
                sortable : false,
                formatter : formatter_grid2_opts
            }, {
                label : '公告标题',
                name : 'ggbt',
                width : 300
            }, {
                label : '信息类型',
                name : 'pclx',
                align : 'center',
                width : 100
            }, {
                label : '发布人',
                name : 'lxrmc',
                width : 100
            }, {
                label : '发布时间',
                name : 'fbsj',
                width : 100
            }],
            pager : '#pager1'
            ,viewrecords: true
        });
    })

    function formatter_grid2_opts(cellvalue, options, rowObject) {
        return '<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="verify(1,\'' + rowObject.ggid + '\')" title="查看公告详细"><i class="fa fa-info-circle"></i> 详细</button>';
    }

    function gridWidth() {
        return $('body').width() - 22;
    }
    function gridHeight() {
        return $('body').height() -70;
    }

    function verify(mode,ggid) {
//        layer.open({
//            type : 2,
//            shift : 5,
//            title : mode==1?"查看":"审核",
//            shadeClose : false,
//            shade : 0.3,
//            area : [ '95%', '90%' ],
//            content : ahcourt.ctx + '/publish/input.do?mode='+mode+'&ggid=' + ggid,
//            cancel : function(index) {
//                layer.close(index);
//            }
//        });
    }
</script>
</body>
</html>
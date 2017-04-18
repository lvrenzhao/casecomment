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
<script>
    $(function () {
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
                width : 100,
                align : 'center',
                sortable : false,
                formatter : formatoption1
            }, {
                label : '公告标题',
                name : 'ggbt',
                width : 300
            },{
                label : '评查类型',
                name : 'pclx',
                align : 'center',
                width : 100
            },{
                label : '本次被评查案件数',
                name : 'bcbpcajs',
                align : 'right',
                width : 100
            }, {
                label : '发起人',
                name : 'lxrmc',
                width : 100
            }, {
                label : '发布时间',
                name : 'fbsj',
                width : 100
            } ],
            pager : '#pager1',
            subGrid : true,
            subGridRowExpanded : initChildGrid1,
            subGridOptions : {
                "plusicon" : "fa fa-plus",
                "minusicon" : "fa fa-minus",
                "expandOnLoad" : false
            }
        });
    });
    function formatoption1(cellvalue, options, rowObject) {
        return '<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="提交评查"><i class="fa fa-check"></i> 提交评查</button>';
    }
    function formatoption2(cellvalue, options, rowObject) {
        return '<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="upload(\'' + rowObject.ggid + '\')" title="上传案件资料"><i class="fa fa-upload"></i> 上传资料</button>';
    }
    function gridWidth() {
        return $('body').width() - 22;
    }
    function gridHeight() {
        return $('body').height() -95;
    }

    function upload(ggid) {
        layer.open({
            type : 2,
            shift : 5,
            title : '上传文件',
            shadeClose : false,
            shade : 0.3,
            area : [ '60%', '80%' ],
            content : ahcourt.ctx + '/casecheck/notice/upload.do?ggid=' + ggid,
            cancel : function(index) {
                layer.close(index);
            }
        });
    }

    function initChildGrid1(parentRowID, parentRowKey) {
        var tabid = parentRowID + "_table";
        $('#' + parentRowID).append('<table id="' + tabid + '"></table>');
        $("#" + tabid).jqGrid({
            postData : {
                "ggid" : parentRowKey
            },
            url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
            datatype : "json",
            mtype : "post",
            height : 200,
            width : gridWidth() - 100,
            rownumbers : true,
            shrinkToFit : true,
            rowNum : 1000000,
            colModel : [ {
                label : 'ajid',
                name : 'ajid',
                hidden : true,
                key : true
            }, {
                label : 'ggid',
                name : 'ggid',
                hidden : true,
            },{
                label : '操作',
                name : 'ggid',
                width : 100,
                align : 'center',
                sortable : false,
                formatter : formatoption2
            },{
                label : '案号',
                name : 'xmmc',
                frozen : true,
                width : 150
            }, {
                label : '已上传文件数',
                name : 'xmzt',
                width : 100
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
                width : 150
            }, {
                label : '结案方式',
                name : 'xmjlmc',
                width : 80
            }, {
                label : '结案时间',
                name : 'xmcymc',
                width : 80
            } ]
        })
    }
</script>
</body>
</html>
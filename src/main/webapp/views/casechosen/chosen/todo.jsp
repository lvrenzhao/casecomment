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
<div class="alert alert-warning" role="alert">填写完【寄语】后才视为完成一次评选活动。</div>
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
                label : '操作',
                name : 'ggid',
                width : 80,
                align : 'center',
                sortable : false,
                formatter : formatoption1
            }, {
                label : '公告标题',
                name : 'ggbt',
                width : 300
            },{
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
                label : '我分配到的案件',
                name : 'wjpc',
                width : 100
            }, {
                label : '我已评选的案件',
                name : 'wjpc',
                width : 100
            }],
            pager : '#pager1'
            ,viewrecords: true
            ,subGrid : true,
            subGridRowExpanded : initChildGrid1,
            subGridOptions : {
                "plusicon" : "fa fa-plus",
                "minusicon" : "fa fa-minus",
                "expandOnLoad" : false
            }
        });
    })

    function formatoption1(cellvalue, options, rowObject) {
        return '<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="javascript:layer.msg(\'请评审完所有案件后再填写寄语\')" title="寄语"><i class="fa fa-commenting"></i> 寄语</button>';
    }

    function gridWidth() {
        return $('body').width() - 22;
    }
    function gridHeight() {
        return $('body').height() -75;
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
                width : 80,
                align : 'center',
                sortable : false,
                formatter : formatoption2
            },{
                label : '案号',
                name : 'xmmc',
                frozen : true,
                width : 150
            },{
                label : '状态',
                name : 'xmmc',
                frozen : true,
                width : 80
            }, {
                label : '归属法院',
                name : 'gsfy',
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

    function formatoption2(cellvalue, options, rowObject) {
        return '<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="check(\'' + 1 + '\')" title="评选"><i class="fa fa-thumbs-o-up"></i> 评选</button>';
    }

    function check(ajid) {
        layer.open({
            type : 2,
            shift : 5,
            title : '三精评选',
            shadeClose : false,
            shade : 0.3,
            area : [ '90%', '90%' ],
            content : ahcourt.ctx + '/casechosen/chosen/chosen.do?ajid=' + ajid,
            cancel : function(index) {
                layer.close(index);
            }
        });
    }

</script>
</body>
</html>


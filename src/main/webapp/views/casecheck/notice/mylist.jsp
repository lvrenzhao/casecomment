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
            <label>状态</label>
            <select class="form-control input-sm">
                <option value="">--请选择--</option>
                <option value="">待审核</option>
            </select>
        </div>
        <div class="form_item wb15 fl">
            <label>评查类型</label>
            <select class="form-control input-sm">
                <option value="">--请选择--</option>
                <option value="">常规评查</option>
            </select>
        </div>
        <div class="form_item wb35 fl">
            <label>发布日期</label>
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
                label : '操作',
                name : 'ggid',
                width : 80,
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
                label : '评查类型',
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
                label : '审核人',
                name : 'shr',
                width : 100
            } , {
                label : '审核时间',
                name : 'shsj',
                width : 100
            }, {
                label : '审核意见',
                name : 'shyj',
                width : 200,
                formatter:formatter_grid1_shyj
            }],
            pager : '#pager1'
        });
    })

    function formatter_grid1_shyj(cellvalue, options, rowObject) {
        return '<a href="javascript:void(0)">...</a>';
    }
    function formatter_grid1_opts(cellvalue, options, rowObject) {
        return '<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="openCases(1,\'' + rowObject.ggid + '\')" title="查看公告详细"><i class="fa fa-info-circle"></i> 详细</button>';
    }

    function openCases(mode,ggid) {
        layer.open({
            type : 2,
            shift : 5,
            title : mode==1?"查看案件详细列表":"审核评查公告",
            shadeClose : false,
            shade : 0.3,
            area : [ '95%', '90%' ],
            content : ahcourt.ctx + '/casecheck/notice/caselist.do?mode='+mode+'&ggid=' + ggid,
            cancel : function(index) {
                layer.close(index);
            }
        });
    }
    function gridWidth() {
        return $('body').width() - 22;
    }
    function gridHeight() {
        return $('body').height() -95;
    }

</script>
</body>
</html>


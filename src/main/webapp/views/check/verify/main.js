

//============================================================
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
            label : '评查类型',
            name : 'pclx',
            align : 'center',
            width : 100
        }, {
            label : '评查任务',
            name : 'pclx',
            align : 'center',
            width : 100
        },{
            label : '发起人',
            name : 'lxrmc',
            width : 100
        }, {
            label : '发布时间',
            name : 'fbsj',
            width : 100
        } ],
        pager : '#pager1'
        ,viewrecords: true

    });

    $("#table2").jqGrid({
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
            label : '评查任务',
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
            formatter:formatter_grid2_shyj
        }],
        pager : '#pager2'
        ,viewrecords: true
    });


});


function formatter_grid1_opts(cellvalue, options, rowObject) {
    return '<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="openCases(2,\'' + rowObject.ggid + '\')" title="审核"><i class="fa fa-eye"></i> 审核</button>';
}

function formatter_grid2_opts(cellvalue, options, rowObject) {
    return '<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="openCases(1,\'' + rowObject.ggid + '\')" title="查看公告详细"><i class="fa fa-info-circle"></i> 详细</button>';
}

function formatter_grid2_shyj(cellvalue, options, rowObject) {
    return '<a href="javascript:void(0)">...</a>';
}
function gridWidth() {
    return $('body').width() - 22;
}
function gridHeight() {
    return $('body').height() -135;
}

function openCases(mode,ggid) {
    layer.open({
        type : 2,
        shift : 5,
        title : mode==1?"查看案件详细列表":"审核评查公告",
        shadeClose : false,
        shade : 0.3,
        area : [ '95%', '90%' ],
        content : ahcourt.ctx + '/casecheck/notice/caselist.do?ggid=' + ggid,
        cancel : function(index) {
            layer.close(index);
        }
    });
}


//============================================================
$(function(){

    $("#table1").jqGrid({
        url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
        datatype : "json",
        mtype : "post",
        height : $('body').height() -135,
        width : $('body').width() - 22,
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
            formatter : function(cellvalue, options, rowObject) {
                return '<button class="btn btn-link btn-xs " type="button" onclick="viewOrVerifyNotice(1,\'' + rowObject.ggid + '\')" title="审核"><i class="fa fa-eye"></i> 审核 </button>';
            }
        }, {
            label : '公告标题',
            name : 'ggbt',
            width : 300
        },
            {
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
        } ],
        pager : '#pager1'
        ,viewrecords: true

    });

    $("#table2").jqGrid({
        url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
        datatype : "json",
        mtype : "post",
        height : $('body').height() -135 -65,
        width : $('body').width() - 22,
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
            width : 260,
            align : 'center',
            sortable : false,
            formatter : function(cellvalue, options, rowObject) {
                return '<button class="btn btn-link btn-xs " type="button" onclick="viewOrVerifyNotice(2,\'' + rowObject.ggid + '\')" title="查看公告详细"><i class="fa fa-info-circle"></i> 查看公告 </button>'
                     + '<button class="btn btn-link btn-xs " type="button" onclick="viewCases(2,\'' + rowObject.ggid + '\')"><i class="fa fa-reddit"></i> 评选详情 </button>'
            }
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
            width : 120
        }, {
            label : '审核人',
            name : 'shr',
            width : 100
        } , {
            label : '审核时间',
            name : 'shsj',
            width : 120
        }, {
            label : '审核意见',
            name : 'shyj',
            width : 200,
            formatter:function(cellvalue, options, rowObject) {
                return '<a href="javascript:void(0)">...</a>';
            }
        }],
        pager : '#pager2'
        ,viewrecords: true
    });


});

function viewOrVerifyNotice(mode,ggid) {
    layer.open({
        type : 2,
        shift : 5,
        title : mode==1?"审核案件评查公告":"查看审核评查公告",
        shadeClose : false,
        shade : 0.3,
        area : [ '95%', '90%' ],
        content : ahcourt.ctx + '/views/chosen/start/main.jsp?ggid=' + ggid+"&mode="+mode,
        cancel : function(index) {
            layer.close(index);
        }
    });
}

function viewCases(mode,ggid) {
    layer.open({
        type : 2,
        shift : 5,
        title : "评选详情",
        shadeClose : false,
        shade : 0.3,
        area : [ '95%', '90%' ],
        content : ahcourt.ctx + '/views/chosen/work/view_bypxid.jsp?ggid=' + ggid+"&mode="+mode,
        cancel : function(index) {
            layer.close(index);
        }
    });
}
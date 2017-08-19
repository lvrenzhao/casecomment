$(function () {
    //###这里进能显示未截止的评选活动公告
    $("#table1").jqGrid({
        url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
        datatype : "json",
        mtype : "post",
        height : $('body').height() -125,
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
            label : 'btys',
            name : 'btys',
            hidden : true
        },{
            label : '操作',
            name : 'ggid',
            width : 150,
            align : 'center',
            sortable : false,
            formatter : function(cellvalue, options, rowObject) {
                return '<button class="btn btn-link btn-xs " type="button" onclick="viewOrVerifyNotice(2,\'' + rowObject.ggid + '\')" title="查看公告详细"><i class="fa fa-info-circle"></i> 详细</button>'
                +      '<button class="btn btn-link btn-xs " type="button" onclick="joinCase(\'' + rowObject.ggid + '\')" title=""><i class="fa fa-random"></i> 分配</button>';
            }
        }, {
            label : '公告标题',
            name : 'ggbt',
            width : 300,
            formatter : function(cellvalue, options, rowObject) {
                var style = "";
                if(rowObject.btys == 2){
                    style = "color:red"
                }
                return '<span style="'+style+'">'+cellvalue+'</span>';
            }
        }, {
            label : '已填报案件数',
            name : 'pclx',
            align : 'center',
            width : 120,
            formatter : function(cellvalue, options, rowObject) {
                return '<a href="javascript:;" onclick="viewCases(1,\'' + rowObject.ggid + '\')">'+cellvalue+'</a>';
            }
        }, {
            label : '评选类型',
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
        }, {
            label : '截止时间',
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
        }],
        pager : '#pager1'
        ,viewrecords: true
    });

    $("#table2").jqGrid({
        url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
        datatype : "json",
        mtype : "post",
        height : $('body').height() -200,
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
            label : 'btys',
            name : 'btys',
            hidden : true
        },{
            label : '操作',
            name : 'ggid',
            width : 120,
            align : 'center',
            sortable : false,
            formatter : function(cellvalue, options, rowObject) {
                return '<button class="btn btn-link btn-xs " type="button" onclick="viewOrVerifyNotice(2,\'' + rowObject.ggid + '\')" title="查看公告详细"><i class="fa fa-info-circle"></i> 公告详细</button>';
                    //+      '<button class="btn btn-link btn-xs " type="button" onclick="joinCase(\'' + rowObject.ggid + '\')" title=""><i class="fa fa-random"></i> 查看分配</button>';
            }
        }, {
            label : '公告标题',
            name : 'ggbt',
            width : 300,
            formatter : function(cellvalue, options, rowObject) {
                var style = "";
                if(rowObject.btys == 2){
                    style = "color:red"
                }
                return '<span style="'+style+'">'+cellvalue+'</span>';
            }
        }, {
            label : '已填报案件数',
            name : 'pclx',
            align : 'center',
            width : 120,
            formatter : function(cellvalue, options, rowObject) {
                return '<a href="javascript:;" onclick="viewCases(1,\'' + rowObject.ggid + '\')">'+cellvalue+'</a>';
            }
        }, {
            label : '评选类型',
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
        }, {
            label : '截止时间',
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
        title : "查看已填报案件",
        shadeClose : false,
        shade : 0.3,
        area : [ '95%', '90%' ],
        content : ahcourt.ctx + '/views/chosen/work/view_bypxid.jsp?ggid=' + ggid+"&mode="+mode,
        cancel : function(index) {
            layer.close(index);
        }
    });
}

function joinCase(key) {
    layer.open({
        type : 2,
        shift : 5,
        title : "填报案例",
        shadeClose : false,
        shade : 0.3,
        area : [ '95%', '95%' ],
        content : ahcourt.ctx + '/views/chosen/distribute/dist.jsp?ggid=' + key,
        cancel : function(index) {
            layer.close(index);
        }
    });
}

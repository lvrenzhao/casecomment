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
            label : 'sfyd',
            name : 'sfyd',
            hidden : true
        },{
            label : '操作',
            name : 'ggid',
            width : 150,
            align : 'center',
            sortable : false,
            formatter : function(cellvalue, options, rowObject) {
                return '<button class="btn btn-link btn-xs " type="button" onclick="viewOrVerifyNotice(2,\'' + rowObject.ggid + '\')" title="查看公告详细"><i class="fa fa-info-circle"></i> 详细</button>'
                +      '<button class="btn btn-link btn-xs " type="button" onclick="joinCase(\'' + rowObject.ggid + '\')" title=""><i class="fa fa-edit"></i> 填报</button>';
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
                var remind = "";
                if(rowObject.sfyd == 2){
                    remind = "<span class='label label-primary'>未读</span>&nbsp;&nbsp;";
                }
                return remind + '<span style="'+style+'">'+cellvalue+'</span>';
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
        shrinkToFit : false,
        rowNum : 20,
        rowList : [ 10, 20, 30 ],
        colModel : [ {
            label : 'id',
            name : 'id',
            hidden : true,
            key : true
        },{
            label : '案号',
            name : 'pclx',
            width : 120
        }, {
            label : '所属评选公告',
            name : 'pclx',
            width : 200
        },{
            label : '评选类型',
            name : 'pclx',
            width : 100
        },{
            label : '是否被评选',
            name : 'shsj',
            width : 100
        }, {
            label : '评选得分',
            name : 'shsj',
            width : 100
        }, {
            label : '未评选原因',
            name : 'shsj',
            width : 100,
            formatter:function (cellvalue,options,rowObject) {
                return '<a href="javascript:;" onclick="ViewComment(\'' + rowObject.ggid + '\')">'+cellvalue+'</a>'
            }
        },{
            label : '评选时间',
            name : '',
            width : 100
        },{
            label : '填报日期',
            name : 'fbsj',
            width : 100
        }, {
            label : '推荐理由',
            name : 'shr',
            width : 300,
            formatter:function (cellvalue,options,rowObject) {
                return '<a href="javascript:;" onclick="ViewComment(\'' + rowObject.ggid + '\')">'+cellvalue+'</a>'
            }
        } ,{
            label : '归属法院',
            name : 'lxrmc',
            width : 100
        }, {
            label : '承办部门',
            name : 'fbsj',
            width : 100
        }, {
            label : '承办人',
            name : 'fbsj',
            width : 100
        }, {
            label : '性质',
            name : 'zylbmc',
            width : 80
        },  {
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
        content : ahcourt.ctx + '/views/chosen/start/view_bypxid.jsp?ggid=' + ggid+"&mode="+mode,
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
        area : [ '600px', '420px' ],
        content : ahcourt.ctx + '/views/chosen/join/add_case.jsp?ggid=' + key,
        cancel : function(index) {
            layer.close(index);
        }
    });
}

function ViewComment(content) {
    layer.open({
        type : 1,
        shift : 5,
        title : "查看推荐理由",
        shadeClose : false,
        shade : 0.3,
        area : [ '400px', '280px' ],
        content : content,
        cancel : function(index) {
            layer.close(index);
        }
    });
}
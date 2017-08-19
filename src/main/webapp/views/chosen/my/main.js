$(function () {
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
            key : true,
            frozen:true
        },{
            label : '操作',
            name : 'ggid',
            width : 180,
            align : 'center',
            sortable : false,
            formatter : function(cellvalue, options, rowObject) {
                return '<button class="btn btn-link btn-xs " type="button" onclick="comment(2,\'' + cellvalue + '\')" title="点评"><i class="fa fa-info"></i> 评选详情</button>'
                    +      '<button class="btn btn-link btn-xs " type="button" onclick="check(3,\'' + cellvalue + '\')" title="评查"><i class="fa fa-dedent"></i> 案件资料</button>';
            },
            frozen:true
        },{
            label : '案号',
            name : 'pclx',
            width : 120,
            frozen:true
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
            name : 'lxrmc',
            width : 100
        },{
            label : '评选组长',
            name : 'xmcymc',
            width : 80
        },{
            label : '评选组员',
            name : 'xmcymc',
            width : 200
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
        } , {
            label : '所属评选公告',
            name : 'pclx',
            width : 200
        }, {
            label : '发布人',
            name : 'pclx',
            width : 100
        }, {
            label : '发布日期',
            name : 'pclx',
            width : 100
        }, {
            label : '评选类型',
            name : 'pclx',
            width : 100
        },{
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
    }).jqGrid('setFrozenColumns');
});


function ViewComment(content) {
    layer.open({
        type : 1,
        shift : 5,
        title : "查看详细",
        shadeClose : false,
        shade : 0.3,
        area : [ '400px', '280px' ],
        content : content,
        cancel : function(index) {
            layer.close(index);
        }
    });
}

function check(mode,ajid) {
    layer.open({
        type : 2,
        shift : 5,
        title : '案件资料',
        shadeClose : false,
        shade : 0.3,
        area : [ '90%', '90%' ],
        content : ahcourt.ctx + '/views/check/work/check.jsp?ajid=' + ajid+"&mode="+mode,
        cancel : function(index) {
            layer.close(index);
        }
    });
}

function comment(mode,ajid) {
    layer.open({
        type : 2,
        shift : 5,
        title : mode==1?'案件点评':"查看案件评查详情",
        shadeClose : false,
        shade : 0.3,
        area : [ '90%', '90%' ],
        content : ahcourt.ctx + '/views/check/work/comment.jsp?ajid=' + ajid+"&mode="+mode,
        cancel : function(index) {
            layer.close(index);
        }
    });
}

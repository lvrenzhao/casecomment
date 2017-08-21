

//============================================================
$(function () {
    loadGrid();
});

function loadGrid() {
    $("#table1").jqGrid({
        url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
        datatype : "json",
        mtype : "post",
        height : $('body').height() -190,
        width : $('body').width() - 10,
        rownumbers : true,
        shrinkToFit : false,
        rowNum : 20,
        rowList : [ 10, 20, 30 ],
        colModel : [ {
            label : 'ajid',
            name : 'ajid',
            hidden : true,
            key : true,
            frozen:true
        }, {
            label : 'ggid',
            name : 'ggid',
            hidden : true,
            frozen:true
        },{
            label : '操作',
            name : 'ggid',
            width : 180,
            align : 'center',
            sortable : false,
            formatter : function(cellvalue, options, rowObject) {
                return '<button class="btn btn-link btn-xs " type="button" onclick="comment(2,\'' + cellvalue + '\')" title="点评"><i class="fa fa-info"></i> 评查详情</button>'
                    +      '<button class="btn btn-link btn-xs " type="button" onclick="check(3,\'' + cellvalue + '\')" title="评查"><i class="fa fa-dedent"></i> 案件资料</button>';
            },
            frozen:true
        },{
            label : '案号',
            name : 'xmmc',
            frozen : true,
            sortable:false,
            width : 150
        },{
            label : '所属评查公告',
            name : '',
            sortable:false,
            width : 200
        },{
            label : '评查分数',
            name : '',
            sortable:false,
            width : 100
        },{
            label : '质量等级',
            name : '',
            sortable:false,
            width : 100
        },{
            label : '评查时间',
            name : '',
            sortable:false,
            width : 100
        },{
            label : '评查组长',
            name : 'xmcymc',
            sortable:false,
            width : 80
        },{
            label : '评查组员',
            name : 'xmcymc',
            sortable:false,
            width : 200
        }, {
            label : '公告发布人',
            name : 'pclx',
            sortable:false,
            width : 100
        }, {
            label : '发布日期',
            name : 'pclx',
            sortable:false,
            width : 100
        }, {
            label : '评查类型',
            name : 'pclx',
            sortable:false,
            width : 100
        },{
            label : '评查任务',
            name : 'pclx',
            sortable:false,
            width : 100
        },{
            label : '归属法院',
            name : 'gsfy',
            sortable:false,
            width : 100
        }, {
            label : '承办部门',
            name : 'htmc',
            sortable:false,
            width : 100
        }, {
            label : '承办人',
            name : 'xmlxmc',
            sortable:false,
            width : 80
        }, {
            label : '性质',
            name : 'zylbmc',
            sortable:false,
            width : 80
        },{
            label : '类型',
            name : 'zylbmc',
            sortable:false,
            width : 80
        },  {
            label : '案由',
            name : 'xmfzrmc',
            sortable:false,
            width : 150
        }, {
            label : '结案方式',
            name : 'xmjlmc',
            sortable:false,
            width : 80
        }, {
            label : '结案时间',
            name : 'xmcymc',
            sortable:false,
            width : 80
        }],
        pager : '#pager1'
        ,viewrecords: true
    }).jqGrid('setFrozenColumns');
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

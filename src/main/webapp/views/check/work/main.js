

//============================================================
$(function () {
    loadUnCheckGrid();
    loadCheckedGrid();
});


function loadUnCheckGrid() {
    $("#table1").jqGrid({
        url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
        datatype : "json",
        mtype : "post",
        height : $('body').height() -125,
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
            width : 80,
            align : 'center',
            sortable : false,
            formatter : function(cellvalue, options, rowObject) {
                if(rowObject.zt == 1){
                    return '<button class="btn btn-link btn-xs " type="button" onclick="check(1,\'' + cellvalue + '\')" title="评查"><i class="fa fa-balance-scale"></i> 评查</button>';
                }else if(rowObject.zt == 2 ){
                    return '<button class="btn btn-link btn-xs " type="button" onclick="comment(1,\'' + cellvalue + '\')" title="总结"><i class="fa fa-commenting-o"></i> 点评</button>';
                }
                return '';
            },
            frozen:true
        },{
            label : '案号',
            name : 'xmmc',
            frozen : true,
            width : 150,
            frozen:true
        }, {
            label : '所属评查公告',
            name : '',
            width : 200
        },{
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
            label : '性质',
            name : 'zylbmc',
            width : 80
        },{
            label : '类型',
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
        },{
            label : '评查组长',
            name : 'xmcymc',
            width : 80
        },{
            label : '评查组员',
            name : 'xmcymc',
            width : 200
        }],
        pager : '#pager1'
        ,viewrecords: true
    }).jqGrid('setFrozenColumns');;
}

function loadCheckedGrid() {
    $("#table2").jqGrid({
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
            width : 150,
            frozen:true
        }, {
            label : '所属评查公告',
            name : '',
            width : 200
        },{
            label : '评查分数',
            name : '',
            width : 100
        },{
            label : '质量等级',
            name : '',
            width : 100
        },{
            label : '评查时间',
            name : '',
            width : 100
        },{
            label : '评查组长',
            name : 'xmcymc',
            width : 80
        },{
            label : '评查组员',
            name : 'xmcymc',
            width : 200
        },{
            label : '归属法院',
            name : 'gsfy',
            width : 200
        }, {
            label : '承办部门',
            name : 'htmc',
            width : 100
        }, {
            label : '承办人',
            name : 'xmlxmc',
            width : 80
        }, {
            label : '性质',
            name : 'zylbmc',
            width : 80
        },{
            label : '类型',
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
    });//.jqGrid('setFrozenColumns');;
}

function check(mode,ajid) {
    layer.open({
        type : 2,
        shift : 5,
        title : '案件评查',
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

var URL_TABLE1 = ahcourt.ctx + "/case/checkcases.do";
var ggid;
$(function () {
    ggid = $.getUrlParam("ggid");
    loadCheckedGrid();
});

function loadCheckedGrid() {
    $("#table1").jqGrid({
        url : URL_TABLE1,
        postData:{ggid:ggid},
        datatype : "json",
        mtype : "post",
        height : $('body').height() -125,
        width : $('body').width() - 10,
        rownumbers : true,
        shrinkToFit : false,
        rowNum : 20,
        rowList : [ 10, 20, 30 ],
        colModel : [
            {label : 'ccid',name : 'ccid',hidden : true, key : true,frozen:true},
            {label : 'checkid',name : 'checkid',hidden : true,frozen:true},
            {label : 'ajid',name : 'ajid',hidden : true,frozen:true},
            {label : '操作',name : 'fmt',width : 180,align : 'center',sortable : false,frozen:true,
                formatter : function(cellvalue, options, rowObject) {
                    return '<button class="btn btn-link btn-xs " type="button" onclick="comment(2,\'' + rowObject.ccid + '\')"><i class="fa fa-info"></i> 评查详情</button>'
                        +      '<button class="btn btn-link btn-xs " type="button" onclick="check(3,\'' + rowObject.ajid + '\')"><i class="fa fa-dedent"></i> 案件资料</button>';
                }
            },
            {label : '案号', name : 'ah',frozen : true, sortable : false, width : 150},
            {label : '评查分数',name : 'zzpcdf',sortable:false,width : 100},
            {label : '质量等级',name : 'zzzldj',sortable:false,width : 100},
            {label : '评查时间',name : 'dpsj',sortable:false,width : 100},
            {label : '评查组长',name : 'teamleadername',sortable:false,width : 80},
            {label : '评查组员', name : 'teammatenames',sortable:false,width : 200 },
            {label : '归属法院', name : 'gsfy',sortable:false,width : 100},
            {label : '承办部门',name : 'cbbm',sortable:false,width : 100},
            {label : '承办人',name : 'cbr',sortable:false,width : 80},
            {label : '性质',name : 'xz',sortable:false,width : 80 },
            {label : '类型',name : 'lx',sortable:false, width : 80},
            {label : '案由',name : 'ay',sortable:false,width : 150},
            {label : '结案方式',name : 'jafs',sortable:false,width : 80},
            {label : '结案时间', name : 'jasj',sortable:false, width : 80}
        ],
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

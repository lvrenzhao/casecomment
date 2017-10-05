
//todo 待办（关于数据范围）：（案件表简要点评为空且我是队长）或（案件表左关联records表，当评查状态为空或暂存）,公告状态为审核通过
//todo 待办（关于操作按钮）:简要点评为空，且我是组长 显示 点评，其他均显示评审

var URL_TABLE1 = ahcourt.ctx + "/case/worktodo.do";
var URL_TABLE2 = ahcourt.ctx + "/case/workdone.do";


//============================================================
$(function () {
    loadUnCheckGrid();
    loadCheckedGrid();
    $("#btn_query").click(function () {
        reloadCheckedGrid();
    });
});


function loadUnCheckGrid() {
    $("#table1").jqGrid({
        url : URL_TABLE1,
        datatype : "json",
        mtype : "post",
        height : $('body').height() -125,
        width : $('body').width() - 10,
        rownumbers : true,
        shrinkToFit : false,
        rowNum : 20,
        rowList : [ 10, 20, 30 ],
        colModel : [
            {label : 'remarks',name : 'remarks',hidden : true,key : true,frozen:true},
            {label : 'ccid',name : 'ccid',hidden : true, frozen:true},
            {label : 'ajid',name : 'ajid',hidden : true, frozen:true},
            {label : 'sfzz',name : 'sfzz',hidden : true, frozen:true},
            {label : 'jydp',name : 'jydp',hidden : true, frozen:true},
            {label : 'checkid',name : 'checkid',hidden : true, frozen:true},
            {label : '操作',name : 'fmt', width : 80, align : 'center',sortable : false,
                formatter : function(cellvalue, options, rowObject) {
                    if(rowObject.sfzz == "1" && rowObject.jydp && rowObject.jydp.length>0){
                        return '<button class="btn btn-link btn-xs " type="button" onclick="comment(1,\'' + rowObject.ccid + '\')" title="总结"><i class="fa fa-commenting-o"></i> 点评</button>';
                    }else{
                        return '<button class="btn btn-link btn-xs " type="button" onclick="check(1,\'' + rowObject.ccid + '\')" title="评查"><i class="fa fa-balance-scale"></i> 评查</button>';
                    }
                },
                frozen:true
            },
            {label : '案号',name : 'ah',frozen : true,sortable:false,width : 150},
            {label : '所属评查公告',name : 'bt', sortable:false,width : 200,formatter:function (cellvalue,options,rowObject) {
                return '<a href="javascript:;" onclick="openCases(5,\'' + rowObject.checkid + '\')">'+cellvalue+'</a>';
            }},
            {label : '评查组长',name : 'teamleadername',sortable:false,width : 80},
            {label : '评查组员',name : 'teammatenames',sortable:false,width : 200},
            {label : '归属法院',name : 'gsfy',sortable:false,width : 100},
            {label : '承办部门',name : 'cbbm',sortable:false,width : 100},
            {label : '承办人',name : 'cbr',sortable:false,width : 80},
            {label : '性质',name : 'xz',sortable:false,width : 80 },
            {label : '类型',name : 'lx',sortable:false,width : 80 },
            {label : '案由', name : 'ay',sortable:false,width : 150 },
            {label : '结案方式',name : 'jafs',sortable:false,width : 80},
            {label : '结案时间',name : 'jasj',sortable:false,width : 80}
        ],
        pager : '#pager1'
        ,viewrecords: true
    }).jqGrid('setFrozenColumns');
}

function loadCheckedGrid() {
    $("#table2").jqGrid({
        url : URL_TABLE2,
        datatype : "json",
        mtype : "post",
        height : $('body').height() -190,
        width : $('body').width() - 10,
        rownumbers : true,
        shrinkToFit : false,
        rowNum : 20,
        rowList : [ 10, 20, 30 ],
        colModel : [
            {label : 'remarks',name : 'remarks',hidden : true,key : true,frozen:true},
            {label : 'ccid',name : 'ccid',hidden : true, frozen:true},
            {label : 'ajid',name : 'ajid',hidden : true, frozen:true},
            {label : 'checkid',name : 'checkid',hidden : true, frozen:true},
            {label : '操作',name : 'fmt',width : 180,align : 'center',sortable : false,frozen:true,
                formatter : function(cellvalue, options, rowObject) {
                    return '<button class="btn btn-link btn-xs " type="button" onclick="comment(2,\'' + rowObject.ccid + '\')" title="点评"><i class="fa fa-info"></i> 评查详情</button>'
                    +      '<button class="btn btn-link btn-xs " type="button" onclick="check(3,\'' + rowObject.ccid + '\')" title="评查"><i class="fa fa-dedent"></i> 案件资料</button>';
                }
            },
            {label : '案号', name : 'ah',frozen : true,sortable:false,width : 150},
            {label : '所属评查公告',name : 'bt', sortable:false,width : 200,formatter:function (cellvalue,options,rowObject) {
                return '<a href="javascript:;" onclick="openCases(5,\'' + rowObject.checkid + '\')">'+cellvalue+'</a>';
            }},
            {label : '评查分数',name : 'zzpcdf',sortable:false,width : 100},
            {label : '质量等级',name : 'zzzldj',sortable:false,width : 100  },
            {label : '评查时间',name : 'dpsj',sortable:false,width : 100},
            {label : '评查组长',name : 'teamleadername',sortable:false, width : 80 },
            {label : '评查组员',name : 'teammatenames',sortable:false,width : 200},
            {label : '归属法院',name : 'gsfy',sortable:false,width : 200},
            {label : '承办部门',name : 'cbbm',sortable:false,width : 100},
            {label : '承办人',name : 'cbr',sortable:false,width : 80},
            {label : '性质', name : 'xz',sortable:false, width : 80},
            {label : '类型',name : 'lx',sortable:false, width : 80},
            {label : '案由', name : 'ay',sortable:false,width : 150},
            {label : '结案方式',name : 'jafs',sortable:false, width : 80},
            {label : '结案时间',name : 'jasj',sortable:false, width : 80 }
        ],
        pager : '#pager2'
        ,viewrecords: true
    });//.jqGrid('setFrozenColumns');;
}


function reloadUnCheckGrid() {
    $("#table1").jqGrid().setGridParam({
        url : URL_TABLE1,
        page : 1
    }).trigger("reloadGrid");
}

function reloadCheckedGrid() {
    $("#table2").jqGrid().setGridParam({
        url : URL_TABLE2,
        postData:{
            bt:$("#form_inp_bt").val(),
            pclx:$("#form_sel_pclx").val(),
            pcrw:$("#form_sel_pcrw").val(),
            fqsj1:$("#form_inp_fqsj1").val(),
            fqsj2:$("#form_inp_fqsj2").val()//,
            // fqrmc:$("#form_inp_fqrmc").val()
        },
        page : 1
    }).trigger("reloadGrid");
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
function openCases(mode,ggid) {
    layer.open({
        type : 2,
        shift : 5,
        title : mode==1?"审核案件评查公告":"查看审核评查公告",
        shadeClose : false,
        shade : 0.3,
        area : [ '95%', '90%' ],
        content : ahcourt.ctx + '/views/check/start/details.jsp?ggid=' + ggid+"&mode="+mode,
        cancel : function(index) {
            layer.close(index);
        }

    });
}
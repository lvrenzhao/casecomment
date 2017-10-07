var URL_TABLE1 =  ahcourt.ctx + "/chosen/mystart.do";

$(function () {
    $("#table1").jqGrid({
        url : URL_TABLE1,
        datatype : "json",
        mtype : "post",
        height : $('body').height() -200,
        width : $('body').width() - 22,
        rownumbers : true,
        shrinkToFit : false,
        rowNum : 20,
        rowList : [ 10, 20, 30 ],
        colModel : [
            {label : 'ccid',name : 'ccid',hidden : true, key : true,frozen:true},
            {label : 'chosenid',name : 'chosenid',hidden : true, frozen:true},
            {label : '操作',name : 'fmt',width : 180,align : 'center',sortable : false,
                formatter : function(cellvalue, options, rowObject) {
                    return '<button class="btn btn-link btn-xs " type="button" onclick="comment(2,\'' + rowObject.chosenid + '\')" title="点评"><i class="fa fa-info"></i> 评选结果</button>'
                        +      '<button class="btn btn-link btn-xs " type="button" onclick="check(3,\'' + rowObject.chosenid + '\')" title="评查"><i class="fa fa-dedent"></i> 案件资料</button>';
                },
                frozen:true
            },
            {label : '案号',name : 'ah',width : 120,sortable : false,frozen:true},
            {label : '所属评选公告',name : 'bt',sortable : false,width : 200},
            {label : '评选得分',name : 'zzpxdf',sortable : false,width : 100},
            {label : '评选时间',name : 'dpsj',sortable : false,width : 100},
            {label : '评选组长', name : 'teamleadername', sortable : false,width : 80},
            {label : '评选组员',name : 'teammatenames',sortable : false,width : 200},
            {label : '填报日期',name : 'tbrq',sortable : false,width : 100},
            {label : '推荐理由',name : 'tjly',sortable : false,width : 300,
                formatter:function (cellvalue,options,rowObject) {
                    return '<a href="javascript:;" onclick="ViewComment(\'' + rowObject.tjly + '\')">'+cellvalue+'</a>'
                }
            } ,
            {label : '公告发布人',name : 'fqrmc',sortable : false,width : 100},
            {label : '发布日期',name : 'fqsj',sortable : false,width : 100},
            {label : '评选类型',name : 'pclx',sortable : false,width : 100},
            {label : '归属法院',name : 'gsfy',sortable : false, width : 100},
            {label : '承办部门',name : 'cbbm',sortable : false,width : 100},
            {label : '承办人', name : 'cbr',sortable : false,width : 100},
            {label : '性质',name : 'xz',sortable : false, width : 80},
            {label : '案由',name : 'ay',sortable : false,width : 150},
            {label : '结案方式',name : 'jafs',sortable : false,width : 80},
            {label : '结案时间',name : 'jasj',sortable : false,width : 80}
        ],
        pager : '#pager1'
        ,viewrecords: true
    }).jqGrid('setFrozenColumns');
    
    $("#btn_query").click(function () {
        reloadGrid();
    });
});


function reloadGrid() {
    $("#table1").jqGrid().setGridParam({
        url : URL_TABLE1,
        postData:{
            bt:$("#form_inp_bt").val(),
            pclx:$("#form_sel_pclx").val(),
            fqsj1:$("#form_inp_fqsj1").val(),
            fqsj2:$("#form_inp_fqsj2").val()
        },
        page : 1
    }).trigger("reloadGrid");
}


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

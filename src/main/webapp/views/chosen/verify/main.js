var URL_TABLE1 = ahcourt.ctx + "/chosen/verifylist.do";
var URL_TABLE2 = ahcourt.ctx + "/chosen/verifyhistorylist.do";

//============================================================
$(function(){

    $("#table1").jqGrid({
        url : URL_TABLE1,
        datatype : "json",
        mtype : "post",
        height : $('body').height() -135,
        width : $('body').width() - 22,
        rownumbers : true,
        shrinkToFit : true,
        rowNum : 20,
        rowList : [ 10, 20, 30 ],
        colModel : [
            {label : 'chosenid',name : 'chosenid',hidden : true,key : true},
            {label : '操作', name : 'fmt',width : 50,align : 'center',sortable : false,
                formatter : function(cellvalue, options, rowObject) {
                    return '<button class="btn btn-link btn-xs " type="button" onclick="viewOrVerifyNotice(1,\'' + rowObject.chosenid + '\')"><i class="fa fa-eye"></i> 审核 </button>';
                }
            },
            {label : '公告标题',name : 'bt', sortable : false, width : 300 },
            {label : '评选类型', name : 'pclx',align : 'center',sortable : false, width : 100},
            {label : '发起人',name : 'fqrmc',sortable : false, width : 100 },
            {label : '发布时间',name : 'fqsj',sortable : false,width : 100 }
        ],
        pager : '#pager1'
        ,viewrecords: true

    });

    $("#table2").jqGrid({
        url : URL_TABLE2,
        datatype : "json",
        mtype : "post",
        height : $('body').height() -135 -65,
        width : $('body').width() - 22,
        rownumbers : true,
        shrinkToFit : true,
        rowNum : 20,
        rowList : [ 10, 20, 30 ],
        colModel : [
            {label : 'ggid',name : 'ggid',hidden : true, key : true},
            {label : '操作', name : 'ggid',width : 260, align : 'center',sortable : false,
                formatter : function(cellvalue, options, rowObject) {
                    return '<button class="btn btn-link btn-xs " type="button" onclick="viewOrVerifyNotice(2,\'' + rowObject.ggid + '\')" title="查看公告详细"><i class="fa fa-info-circle"></i> 查看公告 </button>'
                         + '<button class="btn btn-link btn-xs " type="button" onclick="viewCases(2,\'' + rowObject.ggid + '\')"><i class="fa fa-reddit"></i> 评选详情 </button>'
                }
            },
            {label : '公告标题',name : 'bt',sortable : false, width : 300 },
            {label : '状态',name : 'zt',align : 'center',sortable:false,width : 100,formatter:function (cellvalue,options,rowObject) {
                if (cellvalue == '0') {
                    return '<lable class="label label-default">待审核</lable>'
                } else if (cellvalue == '1') {
                    return '<lable class="label label-primary">审核通过</lable>'
                } else {
                    return '<lable class="label label-danger ">审核不通过</lable>'
                }
            }},
            {label : '评选类型',name : 'pclx',align : 'center',sortable : false,width : 100},
            {label : '发起人',name : 'fqrmc',sortable : false,width : 100 },
            {label : '发布时间',name : 'fqsj',sortable : false,width : 120},
            {label : '审核人',name : 'shrmc',sortable : false,width : 100} ,
            {label : '审核时间',name : 'shsj',sortable : false,width : 120},
            {label : '审核意见',name : 'shyj',sortable:false,width : 200,
                formatter:function(cellvalue, options, rowObject) {
                    if(!cellvalue){
                        cellvalue = "";
                    }
                    return '<a href="javascript:void(0)" onclick="openComments(\'' + cellvalue + '\')">'+cellvalue+'</a>';
                }
            }
        ],
        pager : '#pager2'
        ,viewrecords: true
    });

    $("#btn_query").click(function () {
        reloadTable2();
    });

});

function reloadTable1() {
    $("#table1").jqGrid().setGridParam({
        url : URL_TABLE1,
        page : 1
    }).trigger("reloadGrid");
}

function reloadTable2() {
    $("#table2").jqGrid().setGridParam({
        url : URL_TABLE2,
        postData:{
            bt:$("#form_inp_bt").val(),
            zt:$("#form_sel_zt").val(),
            fqsj1:$("#form_inp_fqsj1").val(),
            fqsj2:$("#form_inp_fqsj2").val()
        },
        page : 1
    }).trigger("reloadGrid");
}

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

function openComments(shyj) {
    layer.open({
        type : 1,
        shift : 5,
        title : "查看审核意见",
        shadeClose : false,
        shade : 0.3,
        area : [ '400px', '200px' ],
        content : shyj,
        cancel : function(index) {
            layer.close(index);
        }

    });
}
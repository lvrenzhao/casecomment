var URL_TABLE1 = ahcourt.ctx+"/chosen/incases.do";
var URL_TABLE2 = ahcourt.ctx+"/chosen/mysubmit.do";

$(function () {
    //###这里进能显示未截止的评选活动公告
    $("#table1").jqGrid({
        url : URL_TABLE1,
        datatype : "json",
        mtype : "post",
        height : $('body').height() -125,
        width : $('body').width() - 22,
        rownumbers : true,
        shrinkToFit : true,
        rowNum : 20,
        rowList : [ 10, 20, 30 ],
        colModel : [
            {label : 'chosenid',name : 'chosenid', hidden : true,key : true},
            {label : 'btys',name : 'btys',hidden : true},
            {label : 'sfyd',name : 'sfyd',hidden : true},
            {label : '操作',name : 'ggid',width : 150,align : 'center',sortable : false,
                formatter : function(cellvalue, options, rowObject) {
                    return '<button class="btn btn-link btn-xs " type="button" onclick="viewOrVerifyNotice(2,\'' + rowObject.chosenid + '\')" title="查看公告详细"><i class="fa fa-info-circle"></i> 详细</button>'
                        +      '<button class="btn btn-link btn-xs " type="button" onclick="joinCase(\'' + rowObject.chosenid + '\')" title=""><i class="fa fa-edit"></i> 填报</button>';
                }
            },
            {label : '公告标题',name : 'bt',width : 300,sortable:false,
                formatter : function(cellvalue, options, rowObject) {
                    var style = "color:"+rowObject.btys;
                    return '<span style="'+style+'">'+cellvalue+'</span>';
                }
            },
            {label : '已填报案件数', name : 'ytbajs',align : 'right',sortable : false,width : 120,
                formatter : function(cellvalue, options, rowObject) {
                    return '<a href="javascript:;" onclick="viewCases(1,\'' + rowObject.chosenid + '\')">'+cellvalue+'</a>';
                }
            },
            {label : '评选类型',name : 'pclx',align : 'center',sortable : false,width : 100},
            {label : '发起人', name : 'fqrmc',sortable : false,width : 100},
            {label : '发布时间', name : 'fqsj',sortable : false,width : 100},
            {label : '截止时间',name : 'jzrq',sortable : false,width : 100},
            {label : '审核人',name : 'shrmc',sortable : false,width : 100} ,
            {label : '审核时间',name : 'shsj',sortable : false,width : 100}
        ],
        pager : '#pager1'
        ,viewrecords: true
    });

    $("#table2").jqGrid({
        url : URL_TABLE2,
        datatype : "json",
        mtype : "post",
        height : $('body').height() -200,
        width : $('body').width() - 22,
        rownumbers : true,
        shrinkToFit : false,
        rowNum : 20,
        rowList : [ 10, 20, 30 ],
        colModel : [
            {label : 'ccid',name : 'ccid',hidden : true,key : true},
            {label : '案号',name : 'ah',sortable:false,width : 120},
            {label : '所属评选公告',name : 'bt',sortable:false,width : 200},
            {label : '评选类型',name : 'pclx',sortable:false,width : 100},
            {label : '评选得分',name : 'zzpxdf',sortable:false,width : 100},
            {label : '评选时间',name : 'dpsj',sortable:false,width : 100},
            {label : '填报日期', name : 'tbrq',sortable:false,width : 100},
            {label : '推荐理由',name : 'tjly',width : 300,sortable:false,
                formatter:function (cellvalue,options,rowObject) {
                    return '<a href="javascript:;" onclick="ViewComment(\'' + rowObject.tjly + '\')">'+cellvalue+'</a>'
                }
            } ,
            {label : '归属法院',name : 'gsfy',sortable:false,width : 100},
            {label : '承办部门',name : 'cbbm',sortable:false,width : 100},
            {label : '承办人',name : 'cbr',sortable:false,width : 100},
            {label : '性质',name : 'xz',sortable:false,width : 80},
            {label : '案由',name : 'ay',sortable:false,width : 150},
            {label : '结案方式',name : 'jafs',sortable:false,width : 80 },
            {label : '结案时间',name : 'jasj',sortable:false,width : 80}
        ],
        pager : '#pager2'
        ,viewrecords: true
    });

    $("#btn_query").click(function () {
        reloadGrid();
    });

    $("#xbtn_refresh").click(function () {
        reloadGrid1();
        reloadGrid();
        layer.msg("刷新成功!",{icon:1});
    });

});

function reloadGrid1() {
    $("#table1").jqGrid().setGridParam({
        url :URL_TABLE1,
        page : 1
    }).trigger("reloadGrid");
}

function reloadGrid() {
    $("#table2").jqGrid().setGridParam({
        url :URL_TABLE2,
        postData:{
            bt:$("#form_inp_bt").val(),
            pclx:$("#form_sel_pclx").val(),
            tbrq1:$("#form_inp_fqsj1").val(),
            tbrq2:$("#form_inp_fqsj2").val()
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
        area : [ '90%', '90%' ],
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
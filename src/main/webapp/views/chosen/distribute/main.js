var URL_TABLE1 = ahcourt.ctx + "/chosen/dfp.do";
var URL_TABLE2 = ahcourt.ctx + "/chosen/yfp.do";

$(function () {
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
            {label : '操作',name : 'fmt',width : 150,align : 'center',sortable : false,
                formatter : function(cellvalue, options, rowObject) {
                    var str="";
                    str += '<button class="btn btn-link btn-xs " type="button" onclick="viewOrVerifyNotice(2,\'' + rowObject.chosenid + '\')" title="查看公告详细"><i class="fa fa-info-circle"></i> 详细</button>'
                    if(getNowFormatDate() > rowObject.jzrq.replace(/\//g, "")){
                        str +='<button class="btn btn-link btn-xs " type="button" onclick="joinCase(\'' + rowObject.chosenid + '\')" title=""><i class="fa fa-random"></i> 分配</button>';
                    }
                    return str;
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
        shrinkToFit : true,
        rowNum : 20,
        rowList : [ 10, 20, 30 ],
        colModel : [
            {label : 'chosenid',name : 'chosenid', hidden : true,key : true},
            {label : 'btys',name : 'btys',hidden : true},
            {label : 'sfyd',name : 'sfyd',hidden : true},
            {label : '操作',name : 'fmt',width : 120,align : 'center',sortable : false,
                formatter : function(cellvalue, options, rowObject) {
                    return '<button class="btn btn-link btn-xs " type="button" onclick="viewOrVerifyNotice(2,\'' + rowObject.chosenid + '\')" ><i class="fa fa-info-circle"></i> 公告详细</button>';
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
                    return '<a href="javascript:;" onclick="viewCases(2,\'' + rowObject.chosenid + '\')">'+cellvalue+'</a>';
                }
            },
            {label : '评选类型',name : 'pclx',align : 'center',sortable : false,width : 100},
            {label : '发起人', name : 'fqrmc',sortable : false,width : 100},
            {label : '发布时间', name : 'fqsj',sortable : false,width : 100},
            {label : '截止时间',name : 'jzrq',sortable : false,width : 100},
            {label : '审核人',name : 'shrmc',sortable : false,width : 100} ,
            {label : '审核时间',name : 'shsj',sortable : false,width : 100}
        ],
        pager : '#pager2'
        ,viewrecords: true
    });

    $("#btn_query").click(function () {
        reloadGrid2();
    });


    $("#xbtn_refresh").click(function () {
        reloadGrid1();
        reloadGrid2();
        layer.msg("刷新成功!",{icon:1});
    });

});


function reloadGrid1() {
    $("#table1").jqGrid().setGridParam({
        url :URL_TABLE1,
        page : 1
    }).trigger("reloadGrid");
}

function reloadGrid2() {
    $("#table2").jqGrid().setGridParam({
        url :URL_TABLE2,
        postData:{
            bt:$("#form_inp_bt").val(),
            pclx:$("#form_sel_pclx").val(),
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
        title : "分配案件",
        shadeClose : false,
        shade : 0.3,
        area : [ '95%', '95%' ],
        content : ahcourt.ctx + '/views/chosen/distribute/dist.jsp?ggid=' + key,
        cancel : function(index) {
            layer.close(index);
        }
    });
}

function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate;
    return currentdate;
}

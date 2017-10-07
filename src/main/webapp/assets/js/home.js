//获取任务数
var URL_TABLE2 =  ahcourt.ctx + "/case/notice.do";


$(function () {
    if(top.badgeObject && top.badgeObject.badge_ajpc_pc){
        $("#label_count_1").text(top.badgeObject.badge_ajpc_pc);
    }else{
        $("#label_count_1").text("0");
    }
    if(top.badgeObject && top.badgeObject.badge_sjpx_px){
        $("#label_count_2").text(top.badgeObject.badge_sjpx_px);
    }else{
        $("#label_count_2").text("0");
    }
    loadGrid1();
    loadGrid2();
    loadGrid3();
});
function loadGrid1() {
    $("#table1").jqGrid({
        url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
        datatype : "json",
        mtype : "post",
        height : $('body').height()-300,
        width : $('body').width() * 0.5 -20,
        rownumbers : true,
        shrinkToFit : true,
        rowNum : 20,
        rowList : [ 10, 20, 30 ],
        colModel : [
            {label : 'ggid',name : 'ggid',hidden : true,key : true },
            {label : '公告标题',name : 'xxggbt',width : 300,sortable:false,formatter : function(cellvalue, options, rowObject) {
                var style = "";
                if(rowObject.btys == 2){
                    style = "color:red;text-decoration:underline"
                }else{
                    style = "color:black;text-decoration:underline";
                }
                return '<a href="javascript:;" onclick="openDetails(1,\'' + rowObject.ggid + '\')"><span style="'+style+'">'+cellvalue+'</span></a>';
            }},
            {label : '发布人',name : 'fqr',width : 100,sortable:false},
            {label : '发布时间', name : 'fbsj',width : 100,sortable:false}
        ],
        pager : '#pager1'
        ,viewrecords: true
    });
}
function loadGrid2() {
    $("#table2").jqGrid({
        url : URL_TABLE2,
        datatype : "json",
        mtype : "post",
        height : $('body').height()*0.5-135,
        width : $('body').width() * 0.5 - 5 ,
        rownumbers : true,
        shrinkToFit : true,
        rowNum : 5,
        rowList : [ 5, 10, 20 ],
        colModel : [
            {label : 'checkid',name : 'checkid',hidden : true,key : true },
            {label : 'btys',name : 'btys',hidden : true},
            {label : 'sfyd',name : 'sfyd',hidden : true},
            // {label : '公告标题',name : 'ggbt',width : 300,sortable:false,formatter : function(cellvalue, options, rowObject) {
            //     var style = "";
            //     if(rowObject.btys == 2){
            //         style = "color:red;text-decoration:underline"
            //     }else{
            //         style = "color:black;text-decoration:underline";
            //     }
            //     return '<a href="javascript:;" onclick="openDetails(2,\'' + rowObject.ggid + '\')"><span style="'+style+'">'+cellvalue+'</span></a>';
            // }},
            {label : '公告标题',name : 'bt',width : 300,sortable:false,
                formatter : function(cellvalue, options, rowObject) {
                    var style = "color:"+rowObject.btys;
                    var remind = "";
                    if(rowObject.sfyd == 0){
                        remind = "<span class='label label-primary'>未读</span>&nbsp;&nbsp;";
                    }
                    return '<a href="javascript:;" onclick="openDetails(2,\'' + rowObject.ggid + '\')">' + remind + '<span style="text-decoration:underline;'+style+'">'+cellvalue+'</span>'+'</a>';
                }
            },
            {label : '发起人',name : 'fqrmc',sortable:false,width : 100},
            {label : '发布时间',name : 'fqsj',sortable:false,width : 100}
        ],
        pager : '#pager2'
        ,viewrecords: true
    });
}
function loadGrid3() {
    $("#table3").jqGrid({
        url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
        datatype : "json",
        mtype : "post",
        height : $('body').height()*0.5-125,
        width : $('body').width() * 0.5 - 5 ,
        rownumbers : true,
        shrinkToFit : true,
        rowNum : 20,
        rowList : [ 10, 20, 30 ],
        colModel : [
            {label : 'ggid',name : 'ggid',hidden : true,key : true },
            {label : '公告标题',name : 'pxggbt',width : 300,sortable:false,formatter : function(cellvalue, options, rowObject) {
                var style = "";
                if(rowObject.btys == 2){
                    style = "color:red;text-decoration:underline"
                }else{
                    style = "color:black;text-decoration:underline";
                }
                return '<a href="javascript:;" onclick="openDetails(3,\'' + rowObject.ggid + '\')"><span style="'+style+'">'+cellvalue+'</span></a>';
            }},
            {label : '发布人',name : 'fqr',width : 100,sortable:false},
            {label : '发布时间', name : 'fbsj',width : 100,sortable:false}
        ],
        pager : '#pager3'
        ,viewrecords: true
    });
}

function reloadGrid1() {
    $("#table1").jqGrid().setGridParam({
        url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
        postData:{
        },
        page : 1
    }).trigger("reloadGrid");
}
function reloadGrid2() {
    $("#table2").jqGrid().setGridParam({
        url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
        postData:{
        },
        page : 1
    }).trigger("reloadGrid");
}
function reloadGrid3() {
    $("#table3").jqGrid().setGridParam({
        url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
        postData:{
        },
        page : 1
    }).trigger("reloadGrid");
}

function openDetails(type,key) {
    var URL = "";
    if(type == 1){
        URL = ahcourt.ctx + '/publish/input.do?mode=3'+'&xxid=' + key;
    }else if(type == 2){
        URL = ahcourt.ctx + '/views/check/start/details.jsp?ggid=' + key+"&mode=3";
    }else if(type == 3){
        URL = ahcourt.ctx + '/views/chosen/start/main.jsp?ggid=' + key+"&mode=2";
    }
    layer.open({
        type : 2,
        shift : 5,
        title : "查看详细",
        shadeClose : false,
        shade : 0.3,
        area : [ '95%', '90%' ],
        content : URL,
        cancel : function(index) {
            layer.close(index);
            reloadGrid1();
            reloadGrid2();
            reloadGrid3();
        }
    });
}
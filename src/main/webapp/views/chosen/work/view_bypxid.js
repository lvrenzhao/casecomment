//mode:1 = 无评选结果，评选组长，评选组员 ,无按照专家组进行过滤的条件。
//mod:2 = 有评选结果，有评选组长，评选组员，有按照专家组进行过滤的条件

var mode;
$(function () {
    mode = $.getUrlParam("mode");
    if(mode == 1){
        $("#left").hide();
        $("#right").css("cssText","width:100% !important");
    }
    loadGridCases();
    loadGridGroup();
});


function loadGridCases() {
    var cols = [];
    if(mode == 2){
        cols = [
            {label : 'ajid',name : 'ajid',hidden : true,key : true,sortable:false,frozen : true},
            {label : 'ggid',name : 'ggid',hidden : true,sortable:false,frozen : true},
            {label : '案号',name : 'xmmc', width : 120,sortable:false,frozen : true},
            {label : '关联案件',name : '',width : 80,sortable:false,formatter:function (cellvalue,options,rowObject) {
                return '<a onclick="viewRelated(\'' + cellvalue + '\')" href="javascript:;">'+cellvalue+'</a>';
            }},
            {label : '评选得分',name : 'shsj',sortable:false, width : 100},
            {label : '评选时间',name : 'lxrmc',sortable:false,width : 100},
            {label : '填报日期', name : 'fbsj',sortable:false,width : 100},
            {label : '推荐理由',name : 'shr',sortable:false,width : 300,
                formatter:function (cellvalue,options,rowObject) {
                    return '<a href="javascript:;" onclick="ViewComment(\'' + rowObject.ggid + '\')">'+cellvalue+'</a>'
                }
            },
            {label : '归属法院',name : 'xmzt',width : 150,sortable:false},
            {label : '承办部门',name : 'htmc', width : 100,sortable:false},
            {label : '承办人',name : 'xmlxmc',width : 80,sortable:false},
            {label : '性质',name : 'zylbmc',width : 80 ,sortable:false},
            {label : '类型',name : 'zylbmc',width : 80,sortable:false},
            {label : '案由',name : 'xmfzrmc',width : 120,sortable:false},
            {label : '结案方式',name : 'xmjlmc', width : 80,sortable:false},
            {label : '结案时间',name : 'xmcymc', width : 80,sortable:false}
        ]
    }else{
        cols = [
            {label : 'ajid',name : 'ajid',hidden : true,key : true,sortable:false,frozen : true},
            {label : 'ggid',name : 'ggid',hidden : true,sortable:false,frozen : true},
            {label : '案号',name : 'xmmc', width : 120,sortable:false,frozen : true},
            {label : '关联案件',name : '',width : 80,sortable:false,formatter:function (cellvalue,options,rowObject) {
                return '<a onclick="viewRelated(\'' + cellvalue + '\')" href="javascript:;">'+cellvalue+'</a>';
            }},
            {label : '填报日期',name : 'fbsj', sortable:false,width : 100},
            {label : '推荐理由', name : 'shr',sortable:false,width : 300,
                formatter:function (cellvalue,options,rowObject) {
                    return '<a href="javascript:;" onclick="ViewComment(\'' + rowObject.ggid + '\')">'+cellvalue+'</a>'
                }
            },
            {label : '归属法院',name : 'xmzt',width : 150,sortable:false},
            {label : '承办部门',name : 'htmc', width : 100,sortable:false},
            {label : '承办人',name : 'xmlxmc',width : 80,sortable:false},
            {label : '性质',name : 'zylbmc',width : 80 ,sortable:false},
            {label : '类型',name : 'zylbmc',width : 80,sortable:false},
            {label : '案由',name : 'xmfzrmc',width : 120,sortable:false},
            {label : '结案方式',name : 'xmjlmc', width : 80,sortable:false},
            {label : '结案时间',name : 'xmcymc', width : 80,sortable:false}
        ]
    }
    $("#table1").jqGrid({
        url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
        datatype : "json",
        mtype : "post",
        multiselect : true,
        height : $('body').height() - 145,
        width : mode == 1 ? ($('body').width() -10) : ($('body').width() * 0.65-10),
        rownumbers : true,
        shrinkToFit : false,
        rowNum : 100000000,
        colModel : cols
    }).jqGrid('setFrozenColumns');
}

function loadGridGroup() {
    $("#table2").jqGrid({
        url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
        datatype : "json",
        mtype : "post",
        height : $('body').height() - 125,
        width : $('body').width() * 0.35,
        shrinkToFit : true,
        rowNum : 20,
        colModel : [
            {label : 'ajid',name : 'ajid',hidden : true,key : true,sortable:false,frozen : true},
            {label : '组名',name : 'xmzt',width : 100,sortable:false},
            {label : '组长',name : 'xmzt',width : 80,sortable:false},
            {label : '组员',name : 'htmc', width : 200,sortable:false},
            {label : '评查',name : 'htmc', width : 60,sortable:false},
            {label : '占比',name : 'htmc', width : 60,sortable:false}
        ],
        pager:"#pager2"
        // ,viewrecords: true
    });//.jqGrid('setFrozenColumns');
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
function viewRelated(key) {
    layer.open({
        type : 2,
        shift : 5,
        title : '查看关联案件',
        shadeClose : false,
        shade : 0.3,
        area : [ '90%', '90%' ],
        content : ahcourt.ctx + '/views/check/start/view_relatedcases.jsp?ajid=' + key,
        cancel : function(index) {
            layer.close(index);
        }
    });
}
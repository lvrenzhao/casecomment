var ggid,mode;
$(function () {
    var ggid = $.getUrlParam("ggid");
    var mode = $.getUrlParam("mode");

    if(mode == 1){
        $("#btn_pass").show();
        $("#btn_reject").show();
    }
    //### mode == 3 要记录阅读记录

    $('.i-checks').iCheck({
        radioClass : 'iradio_square-green',
        checkboxClass : 'icheckbox_square-green'
    });
    loadGridCase();
    loadGridGroup();
    $("#div_noticeconent").height($('body').height()-240);
    
    $("#btn_reject").click(function () {
        layer.open({
            type : 1,
            shift : 5,
            title : '审核不同意',
            shadeClose : false,
            shade : 0.3,
            area : [ '480px', '250px' ],
            content : $("#div_reject"),
            cancel : function(index) {
                layer.close(index);
            }
        });
    });

    $("#viewTable").click(function () {
        layer.open({
            type : 2,
            shift : 5,
            title : '查看评分表',
            shadeClose : false,
            shade : 0.3,
            area : [ '90%', '90%' ],
            content : ahcourt.ctx+"/views/check/configscore/view_table.jsp?id=",
            cancel : function(index) {
                layer.close(index);
            }
        });
    });
});

function loadGridCase() {
    $("#table1").jqGrid({
           url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
        datatype : "json",
        mtype : "post",
        multiselect : true,
        height : $('body').height() - 175,
        width : $('body').width() * 0.6-15 ,
        rownumbers : true,
        shrinkToFit : false,
        rowNum : 20,
        colModel : [
            {label : 'ajid',name : 'ajid',hidden : true,key : true,sortable:false,frozen : true},
            {label : 'ggid',name : 'ggid',hidden : true,sortable:false,frozen : true},
            {label : '案号',name : 'xmmc', width : 120,sortable:false,frozen : true},
            {label : '关联案件',name : '',frozen : true,width : 80,sortable:false,formatter:function (cellvalue,options,rowObject) {
                return '<a onclick="viewRelated(\'' + cellvalue + '\')" href="javascript:;">'+cellvalue+'</a>';
            }},
            {label : '归属法院',name : 'xmzt',width : 150,sortable:false},
            {label : '承办部门',name : 'htmc', width : 100,sortable:false},
            {label : '承办人',name : 'xmlxmc',width : 80,sortable:false},
            {label : '性质',name : 'zylbmc',width : 80 ,sortable:false},
            {label : '类型',name : 'zylbmc',width : 80,sortable:false},
            {label : '案由',name : 'xmfzrmc',width : 120,sortable:false},
            {label : '结案方式',name : 'xmjlmc', width : 80,sortable:false},
            {label : '结案时间',name : 'xmcymc', width : 80,sortable:false}
        ],
        pager:"#pager1",
        viewrecords: true
    });//.jqGrid('setFrozenColumns');
}

function loadGridGroup() {
    $("#table3").jqGrid({
        url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
        datatype : "json",
        mtype : "post",
        height : $('body').height() - 350,
        width : $('body').width() * 0.4-10,
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
        pager:"#pager3"
        // ,viewrecords: true
    });//.jqGrid('setFrozenColumns');
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
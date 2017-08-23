var URL_RELATED_CASES = ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json';

$(function () {
    loadGrid1();
});

function loadGrid1() {
    $("#table1").jqGrid({
        url:URL_RELATED_CASES,
        datatype : "json",
        mtype : "post",
        multiselect : true,
        height : $('body').height() - 125,
        width : $('body').width() ,
        rownumbers : true,
        shrinkToFit : true,
        rowNum : 20,
        colModel : [
            {label : 'ajid',name : 'ajid',hidden : true,key : true,sortable:false,frozen : true},
            {label : 'ggid',name : 'ggid',hidden : true,sortable:false,frozen : true},
            {label : '操作',name : '',frozen : true,width : 100,sortable:false,formatter:function (cellvalue,options,rowObject) {
                return  '<button class="btn btn-link btn-xs " type="button" onclick="check(3,\'' + cellvalue + '\')" title="评查"><i class="fa fa-dedent"></i> 案件资料</button>';
            }},
            {label : '案号',name : 'xmmc', width : 120,sortable:false,frozen : true},
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
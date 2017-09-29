var ajid;

var URL_RELATED_CASES = ahcourt.ctx + '/case/related.do';

$(function () {

    ajid = $.getUrlParam("ajid");
    loadGrid1();
});

function loadGrid1() {
    $("#table1").jqGrid({
        url:URL_RELATED_CASES,
        postData:{ajid:ajid},
        datatype : "json",
        mtype : "post",
        multiselect : true,
        height : $('body').height() - 75,
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
            {label : '案号',name : 'ah', width : 120,sortable:false,frozen : true},
            {label : '归属法院',name : 'gsfy',width : 150,sortable:false},
            {label : '承办部门',name : 'cbbm', width : 100,sortable:false},
            {label : '承办人',name : 'cbr',width : 80,sortable:false},
            {label : '性质',name : 'xz',width : 80 ,sortable:false},
            {label : '类型',name : 'lx',width : 80,sortable:false},
            {label : '案由',name : 'ay',width : 120,sortable:false},
            {label : '结案方式',name : 'jafs', width : 80,sortable:false},
            {label : '结案时间',name : 'jasj', width : 80,sortable:false}
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
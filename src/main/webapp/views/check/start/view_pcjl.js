var ajid;

var URL_RELATED_CASES = ahcourt.ctx + '/case/pcjl.do';

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
            {label : 'ccid',name : 'ccid',hidden : true,key : true,sortable:false,frozen : true},
            {label : '操作',name : '',frozen : true,width : 80,align:'center',sortable:false,formatter:function (cellvalue,options,rowObject) {
                return  '<button class="btn btn-link btn-xs " type="button" onclick="comment(2,\'' + cellvalue + '\')" ><i class="fa fa-dedent"></i> 评查详情</button>';
            }},
            {label : '评查公告',name : 'ggmc', width : 200,sortable:false,frozen : true},
            {label : '评查分数',name : 'zzpcdf',width : 80,align:'right',sortable:false},
            {label : '质量等级',name : 'zzzldj', width : 80,align:'center',sortable:false},
            {label : '评查时间',name : 'dpsj', align:'right',width : 80,sortable:false},
            {label : '评查组长',name : 'teamleadername',width : 80 ,sortable:false},
            {label : '评查组员',name : 'teammatenames',width : 150,sortable:false}
        ],
        pager:"#pager1",
        viewrecords: true
    });
}

function comment(mode,ajid) {
    layer.open({
        type : 2,
        shift : 5,
        title : mode==1?'案件点评':"查看案件评查详情",
        shadeClose : false,
        shade : 0.3,
        area : [ '95%', '95%' ],
        content : ahcourt.ctx + '/views/check/work/comment.jsp?ajid=' + ajid+"&mode="+mode,
        cancel : function(index) {
            layer.close(index);
        }
    });
}
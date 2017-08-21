//#### type为1 是评查模板维护 ， type为2 是评选模板维护

//============================================================
var type;
$(function () {
    //todo here
    type = $.getUrlParam("type");
    loadTables();
    $("#btn_add").click(function () {
        layer.open({
            type : 2,
            shift : 5,
            title : '新增评分表',
            shadeClose : false,
            shade : 0.3,
            area : [ '90%', '90%' ],
            content : ahcourt.ctx+"/views/check/configscore/add_table.jsp",
            cancel : function(index) {
                layer.close(index);
            }
        });
    });
});

function loadTables() {
    $("#table1").jqGrid({
        url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
        datatype : "json",
        mtype : "post",
        height : $('body').height()-125,
        width : $('body').width() - 5 ,
        rownumbers : true,
        shrinkToFit : true,
        rowNum : 20,
        rowList : [ 10, 20, 30 ],
        colModel : [
            {label : 'id',name : 'id',hidden : true,key : true },
            {label : '操作',name : 'id',width : 100,sortable:false,formatter:function(cellvalue,options,rowObject){
                var btn_str = "";
                //如果已经被使用，则不能对评分表进行修改和删除
                if(rowObject.used == "1"){
                    btn_str += '<button class="btn btn-link btn-xs " type="button" onclick="" title=""><i class="fa fa-trash"></i> </button>';
                    btn_str += '<button class="btn btn-link btn-xs " type="button" onclick="" title=""><i class="fa fa-edit"></i> </button>';
                }
                btn_str += '<button class="btn btn-link btn-xs " type="button" onclick="viewone()" title=""><i class="fa fa-info-circle"></i> </button>';
                return btn_str;
            }},
            {label : '模板名称',name : 'ggbt',sortable:false,width : 400},
            {label : '模板说明',name : 'pclx',sortable:false,align : 'center',width : 300},
            {label : '创建人',name : 'lxrmc',sortable:false,width : 100},
            {label : '创建时间', name : 'fbsj',sortable:false,width : 100}
        ],
        pager : '#pager1'
        ,viewrecords: true
    });
}

function viewone(key) {
    layer.open({
        type : 2,
        shift : 5,
        title : '查看评分表',
        shadeClose : false,
        shade : 0.3,
        area : [ '90%', '90%' ],
        content : ahcourt.ctx+"/views/check/configscore/view_table.jsp?id="+key,
        cancel : function(index) {
            layer.close(index);
        }
    });
}
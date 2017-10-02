var URL_TABLE1 = ahcourt.ctx + "/case/levels.do";
var URL_DELETEONE = ahcourt.ctx + "/case/dellevel.do";

$(function(){
    // Configuration for jqGrid Example 1
    $("#table1").jqGrid({
        url: URL_TABLE1,
        datatype: "json",
        mtype : "post",
        height: $('body').height()-135,
        autowidth: true,
        shrinkToFit: true,
        rowNum: 20,
        colModel: [
            {label : 'levelid',name : 'levelid',hidden : true, key : true,frozen:true},
            {label : 'minscore',name : 'minscore',hidden : true, frozen:true},
            {label : 'maxscore',name : 'maxscore',hidden : true, frozen:true},
            {label:'操作',name:'fmt',width:60,frozen:true,sortable:false,formatter:function(cellvalue, options, rowObject) {
                return '<button class="btn btn-white btn-xs " type="button" onclick="deleteItem(\'' + rowObject.levelid + '\')" title="删除"><i class="fa fa-trash"></i> 删除</button>'+
                       '<button class="btn btn-white btn-xs " type="button" onclick="" title="编辑"><i class="fa fa-edit"></i> 编辑</button>';
            }},
            {label: '序号',name: 'xh',width: 60,sortable:false,align:'center'},
            {label: '等级',name: 'levelname',width: 200,sortable:false,align:'center'},
            {label: '分值区间',name: 'fmt2',width: 200,sortable:false, align:'center',formatter:function (cellvalue,options,rowObject) {
                return  rowObject.minscore + '&nbsp;&nbsp;~&nbsp;&nbsp;' + rowObject.maxscore;
            }}
        ],
        viewrecords: true,
        hidegrid: false,
        pager:"#pager1"
    });
});

function reloadGrid1() {
    $("#table1").jqGrid().setGridParam({
        url : URL_TABLE1,
        page : 1
    }).trigger("reloadGrid");
}



function deleteItem (levelid) {
    layer.confirm('确定要删除该项？', {
        btn: ['确定','取消'] //按钮
    }, function(o){
        layer.close(o)
        $.ajax({
            type : 'POST',
            url : URL_DELETEONE,
            data:{
                levelid:levelid
            },
            datatype : 'json',
            success : function(data) {
                if(data > 0){
                    layer.msg("删除成功!",{icon:1});
                    reloadGrid1();
                }
            }
        });
    }, function(){
    });
}
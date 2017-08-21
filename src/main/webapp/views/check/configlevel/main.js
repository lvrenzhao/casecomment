$(function(){
    var mydata = [
        {
            id: "1",
            xh: "1",
            dj: "优秀",
            fzqj: "85-100"
        },{
            id: "2",
            xh: "2",
            dj: "良好",
            fzqj: "70-84"
        },{
            id: "3",
            xh: "3",
            dj: "合格",
            fzqj: "60-69"
        }
    ];

    // Configuration for jqGrid Example 1
    $("#table1").jqGrid({
        data: mydata,
        datatype: "local",
        height: $('body').height()-135,
        autowidth: true,
        shrinkToFit: true,
        rowNum: 20,
        colNames: ['操作', '序号','等级', '分值区间'],
        colModel: [
            {name: 'id',index: 'id', width: 60,sortable : false,frozen : true,align:'center',
                formatter:function(cellvalue, options, rowObject) {
                    return '<button class="btn btn-white btn-xs " type="button" onclick="deleteItem()" title="删除"><i class="fa fa-trash"></i> 删除</button>'+
                        '<button class="btn btn-white btn-xs " type="button" onclick="" title="编辑"><i class="fa fa-edit"></i> 编辑</button>';
                }
            },
            {name: 'xh',index: 'xh',width: 60,sortable:false,align:'center'},
            {name: 'dj',index: 'dj',width: 200,sortable:false,align:'center'},
            {name: 'fzqj',index: 'fzqj',width: 200,sortable:false, align:'center'}
        ],
        viewrecords: true,
        hidegrid: false,
        pager:"#pager1"
    });
})



function deleteItem () {
    layer.confirm('确定要删除该项？', {
        btn: ['确定','取消'] //按钮
    }, function(){
    }, function(){
    });
}
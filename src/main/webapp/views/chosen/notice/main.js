var URL_TABLE1 = ahcourt.ctx + "/chosen/notice.do";
var URL_SETREAD = ahcourt.ctx + '/chosen/setread.do';

$(function(){
    $("#table1").jqGrid({
        url : URL_TABLE1,
        datatype : "json",
        mtype : "post",
        height : $('body').height() -95 -65,
        width : $('body').width() - 22,
        rownumbers : true,
        shrinkToFit : true,
        rowNum : 20,
        rowList : [ 10, 20, 30 ],
        colModel : [
            {label : 'chosenid',name : 'chosenid', hidden : true,key : true},
            {label : 'btys',name : 'btys',hidden : true},
            {label : 'sfyd',name : 'sfyd',hidden : true},
            {label : '操作',name : 'ggid',width : 80,align : 'center',sortable : false,
                formatter : function(cellvalue, options, rowObject) {
                    return '<button class="btn btn-link btn-xs " type="button" onclick="viewOrVerifyNotice(2,\'' + rowObject.chosenid + '\')"><i class="fa fa-info-circle"></i> 详细</button>';
                }
            },
            {label : '公告标题',name : 'bt',width : 300,sortable:false,
                formatter : function(cellvalue, options, rowObject) {
                    var style = "color:"+rowObject.btys;
                    var remind = "";
                    if(rowObject.sfyd == 0){
                        remind = "<span class='label label-primary'>未读</span>&nbsp;&nbsp;";
                    }
                    return remind + '<span style="'+style+'">'+cellvalue+'</span>';
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

    $("#btn_query").click(function () {
        reloadGrid();
    });

});

function reloadGrid() {
    $("#table1").jqGrid().setGridParam({
        url :URL_TABLE1,
        postData:{
            bt:$("#form_inp_bt").val(),
            pclx:$("#form_sel_pclx").val(),
            fqrmc:$("#form_inp_fqrmc").val(),
            fqsj1:$("#form_inp_fqsj1").val(),
            fqsj2:$("#form_inp_fqsj2").val()
        },
        page : 1
    }).trigger("reloadGrid");
}

function viewOrVerifyNotice(mode,ggid) {
    $.ajax({
        type : 'POST',
        url : URL_SETREAD,
        data:{
            ggid:ggid,
            type:"1"
        },
        datatype : 'json',
        success : function(data) {
            layer.open({
                type : 2,
                shift : 5,
                title : mode==1?"审核案件评查公告":"查看审核评查公告",
                shadeClose : false,
                shade : 0.3,
                area : [ '95%', '90%' ],
                content : ahcourt.ctx + '/views/chosen/start/main.jsp?ggid=' + ggid+"&mode="+mode,
                cancel : function(index) {
                    reloadGrid();
                    layer.close(index);
                }
            });
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
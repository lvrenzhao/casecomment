var URL_TABLE1 =  ahcourt.ctx + "/chosen/verifing.do";
var URL_TABLE2 =  ahcourt.ctx + "/chosen/reject.do";
var URL_SETREAD = ahcourt.ctx + '/chosen/setread.do';

//============================================================
$(function () {
    $("#table1").jqGrid({
        url : URL_TABLE1,
        datatype : "json",
        mtype : "post",
        height : $('body').height() -125 ,
        width : $('body').width() - 22,
        rownumbers : true,
        shrinkToFit : true,
        rowNum : 20,
        rowList : [ 10, 20, 30 ],
        colModel : [
            {label : 'chosenid',name : 'chosenid',hidden : true,key : true },
            {label : 'btys',name : 'btys',hidden : true},
            {label : '操作',name : 'fmt', width : 120,align : 'center',sortable : false,
                formatter : function(cellvalue, options, rowObject) {
                    return '<button class="btn btn-link btn-xs " type="button" onclick="viewOrVerifyNotice(2,\'' + rowObject.chosenid + '\')" title="查看公告详细"><i class="fa fa-info"></i> 公告详细</button>';
                    // +      '<button class="btn btn-link btn-xs " type="button" onclick="openComments(\'' + rowObject.chosenid + '\',\'' + 'test' + '\')" title="查看公告详细"><i class="fa fa-comment"></i> 审核意见</button>';
                }
            },
            {label : '公告标题',name : 'bt',width : 300,sortable:false,
                formatter : function(cellvalue, options, rowObject) {
                    var style = "color:"+rowObject.btys;
                    return '<span style="'+style+'">'+cellvalue+'</span>';
                }
            },
            {label : '评选类型',name : 'pclx',align : 'center',sortable : false,width : 100},
            {label : '发布人',name : 'fqrmc', sortable : false,width : 100},
            {label : '发布时间',name : 'fqsj', sortable : false,width : 100},
            {label : '截止时间',name : 'jzrq',sortable : false, width : 100 }//,
            // {label : '审核人',name : 'shrmc',sortable : false,width : 100 } ,
            // {label : '审核时间',name : 'shsj',sortable : false,width : 100}
        ],
        pager : '#pager1'
        ,viewrecords: true
    });


    $("#table2").jqGrid({
        url : URL_TABLE2,
        datatype : "json",
        mtype : "post",
        height : $('body').height() -85 ,
        width : $('body').width() - 22,
        rownumbers : true,
        shrinkToFit : true,
        rowNum : 99999999,
        rowList : [ 10, 20, 30 ],
        colModel : [
            {label : 'chosenid',name : 'chosenid',hidden : true,key : true },
            {label : 'btys',name : 'btys',hidden : true},
            {label : 'sfyd2',name : 'sfyd2',hidden : true},
            {label : 'shyj',name : 'shyj',hidden : true},
            {label : '操作',name : 'fmt', width : 180,align : 'center',sortable : false,
                formatter : function(cellvalue, options, rowObject) {
                    return '<button class="btn btn-link btn-xs " type="button" onclick="viewOrVerifyNotice(2,\'' + rowObject.chosenid + '\')" title=""><i class="fa fa-info"></i> 公告详细</button>'
                        +      '<button class="btn btn-link btn-xs " type="button" onclick="openComments(\'' + rowObject.chosenid + '\',\'' + rowObject.shyj + '\')" title=""><i class="fa fa-comment"></i> 审核意见</button>';
                }
            },
            {label : '公告标题',name : 'bt',width : 300,sortable:false,
                formatter : function(cellvalue, options, rowObject) {
                    var style = "color:"+rowObject.btys;
                    var remind = "";
                    if(rowObject.sfyd2 == 0){
                        remind = "<span class='label label-primary'>未读</span>&nbsp;&nbsp;";
                    }
                    return remind + '<span style="'+style+'">'+cellvalue+'</span>';
                }
            },
            {label : '评查类型',name : 'pclx',align : 'center',sortable:false,width : 100},
            {label : '发布人',name : 'fqrmc',sortable:false,width : 100},
            {label : '发布时间',name : 'fqsj',sortable:false,width : 100},
            {label : '审核人',name : 'shrmc',sortable:false,width : 100} ,
            {label : '审核时间',name : 'shsj', sortable:false, width : 100}
        ],
        loadComplete:function (xhr) {
            var count = 0;
            var data = $("#table2").jqGrid('getRowData');
            for(var i = 0 ; data && i < data.length ; i ++){
                if(data[i].sfyd2 == 0){
                    count++;
                }
            }
            $("#label_remind").html(count);
        }
    });

    $("#xbtn_refresh").click(function () {
        reloadGrid();
        reloadGrid2();
        layer.msg("刷新成功!",{icon:1});
    });

});

function reloadGrid() {
    $("#table1").jqGrid().setGridParam({
        url : URL_TABLE1,
        page : 1
    }).trigger("reloadGrid");
}

function reloadGrid2() {
    $("#table2").jqGrid().setGridParam({
        url : URL_TABLE2,
        page : 1
    }).trigger("reloadGrid");
    top.loadBadges();
}


function viewOrVerifyNotice(mode,ggid) {
    $.ajax({
        type : 'POST',
        url : URL_SETREAD,
        data:{
            ggid:ggid,
            type:"2"
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
                    reloadGrid2();
                    layer.close(index);
                }
            });
        }
    });


}

function openComments(ggid,shyj) {
    $.ajax({
        type : 'POST',
        url : URL_SETREAD,
        data:{
            ggid:ggid,
            type:"2"
        },
        datatype : 'json',
        success : function(data) {
            layer.open({
                type : 1,
                shift : 5,
                title : "查看审核意见",
                shadeClose : false,
                shade : 0.3,
                area : [ '400px', '200px' ],
                content : shyj,
                cancel : function(index) {
                    reloadGrid();
                    reloadGrid2();
                    layer.close(index);
                }

            });
        }
    });
}
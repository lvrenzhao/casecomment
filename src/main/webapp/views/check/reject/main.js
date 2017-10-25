var URL_TABLE1 =  ahcourt.ctx + "/case/verifing.do";
var URL_TABLE2 =  ahcourt.ctx + "/case/reject.do";
var URL_SETREAD = ahcourt.ctx + '/case/setread.do';

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
            {label : 'checkid',name : 'checkid',hidden : true,key : true },
            {label : 'btys',name : 'btys',hidden : true},
            {label : '操作',name : 'ggid',width : 80,align : 'center',sortable : false,
                formatter : function(cellvalue, options, rowObject) {
                    return '<button class="btn btn-link btn-xs " type="button" onclick="openCases(5,\'' + rowObject.checkid + '\')" title="查看公告详细"><i class="fa fa-info"></i> 公告详细</button>'
                }
            },
            {label : '公告标题',name : 'bt',width : 300,sortable:false,
                formatter : function(cellvalue, options, rowObject) {
                    var style = "color:"+rowObject.btys;
                    return '<span style="'+style+'">'+cellvalue+'</span>';
                }
            },
            {label : '评查类型',name : 'pclx',align : 'center',sortable:false,width : 100},
            {label : '评查任务',name : 'pcrw',align : 'center',sortable:false,width : 100},
            {label : '发布人',name : 'fqrmc',sortable:false,width : 100},
            {label : '发布时间',name : 'fqsj',sortable:false,width : 100}
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
            {label : 'checkid',name : 'checkid',hidden : true,key : true },
            {label : 'btys',name : 'btys',hidden : true},
            {label : 'sfyd2',name : 'sfyd2',hidden : true},
            {label : 'shyj',name : 'shyj',hidden : true},
            {label : '操作',name : 'ggid', width : 180,align : 'center',sortable : false,
                formatter : function(cellvalue, options, rowObject) {
                    return '<button class="btn btn-link btn-xs " type="button" onclick="openCases(4,\'' + rowObject.checkid + '\')" title=""><i class="fa fa-info"></i> 公告详细</button>'
                    +      '<button class="btn btn-link btn-xs " type="button" onclick="openComments(\'' + rowObject.checkid + '\',\'' + rowObject.shyj + '\')" title=""><i class="fa fa-comment"></i> 审核意见</button>';
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
            {label : '评查任务',name : 'pcrw',align : 'center',sortable:false,width : 100},
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
        reloadGrid1();
        reloadGrid2();
        layer.msg("刷新成功!",{icon:1});
    });

});

function reloadGrid1() {
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
}


function openCases(mode,ggid) {
    layer.open({
        type : 2,
        shift : 5,
        title : mode==1?"审核案件评查公告":"查看审核评查公告",
        shadeClose : false,
        shade : 0.3,
        area : [ '95%', '90%' ],
        content : ahcourt.ctx + '/views/check/start/details.jsp?ggid=' + ggid+"&mode="+mode,
        cancel : function(index) {
            layer.close(index);
            reloadGrid2();
        }

    });
}

function openComments(ggid,shyj) {
    layer.open({
        type : 1,
        shift : 5,
        title : "查看审核意见",
        shadeClose : false,
        shade : 0.3,
        area : [ '400px', '200px' ],
        content : shyj,
        cancel : function(index) {
            layer.close(index);
            $.ajax({
                type : 'POST',
                url : URL_SETREAD,
                data:{
                    ggid:ggid,
                    type:"4"
                },
                datatype : 'json',
                success : function(data) {
                    reloadGrid2();
                }
            });
        }

    });
}


//============================================================
$(function () {
    $("#table1").jqGrid({
        url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
        datatype : "json",
        mtype : "post",
        height : $('body').height() -125 ,
        width : $('body').width() - 22,
        rownumbers : true,
        shrinkToFit : true,
        rowNum : 20,
        rowList : [ 10, 20, 30 ],
        colModel : [ {
            label : 'ggid',
            name : 'ggid',
            hidden : true,
            key : true
        },{
            label : 'btys',
            name : 'btys',
            hidden : true
        },{
            label : 'sfyd',
            name : 'sfyd',
            hidden : true
        },{
            label : '操作',
            name : 'ggid',
            width : 180,
            align : 'center',
            sortable : false,
            formatter : function(cellvalue, options, rowObject) {
                return '<button class="btn btn-link btn-xs " type="button" onclick="viewOrVerifyNotice(2,\'' + rowObject.ggid + '\')" title="查看公告详细"><i class="fa fa-info"></i> 公告详细</button>'
                +      '<button class="btn btn-link btn-xs " type="button" onclick="openComments(\'' + rowObject.ggid + '\',\'' + 'test' + '\')" title="查看公告详细"><i class="fa fa-comment"></i> 审核意见</button>';
            }
        }, {
            label : '公告标题',
            name : 'ggbt',
            width : 300,
            formatter : function(cellvalue, options, rowObject) {
                var style = "";
                if(rowObject.btys == 2){
                    style = "color:red"
                }
                var remind = "";
                if(rowObject.sfyd == 2){
                    remind = "<span class='label label-primary'>未读</span>&nbsp;&nbsp;";
                }
                return remind + '<span style="'+style+'">'+cellvalue+'</span>';
            }
        },{
            label : '评选类型',
            name : 'pclx',
            align : 'center',
            width : 100
        }, {
            label : '发布人',
            name : 'fbsj',
            width : 100
        },{
            label : '发布时间',
            name : 'fbsj',
            width : 100
        }, {
            label : '截止时间',
            name : 'pclx',
            width : 100
        },  {
            label : '审核人',
            name : 'shr',
            width : 100
        } , {
            label : '审核时间',
            name : 'shsj',
            width : 100
        }],
        pager : '#pager1'
        ,viewrecords: true
    });
});

function reloadGrid() {
    $("#table1").jqGrid().setGridParam({
        url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
        postData:{
        },
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
        }

    });
}

function viewOrVerifyNotice(mode,ggid) {
    layer.open({
        type : 2,
        shift : 5,
        title : mode==1?"审核案件评查公告":"查看审核评查公告",
        shadeClose : false,
        shade : 0.3,
        area : [ '95%', '90%' ],
        content : ahcourt.ctx + '/views/chosen/start/main.jsp?ggid=' + ggid+"&mode="+mode,
        cancel : function(index) {
            layer.close(index);
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
            reloadGrid();
        }

    });
}
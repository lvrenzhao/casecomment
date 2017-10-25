
var URL_TABLE1 = ahcourt.ctx + "/chosen/worktodo.do";
var URL_TABLE2 = ahcourt.ctx + "/chosen/workdone.do";

//============================================================
$(function () {
    loadUnCheckGrid();
    loadCheckedGrid();
    $("#btn_query").click(function () {
        reloadCheckedGrid();
    });

    $("#xbtn_refresh").click(function () {
        reloadUnCheckGrid();
        reloadCheckedGrid();
        layer.msg("刷新成功!",{icon:1});
    });
});


function loadUnCheckGrid() {
    $("#table1").jqGrid({
        url : URL_TABLE1,
        datatype : "json",
        mtype : "post",
        height : $('body').height() -125,
        width : $('body').width() - 10,
        rownumbers : true,
        shrinkToFit : false,
        rowNum : 20,
        rowList : [ 10, 20, 30 ],
        colModel : [
            {label : 'remarks',name : 'remarks',hidden : true,key : true,frozen:true},
            {label : 'ccid',name : 'ccid',hidden : true, frozen:true},
            {label : 'ajid',name : 'ajid',hidden : true, frozen:true},
            {label : 'sfzz',name : 'sfzz',hidden : true, frozen:true},
            {label : 'jydp',name : 'jydp',hidden : true, frozen:true},
            {label : 'pczt',name : 'pczt',hidden : true, frozen:true},
            {label : 'chosenid',name : 'chosenid',hidden : true, frozen:true},
            {label : 'relatedcasecount',name : 'relatedcasecount',hidden : true, frozen:true},
            {label : '操作',name : 'fmt', width : 80, align : 'center',sortable : false,
                formatter : function(cellvalue, options, rowObject) {
                    // if(rowObject.sfzz == "1" && rowObject.jydp && rowObject.jydp.length>0){
                    if(rowObject.sfzz == "1" && rowObject.pczt == "2"){
                        return '<button class="btn btn-primary btn-xs " type="button" onclick="comment(1,\'' + rowObject.ccid + '\')"><i class="fa fa-commenting-o"></i> 合议</button>';
                    }else{
                        return '<button class="btn btn-link btn-xs " type="button" onclick="check(1,\'' + rowObject.ccid + '\')"><i class="fa fa-balance-scale"></i> 评查</button>';
                    }
                },
                frozen:true
            },
            {label : '案号',name : 'ah',frozen : true,sortable:false,width : 150,formatter:function (cellvalue,options,rowObject) {
                if(rowObject.relatedcasecount > 0){

                    return '<a href="javascript:;" onclick="viewRelated(\'' + rowObject.ajid + '\')"><span class="fa fa-tags"></span></a> '+cellvalue;
                }else{
                    return cellvalue;
                }
            }},
            {label : '所属评查公告',name : 'bt', sortable:false,width : 200,formatter:function (cellvalue,options,rowObject) {
                return '<a href="javascript:;" onclick="openCases(2,\'' + rowObject.chosenid + '\')">'+cellvalue+'</a>';
            }},
            {label : '评查组长',name : 'teamleadername',sortable:false,width : 80},
            {label : '评查组员',name : 'teammatenames',sortable:false,width : 200},
            {label : '归属法院',name : 'gsfy',sortable:false,width : 100},
            {label : '承办部门',name : 'cbbm',sortable:false,width : 100},
            {label : '承办人',name : 'cbr',sortable:false,width : 80},
            {label : '性质',name : 'xz',sortable:false,width : 80 },
            {label : '类型',name : 'lx',sortable:false,width : 80 },
            {label : '案由', name : 'ay',sortable:false,width : 150 },
            {label : '结案方式',name : 'jafs',sortable:false,width : 80},
            {label : '结案时间',name : 'jasj',sortable:false,width : 80}
        ],
        pager : '#pager1'
        ,viewrecords: true
    }).jqGrid('setFrozenColumns');;
}

function loadCheckedGrid() {
    $("#table2").jqGrid({
        url : URL_TABLE2,
        datatype : "json",
        mtype : "post",
        height : $('body').height() -190,
        width : $('body').width() - 10,
        rownumbers : true,
        shrinkToFit : false,
        rowNum : 20,
        rowList : [ 10, 20, 30 ],
        colModel : [
            {label : 'remarks',name : 'remarks',hidden : true,key : true,frozen:true},
            {label : 'ccid',name : 'ccid',hidden : true, frozen:true},
            {label : 'ajid',name : 'ajid',hidden : true, frozen:true},
            {label : 'chosenid',name : 'chosenid',hidden : true, frozen:true},
            {label : 'relatedcasecount',name : 'relatedcasecount',hidden : true, frozen:true},
            {label : '操作',name : 'fmt',width : 180,align : 'center',sortable : false,frozen:true,
                formatter : function(cellvalue, options, rowObject) {
                    return '<button class="btn btn-link btn-xs " type="button" onclick="comment(2,\'' + rowObject.ccid + '\')" ><i class="fa fa-info"></i> 评查详情</button>'
                        +      '<button class="btn btn-link btn-xs " type="button" onclick="check(3,\'' + rowObject.ajid + '\',\'' + rowObject.ccid + '\')"><i class="fa fa-dedent"></i> 案件资料</button>';
                }
            },
            {label : '案号',name : 'ah',frozen : true,sortable:false,width : 150,formatter:function (cellvalue,options,rowObject) {
                if(rowObject.relatedcasecount > 0){

                    return '<a href="javascript:;" onclick="viewRelated(\'' + rowObject.ajid + '\')"><span class="fa fa-tags"></span></a> '+cellvalue;
                }else{
                    return cellvalue;
                }
            }},
            {label : '所属评查公告',name : 'bt', sortable:false,width : 200,formatter:function (cellvalue,options,rowObject) {
                return '<a href="javascript:;" onclick="openCases(2,\'' + rowObject.chosenid + '\')">'+cellvalue+'</a>';
            }},
            {label : '合议评选得分',name : 'zzpxdf',sortable : false,width : 100},
            {label : '评选时间',name : 'dpsj',sortable : false,width : 100},
            {label : '评查组长',name : 'teamleadername',sortable:false, width : 80 },
            {label : '评查组员',name : 'teammatenames',sortable:false,width : 200},
            {label : '归属法院',name : 'gsfy',sortable:false,width : 200},
            {label : '承办部门',name : 'cbbm',sortable:false,width : 100},
            {label : '承办人',name : 'cbr',sortable:false,width : 80},
            {label : '性质', name : 'xz',sortable:false, width : 80},
            {label : '类型',name : 'lx',sortable:false, width : 80},
            {label : '案由', name : 'ay',sortable:false,width : 150},
            {label : '结案方式',name : 'jafs',sortable:false, width : 80},
            {label : '结案时间',name : 'jasj',sortable:false, width : 80 }
        ],
        pager : '#pager2'
        ,viewrecords: true
    });//.jqGrid('setFrozenColumns');;
}

function reloadUnCheckGrid() {
    $("#table1").jqGrid().setGridParam({
        url : URL_TABLE1,
        page : 1
    }).trigger("reloadGrid");
    top.loadBadges();
}

function reloadCheckedGrid() {
    $("#table2").jqGrid().setGridParam({
        url : URL_TABLE2,
        postData:{
            bt:$("#form_inp_bt").val(),
            pclx:$("#form_sel_pclx").val(),
            fqsj1:$("#form_inp_fqsj1").val(),
            fqsj2:$("#form_inp_fqsj2").val(),
            fqrmc:$("#form_inp_fqrmc").val()
        },
        page : 1
    }).trigger("reloadGrid");
}


function check(mode,ajid,ccid) {
    layer.open({
        type : 2,
        shift : 5,
        title : '案件评查',
        shadeClose : false,
        shade : 0.3,
        area : [ '90%', '90%' ],
        content : ahcourt.ctx + '/views/check/work/check.jsp?type=2&ccid='+ccid+'ajid=' + ajid+"&mode="+mode,
        cancel : function(index) {
            layer.close(index);
        }
    });
}

function comment(mode,ccid) {
    layer.open({
        type : 2,
        shift : 5,
        title : mode==1?'案件点评':"查看案件评查详情",
        shadeClose : false,
        shade : 0.3,
        area : [ '90%', '90%' ],
        content : ahcourt.ctx + '/views/check/work/comment.jsp?type=2&ajid=' + ccid+"&mode="+mode,
        cancel : function(index) {
            layer.close(index);
        }
    });
}

function openCases(mode,ggid) {
    layer.open({
        type : 2,
        shift : 5,
        title : mode==1?"审核案件评选公告":"查看审核评选公告",
        shadeClose : false,
        shade : 0.3,
        area : [ '95%', '90%' ],
        content : ahcourt.ctx + '/views/chosen/start/main.jsp?ggid=' + ggid+"&mode="+mode,
        cancel : function(index) {
            layer.close(index);
        }
    });
}


function viewRelated(key) {
    layer.open({
        type : 2,
        shift : 5,
        title : '查看关联案件',
        shadeClose : false,
        shade : 0.3,
        area : [ '90%', '90%' ],
        content : ahcourt.ctx + '/views/check/start/view_relatedcases.jsp?ajid=' + key,
        cancel : function(index) {
            layer.close(index);
        }
    });
}
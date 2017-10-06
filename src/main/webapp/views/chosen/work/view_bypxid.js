//mode:1 = 无评选结果，评选组长，评选组员 ,无按照专家组进行过滤的条件。
//mod:2 = 有评选结果，有评选组长，评选组员，有按照专家组进行过滤的条件

var URL_TABLE1 = ahcourt.ctx + '/chosen/chosencases.do';
var URL_TABLE2 = ahcourt.ctx + '/chosen/groups.do';
var URL_GSFY = ahcourt.ctx + '/chosen/distgsfy.do';
var URL_AJXZ = ahcourt.ctx + '/chosen/distajxz.do';

var mode,ggid;
$(function () {
    mode = $.getUrlParam("mode");
    ggid = $.getUrlParam("ggid");
    if(mode == 1){
        $("#left").hide();
        $("#right").css("cssText","width:100% !important");
    }
    loadGridCases();
    loadGridGroup();

    $.ajax({
        type : 'POST',
        url : URL_GSFY,
        data:{
            ggid:ggid
        },
        datatype : 'json',
        success : function(data) {
            if (data && data.rows && data.rows.length > 0) {
                $("#form_sel_gsfy").each(function() {
                    var html = '<option value="">归属法院</option>';
                    for (var i = 0; i < data.rows.length; i++) {
                        html += '<option ' + 'value="' + data.rows[i].fbx + '">' + data.rows[i].fbxmc + '</option>'
                    }
                    $(this).html(html);
                });
            } else {
                $("#form_sel_gsfy").each(function() {
                    $(this).html('<option value="">归属法院</option>');
                })
            }
        }
    });

    $.ajax({
        type : 'POST',
        url : URL_AJXZ,
        data:{
            ggid:ggid
        },
        datatype : 'json',
        success : function(data) {
            if (data && data.rows && data.rows.length > 0) {
                $("#form_sel_xz").each(function() {
                    var html = '<option value="">案件性质</option>';
                    for (var i = 0; i < data.rows.length; i++) {
                        html += '<option ' + 'value="' + data.rows[i].fbx + '">' + data.rows[i].fbxmc + '</option>'
                    }
                    $(this).html(html);
                });
            } else {
                $("#form_sel_xz").each(function() {
                    $(this).html('<option value="">案件性质</option>');
                })
            }
        }
    });

    $(".xselect").change(function () {
        reloadGridCase();
    });

    $("#btn_clear").click(function () {
        $("#table2").jqGrid().setGridParam({
            url : URL_TABLE2,
            page : 1,
            postData:{
                ggid:ggid
            }
        }).trigger("reloadGrid");
        selectgroupid = "";
        reloadGridCase();
    });

});


function loadGridCases() {
    var cols = [];
    if(mode == 2){
        cols = [
            {label : 'ccid',name : 'ccid',hidden : true, key : true,frozen:true},
            {label : 'chosenid',name : 'chosenid',hidden : true,frozen:true},
            {label : 'ajid',name : 'ajid',hidden : true,frozen:true},
            {label : 'relatedcasecount',name : 'relatedcasecount',hidden : true,frozen:true},
            {label : '案号',name : 'ah', width : 120,sortable:false,frozen : true},
            {label : '关联案件',name : 'fmt',frozen : true,width : 80,sortable:false,formatter:function (cellvalue,options,rowObject) {
                return '<a onclick="viewRelated(\'' + rowObject.ajid + '\')" href="javascript:;">'+rowObject.relatedcasecount+'</a>';
            }},
            {label : '评选得分',name : 'zzpxdf',sortable:false, width : 100},
            {label : '评选时间',name : 'dpsj',sortable:false,width : 100},
            {label : '填报日期', name : 'tbrq',sortable:false,width : 100},
            {label : '推荐理由',name : 'tjly',sortable:false,width : 300,
                formatter:function (cellvalue,options,rowObject) {
                    return '<a href="javascript:;" onclick="ViewComment(\'' + rowObject.tjly + '\')">'+cellvalue+'</a>'
                }
            },
            {label : '归属法院',name : 'gsfy',width : 150,sortable:false},
            {label : '承办部门',name : 'cbbm', width : 100,sortable:false},
            {label : '承办人',name : 'cbr',width : 80,sortable:false},
            {label : '性质',name : 'xz',width : 80 ,sortable:false},
            {label : '类型',name : 'lx',width : 80,sortable:false},
            {label : '案由',name : 'ay',width : 120,sortable:false},
            {label : '结案方式',name : 'jafs', width : 80,sortable:false},
            {label : '结案时间',name : 'jasj', width : 80,sortable:false}
        ]
    }else{
        cols = [
            {label : 'ccid',name : 'ccid',hidden : true, key : true,frozen:true},
            {label : 'chosenid',name : 'chosenid',hidden : true,frozen:true},
            {label : 'ajid',name : 'ajid',hidden : true,frozen:true},
            {label : 'relatedcasecount',name : 'relatedcasecount',hidden : true,frozen:true},
            {label : '案号',name : 'ah', width : 120,sortable:false,frozen : true},
            {label : '关联案件',name : 'fmt',frozen : true,width : 80,sortable:false,formatter:function (cellvalue,options,rowObject) {
                return '<a onclick="viewRelated(\'' + rowObject.ajid + '\')" href="javascript:;">'+rowObject.relatedcasecount+'</a>';
            }},
            {label : '填报日期', name : 'tbrq',sortable:false,width : 100},
            {label : '推荐理由',name : 'tjly',sortable:false,width : 300,
                formatter:function (cellvalue,options,rowObject) {
                    return '<a href="javascript:;" onclick="ViewComment(\'' + rowObject.tjly + '\')">'+cellvalue+'</a>'
                }
            },
            {label : '归属法院',name : 'gsfy',width : 150,sortable:false},
            {label : '承办部门',name : 'cbbm', width : 100,sortable:false},
            {label : '承办人',name : 'cbr',width : 80,sortable:false},
            {label : '性质',name : 'xz',width : 80 ,sortable:false},
            {label : '类型',name : 'lx',width : 80,sortable:false},
            {label : '案由',name : 'ay',width : 120,sortable:false},
            {label : '结案方式',name : 'jafs', width : 80,sortable:false},
            {label : '结案时间',name : 'jasj', width : 80,sortable:false}
        ]
    }
    $("#table1").jqGrid({
        url : URL_TABLE1,
        postData:{
            ggid:ggid
        },
        datatype : "json",
        mtype : "post",
        multiselect : true,
        height : $('body').height() - 145,
        width : mode == 1 ? ($('body').width() -10) : ($('body').width() * 0.65-10),
        rownumbers : true,
        shrinkToFit : false,
        rowNum : 100000000,
        colModel : cols
    }).jqGrid('setFrozenColumns');
}

function reloadGridCase() {
    $("#table1").jqGrid().setGridParam({
        url : URL_TABLE1,
        page : 1,
        postData:{
            ggid:ggid,
            gsfy:$("#form_sel_gsfy").val(),
            xz:$("#form_sel_xz").val(),
            groupid:selectgroupid
        }
    }).trigger("reloadGrid");
}
var selectgroupid="";
function loadGridGroup() {
    $("#table2").jqGrid({
        url : URL_TABLE2,
        postData:{
            ggid:ggid
        },
        datatype : "json",
        mtype : "post",
        height : $('body').height() - 125,
        width : $('body').width() * 0.35,
        shrinkToFit : true,
        rowNum : 20,
        colModel : [
            {label : 'cgid',name : 'cgid',hidden : true,key : true,sortable:false,frozen : true},
            {label : 'chosenid',name : 'chosenid',hidden : true,frozen:true},
            {label : '组名',name : 'groupname',width : 100,sortable:false},
            {label : '组长',name : 'teamleadername',width : 80,sortable:false},
            {label : '组员',name : 'teammatenames', width : 200,sortable:false},
            {label : '评查',name : 'pcajs', width : 60,sortable:false},
            {label : '占比',name : 'zb', width : 60,sortable:false}
        ],
        pager:"#pager2",
        onSelectRow:function (rowid,status) {
            selectgroupid = rowid;
            reloadGridCase();
        }
        // ,viewrecords: true
    });//.jqGrid('setFrozenColumns');
}

function ViewComment(content) {
    layer.open({
        type : 1,
        shift : 5,
        title : "查看详细",
        shadeClose : false,
        shade : 0.3,
        area : [ '400px', '280px' ],
        content : content,
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
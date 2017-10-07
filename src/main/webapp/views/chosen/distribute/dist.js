var URL_GSFY = ahcourt.ctx + '/chosen/distgsfy.do';
var URL_AJXZ = ahcourt.ctx + '/chosen/distajxz.do';
var URL_TABLE1 = ahcourt.ctx + '/chosen/chosencases.do';
var URL_TABLE2 = ahcourt.ctx + '/chosen/groups.do';
//获取专家接口
var URL_PROFESSIONALS = ahcourt.ctx + '/setting/professional/listjson.do';

var URL_GROUP_ADD = ahcourt.ctx + '/chosen/groupsave.do';
var URL_GROUP_DEL = ahcourt.ctx + '/chosen/groupdel.do';
var URL_DODIST = ahcourt.ctx + '/chosen/dodist.do';
var URL_REDODIST = ahcourt.ctx + '/chosen/redodist.do';

var ggid;
var lo;
var l_chosen_group;
$(function () {
    ggid = $.getUrlParam("ggid");

    loadGrid2();
    loadGrid3();

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

    $("#btn_chosenCaseToGroup").click(function () {
        if(!$("#from_sel_groups").val()){
            layer.msg("必须选择一个专家组!");
            return false;
        }
        var ids = $("#table2").jqGrid('getGridParam', 'selarrrow');
        $.ajax({
            type : 'POST',
            url : URL_DODIST,
            data:{
                ids:ids.join(";"),
                cgid:$("#from_sel_groups").val(),
                ggid:ggid
            },
            datatype : 'json',
            async : false,
            success : function(data) {
                reloadGrid2();
                reloadGrid3();
            }
        });
        layer.close(l_chosen_group);
    });
    
    $("#btn_chooseTo").click(function () {

        var ids = $("#table2").jqGrid('getGridParam', 'selarrrow');
        if(ids.length == 0){
            layer.msg("请先从待分配案件选择至少一条案件后再分配!");
            return;
        }
        //先动态填充组到选择控件中
        $.ajax({
            type : 'POST',
            url : URL_TABLE2,
            data:{
                ggid:ggid
            },
            datatype : 'json',
            async : false,
            success : function(data) {
                if (data && data.rows && data.rows.length > 0) {
                    $("#from_sel_groups").each(function() {
                        var html = '<option value="">--请选择专家组--</option>';
                        for (var i = 0; i < data.rows.length; i++) {
                            html += '<option ' + 'value="' + data.rows[i].cgid + '">' + data.rows[i].groupname + '</option>'
                        }
                        $(this).html(html);
                    });
                } else {
                    $("#from_sel_groups").each(function() {
                        $(this).html('<option value="">--请选择专家组--</option>');
                    })
                }
            }
        });

        l_chosen_group = layer.open({
            type : 1,
            shift : 5,
            title : '将选中案件分配至...',
            shadeClose : false,
            shade : 0.3,
            area : [ '400px', '200px' ],
            content : $("#div_chooseTo"),
            cancel : function(index) {
                layer.close(index);
            }
        });
    });
    $("#btn_newGroup").click(function () {
        $("#from_ipt_groupname").val("");
        $("#form_ipt_groupid").val("");
        $("#form_hid_pcajs").val("0");
        $("#form_hid_zb").val("0%");
        $("#form_sel_teamleader").find("option").removeAttr("selected");
        $("#form_sel_teamleader").find("option:first").attr("selected","selected");
        $("#form_sel_teamleader").trigger("chosen:updated");
        $("#form_sel_teammate").find("option").removeAttr("selected");
        $("#form_sel_teammate").trigger("chosen:updated");
        lo = layer.open({
            type : 1,
            shift : 5,
            title : '新建组',
            shadeClose : false,
            shade : 0.3,
            area : [ '600px', '400px' ],
            content : $("#div_newGroup"),
            cancel : function(index) {
                layer.close(index);
            }
        });
    });

    $.ajax({
        type : 'POST',
        url : URL_PROFESSIONALS,
        datatype : 'json',
        async : false,
        success : function(data) {
            var html="";
            for (var i = 0; data && data.rows && i < data.rows.length; i++) {
                html += '<option data-xm="'+data.rows[i].xm+'" value="' + data.rows[i].userid + '" >' + data.rows[i].xm + ' (' + data.rows[i].zzjgmc + ')' + '</option>'
            }
            $("#form_sel_teamleader").html("<option>--请选择--</option>"+html);
            $("#form_sel_teammate").html(html);
        }
    });

    for ( var selector in config) {
        $(selector).chosen(config[selector]);
    }
    $(".chosen-choices").css("cssText","height:80px !important");


    $(".xselect").change(function () {
        reloadGrid2();
    });

    $("#btn_savegroup").click(function () {
        if(!$("#from_ipt_groupname").val()){
            layer.msg("组名不能为空!");
            return false;
        }
        if(!$("#form_sel_teamleader").val()){
            layer.msg("组长不能为空!");
            return false;
        }
        if("--请选择--" == $("#form_sel_teamleader").val()){
            layer.msg("组长不能为空!");
            return false;
        }
        layer.close(lo);
        var tms = "";
        $("#form_sel_teammate").find("option:selected").each(function () {
            tms += $(this).attr("data-xm")+";"
        });

        $.ajax({
            type : 'POST',
            url : URL_GROUP_ADD,
            data:{
                cgid:$("#form_ipt_groupid").val()?$("#form_ipt_groupid").val():"",
                chosenid:ggid,
                groupname:$("#from_ipt_groupname").val(),
                pcajs:$("#form_hid_pcajs").val(),
                zb:$("#form_hid_zb").val(),
                teamleaderid:$("#form_sel_teamleader").val(),
                teamleadername:$("#form_sel_teamleader").find("option:selected").attr("data-xm"),
                teammateids:$("#form_sel_teammate").val()?$("#form_sel_teammate").val().join(";"):"",
                teammatenames:tms
            },
            datatype : 'json',
            success : function(data) {
                layer.msg("操作成功!",{icon:1});
                reloadGrid3();
            }
        });
    });

});

function loadGrid2() {
    $("#table2").jqGrid({
        url : URL_TABLE1,
        postData:{
            ggid:ggid,
            undisted:"1"
        },
        datatype : "json",
        mtype : "post",
        multiselect : true,
        height : $('body').height() - 193,
        width : $('body').width() * 0.5-10,
        rownumbers : true,
        shrinkToFit : false,
        rowNum : 100000000,
        colModel : [
            {label : 'ccid',name : 'ccid',hidden : true, key : true,frozen:true},
            {label : 'chosenid',name : 'chosenid',hidden : true,frozen:true},
            {label : 'ajid',name : 'ajid',hidden : true,frozen:true},
            {label : 'relatedcasecount',name : 'relatedcasecount',hidden : true,frozen:true},
            // {label : '-',name : 'ajid', width : 40,align:'center',sortable:false,frozen : true,formatter:function(cellvalue, options, rowObject) {
            //     return '<button class="btn btn-link btn-xs " type="button" onclick=""><i class="fa fa-trash"></i> </button>';
            // }},
            // {label : '检',name : 'ajid', width : 40,align:'center',sortable:false,frozen : true,formatter:function(cellvalue, options, rowObject) {
            //     return '<div style="padding-top:3px"><i style="color: orange;" class="fa fa-warning"></i></div>';
            // }},

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
        // ,pager:"#pager2",
        // viewrecords: true
    });//.jqGrid('setFrozenColumns');
}

function reloadGrid2() {
    $("#table2").jqGrid().setGridParam({
        url : URL_TABLE1,
        page : 1,
        postData:{
            ggid:ggid,
            gsfy:$("#form_sel_gsfy").val(),
            xz:$("#form_sel_xz").val()
        }
    }).trigger("reloadGrid");
}

function loadGrid3() {
    $("#table3").jqGrid({
        url : URL_TABLE2,
        postData:{
            ggid:ggid
        },
        datatype : "json",
        mtype : "post",
        height : $('body').height() - 175,
        width : $('body').width() * 0.45-10,
        shrinkToFit : true,
        rowNum : 20,
        colModel : [
            {label : 'cgid',name : 'cgid',hidden : true,key : true,sortable:false,frozen : true},
            {label : 'chosenid',name : 'chosenid',hidden : true,frozen:true},
            {label : 'teamleaderid',name : 'teamleaderid',hidden : true,frozen:true},
            {label : 'teammateids',name : 'teammateids',hidden : true,frozen:true},
            {label : '操作',name : 'fmt', width : 90,sortable:false,frozen : true,formatter:function(cellvalue, options, rowObject) {
                return '<button class="btn btn-link btn-xs " type="button" onclick="editProGroup(\'' + rowObject.cgid + '\',\'' + rowObject.groupname + '\',\'' + rowObject.teamleaderid + '\',\'' + rowObject.teammateids + '\',\'' + rowObject.pcajs + '\',\'' + rowObject.zb + '\')" title="编辑"><i class="fa fa-edit"></i> </button>'
                    +  '<button class="btn btn-link btn-xs " type="button" onclick="removeProGroup(\'' + rowObject.cgid + '\')" title="移除"><i class="fa fa-trash"></i> </button>';
            }},
            {label : '组名',name : 'groupname',width : 100,sortable:false},
            {label : '组长',name : 'teamleadername',width : 80,sortable:false},
            {label : '组员',name : 'teammatenames', width : 200,sortable:false},
            {label : '评查',name : 'pcajs', width : 60,sortable:false},
            {label : '占比',name : 'zb', width : 60,sortable:false}
        ],
        pager:"#pager3",
        subGrid : true,
        subGridRowExpanded : initChildGrid1,
        subGridOptions : {
            "plusicon" : "fa fa-plus",
            "minusicon" : "fa fa-minus",
            "expandOnLoad" : false
        }
        // ,viewrecords: true
    });//.jqGrid('setFrozenColumns');
}

function initChildGrid1(parentRowID, parentRowKey) {
    var tabid = parentRowID + "_table";
    $('#' + parentRowID).append('<table id="' + tabid + '"></table>');
    $("#" + tabid).jqGrid({
        url : URL_TABLE1,
        datatype : "json",
        mtype : "post",
        postData:{
            ggid:ggid,
            groupid:parentRowKey
        },
        height : 150,
        width : $('body').width() * 0.45 - 60,
        autowidth : true,
        shrinkToFit : false,
        rowNum : 100000,
        colModel : [
            {label : 'ccid',name : 'ccid',hidden : true,key : true,sortable:false,frozen : true},
            {label : 'ajid',name : 'ajid',hidden : true,sortable:false,frozen : true},
            {label : 'teamid',name : 'teamid',hidden : true,sortable:false,frozen : true},
            {label : 'ah',name : 'ah',hidden : true,sortable:false,frozen : true},
            {label : 'relatedcasecount',name : 'relatedcasecount',hidden : true,sortable:false,frozen : true},
            {label : '-',name : 'fmt1', width : 40,align:'center',sortable:false,frozen : true,formatter:function(cellvalue, options, rowObject) {
                return '<button class="btn btn-link btn-xs " type="button" onclick="reChooseCasesByCase(\'' + rowObject.ccid + '\')"><i class="fa fa-long-arrow-left"></i> </button>';
            }},
            {label : '案号',name : 'fmt2', width : 120,sortable:false,frozen : true,formatter:function (cellvalue,options,rowObject) {
                return '<a href="javascript:;" onclick="check(3,\'' + cellvalue + '\')">'+rowObject.ah+'</a>'
            }},
            {label : '关联案件',name : 'fmt',frozen : true,width : 80,sortable:false,align:'right',
                formatter:function (cellvalue,options,rowObject) {
                    return '<a onclick="viewRelated(\'' + rowObject.ajid + '\')" href="javascript:;">'+rowObject.relatedcasecount+'</a>';
                }
            },
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
    });
}


function reloadGrid3() {
    $("#table3").jqGrid().setGridParam({
        url : URL_TABLE2,
        page : 1,
        postData:{
            ggid:ggid
        }
    }).trigger("reloadGrid");
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

function check(mode,ajid) {
    layer.open({
        type : 2,
        shift : 5,
        title : '案件评查',
        shadeClose : false,
        shade : 0.3,
        area : [ '90%', '90%' ],
        content : ahcourt.ctx + '/views/check/work/check.jsp?ajid=' + ajid+"&mode="+mode,
        cancel : function(index) {
            layer.close(index);
        }
    });
}



var config = {
    '.chosen-select' : {},
    '.chosen-select-deselect' : {
        allow_single_deselect : true
    },
    '.chosen-select-no-single' : {
        disable_search_threshold : 10
    },
    '.chosen-select-no-results' : {
        no_results_text : 'Oops, nothing found!'
    },
    '.chosen-select-width' : {
        width : "95%"
    }
};

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


function editProGroup(cgid,groupname,teamleaderid,teammateids,pcajs,zb) {
    lo = layer.open({
        type : 1,
        shift : 5,
        title : '编辑组',
        shadeClose : false,
        shade : 0.3,
        area : [ '600px', '400px' ],
        content : $("#div_newGroup"),
        cancel : function(index) {
            layer.close(index);
        },
        success:function () {
            //设置form
            $("#from_ipt_groupname").val(groupname);
            $("#form_ipt_groupid").val(cgid);
            $("#form_hid_pcajs").val(pcajs);
            $("#form_hid_zb").val(zb);
            $("#form_sel_teamleader").find("option").removeAttr("selected");
            $("#form_sel_teamleader").val(teamleaderid);
            $("#form_sel_teamleader").trigger("chosen:updated");
            var teanmates = teammateids ? teammateids.split(";"):[];
            $("#form_sel_teammate").find("option").removeAttr("selected");
            $("#form_sel_teammate").val(teanmates);
            $("#form_sel_teammate").trigger("chosen:updated");
        }
    });
}
function removeProGroup(id) {
    layer.confirm('确认删除该专家组吗？', {
        btn : [ '确认', '取消' ]
    }, function(lo) {
        layer.close(lo);
        $.ajax({
            type : 'POST',
            url : URL_GROUP_DEL,
            data:{
                groupid:id
            },
            datatype : 'json',
            success : function(data) {
                layer.msg("删除专家组成功",{icon:1});
                reloadGrid3();
                reloadGrid2();
            }
        });
    });
}

function reChooseCasesByCase(caseid) {
    $.ajax({
        type : 'POST',
        url : URL_REDODIST,
        data:{
            ccid:caseid
        },
        datatype : 'json',
        success : function(data) {
            reloadGrid2();
            reloadGrid3();
        }
    });
}



//=======================
// function addProGroup(groupObject){
//
// }


// function editProGroup(id) {
//     lo = layer.open({
//         type : 1,
//         shift : 5,
//         title : '编辑组',
//         shadeClose : false,
//         shade : 0.3,
//         area : [ '600px', '400px' ],
//         content : $("#div_newGroup"),
//         cancel : function(index) {
//             layer.close(index);
//         },
//         success:function () {
//             var groupObj = null;
//             for(var i = 0 ; teams && i < teams.length ; i ++){
//                 if(teams[i].id == id){
//                     groupObj = teams[i];
//                     break;
//                 }
//             }
//             //设置form
//             $("#from_ipt_groupname").val(groupObj.name);
//             $("#form_ipt_groupid").val(groupObj.id);
//             $("#form_sel_teamleader").find("option").removeAttr("selected");
//             $("#form_sel_teamleader").val(groupObj.teamleaderid);
//             $("#form_sel_teamleader").trigger("chosen:updated");
//             var teanmates = groupObj.teammateids ? groupObj.teammateids.split(";"):[];
//             $("#form_sel_teammate").find("option").removeAttr("selected");
//             $("#form_sel_teammate").val(teanmates);
//             $("#form_sel_teammate").trigger("chosen:updated");
//         }
//     });
// }

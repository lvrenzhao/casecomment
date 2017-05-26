var mode, zNodes;
$(function(){
    //加载组织机构相关代码
    $.ajax({
        type : 'POST',
        url : ahcourt.ctx + "/setting/organization/getlist.do?remarks="+$("#hid_zzid").val(),
        datatype : 'json',
        async : false,
        success : function(data) {
            zNodes = data;
        }
    });
    $('#btn_clearorgs').click(function(){
        $('#citySel').val("");
        $("#zzid").val("");
    });
    $.fn.zTree.init($("#treeDemo"), setting, zNodes);
    $("#menuBtn").click(function() {
        showMenu();
        return false;
    });
    //展开和收缩查询控件相关逻辑代码
    $("#btn-beginextract").click(function() {
        $(".moreview").show();
        $(this).hide();
        $("#btn-endextract").show();
        $("#btn-extract-group").show();
        $("#btn-extract-checked").show();
        $('#table1').setGridHeight($('body').height()-445);
    });
    $("#btn-endextract").click(function() {
        $(".moreview").hide();
        $(this).hide();
        $("#btn-open").show();
        $('#table1').setGridHeight($('body').height()-185);
    });
    $("#btn-open").click(function() {
        $(".moreview").show();
        $(this).hide();
        $("#btn-endextract").show();
        $('#table1').setGridHeight($('body').height()-445);
    });
    $("#btn-endextract2").click(function() {
        $(".viewmore2").hide();
        $(this).hide();
        $("#btn-open2").show();
        $('#table2').setGridHeight($('body').height()-270);
    });
    $("#btn-open2").click(function() {
        $(".viewmore2").show();
        $(this).hide();
        $("#btn-endextract2").show();
        $('#table2').setGridHeight($('body').height()-400);
    });
    //icheck 初始化
    $('.i-checks').iCheck({
        radioClass : 'iradio_square-green',
        checkboxClass : 'icheckbox_square-green',
    });


    $("#table1").jqGrid({
//            url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
        datatype : "json",
        mtype : "post",
        multiselect : true,
        height : gridHeight(),
        width : gridWidth(),
        rownumbers : true,
        shrinkToFit : true,
        rowNum : 20,
        colModel : [ {
                label : 'ajid',
                name : 'ajid',
                hidden : true,
                key : true,
                frozen : true
            }, {
                label : 'ggid',
                name : 'ggid',
                hidden : true,
                frozen : true
            },{
                label : '案号',
                name : 'xmmc',
                frozen : true,
                width : 100
            }, {
                label : '归属法院',
                name : 'xmzt',
                width : 150
            }, {
                label : '承办部门',
                name : 'htmc',
                width : 100
            }, {
                label : '承办人',
                name : 'xmlxmc',
                width : 80
            }, {
                label : '性质',
                name : 'zylbmc',
                width : 80
            },{
                label : '类型',
                name : 'zylbmc',
                width : 80
            }, {
                label : '案由',
                name : 'xmfzrmc',
                width : 120
            }, {
                label : '结案方式',
                name : 'xmjlmc',
                width : 80
            }, {
                label : '结案时间',
                name : 'xmcymc',
                width : 80
            }
        ],
        pager:"#pager1",
        viewrecords: true
    });




    $("#table2").jqGrid({
        // url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
        datatype : "json",
        mtype : "post",
        height : $('body').height() -270,
        width : gridWidth(),
        rownumbers : true,
        shrinkToFit : true,
        rowNum : 1000000,
        colModel : [ {
            label : 'ajid',
            name : 'ajid',
            hidden : true,
            key : true,
            frozen : true
        }, {
            label : 'ggid',
            name : 'ggid',
            hidden : true,
            frozen : true
        },{
            label : '操作',
            name : 'ggid',
            width : 170,
            align : 'center',
            sortable : false,
            formatter :formatter_grid2_opt_1 ,
            frozen : true
        },{
            label : '案号',
            name : 'ah',
            frozen : true,
            formatter:formatter_grid2_opt_2,
            width : 100
        }, {
            label : '归属法院',
            name : 'xmzt',
            width : 150
        }, {
            label : '承办部门',
            name : 'htmc',
            width : 100
        }, {
            label : '承办人',
            name : 'xmlxmc',
            width : 80
        }, {
            label : '性质',
            name : 'zylbmc',
            width : 80
        },{
            label : '类型',
            name : 'zylbmc',
            width : 80
        },  {
            label : '案由',
            name : 'xmfzrmc',
            width : 120
        }, {
            label : '结案方式',
            name : 'xmjlmc',
            width : 80
        }, {
            label : '结案时间',
            name : 'xmcymc',
            width : 80
        }, {
            label : '分配专家',
            name : 'xmcymc',
            width : 80
        }
        ],
        pager:"#pager2",
        viewrecords: true
    });
});




//=====================================辅助代码=================================
function gridWidth() {
    return $('body').width() - 22;
}
function gridHeight() {
    return $('body').height() -185;
}

function formatter_grid2_opt_1(cellvalue, options, rowObject) {
    return '<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="更换专家"><i class="fa fa-exchange"></i> 更换专家</button>'
        +'<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="移除"><i class="fa fa-trash"></i> 移除</button>';
}

function formatter_grid2_opt_2(cellvalue, options, rowObject) {
    return '<i class="fa fa-warning" style="color:#ff6600;"></i>'+'<a href="javascript:;" onclick="viewupload()">'+cellvalue+'</a>';
}


function viewupload() {
    layer.open({
        type : 2,
        shift : 5,
        title : '查看案件资料',
        shadeClose : false,
        shade : 0.3,
        area : [ '60%', '80%' ],
        content : ahcourt.ctx + '/casecheck/notice/upload.do?ggid=',
        cancel : function(index) {
            layer.close(index);
        }
    });
}

function openpcgg(){
    layer.open({
        type : 1,
        shift : 5,
        title : '发起评查活动',
        shadeClose : false,
        shade : 0.3,
        area : ['50%', '330px'],
        content : $("#fqpchd"),
        cancel : function(index) {
            layer.close(index);
        }
    });
}


// 选择组织机构
var setting = {
    view : {dblClickExpand : false},
    data : {simpleData : { enable : true}},
    callback : { onClick : onClick}
};
function onClick(e, treeId, treeNode) {
    var zTree = $.fn.zTree.getZTreeObj("treeDemo"), nodes = zTree.getSelectedNodes(), v = "", zzid = "";
    nodes.sort(function compare(a, b) {
        return a.id - b.id;
    });
    v += nodes[0].name;
    zzid = nodes[0].id;
    if (v.length > 0)
        v = v.substring(0, v.length);
    var cityObj = $("#citySel");
    cityObj.val(v);
    $("#zzid").val(zzid);
    cityObj.removeClass("border-red");
    hideMenu();
}
function showMenu() {
    $("#menuContent").slideDown("fast");
    $("body").bind("mousedown", onBodyDown);
}
function hideMenu() {
    $("#menuContent").fadeOut("fast");
    $("body").unbind("mousedown", onBodyDown);
}
function onBodyDown(event) {
    if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length > 0)) {
        hideMenu();
    }
}

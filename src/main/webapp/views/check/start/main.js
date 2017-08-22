//获取组织机构接口
var URL_ORGS = ahcourt.ctx + "/setting/organization/getlist.do";
//案件库接口，接受多个查询条件
var URL_CASES = ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json';
//获取随机的案件
var URL_RANDOM_CASES = ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json';

//获取ztree中选中节点的下级节点名称,返回数组
function getSubCourtNameBYSelectedCourt() {

}

var currentFormValues = {};
//对比抽案表单是否发生条件变更，如存在变更需重新刷新表格。
function formChanged() {
    var newFormValues = getFromValues();
    //todo 进行比较
    currentFormValues = newFormValues;
    return true;
}
//返回抽案表单对象
function getFromValues() {
    var newFormValues = {};
    newFormValues.joinedCaseUniqleNames = getCaseUniqleNames();
}

var joinedCases = [];
//手动抽取
function extractSelectedCases(caselist) {
    addCases(caselist);
    reloadGrid1();
}
//随机抽取
function extractRandomCases(casecount) {
    $.ajax({
        type : 'POST',
        url : URL_RANDOM_CASES,
        datatype : 'json',
        async : false,
        success : function(data) {
            layer.msg("已成功随机抽取"+casecount+"条案件",{icon:1});
            addCases(data);
            reloadGrid1();
        }
    });
}

//将抽取的案件加入到待分配
function addCases(caselist) {
    for(var i =0 ; caselist && i < caselist.length ; i ++){
        joinedCases.push(caselist[i]);
    }
    $("#lbl_joined_case_count").text(joinedCases.length);
}

//从待分配案件中移除
function removeCases() {

}

//获取待分配案件
function getCases() {
    return joinedCases;
}

//获取待分配案件的案号
function getCaseUniqleNames() {
    return [];
}

//刷新待分配案件列表
function refreshJoinedCasesGrid() {
    //根据案件性质，类型，区域，及是否分配属性进行过滤。(取所有未分配的案件)
    $("#table2").jqGrid('clearGridData');
    var cases = getCases();
    for ( var i = 0; i < cases.length; i++){
        $("#table2").jqGrid('addRowData', cases[i].id, cases[i]);
    }
}

//刷新专家组列表
var teams = [];
function refreshTeamGrid() {
    
}

var max_allowed_extract_case_count = 1024;
//============================================================
$(function () {
    //初始化jquery.step组件，分步骤引导用户发起评查活动
    $("#wizard").steps({
        enableCancelButton: false,
        enableFinishButton: true,
        onStepChanging: function (event, currentIndex, newIndex) {
            if(currentIndex == 0 && formChanged()){
                reloadGrid1();
            }
            if(currentIndex == 1 && newIndex == 2){
                refreshJoinedCasesGrid();
                refreshTeamGrid();
            }
            if(currentIndex == 2){
                $(".subforms").css("cssText","background-color:#1AB394 !important;color:#fff !important");
            }else{
                $(".subforms").css("cssText","background-color:#eee !important;color:#aaa !important");
            }
            return true;
        },
        onFinishing:function (event, currentIndex) {
            if(currentIndex < 3){
                return false;
            }
            return true;
        }
    });
    $(".content").css("height",($('body').height()-110)+"px");

    //icheck 初始化
    $('.i-checks').iCheck({
        radioClass : 'iradio_square-green',
        checkboxClass : 'icheckbox_square-green'
    });

    //初始化组织机构选则器
    $.ajax({
        type : 'POST',
        url : URL_ORGS,
        datatype : 'json',
        // async : false,
        success : function(data) {
            var zNodes = data;
            $.fn.zTree.init($("#treeDemo"), setting, zNodes);
            $("#menuBtn").click(function() {
                showMenu();
                return false;
            });
        }
    });
    $('#btn_clearorgs').click(function(){
        $('#citySel').val("");
        $("#zzid").val("");
    });

    //手动选中案件抽取
    $("#btn_extract_checked").click(function () {
        var ids = $("#table1").jqGrid('getGridParam', 'selarrrow');
        if(ids.length == 0){
            layer.msg("未选中任何数据!");
            return;
        }
        layer.confirm('本次选中案件'+ids.length+'条，是否确定抽取？', {
            btn: ['确定','取消'] //按钮
        }, function(index){
            var caselist = [];
            for(var i = 0 ; i< ids.length ; i ++){
                caselist.push($("#table1").jqGrid('getRowData',ids[i]));
            }
            extractSelectedCases(caselist);
            layer.close(index);
        }, function(index){
            layer.close(index);
        });
    });

    $("#btn_extract_random").click(function () {
        var casecount = $("#txt_random").val();
        if(casecount && !isNaN(casecount)){
            var extractedcount = getCases().length;
            if(parseInt(casecount) + extractedcount > max_allowed_extract_case_count){
                layer.msg("一次评查活动最多不允许抽取案件超过1024件。");
                return false;
            }
            var gridrecords = $("#table1").jqGrid('getGridParam','records');
            if(parseInt(casecount)>gridrecords){
                layer.msg("案件库符合条件的案件数量小于要抽取的数量，最多只能随机抽取"+gridrecords+"条。");
                return false;
            }
        }else{
            layer.msg("案件数必须输入整数");
            return false;
        }
        extractRandomCases(casecount);
    });

    //各个表格框架先加载，数据随后加载。
    loadGrid1();
    loadGrid2();
    loadGrid3();

    //初始化富文本控件
    $('.summernote').summernote({
        lang: 'zh-CN',
        height:300
    });

    $("#btn_chooseTo").click(function () {
        layer.open({
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
        layer.open({
            type : 1,
            shift : 5,
            title : '新建组',
            shadeClose : false,
            shade : 0.3,
            area : [ '600px', '300px' ],
            content : $("#div_newGroup"),
            cancel : function(index) {
                layer.close(index);
            }
        });
    });

    for ( var selector in config) {
        $(selector).chosen(config[selector]);
    }
    
    $("#form_sel_region").change(function () {
        refreshJoinedCasesGrid();
    });
    $("#form_sel_lx").change(function () {
        refreshJoinedCasesGrid();
    });
    $("#form_sel_xz").change(function () {
        refreshJoinedCasesGrid();
    });

});



function loadGrid1() {
    $("#table1").jqGrid({
        datatype : "json",
        mtype : "post",
        multiselect : true,
        height : $('body').height() - 230,
        width : $('body').width() ,
        rownumbers : true,
        shrinkToFit : true,
        rowNum : 20,
        colModel : [
            {label : 'ajid',name : 'ajid',hidden : true,key : true,sortable:false,frozen : true},
            {label : 'ggid',name : 'ggid',hidden : true,sortable:false,frozen : true},
            {label : '案号',name : 'xmmc', width : 120,sortable:false,frozen : true},
            {label : '关联案件',name : '',frozen : true,width : 80,sortable:false,formatter:function (cellvalue,options,rowObject) {
                return '<a onclick="viewRelated(\'' + cellvalue + '\')" href="javascript:;">'+cellvalue+'</a>';
            }},
            {label : '归属法院',name : 'xmzt',width : 150,sortable:false},
            {label : '承办部门',name : 'htmc', width : 100,sortable:false},
            {label : '承办人',name : 'xmlxmc',width : 80,sortable:false},
            {label : '性质',name : 'zylbmc',width : 80 ,sortable:false},
            {label : '类型',name : 'zylbmc',width : 80,sortable:false},
            {label : '案由',name : 'xmfzrmc',width : 120,sortable:false},
            {label : '结案方式',name : 'xmjlmc', width : 80,sortable:false},
            {label : '结案时间',name : 'xmcymc', width : 80,sortable:false}
        ],
        pager:"#pager1",
        viewrecords: true
    });
}

function reloadGrid1() {
    $("#table1").jqGrid().setGridParam({
        url : URL_CASES,
        postData:currentFormValues,
        page : 1
    }).trigger("reloadGrid");
}

function loadGrid2() {
    $("#table2").jqGrid({
        datatype : "local",
        multiselect : true,
        height : $('body').height() - 305,
        width : $('body').width() * 0.5-10,
        rownumbers : true,
        shrinkToFit : false,
        rowNum : 100000000,
        colModel : [
            {label : 'ajid',name : 'ajid',hidden : true,key : true,sortable:false,frozen : true},
            {label : 'ggid',name : 'ggid',hidden : true,sortable:false,frozen : true},
            {label : '-',name : 'ajid', width : 40,align:'center',sortable:false,frozen : true,formatter:function(cellvalue, options, rowObject) {
                return '<button class="btn btn-link btn-xs " type="button" onclick=""><i class="fa fa-trash"></i> </button>';
            }},
            {label : '检',name : 'ajid', width : 40,align:'center',sortable:false,frozen : true,formatter:function(cellvalue, options, rowObject) {
                return '<div style="padding-top:3px"><i style="color: orange;" class="fa fa-warning"></i></div>';
            }},
            {label : '案号',name : 'xmmc', width : 120,sortable:false,frozen : true,formatter:function (cellvalue,options,rowObject) {
                return '<a href="javascript:;" onclick="check(3,\'' + cellvalue + '\')">'+cellvalue+'</a>'
            }},
            {label : '关联案件',name : '',frozen : true,width : 80,sortable:false,formatter:function (cellvalue,options,rowObject) {
                return '<a onclick="viewRelated(\'' + cellvalue + '\')" href="javascript:;">'+cellvalue+'</a>';
            }},
            {label : '归属法院',name : 'xmzt',width : 150,sortable:false},
            {label : '承办部门',name : 'htmc', width : 100,sortable:false},
            {label : '承办人',name : 'xmlxmc',width : 80,sortable:false},
            {label : '性质',name : 'zylbmc',width : 80 ,sortable:false},
            {label : '类型',name : 'zylbmc',width : 80,sortable:false},
            {label : '案由',name : 'xmfzrmc',width : 120,sortable:false},
            {label : '结案方式',name : 'xmjlmc', width : 80,sortable:false},
            {label : '结案时间',name : 'xmcymc', width : 80,sortable:false}
        ]
        // ,pager:"#pager2",
        // viewrecords: true
    });//.jqGrid('setFrozenColumns');
}

function loadGrid3() {
    $("#table3").jqGrid({
        datatype : "local",
        height : $('body').height() - 225,
        width : $('body').width() * 0.45-10,
        shrinkToFit : true,
        rowNum : 2000,
        colModel : [
            {label : 'ajid',name : 'ajid',hidden : true,key : true,sortable:false,frozen : true},
            {label : '&nbsp;',name : 'ajid', width : 90,sortable:false,frozen : true,formatter:function(cellvalue, options, rowObject) {
                return '<button class="btn btn-link btn-xs " type="button" onclick="" title="编辑"><i class="fa fa-edit"></i> </button>'
                    +  '<button class="btn btn-link btn-xs " type="button" onclick="" title="移除"><i class="fa fa-trash"></i> </button>';
            }},
            {label : '组名',name : 'xmzt',width : 100,sortable:false},
            {label : '组长',name : 'xmzt',width : 80,sortable:false},
            {label : '组员',name : 'htmc', width : 200,sortable:false},
            {label : '评查',name : 'htmc', width : 60,sortable:false,
                formatter:function(cellvalue,options,rowObject){
                    return '<a href="javascript:;" onclick=""></a>';
                }
            },
            {label : '占比',name : 'htmc', width : 60,sortable:false}
        ],
        pager:"#pager3",
        subGrid : true,
        subGridRowExpanded : initChildGrid1,
        subGridOptions : {
            "plusicon" : "fa fa-plus",
            "minusicon" : "fa fa-minus",
            "expandOnLoad" : false
        }
    });
}

function initChildGrid1(parentRowID, parentRowKey) {
    var tabid = parentRowID + "_table";
    $('#' + parentRowID).append('<table id="' + tabid + '"></table>');
    $("#" + tabid).jqGrid({
        datatype : "local",
        height : 150,
        width : $('body').width() * 0.45 - 60,
        autowidth : true,
        shrinkToFit : false,
        rowNum : 100000,
        colModel : [
            {label : 'ajid',name : 'ajid',hidden : true,key : true,sortable:false,frozen : true},
            {label : 'ggid',name : 'ggid',hidden : true,sortable:false,frozen : true},
            {label : '-',name : 'ajid', width : 40,align:'center',sortable:false,frozen : true,formatter:function(cellvalue, options, rowObject) {
                return '<button class="btn btn-link btn-xs " type="button" onclick=""><i class="long-arrow-left"></i> </button>';
            }},
            {label : '检',name : 'ajid', width : 40,align:'center',sortable:false,frozen : true,formatter:function(cellvalue, options, rowObject) {
                return '<div style="padding-top:3px"><i style="color: orange;" class="fa fa-warning"></i></div>';
            }},
            {label : '案号',name : 'xmmc', width : 120,sortable:false,frozen : true,formatter:function (cellvalue,options,rowObject) {
                return '<a href="javascript:;" onclick="check(3,\'' + cellvalue + '\')">'+cellvalue+'</a>'
            }},
            {label : '关联案件',name : '',frozen : true,width : 80,sortable:false,formatter:function (cellvalue,options,rowObject) {
                return '<a onclick="viewRelated(\'' + cellvalue + '\')" href="javascript:;">'+cellvalue+'</a>';
            }},
            {label : '归属法院',name : 'xmzt',width : 150,sortable:false},
            {label : '承办部门',name : 'htmc', width : 100,sortable:false},
            {label : '承办人',name : 'xmlxmc',width : 80,sortable:false},
            {label : '性质',name : 'zylbmc',width : 80 ,sortable:false},
            {label : '类型',name : 'zylbmc',width : 80,sortable:false},
            {label : '案由',name : 'xmfzrmc',width : 120,sortable:false},
            {label : '结案方式',name : 'xmjlmc', width : 80,sortable:false},
            {label : '结案时间',name : 'xmcymc', width : 80,sortable:false}
        ]
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
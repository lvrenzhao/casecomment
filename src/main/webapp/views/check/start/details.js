//mode解释：
// 1审核，
// 2：普通查看，
// 3：审核通过后查看（需向后台发送阅读记录，不能显示组员和组长信息）,
// 4:审核不通过查看（需向后台发送阅读记录）


var URL_TABLE1 = ahcourt.ctx + '/case/checkcases.do';
var URL_TABLE3 = ahcourt.ctx + '/case/groups.do';
var URL_DIST = ahcourt.ctx + '/case/dists.do';

var ggid,mode;
$(function () {
    ggid = $.getUrlParam("ggid");
    mode = $.getUrlParam("mode");

    if(mode == 1){
        $("#btn_pass").show();
        $("#btn_reject").show();
    }
    //### mode == 3 要记录阅读记录

    $('.i-checks').iCheck({
        radioClass : 'iradio_square-green',
        checkboxClass : 'icheckbox_square-green'
    });
    $.ajax({
        type : 'POST',
        url : URL_DIST,
        data:{
            ggid:ggid,
            lx:"1"
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
        url : URL_DIST,
        data:{
            ggid:ggid,
            lx:"2"
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

    $.ajax({
        type : 'POST',
        url : URL_DIST,
        data:{
            ggid:ggid,
            lx:"3"
        },
        datatype : 'json',
        success : function(data) {
            if (data && data.rows && data.rows.length > 0) {
                $("#form_sel_lx").each(function() {
                    var html = '<option value="">案件类型</option>';
                    for (var i = 0; i < data.rows.length; i++) {
                        html += '<option ' + 'value="' + data.rows[i].fbx + '">' + data.rows[i].fbxmc + '</option>'
                    }
                    $(this).html(html);
                });
            } else {
                $("#form_sel_lx").each(function() {
                    $(this).html('<option value="">案件类型</option>');
                })
            }
        }
    });

    loadGridCase();
    loadGridGroup();
    $("#div_noticeconent").height($('body').height()-240);
    
    $("#btn_reject").click(function () {
        layer.open({
            type : 1,
            shift : 5,
            title : '审核不同意',
            shadeClose : false,
            shade : 0.3,
            area : [ '480px', '250px' ],
            content : $("#div_reject"),
            cancel : function(index) {
                layer.close(index);
            }
        });
    });

    $("#viewTable").click(function () {
        layer.open({
            type : 2,
            shift : 5,
            title : '查看评分表',
            shadeClose : false,
            shade : 0.3,
            area : [ '90%', '90%' ],
            content : ahcourt.ctx+"/views/check/configscore/view_table.jsp?id=",
            cancel : function(index) {
                layer.close(index);
            }
        });
    });
});

function loadGridCase() {
    $("#table1").jqGrid({
        url :URL_TABLE1,
        postData:{
            ggid:ggid
        },
        datatype : "json",
        mtype : "post",
        // multiselect : true,
        height : $('body').height() - 175,
        width : $('body').width() * 0.6-15 ,
        rownumbers : true,
        shrinkToFit : false,
        rowNum : 20,
        colModel : [
            {label : 'ccid',name : 'ccid',hidden : true, key : true,frozen:true},
            {label : 'checkid',name : 'checkid',hidden : true,frozen:true},
            {label : 'ajid',name : 'ajid',hidden : true,frozen:true},
            {label : 'relatedcasecount',name : 'relatedcasecount',hidden : true,frozen:true},
            {label : 'pcjl',name : 'pcjl',hidden : true,sortable:false,frozen : true},
            {label : '案号',name : 'ah', width : 120,sortable:false,frozen : true},
            {label : '关联案件',name : 'fmt',frozen : true,width : 80,sortable:false,formatter:function (cellvalue,options,rowObject) {
                return '<a onclick="viewRelated(\'' + rowObject.ajid + '\')" href="javascript:;">'+rowObject.relatedcasecount+'</a>';
            }},
            {label : '评查记录',name : 'fmt2',frozen : true,width : 80,sortable:false,align:'right',
                formatter:function (cellvalue,options,rowObject) {
                    return '<a onclick="viewPcjl(\'' + rowObject.ajid + '\')" href="javascript:;">'+rowObject.pcjl+'</a>';
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
        ],
        pager:"#pager1",
        viewrecords: true
    });//.jqGrid('setFrozenColumns');
}

function loadGridGroup() {
    var cols = [];
    if(mode == 3){
        cols = [
            {label : 'cgid',name : 'cgid',hidden : true,key : true,sortable:false,frozen : true},
            {label : 'checkid',name : 'checkid',hidden : true,frozen:true},
            {label : '组名',name : 'groupname',width : 100,sortable:false},
            {label : '评查',name : 'pcajs', width : 60,sortable:false},
            {label : '占比',name : 'zb', width : 60,sortable:false}
        ];
    }else{
        cols = [
            {label : 'cgid',name : 'cgid',hidden : true,key : true,sortable:false,frozen : true},
            {label : 'checkid',name : 'checkid',hidden : true,frozen:true},
            {label : '组名',name : 'groupname',width : 100,sortable:false},
            {label : '组长',name : 'teamleadername',width : 80,sortable:false},
            {label : '组员',name : 'teammatenames', width : 200,sortable:false},
            {label : '评查',name : 'pcajs', width : 60,sortable:false},
            {label : '占比',name : 'zb', width : 60,sortable:false}
        ];
    }
    $("#table3").jqGrid({
        url : URL_TABLE3,
        postData:{
            ggid:ggid
        },
        datatype : "json",
        mtype : "post",
        height : $('body').height() - 350,
        width : $('body').width() * 0.4-10,
        shrinkToFit : true,
        rowNum : 20,
        colModel : cols,
        pager:"#pager3"
        // ,viewrecords: true
    });//.jqGrid('setFrozenColumns');
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

function viewPcjl(key) {
    layer.open({
        type : 2,
        shift : 5,
        title : '查看评查记录',
        shadeClose : false,
        shade : 0.3,
        area : [ '90%', '90%' ],
        content : ahcourt.ctx + '/views/check/start/view_pcjl.jsp?ajid=' + key,
        cancel : function(index) {
            layer.close(index);
        }
    });
}
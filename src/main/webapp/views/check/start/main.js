

//============================================================
$(function () {
    //初始化jquery.step组件，分步骤引导用户发起评查活动
    $("#wizard").steps({
        enableCancelButton: false,
        enableFinishButton: true,
        onStepChanging: function (event, currentIndex, newIndex) {
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
        checkboxClass : 'icheckbox_square-green',
    });

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

    // $.ajax({
    //     type : 'POST',
    //     url : URL_ROLE,
    //     datatype : 'json',
    //     async : false,
    //     success : function(data) {
    //         if(typeof data == "string"){ data =  $.parseJSON(data);}
    //         var html="";
    //         for (var i = 0; i < data.length; i++) {
    //             html += '<option value="' + data[i].roleid + '" >' + data[i].rolename + '</option>'
    //         }
    //         $("#form_sel_js").html(html);
    //     }
    // });
    for ( var selector in config) {
        $(selector).chosen(config[selector]);
    }

});



function loadGrid1() {
    $("#table1").jqGrid({
//            url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
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
            {label : '归属法院',name : 'xmzt',width : 150,sortable:false},
            {label : '承办部门',name : 'htmc', width : 100,sortable:false},
            {label : '承办人',name : 'xmlxmc',width : 80,sortable:false},
            {label : '性质',name : 'zylbmc',width : 80 ,sortable:false},
            {label : '类型',name : 'zylbmc',width : 80,sortable:false},
            {label : '案由',name : 'xmfzrmc',width : 120,sortable:false},
            {label : '结案方式',name : 'xmjlmc', width : 80,sortable:false},
            {label : '结案时间',name : 'xmcymc', width : 80,sortable:false},
            {label : '关联案件',name : '',frozen : true,width : 80,sortable:false}
        ],
        pager:"#pager1",
        viewrecords: true
    });//.jqGrid('setFrozenColumns');
}

function loadGrid2() {
    $("#table2").jqGrid({
//            url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
        datatype : "json",
        mtype : "post",
        multiselect : true,
        height : $('body').height() - 285,
        width : $('body').width() * 0.5-10,
        rownumbers : true,
        shrinkToFit : false,
        rowNum : 20,
        colModel : [
            {label : 'ajid',name : 'ajid',hidden : true,key : true,sortable:false,frozen : true},
            {label : 'ggid',name : 'ggid',hidden : true,sortable:false,frozen : true},
            {label : '案号',name : 'xmmc', width : 120,sortable:false,frozen : true},
            {label : '归属法院',name : 'xmzt',width : 150,sortable:false},
            {label : '承办部门',name : 'htmc', width : 100,sortable:false},
            {label : '承办人',name : 'xmlxmc',width : 80,sortable:false},
            {label : '性质',name : 'zylbmc',width : 80 ,sortable:false},
            {label : '类型',name : 'zylbmc',width : 80,sortable:false},
            {label : '案由',name : 'xmfzrmc',width : 120,sortable:false},
            {label : '结案方式',name : 'xmjlmc', width : 80,sortable:false},
            {label : '结案时间',name : 'xmcymc', width : 80,sortable:false},
            {label : '关联案件',name : '',frozen : true,width : 80,sortable:false}
        ],
        pager:"#pager2",
        viewrecords: true
    }).jqGrid('setFrozenColumns');
}

function loadGrid3() {
    $("#table3").jqGrid({
           url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
        datatype : "json",
        mtype : "post",
        height : $('body').height() - 225,
        width : $('body').width() * 0.45-10,
        shrinkToFit : true,
        rowNum : 20,
        colModel : [
            {label : 'ajid',name : 'ajid',hidden : true,key : true,sortable:false,frozen : true},
            {label : '&nbsp;',name : 'ajid', width : 110,sortable:false,frozen : true,formatter:function(cellvalue, options, rowObject) {
                return '<button class="btn btn-link btn-xs " type="button" onclick="" title="退回待分配"><i class="fa fa-long-arrow-left"></i> </button>'
                    +'<button class="btn btn-link btn-xs " type="button" onclick="" title="编辑"><i class="fa fa-edit"></i> </button>'
                    +'<button class="btn btn-link btn-xs " type="button" onclick="" title="移除"><i class="fa fa-trash"></i> </button>'
            }},
            {label : '组名',name : 'xmzt',width : 100,sortable:false},
            {label : '组长',name : 'xmzt',width : 80,sortable:false},
            {label : '组员',name : 'htmc', width : 200,sortable:false},
            {label : '评查',name : 'htmc', width : 60,sortable:false}
        ],
        pager:"#pager3"
        // ,viewrecords: true
    });//.jqGrid('setFrozenColumns');
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
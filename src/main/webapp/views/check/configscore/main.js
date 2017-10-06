//#### type为1 是评查模板维护 ， type为2 是评选模板维护

var URL_TABLE1 =  ahcourt.ctx + "/case/scores.do";
var URL_STPLAYORSTOP = ahcourt.ctx + "/case/scoresenable.do";
var URL_DELETEONE = ahcourt.ctx + "/case/delscore.do";

//============================================================
var type;
$(function () {
    //todo here
    type = $.getUrlParam("type");
    loadTable();
    $("#btn_add").click(function () {
        layer.open({
            type : 2,
            shift : 5,
            title : '新增评分表',
            shadeClose : false,
            shade : 0.3,
            area : [ '90%', '90%' ],
            content : ahcourt.ctx+"/views/check/configscore/add_table.jsp",
            cancel : function(index) {
                layer.close(index);
            }
        });
    });
});

function loadTable() {
    $("#table1").jqGrid({
        url : URL_TABLE1,
        postData:{
            lx:type
        },
        datatype : "json",
        mtype : "post",
        height : $('body').height()-125,
        width : $('body').width() - 5 ,
        rownumbers : true,
        shrinkToFit : true,
        rowNum : 20,
        rowList : [ 10, 20, 30 ],
        colModel : [
            {label : 'tableid',name : 'tableid',hidden : true,key : true },
            {label : 'sfqy',name : 'sfqy',hidden : true, frozen:true},
            {label : 'sfsy',name : 'sfsy',hidden : true, frozen:true},
            {label : '操作',name : 'fmt',width : 250,align:'center',sortable:false,formatter:function(cellvalue,options,rowObject){
                var btn_str = "";
                //如果已经被使用，则不能对评分表进行修改和删除
                if(rowObject.sfsy == 0){
                    btn_str += '<button class="btn btn-link btn-xs " type="button" onclick="deleteItem(\'' + rowObject.tableid + '\')" title=""><i class="fa fa-trash"></i> 删除</button>';
                    btn_str += '<button class="btn btn-link btn-xs " type="button" onclick="editone(\'' + rowObject.tableid + '\')" title=""><i class="fa fa-edit"></i> 编辑</button>';
                }
                btn_str += '<button class="btn btn-link btn-xs " type="button" onclick="viewone(\'' + rowObject.tableid + '\')" title=""><i class="fa fa-info-circle"></i> 查看</button>';
                if(rowObject.sfqy == "1"){
                    btn_str += '<button class="btn btn-link btn-xs " type="button" onclick="playOrStop(\'' + rowObject.tableid + '\')" title=""><i class="fa fa-pause"></i> 停用</button>';
                }else{
                    btn_str += '<button class="btn btn-link btn-xs " type="button" onclick="playOrStop(\'' + rowObject.tableid + '\')" title=""><i class="fa fa-play"></i> 启用</button>';
                }
                return btn_str;
            }},
            {label : '状态',name : 'fmt2',sortable:false,width : 100,align:'center',formatter:function (cellvalue,options,rowObject) {
                return rowObject.sfqy == "1" ? "<span class='label label-primary'>启用</span>":"<span class='label label-default'>停用</span>";
            }},
            {label : '模板名称',name : 'mbmc',sortable:false,width : 400},
            {label : '模板说明',name : 'mcms',sortable:false,width : 300},
            {label : '创建人',name : 'cjrmc',sortable:false,width : 100},
            {label : '创建时间',align:'right', name : 'createDate',sortable:false,width : 100}
        ],
        pager : '#pager1'
        ,viewrecords: true
    });
}

function reloadTable() {
    $("#table1").jqGrid().setGridParam({
        url : URL_TABLE1,
        postData:{
            lx:type
        },
        page : 1
    }).trigger("reloadGrid");
}

function playOrStop(tableid,currentState) {
    $.ajax({
        type : 'POST',
        url : URL_STPLAYORSTOP,
        data:{
            tableid:tableid
        },
        datatype : 'json',
        // async : false,
        success : function(data) {
            layer.msg("设置成功",{icon:1});
            reloadTable();
        }
    });
}

function viewone(key) {
    layer.open({
        type : 2,
        shift : 5,
        title : '查看评分表',
        shadeClose : false,
        shade : 0.3,
        area : [ '90%', '90%' ],
        content : ahcourt.ctx+"/views/check/configscore/view_table.jsp?id="+key,
        cancel : function(index) {
            layer.close(index);
        }
    });
}

function deleteItem (tableid) {
    layer.confirm('确定要删除该项？', {
        btn: ['确定','取消'] //按钮
    }, function(o){
        layer.close(o)
        $.ajax({
            type : 'POST',
            url : URL_DELETEONE,
            data:{
                tableid:tableid
            },
            datatype : 'json',
            success : function(data) {
                if(data > 0){
                    layer.msg("删除成功!",{icon:1});
                    reloadTable();
                }
            }
        });
    }, function(){
    });
}

function editone(tableid) {
    layer.open({
        type : 2,
        shift : 5,
        title : ' 编辑评分表',
        shadeClose : false,
        shade : 0.3,
        area : [ '90%', '90%' ],
        content : ahcourt.ctx+"/views/check/configscore/add_table.jsp?tableid="+tableid,
        cancel : function(index) {
            layer.close(index);
        }
    });
}
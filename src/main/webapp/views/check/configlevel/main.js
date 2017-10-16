var URL_TABLE1 = ahcourt.ctx + "/case/levels.do";
var URL_DELETEONE = ahcourt.ctx + "/case/dellevel.do";
var URL_SUBMIT = ahcourt.ctx + "/case/savelevel.do";
var lo;
$(function(){
    // Configuration for jqGrid Example 1
    $("#table1").jqGrid({
        url: URL_TABLE1,
        datatype: "json",
        mtype : "post",
        height: $('body').height()-135,
        autowidth: true,
        shrinkToFit: true,
        rowNum: 20,
        colModel: [
            {label : 'levelid',name : 'levelid',hidden : true, key : true,frozen:true},
            {label : 'minscore',name : 'minscore',hidden : true, frozen:true},
            {label : 'maxscore',name : 'maxscore',hidden : true, frozen:true},
            {label:'操作',name:'fmt',width:60,frozen:true,sortable:false,align:'center',formatter:function(cellvalue, options, rowObject) {
                return '<button class="btn btn-white btn-xs " type="button" onclick="deleteItem(\'' + rowObject.levelid + '\')" title="删除"><i class="fa fa-trash"></i> 删除</button>'+
                       '<button class="btn btn-white btn-xs " type="button" onclick="editItem(\'' + rowObject.levelid + '\',\'' + rowObject.levelname + '\',\'' + rowObject.xh + '\',\'' + rowObject.maxscore + '\',\'' + rowObject.minscore + '\')" title="编辑"><i class="fa fa-edit"></i> 编辑</button>';
            }},
            {label: '序号',name: 'xh',width: 60,sortable:false,align:'center'},
            {label: '等级',name: 'levelname',width: 200,sortable:false,align:'center'},
            {label: '分值区间',name: 'fmt2',width: 200,sortable:false, align:'center',formatter:function (cellvalue,options,rowObject) {
                return  rowObject.minscore + '&nbsp;&nbsp;~&nbsp;&nbsp;' + rowObject.maxscore;
            }}
        ],
        viewrecords: true,
        hidegrid: false,
        pager:"#pager1"
    });

    $("#btn_save").click(function () {
        if($("#form_inp_sx").val() && $("#form_inp_xx").val() && $("#form_inp_mc").val() && $("#form_inp_xh").val()){
            if( isNaN($("#form_inp_xx").val()) ){
                layer.msg("分值下线 必填数字");
                return false;
            }
            if( isNaN($("#form_inp_sx").val()) ){
                layer.msg("分值上线 必填数字");
                return false;
            }
            if( isNaN($("#form_inp_xh").val()) ){
                layer.msg("序号 必填数字");
                return false;
            }
            $.ajax({
                type : 'POST',
                url : URL_SUBMIT,
                data:{
                    levelid:$("#form_hid_levelid").val(),
                    levelname:$("#form_inp_mc").val(),
                    maxscore:$("#form_inp_sx").val(),
                    minscore:$("#form_inp_xx").val(),
                    xh:$("#form_inp_xh").val()
                },
                datatype : 'json',
                // async : false,
                success : function(data) {
                    layer.msg("保存成功",{icon:1});
                    layer.close(lo);
                    reloadGrid1();
                }
            });
        }else{
            layer.msg("请填写完整....");
        }
    });

    $("#btn_new").click(function () {
        $("#form_level")[0].reset();
        $("#form_hid_levelid").val("")
        lo = layer.open({
            type : 1,
            shift : 5,
            title : '新建质量等级',
            shadeClose : false,
            shade : 0.3,
            area : [ '600px', '350px' ],
            content : $("#level_form"),
            cancel : function(index) {
                layer.close(index);
            }
        });
    });

});

function reloadGrid1() {
    $("#table1").jqGrid().setGridParam({
        url : URL_TABLE1,
        page : 1
    }).trigger("reloadGrid");
}



function deleteItem (levelid) {
    layer.confirm('确定要删除该项？', {
        btn: ['确定','取消'] //按钮
    }, function(o){
        layer.close(o)
        $.ajax({
            type : 'POST',
            url : URL_DELETEONE,
            data:{
                levelid:levelid
            },
            datatype : 'json',
            success : function(data) {
                if(data > 0){
                    layer.msg("删除成功!",{icon:1});
                    reloadGrid1();
                }
            }
        });
    }, function(){
    });
}


function editItem (levelid,levelname,xh,maxscore,minscore) {
    $("#form_level")[0].reset();
    lo = layer.open({
        type : 1,
        shift : 5,
        title : '编辑质量等级',
        shadeClose : false,
        shade : 0.3,
        area : [ '600px', '350px' ],
        content : $("#level_form"),
        cancel : function(index) {
            layer.close(index);
        }
    });
    $("#form_hid_levelid").val(levelid);
    $("#form_inp_xh").val(xh);
    $("#form_inp_mc").val(levelname);
    $("#form_inp_xx").val(minscore);
    $("#form_inp_sx").val(maxscore);
}
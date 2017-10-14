
$(function() {

    listgrid();



	$('#serch').click(function() {
		$("#table1").jqGrid().setGridParam({
            page:1,
            postData : {
				xm : $('#xm').val(),
				zzjgmc : $('#zzjgmc').val()
			}
		}).trigger("reloadGrid");
	})
});

function listgrid() {
	$("#table1").jqGrid({
		url : ahcourt.ctx + "/setting/professional/listjson.do",
		datatype : "json",
		mtype:'post',
		width : gridWidth(),
		height : gridHeight(),
		//rownumbers : true,
		shrinkToFit : true,
		rowNum : 20,
		rowList : [   10,15,20,30 ],
		colModel : [ {
			label : 'zjid',
			name : 'zjid',
			hidden : true,
			key : true
		}, {
			label : '操作',
			name : 'zjid',
			align : 'center',
			width : 180,
			sortable : false,
			formatter : gridmenu
		}, {
			label : '专家姓名',
			name : 'xm',
			width : 100
		}, {
            label : '组织机构',
            name : 'zzjgmc',
            width : 150
        }, {
            label : '头衔',
            name : 'tx',
            width : 100
        },  {
            label : '专业',
            name : 'zymc',
            width : 150
        },  {
            label : '标签',
            name : 'bqmc',
            width : 150
        }, {
			label : '邮件',
			name : 'dzyx',
			width : 120
		}, {
			label : '电话',
			name : 'dh',
			align : 'center',
			width : 120
		}, {
			label : '手机',
			name : 'sj',
			align : 'center',
			width : 120
		}, {
            label : '介绍',
            name : 'js',
            align : 'center',
            formatter:formatter_grid2_shyj,
            width : 80
        }],
		pager : "#pager1"
        ,viewrecords: true
	});//.jqGrid('setFrozenColumns');

    $(window).on('resize', function() {
        $('#table1').setGridWidth(gridWidth());
        $('#table1').setGridHeight(gridHeight());
    });

}

function gridmenu(cellvalue, options, rowObject) {
    //console.log(rowObject.zjid);
    var btn_edit = '<button class="btn btn-white btn-xs mr5" type="button" onclick="editProfessional(\'' + rowObject.zjid + '\')"><i class="fa fa-edit"></i>&nbsp;编辑</button>&nbsp;';
    var btn_delete = '<button class="btn btn-white btn-xs mr5" type="button" onclick="opendelbox(\'' + rowObject.zjid + '\')"><i class="fa fa-trash"></i>&nbsp;删除</button>';
    return btn_edit + btn_delete ;
};

function formatter_grid2_shyj(cellvalue, options, rowObject) {
    return '<a href="javascript:void(0)" onclick="showintro(\'' + rowObject.js + '\')">查看</a>';
}

function newProfessional(id) {
    layer.open({
        type : 2,
        shift : 5,
        title : '添加专家',
        shadeClose : false,
        shade : 0.3,
        area : [ '90%', '85%' ],
        content : ahcourt.ctx + '/setting/professional/input.do?mode=new',
        end : function(index) {
//			layer.close(index);
            $("#table1").jqGrid().trigger("reloadGrid")
        }
    });
}

function editProfessional(id){
    layer.open({
        type : 2,
        shift : 5,
        title : '编辑专家',
        shadeClose : false,
        shade : 0.3,
        area : [ '90%', '85%' ],
        content : ahcourt.ctx + '/setting/professional/input.do?zjid='+id+'&mode=edit',
        end : function(index) {
//			layer.close(index);
            $("#table1").jqGrid().trigger("reloadGrid")
        }
    });
}

function showintro(intro) {
    layer.open({
        type : 1,
        shift : 5,
        title : '查看专家介绍',
        shadeClose : false,
        shade : 0.3,
        area : [ '400px', '300px' ],
        content :intro,
        end : function(index) {
			layer.close(index);
        }
    });
}

function opendelbox(id) {
    layer.confirm('确定删除该专家？', {
        btn : ['确定', '取消'],
        closeBtn : false,
        yes : function(index) {
            $.ajax({
                type : 'POST',
                url : ahcourt.ctx + '/setting/professional/delete.do',
                datatype : 'json',
                data : {
                    'zjid' : id
                },
                success : function(data) {
                    if (data == 1) {
                        $("#table1").jqGrid().trigger("reloadGrid");
                        layer.msg('删除成功');
                    } else {
                        layer.msg('删除失败');
                    }
                }
            });
            layer.close(index); // 进行手工关闭
        }
    });
}

function gridWidth() {
	return $("body").outerWidth() - 2;
}

function gridHeight() {
	return $("body").outerHeight() - 85 - 80;
}

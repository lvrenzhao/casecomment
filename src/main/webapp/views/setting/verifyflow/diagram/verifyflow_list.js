$(function(){
	//加载流程模块
	loadLcmk();
	//绑定切换流程模块动态加载流程版本事件(版本默认倒序)
	$("#lclx").change(function(){
		loadLcbbByLcmk($(this).val());
		loadIframeForSelectedFlow();
	});
	//绑定切换版本时加载流程图事件
	$("#lcbb").change(function(){
		loadIframeForSelectedFlow();
	});
	$('#btn_input').click(function(){
		var maxlcbb =   Number($("#lcbb > option:nth-child(2)").val())+1;
		if(!maxlcbb){
			maxlcbb = 1;
		}
		var lcbb = $('#lcbb').val();
		if($('#lclx').val()){
			var src = ahcourt.ctx+'/setting/flowconfig/diagraminput.do?mode=input&lcmkid='+$('#lclx').val()+"&lcbb="+maxlcbb+'&lcmkmc='+$('#lclx').find("option:selected").text()+'&lcqyrq=';
			layer.open({
				type : 2,
				shift : 5,
				title : '新建流程版本',
				shadeClose : false,
				shade : 0.3,
				area : ['98%', '90%'],
				content : src,
				cancel : function(index) {
					layer.close(index);
					loadLcbbByLcmk($("#lclx").val());
					$("#lcbb").val(lcbb);
				}
			});
		}
		else{
			layer.msg("请先选择工作流");
		}
	});
});

function loadIframeForSelectedFlow(){
	if($('#lcbb').val()){
		var lcqyrq = $('#lcbb').find("option:selected").text().split("_")[2];
		var src = ahcourt.ctx+'/setting/flowconfig/diagraminput.do?mode=view&lcmkid='+$('#lclx').val()+"&lcbb="+$('#lcbb').val()+'&lcmkmc='+$('#lclx').find("option:selected").text()+'&lcqyrq='+lcqyrq;
		$("#flow_iframe").attr("src",src);
	}else{
		$("#flow_iframe").attr("src","");
	}
}

function loadLcmk(){
	$.ajax({
		type : 'POST',
		url : ahcourt.ctx + '/setting/dict/getByParent.do',
		datatype : 'json',
		data : {
			"parent_id" : '103'
		},
		success : function(data) {
			if (data && data.length > 0) {
				var html = '<option value="">--请选择工作流--</option>';
				for (var i = 0; i < data.length; i++) {
					html += '<option value="' + data[i].zdbh + '">' + data[i].zdmc + '</option>'
				}
				$('#lclx').html(html);
			}
		}
	});
}

function loadLcbbByLcmk(lcmkid){
	if(lcmkid){
		$.ajax({
			type : 'POST',
			url : ahcourt.ctx + '/setting/flowconfig/getLcbbByLcmkid.do',
			datatype : 'json',
			data : {
				"lcmkid" : lcmkid
			},
			async : false,
			success : function(data) {
				var html = '<option value="">--请选择流程版本--</option>';
				for (var i = 0; data && i < data.length; i++) {
					html += '<option value="' + data[i].lcbb + '">版本' + data[i].lcbb + '_启用日期_'+data[i].lcqyrq+'</option>'
				}
				$('#lcbb').html(html);
			}
		});
	}else{
		$('#lcbb').html('<option value="">--请选择流程版本--</option>');
	}
}

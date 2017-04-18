$(document).ready(function() {
	$('.i-checks').iCheck({
		radioClass : 'iradio_square-green',
		checkboxClass : 'icheckbox_square-green',
	});
	$(".sub_role").click(function() {
		if ($('#zzjgmc').val()!='') {
			var radio=gettypeshang();
			$.ajax({
				type : 'POST',
				url :ahcourt.ctx + "/setting/organization/addorg.do",
				datatype : 'json',
				data:{
//					zzjgid:1001,
					sjzzjgid : '0',
					zzjgmc:$('#zzjgmc').val(),
					sfyzdw:radio,
				},
				async:false,
				success : function(data) {
					if(data==1){
						layer.msg('添加成功');
						parent.location.reload(true);
						layer.close();
					}
				}
			});	
		} else {
			layer.confirm('请完善表单内容!', {
				btn : [ '确定' ],
				closeBtn : false,
				yes : function(index) {
					layer.close(index); // 进行手工关闭
				}
			});
		}

	})
})
function gettypeshang(){
	var typeval;
	$("input:radio[name='sex']").each(function(index, element) {
		var val = element.value;
		var check = element.checked+"";
		if(check=='true'){
			typeval= val;
		}
	});
	return typeval;
}
(function($){
var myflow = $.myflow;

$.extend(true, myflow.editors, {
	inputEditor : function(){
		var _props,_k,_div,_src,_r;
		this.init = function(props, k, div, src, r){
			_props=props; _k=k; _div=div; _src=src; _r=r;
			
			$('<input style="width:100%;"/>').val(props[_k].value).change(function(){
				props[_k].value = $(this).val();
			}).appendTo('#'+_div);
			
			$('#'+_div).data('editor', this);
		}
		this.destroy = function(){
			$('#'+_div+' input').each(function(){
				_props[_k].value = $(this).val();
			});
		}
	},
	inputEditorReadonly : function(){
		var _props,_k,_div,_src,_r;
		this.init = function(props, k, div, src, r){
			_props=props; _k=k; _div=div; _src=src; _r=r;
			
			$('<input style="width:100%;" readonly />').val(props[_k].value).change(function(){
				props[_k].value = $(this).val();
			}).appendTo('#'+_div);
			
			$('#'+_div).data('editor', this);
		}
		this.destroy = function(){
			$('#'+_div+' input').each(function(){
				_props[_k].value = $(this).val();
			});
		}
	},
	dateEditor:function(){
		var _props,_k,_div,_src,_r;
		this.init = function(props, k, div, src, r){
			_props=props; _k=k; _div=div; _src=src; _r=r;
			
			$('<input style="width:100%;" placeholder="yyyy-mm-dd" />').val(props[_k].value).change(function(){
				props[_k].value = $(this).val();
			}).appendTo('#'+_div);
			
			$('#'+_div).data('editor', this);
		}
		this.destroy = function(){
			$('#'+_div+' input').each(function(){
				_props[_k].value = $(this).val();
			});
		}
	},
	selectEditor : function(arg){
		var _props,_k,_div,_src,_r;
		this.init = function(props, k, div, src, r){
			_props=props; _k=k; _div=div; _src=src; _r=r;

			var sle = $('<select  style="width:100%;"/>').val(props[_k].value).change(function(){
				props[_k].value = $(this).val();
			}).appendTo('#'+_div);
			
			if(typeof arg === 'string'){
				$.ajax({
				   type: "GET",
				   url: arg,
				   success: function(data){
					  var opts = eval(data);
					 if(opts && opts.length){
						for(var idx=0; idx<opts.length; idx++){
							sle.append('<option value="'+opts[idx].value+'">'+opts[idx].name+'</option>');
						}
						sle.val(_props[_k].value);
					 }
				   }
				});
			}else {
				for(var idx=0; arg&&idx<arg.length; idx++){
					sle.append('<option value="'+arg[idx].value+'">'+arg[idx].name+'</option>');
				}
				sle.val(_props[_k].value);
			}
			
			$('#'+_div).data('editor', this);
		};
		this.destroy = function(){
			
		};
	}
	,
	verifyTypeSelectEditor : function(arg){
		var _props,_k,_div,_src,_r;
		this.init = function(props, k, div, src, r){
			_props=props; _k=k; _div=div; _src=src; _r=r;
			var sle = $('<select id="zt_type"  style="width:100%;"/>').change(function(){
				props[_k].value = $(this).val();
				if($(this).val() == "0"){
					$("#zt_role").css("display","none");
					$("#zt_job").css("display","none");
					$("#zt_man").css("display","none");
				}else if($(this).val() == "1"){
					$("#zt_role").css("display","block");
					$("#zt_job").css("display","none");
					$("#zt_man").css("display","none");
				}else if($(this).val() == "2"){
					$("#zt_role").css("display","none");
					$("#zt_job").css("display","none");
					$("#zt_man").css("display","block");
				}else if($(this).val() == "3"){
					$("#zt_role").css("display","none");
					$("#zt_job").css("display","block");
					$("#zt_man").css("display","none");
				}else{
					$("#zt_role").css("display","none");
					$("#zt_job").css("display","none");
					$("#zt_man").css("display","none");
				}
			}).appendTo('#'+_div);
			
			for(var idx=0; idx<arg.length; idx++){
				sle.append('<option value="'+arg[idx].value+'">'+arg[idx].name+'</option>');
			}
			sle.val(_props[_k].value);
			
			$('#'+_div).data('editor', this);
		};
		this.destroy = function(){
			
		};
	},
	conditionList1_SelectEditor : function(arg){
		var _props,_k,_div,_src,_r;
		this.init = function(props, k, div, src, r){
			_props=props; _k=k; _div=div; _src=src; _r=r;
			var sle = $('<select id="cL1"  style="width:100%;"/>').change(function(){
				props[_k].value = $(this).val();
				
				for(var j = 0 ; conditionList && j < conditionList.length ; j ++){
					if(conditionList[j].value == $(this).val()){
						var html = '<option value=""></option>';
						var c1_ysfs = [{name:'',value:''}];
						var html_ysz = '<option value=""></option>';
						var c1_ysz = [{name:'',value:''}];
						
						var ysfslength = conditionList[j].ysfs?conditionList[j].ysfs.split(",").length:0;
						for(var x = 0 ; x < ysfslength; x ++){
							c1_ysfs.push({name:conditionList[j].ysfsmc.split(";")[x],value:conditionList[j].ysfs.split(",")[x]});
							html += '<option value="'+conditionList[j].ysfs.split(",")[x]+'">'+conditionList[j].ysfsmc.split(";")[x]+'</option>';
						}
						calculateSymbol1 = c1_ysfs;
						$("#_1_cv1").html(html);
						
						if(conditionList[j].sjy){
							$.ajax({
								type : 'POST',
								url : smartec.ctx + '/setting/flowconfig/getDic.do',
								datatype : 'json',
								async : false,
								data : {dicgroup:conditionList[j].sjy},
								success : function(data) {
									for(var i = 0 ; data && i <data.length ; i++){
										c1_ysz.push({name:data[i].zdmc,value:data[i].zdbh});
										html_ysz += '<option value="'+data[i].zdbh+'">'+data[i].zdmc+'</option>';
									}
								}
							});
							conditionValues1 = c1_ysz;
						}
						if(conditionList[j].value == "1"){
							for(var i = 0 ; departements && i <departements.length ; i++){
								c1_ysz.push({name:departements[i].name,value:departements[i].value});
								html_ysz += '<option value="'+departements[i].value+'">'+departements[i].name+'</option>';
							}
							conditionValues1 = departements;
						}
						
						if(conditionList[j].kjlx == "multiselect"){
							$("#_1_cvc1").css("display","none");
							var oriDisplay = $("#ptjz1 .chosen-container").css("display");
							$("#_1_cvc2").html(html_ysz);
							if(!oriDisplay){
								$("#_1_cvc2").css("display","block");
								$("#_1_cvc2").chosen({});
							}else{
								$("#_1_cvc2").trigger("chosen:updated")
							}
							if(oriDisplay == "none"){
								 $("#ptjz1 .chosen-container").css("display","block")
							}
							$("#_1_cvc3").css("display","none");
						}else if(conditionList[j].kjlx == "select"){
							$("#_1_cvc1").css("display","block");
							$("#_1_cvc1").html(html_ysz);
							$("#_1_cvc2").css("display","none");
							$("#ptjz1 .chosen-container").css("display","none")
							$("#_1_cvc3").css("display","none");
						}else{
							$("#_1_cvc1").css("display","none");
							$("#_1_cvc2").css("display","none");
							$("#ptjz1 .chosen-container").css("display","none")
							$("#_1_cvc3").css("display","block");
						}

					}
				}
				
			}).appendTo('#'+_div);
			
			for(var idx=0; idx<arg.length; idx++){
				sle.append('<option value="'+arg[idx].value+'">'+arg[idx].name+'</option>');
			}
			sle.val(_props[_k].value);
			sle.trigger("change");
			$('#'+_div).data('editor', this);
		};
		this.destroy = function(){};
	},
	calculateSymbol1_SelectEditor : function(arg){
		var _props,_k,_div,_src,_r;
		this.init = function(props, k, div, src, r){
			_props=props; _k=k; _div=div; _src=src; _r=r;
			var sle = $('<select id="_1_cv1"  style="width:100%;"/>').change(function(){
				props[_k].value = $(this).val();
			}).appendTo('#'+_div);
			for(var idx=0; arg&&idx<arg.length; idx++){
				sle.append('<option value="'+arg[idx].value+'">'+arg[idx].name+'</option>');
			}
//			console.log(_props[_k].value);
//			console.log($(sle));
			$(sle).val(_props[_k].value);
			$('#'+_div).data('editor', this);
		};
		this.destroy = function(){};
	},
	conditionValues1_Editor : function(arg){
		var _props,_k,_div,_src,_r;
		this.init = function(props, k, div, src, r){
			_props=props; _k=k; _div=div; _src=src; _r=r;
			var select = $('<select id="_1_cvc1"  class="" retype="select" style="width:100%;display:none"></select>');
			var mutiselect = $('<select id="_1_cvc2" data-placeholder="--选择--" class="chosen-select form-control " style="width:100%;height:30px;display:none" retype="multiselect" multiple></select>');
			var input = $('<input id="_1_cvc3"  style="width:100%;display:none" />');

			$(select).appendTo('#'+_div);
			$(mutiselect).appendTo('#'+_div);
			$(input).appendTo('#'+_div);
			
			$(select).change(function(){
				props[_k].value = $(this).val();
			});
			
			$(input).change(function(){
				props[_k].value = $(this).val();
			});
			
			$(mutiselect).change(function(){
				props[_k].value = $(this).val();
			});
			
			for(var j = 0 ; conditionList && j < conditionList.length ; j ++){
				if(conditionList[j].value == $("#cL1").val()){
					
					if(conditionList[j].kjlx == "multiselect"){
						$("#_1_cvc1").css("display","none");
						
						for(var idx=0; conditionValues1!=null&&idx<conditionValues1.length; idx++){
							mutiselect.append('<option value="'+conditionValues1[idx].value+'">'+conditionValues1[idx].name+'</option>');
						}
						
						var oriDisplay = $("#ptjz1 .chosen-container").css("display");
						if(!oriDisplay){
							$("#_1_cvc2").css("display","block");
							$("#_1_cvc2").chosen({});
						}
						if(oriDisplay == "none"){
							 $("#ptjz1 .chosen-container").css("display","block")
						}
						
						if(!isArray(props[_k].value)){
							props[_k].value = props[_k].value.split(",");
						}
						
			            for (i = 0; props[_k].value && i < props[_k].value.length; i++) {
			                $("#_1_cvc2" + " option[value='" + props[_k].value[i] + "']").attr('selected', 'selected');
			            }
						$("#_1_cvc2").trigger("chosen:updated")

						
						$("#_1_cvc3").css("display","none");
					}else if(conditionList[j].kjlx == "select"){
						for(var idx=0; conditionValues1!=null&&idx<conditionValues1.length; idx++){
							select.append('<option value="'+conditionValues1[idx].value+'">'+conditionValues1[idx].name+'</option>');
						}
						$("#_1_cvc1").css("display","block");
						$("#_1_cvc1").val(props[_k].value);
						$("#_1_cvc2").css("display","none");
						$("#ptjz1 .chosen-container").css("display","none")
						$("#_1_cvc3").css("display","none");
					}else{
						$("#_1_cvc1").css("display","none");
						$("#_1_cvc2").css("display","none");
						$("#ptjz1 .chosen-container").css("display","none")
						$("#_1_cvc3").css("display","block");
						$("#_1_cvc3").val(props[_k].value);
					}
				}
			}
			
			$('#'+_div).data('editor', this);
		};
		this.destroy = function(){};
	},
	
	
	

	conditionList2_SelectEditor : function(arg){
		var _props,_k,_div,_src,_r;
		this.init = function(props, k, div, src, r){
			_props=props; _k=k; _div=div; _src=src; _r=r;
			var sle = $('<select id="cL2"  style="width:100%;"/>').change(function(){
				props[_k].value = $(this).val();
				
				for(var j = 0 ; conditionList && j < conditionList.length ; j ++){
					if(conditionList[j].value == $(this).val()){
						var html = '<option value=""></option>';
						var c1_ysfs = [{name:'',value:''}];
						var html_ysz = '<option value=""></option>';
						var c1_ysz = [{name:'',value:''}];
						
						var ysfslength = conditionList[j].ysfs?conditionList[j].ysfs.split(",").length:0;
						for(var x = 0 ; x < ysfslength; x ++){
							c1_ysfs.push({name:conditionList[j].ysfsmc.split(";")[x],value:conditionList[j].ysfs.split(",")[x]});
							html += '<option value="'+conditionList[j].ysfs.split(",")[x]+'">'+conditionList[j].ysfsmc.split(";")[x]+'</option>';
						}
						calculateSymbol2 = c1_ysfs;
						$("#_2_cv1").html(html);
						
						if(conditionList[j].sjy){
							$.ajax({
								type : 'POST',
								url : smartec.ctx + '/setting/flowconfig/getDic.do',
								datatype : 'json',
								async : false,
								data : {dicgroup:conditionList[j].sjy},
								success : function(data) {
									for(var i = 0 ; data && i <data.length ; i++){
										c1_ysz.push({name:data[i].zdmc,value:data[i].zdbh});
										html_ysz += '<option value="'+data[i].zdbh+'">'+data[i].zdmc+'</option>';
									}
								}
							});
							conditionValues2 = c1_ysz;
						}
						if(conditionList[j].value == "1"){
							for(var i = 0 ; departements && i <departements.length ; i++){
								c1_ysz.push({name:departements[i].name,value:departements[i].value});
								html_ysz += '<option value="'+departements[i].value+'">'+departements[i].name+'</option>';
							}
							conditionValues2 = departements;
						}
						
						if(conditionList[j].kjlx == "multiselect"){
							$("#_2_cvc1").css("display","none");
							var oriDisplay = $("#ptjz2 .chosen-container").css("display");
							$("#_2_cvc2").html(html_ysz);
							if(!oriDisplay){
								$("#_2_cvc2").css("display","block");
								$("#_2_cvc2").chosen({});
							}else{
								$("#_2_cvc2").trigger("chosen:updated")
							}
							if(oriDisplay == "none"){
								 $("#ptjz2 .chosen-container").css("display","block")
							}
							$("#_2_cvc3").css("display","none");
						}else if(conditionList[j].kjlx == "select"){
							$("#_2_cvc1").css("display","block");
							$("#_2_cvc1").html(html_ysz);
							$("#_2_cvc2").css("display","none");
							$("#ptjz2 .chosen-container").css("display","none")
							$("#_2_cvc3").css("display","none");
						}else{
							$("#_2_cvc1").css("display","none");
							$("#_2_cvc2").css("display","none");
							$("#ptjz2 .chosen-container").css("display","none")
							$("#_2_cvc3").css("display","block");
						}

					}
				}
				
			}).appendTo('#'+_div);
			
			for(var idx=0; idx<arg.length; idx++){
				sle.append('<option value="'+arg[idx].value+'">'+arg[idx].name+'</option>');
			}
			sle.val(_props[_k].value);
			sle.trigger("change");
			$('#'+_div).data('editor', this);
		};
		this.destroy = function(){};
	},
	calculateSymbol2_SelectEditor : function(arg){
		var _props,_k,_div,_src,_r;
		this.init = function(props, k, div, src, r){
			_props=props; _k=k; _div=div; _src=src; _r=r;
			var sle = $('<select id="_2_cv1"  style="width:100%;"/>').change(function(){
				props[_k].value = $(this).val();
			}).appendTo('#'+_div);
			for(var idx=0; arg&&idx<arg.length; idx++){
				sle.append('<option value="'+arg[idx].value+'">'+arg[idx].name+'</option>');
			}
//			console.log(_props[_k].value);
//			console.log($(sle));
			$(sle).val(_props[_k].value);
			$('#'+_div).data('editor', this);
		};
		this.destroy = function(){};
	},
	conditionValues2_Editor : function(arg){
		var _props,_k,_div,_src,_r;
		this.init = function(props, k, div, src, r){
			_props=props; _k=k; _div=div; _src=src; _r=r;
			var select = $('<select id="_2_cvc1"  class="" retype="select" style="width:100%;display:none"></select>');
			var mutiselect = $('<select id="_2_cvc2" data-placeholder="--选择--" class="chosen-select form-control " style="width:100%;height:30px;display:none" retype="multiselect" multiple></select>');
			var input = $('<input id="_2_cvc3"  style="width:100%;display:none" />');

			$(select).appendTo('#'+_div);
			$(mutiselect).appendTo('#'+_div);
			$(input).appendTo('#'+_div);
			
			$(select).change(function(){
				props[_k].value = $(this).val();
			});
			
			$(input).change(function(){
				props[_k].value = $(this).val();
			});
			
			$(mutiselect).change(function(){
				props[_k].value = $(this).val();
			});
			
			for(var j = 0 ; conditionList && j < conditionList.length ; j ++){
				if(conditionList[j].value == $("#cL2").val()){
					
					if(conditionList[j].kjlx == "multiselect"){
						$("#_2_cvc1").css("display","none");
						
						for(var idx=0; conditionValues2!=null&&idx<conditionValues2.length; idx++){
							mutiselect.append('<option value="'+conditionValues2[idx].value+'">'+conditionValues2[idx].name+'</option>');
						}
						
						var oriDisplay = $("#ptjz2 .chosen-container").css("display");
						if(!oriDisplay){
							$("#_2_cvc2").css("display","block");
							$("#_2_cvc2").chosen({});
						}
						if(oriDisplay == "none"){
							 $("#ptjz2 .chosen-container").css("display","block")
						}
						if(!isArray(props[_k].value)){
							props[_k].value = props[_k].value.split(",");
						}
			            for (i = 0; props[_k].value && i < props[_k].value.length; i++) {
			                $("#_2_cvc2" + " option[value='" + props[_k].value[i] + "']").attr('selected', 'selected');
			            }
						$("#_2_cvc2").trigger("chosen:updated")

						
						$("#_2_cvc3").css("display","none");
					}else if(conditionList[j].kjlx == "select"){
						for(var idx=0; conditionValues2!=null&&idx<conditionValues2.length; idx++){
							select.append('<option value="'+conditionValues2[idx].value+'">'+conditionValues2[idx].name+'</option>');
						}
						$("#_2_cvc1").css("display","block");
						$("#_2_cvc1").val(props[_k].value);
						$("#_2_cvc2").css("display","none");
						$("#ptjz2 .chosen-container").css("display","none")
						$("#_2_cvc3").css("display","none");
					}else{
						$("#_2_cvc1").css("display","none");
						$("#_2_cvc2").css("display","none");
						$("#ptjz2 .chosen-container").css("display","none")
						$("#_2_cvc3").css("display","block");
						$("#_2_cvc3").val(props[_k].value);
					}
				}
			}
			
			$('#'+_div).data('editor', this);
		};
		this.destroy = function(){};
	},
	
	
	
	

	conditionList3_SelectEditor : function(arg){
		var _props,_k,_div,_src,_r;
		this.init = function(props, k, div, src, r){
			_props=props; _k=k; _div=div; _src=src; _r=r;
			var sle = $('<select id="cL3"  style="width:100%;"/>').change(function(){
				props[_k].value = $(this).val();
				
				for(var j = 0 ; conditionList && j < conditionList.length ; j ++){
					if(conditionList[j].value == $(this).val()){
						var html = '<option value=""></option>';
						var c1_ysfs = [{name:'',value:''}];
						var html_ysz = '<option value=""></option>';
						var c1_ysz = [{name:'',value:''}];
						
						var ysfslength = conditionList[j].ysfs?conditionList[j].ysfs.split(",").length:0;
						for(var x = 0 ; x < ysfslength; x ++){
							c1_ysfs.push({name:conditionList[j].ysfsmc.split(";")[x],value:conditionList[j].ysfs.split(",")[x]});
							html += '<option value="'+conditionList[j].ysfs.split(",")[x]+'">'+conditionList[j].ysfsmc.split(";")[x]+'</option>';
						}
						calculateSymbol3 = c1_ysfs;
						$("#_3_cv1").html(html);
						
						if(conditionList[j].sjy){
							$.ajax({
								type : 'POST',
								url : smartec.ctx + '/setting/flowconfig/getDic.do',
								datatype : 'json',
								async : false,
								data : {dicgroup:conditionList[j].sjy},
								success : function(data) {
									for(var i = 0 ; data && i <data.length ; i++){
										c1_ysz.push({name:data[i].zdmc,value:data[i].zdbh});
										html_ysz += '<option value="'+data[i].zdbh+'">'+data[i].zdmc+'</option>';
									}
								}
							});
							conditionValues3 = c1_ysz;
						}
						if(conditionList[j].value == "1"){
							for(var i = 0 ; departements && i <departements.length ; i++){
								c1_ysz.push({name:departements[i].name,value:departements[i].value});
								html_ysz += '<option value="'+departements[i].value+'">'+departements[i].name+'</option>';
							}
							conditionValues3 = departements;
						}
						
						if(conditionList[j].kjlx == "multiselect"){
							$("#_3_cvc1").css("display","none");
							var oriDisplay = $("#ptjz3 .chosen-container").css("display");
							$("#_3_cvc2").html(html_ysz);
							if(!oriDisplay){
								$("#_3_cvc2").css("display","block");
								$("#_3_cvc2").chosen({});
							}else{
								$("#_3_cvc2").trigger("chosen:updated")
							}
							if(oriDisplay == "none"){
								 $("#ptjz3 .chosen-container").css("display","block")
							}
							$("#_3_cvc3").css("display","none");
						}else if(conditionList[j].kjlx == "select"){
							$("#_3_cvc1").css("display","block");
							$("#_3_cvc1").html(html_ysz);
							$("#_3_cvc2").css("display","none");
							$("#ptjz3 .chosen-container").css("display","none")
							$("#_3_cvc3").css("display","none");
						}else{
							$("#_3_cvc1").css("display","none");
							$("#_3_cvc2").css("display","none");
							$("#ptjz3 .chosen-container").css("display","none")
							$("#_3_cvc3").css("display","block");
						}

					}
				}
				
			}).appendTo('#'+_div);
			
			for(var idx=0; idx<arg.length; idx++){
				sle.append('<option value="'+arg[idx].value+'">'+arg[idx].name+'</option>');
			}
			sle.val(_props[_k].value);
			sle.trigger("change");
			$('#'+_div).data('editor', this);
		};
		this.destroy = function(){};
	},
	calculateSymbol3_SelectEditor : function(arg){
		var _props,_k,_div,_src,_r;
		this.init = function(props, k, div, src, r){
			_props=props; _k=k; _div=div; _src=src; _r=r;
			var sle = $('<select id="_3_cv1"  style="width:100%;"/>').change(function(){
				props[_k].value = $(this).val();
			}).appendTo('#'+_div);
			for(var idx=0; arg&&idx<arg.length; idx++){
				sle.append('<option value="'+arg[idx].value+'">'+arg[idx].name+'</option>');
			}
//			console.log(_props[_k].value);
//			console.log($(sle));
			$(sle).val(_props[_k].value);
			$('#'+_div).data('editor', this);
		};
		this.destroy = function(){};
	},
	conditionValues3_Editor : function(arg){
		var _props,_k,_div,_src,_r;
		this.init = function(props, k, div, src, r){
			_props=props; _k=k; _div=div; _src=src; _r=r;
			var select = $('<select id="_3_cvc1"  class="" retype="select" style="width:100%;display:none"></select>');
			var mutiselect = $('<select id="_3_cvc2" data-placeholder="--选择--" class="chosen-select form-control " style="width:100%;height:30px;display:none" retype="multiselect" multiple></select>');
			var input = $('<input id="_3_cvc3"  style="width:100%;display:none" />');

			$(select).appendTo('#'+_div);
			$(mutiselect).appendTo('#'+_div);
			$(input).appendTo('#'+_div);
			
			$(select).change(function(){
				props[_k].value = $(this).val();
			});
			
			$(input).change(function(){
				props[_k].value = $(this).val();
			});
			
			$(mutiselect).change(function(){
				props[_k].value = $(this).val();
			});
			
			for(var j = 0 ; conditionList && j < conditionList.length ; j ++){
				if(conditionList[j].value == $("#cL3").val()){
					
					if(conditionList[j].kjlx == "multiselect"){
						$("#_3_cvc1").css("display","none");
						
						for(var idx=0; conditionValues3!=null&&idx<conditionValues3.length; idx++){
							mutiselect.append('<option value="'+conditionValues3[idx].value+'">'+conditionValues3[idx].name+'</option>');
						}
						
						var oriDisplay = $("#ptjz3 .chosen-container").css("display");
						if(!oriDisplay){
							$("#_3_cvc2").css("display","block");
							$("#_3_cvc2").chosen({});
						}
						if(oriDisplay == "none"){
							 $("#ptjz3 .chosen-container").css("display","block")
						}
						if(!isArray(props[_k].value)){
							props[_k].value = props[_k].value.split(",");
						}
			            for (i = 0; props[_k].value && i < props[_k].value.length; i++) {
			                $("#_3_cvc2" + " option[value='" + props[_k].value[i] + "']").attr('selected', 'selected');
			            }
						$("#_3_cvc2").trigger("chosen:updated")

						
						$("#_3_cvc3").css("display","none");
					}else if(conditionList[j].kjlx == "select"){
						for(var idx=0; conditionValues3!=null&&idx<conditionValues3.length; idx++){
							select.append('<option value="'+conditionValues3[idx].value+'">'+conditionValues3[idx].name+'</option>');
						}
						$("#_3_cvc1").css("display","block");
						$("#_3_cvc1").val(props[_k].value);
						$("#_3_cvc2").css("display","none");
						$("#ptjz3 .chosen-container").css("display","none")
						$("#_3_cvc3").css("display","none");
					}else{
						$("#_3_cvc1").css("display","none");
						$("#_3_cvc2").css("display","none");
						$("#ptjz3 .chosen-container").css("display","none")
						$("#_3_cvc3").css("display","block");
						$("#_3_cvc3").val(props[_k].value);
					}
				}
			}
			
			$('#'+_div).data('editor', this);
		};
		this.destroy = function(){};
	},
	
	
	
	
	
	verifyContentSelectEditor:function(roles,jobs){
		var _props,_k,_div,_src,_r;
		this.init = function(props, k, div, src, r){
			_props=props; _k=k; _div=div; _src=src; _r=r;

			var sle_role = $('<select id="zt_role" class="" retype="select" style="width:100%;display:none"></select>');
			var sle_job = $('<select id="zt_job" class="" retype="select" style="width:100%;display:none"></select>');
			var sle_man = $('<div id="zt_man" class="input-group" style="width:100%;display:none"><input id="user_name" type="text" readonly class="form-control input-sm " retype="text"> <span class="input-group-btn"><button id="selectuser" type="button" class="btn btn-primary input-sm">+</button></span> <input type="hidden" id="user_id" /></div>');
			
			for(var idx=0; roles!=null&&idx<roles.length; idx++){
				sle_role.append('<option value="'+roles[idx].value+'">'+roles[idx].name+'</option>');
			}
			for(var idx=0; jobs!=null&&idx<jobs.length; idx++){
				sle_job.append('<option value="'+jobs[idx].value+'">'+jobs[idx].name+'</option>');
			}
			$(sle_role).appendTo('#'+_div);
			$(sle_job).appendTo('#'+_div);
			$(sle_man).appendTo('#'+_div);
			
			$(sle_role).change(function(){
				props[_k].value = $(this).val();
			});
			
			$(sle_job).change(function(){
				props[_k].value = $(this).val();
			});

			$('#user_id').bind('change', function() {
//				console.log($(this).val()+"_"+$('#user_name').val());
				props[_k].value = $(this).val()+"_"+$('#user_name').val();
			});
			
			$('#selectuser').click(function() {
				try
				{
					layer.open({
						type : 2,
						title : '选择人员',
						shadeClose : false,
						shade : 0.3,
						area : [ '500px', '350px' ],
						content : ahcourt.ctx + '/views/setting/verifyflow/selectuser/select_user.jsp?ele=user_name&hid=user_id&mult=0',
					});
				}catch(err){}
			})
			
			if($("#zt_type").val() == "0"){
				$("#zt_role").css("display","none")
				$("#zt_job").css("display","none");
				$("#zt_man").css("display","none");
			}else if($("#zt_type").val() == "1"){
				$("#zt_role").css("display","block");;
				$("#zt_role").val(props[_k].value);
				$("#zt_job").css("display","none");
				$("#zt_man").css("display","none");
			}else if($("#zt_type").val() == "2"){
				$("#zt_role").css("display","none");
				$("#zt_job").css("display","none");
				$("#zt_man").css("display","block");
				if(props[_k].value){
					$("#user_id").val(props[_k].value.split("_")[0]);
					$("#user_name").val(props[_k].value.split("_")[1]);
//					console.log($("#user_id").val(),$("#user_name").val());
				}
			}else if($("#zt_type").val() == "3"){
				$("#zt_role").css("display","none");
				$("#zt_job").css("display","block");;
				$("#zt_job").val(props[_k].value);
				$("#zt_man").css("display","none");
			}else{
				$("#zt_role").css("display","none");
				$("#zt_job").css("display","none");
				$("#zt_man").css("display","none");
			}
			
			
			$('#'+_div).data('editor', this);
		};
		this.destroy = function(){
			
		};
	}
});

})(jQuery);

function isArray(obj) {   
  return Object.prototype.toString.call(obj) === '[object Array]';    
}  
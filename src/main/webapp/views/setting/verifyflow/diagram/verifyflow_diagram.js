var myflow;
var mode;
var flowName;
var flowId;
var flowVersion;
var flowStartDate;
var conditionList = [{name:'',value:''},{name:'所属组织机构',value:'1',kjlx:'multiselect',ysfs:'18703,18706',ysfsmc:'=;!=',zdlx:'String',zdmc:'qyfl'}];
var calculateSymbol1,calculateSymbol2,calculateSymbol3;
var conditionValues1,conditionValues2,conditionValues3;
var historyVerifiers = [{name:'',value:''},{name:'申请人',value:0}];
// var verifyType = [{name:'',value:''},{name:'角色',value:1},{name:'个人',value:2},{name:'岗位',value:3}]; //简易版不支持岗位
var verifyType = [{name:'',value:''},{name:'角色',value:1},{name:'个人',value:2}];
var flowSteps = [{name:'',value:''},{name:'1',value:1},{name:'2',value:2},{name:'3',value:3},{name:'4',value:4},{name:'5',value:5},{name:'6',value:6},{name:'7',value:7},{name:'8',value:8},{name:'9',value:9},{name:'10',value:10}]
var roles = [{name:'',value:''}];
var jobs = [{name:'',value:''}];
var departements = [{name:'',value:''}];
var json_flow_data = {};

$(function() {

	
	myflow = $.myflow;
	mode = $("#mode").val();
	flowName = $("#lcmkmc").val();;
	flowId = $("#lcmkid").val();
	flowVersion = $("#lcbb").val();
	flowStartDate = $("#lcqyrq").val();
	
	if(mode == "input"){
		json_flow_data = {states:{rect1:{type:'start',text:{text:'开始'}, attr:{ x:16, y:294, width:100, height:50}, props:{text:{value:'开始'}}},rect2:{type:'end',text:{text:'结束'}, attr:{ x:946, y:294, width:100, height:50}, props:{text:{value:'结束'}}}},paths:{},props:{props:{name:{value:'客户审核流程'},key:{value:'6'},desc:{value:''}}}};
		$.extend(true,myflow.config.props.props,{
			name : {name:'name', label:'流程名称', value:flowName, editor:function(){return new myflow.editors.inputEditorReadonly();}},
			key : {name:'key', label:'版本号', value:flowVersion, editor:function(){return new myflow.editors.inputEditorReadonly();}},
			desc : {name:'desc', label:'启用日期', value:flowStartDate, editor:function(){return new myflow.editors.dateEditor();}}
		});
	}else{
		$.ajax({
			type : 'POST',
			url : ahcourt.ctx + '/setting/flowconfig/getTX.do',
			datatype : 'json',
			async : false,
			data : {lcmk:flowId,lcbb:flowVersion},
			success : function(data) {
				if(data && data[0] && data[0].txnr && data[0].txnr.length > 3){
					var jsonstr = "("+data[0].txnr+")";
					json_flow_data = eval(jsonstr);
				}
			}
		});
		$.extend(true,myflow.config.props.props,{
			name : {name:'name', label:'流程名称', value:flowName, editor:function(){return new myflow.editors.inputEditorReadonly();}},
			key : {name:'key', label:'版本号', value:flowVersion, editor:function(){return new myflow.editors.inputEditorReadonly();}},
			desc : {name:'desc', label:'启用日期', value:flowStartDate, editor:function(){return new myflow.editors.inputEditorReadonly();}}
		});
	}
	
	getRoles();
	//getJobs();
	//getConditions();
	//getDepartement();
	
	
	$.extend(true,myflow.config.tools.states,{
		start : {
					type : 'start',
					name : {text:'<<start>>'},
					text : {text:'开始'},
					img : {src : ahcourt.ctx+'/views/setting/verifyflow/diagram/img/16/start_event_empty.png',width : 16, height:16},
					props : {
						text: {name:'text',label: '显示', value:'', editor: function(){return new myflow.editors.inputEditorReadonly();}, value:'开始'}
					}},
				end : {type : 'end',
					name : {text:'<<end>>'},
					text : {text:'结束'},
					img : {src : ahcourt.ctx+'/views/setting/verifyflow/diagram/img/16/end_event_terminate.png',width : 16, height:16},
					props : {
						text: {name:'text',label: '显示', value:'', editor: function(){return new myflow.editors.inputEditorReadonly();}, value:'结束'}
					}},
				task : {type : 'task',
					name : {text:'<<task>>'},
					text : {text:'任务'},
					img : {src : ahcourt.ctx+'/views/setting/verifyflow/diagram/img/16/task_empty.png',width :16, height:16},
					props : {
						text: {name:'text', label: '环节名称', value:'', editor: function(){return new myflow.editors.textEditor();}, value:'任务'},
						hjbz: {name:'hjbz', label: '环节步骤', value:'', editor: function(){return new myflow.editors.selectEditor(flowSteps);}},
						shztlx: {name:'shztlx', label: '审核主体类型', value:'', editor: function(){return new myflow.editors.verifyTypeSelectEditor(verifyType);}},
						shzt: {name:'shzt', label : '审核主体', value:'', editor: function(){return new myflow.editors.verifyContentSelectEditor(roles,jobs);}},
						btgth: {name:'btgth', label : '不通过退回', value:'', editor: function(){return new myflow.editors.selectEditor(historyVerifiers);}}
						//建议版本无条件支持功能
						// tj1: {name:'tj1', label : '条件1', value:'', editor: function(){return new myflow.editors.conditionList1_SelectEditor(conditionList);}},
						// tjysf1: {name:'tjysf1', label : '条件运算符1', value:'', editor: function(){return new myflow.editors.calculateSymbol1_SelectEditor(calculateSymbol1);}},
						// tjz1: {name:'tjz1', label : '条件值1', value:'', editor: function(){return new myflow.editors.conditionValues1_Editor();}},
						// tj2: {name:'tj2', label : '条件2', value:'', editor: function(){return new myflow.editors.conditionList2_SelectEditor(conditionList);}},
						// tjysf2: {name:'tjysf2', label : '条件运算符2', value:'', editor: function(){return new myflow.editors.calculateSymbol2_SelectEditor(calculateSymbol2);}},
						// tjz2: {name:'tjz2', label : '条件值2', value:'', editor: function(){return new myflow.editors.conditionValues2_Editor();}},
						// tj3: {name:'tj3', label : '条件3', value:'', editor: function(){return new myflow.editors.conditionList3_SelectEditor(conditionList);}},
						// tjysf3: {name:'tjysf3', label : '条件运算符3', value:'', editor: function(){return new myflow.editors.calculateSymbol3_SelectEditor(calculateSymbol3);}},
						// tjz3: {name:'tjz3', label : '条件值3', value:'', editor: function(){return new myflow.editors.conditionValues3_Editor();}}
					}}
	});
	
	$('#myflow').myflow({
		restore : json_flow_data,
		tools : {
			save : {
				onclick : function(data) {
					var _steps = [];
					var flowItems = eval("("+data+")");
					//validata
					if(flowItems && flowItems.props && flowItems.props.props && flowItems.props.props.desc && !flowItems.props.props.desc.value){
						parent.layer.msg("流程启用日期不能为空");
						//###验证日期格式非法
						return;
					}
//					console.log(flowItems.states);
					for(var _k in flowItems.states){
						var item = flowItems.states[_k];
						if(item.type == "task"){
							var _step = {};
							_step.lcmk = flowId;
							_step.lcbb = flowVersion;
							_step.lcqyrq = flowItems.props.props.desc.value;
							if(!item.text.text){
								parent.layer.msg("所有任务名称都不能为空");
								return ;
							}
							_step.hjmc = item.text.text;
							if(!item.props["hjbz"].value){
								parent.layer.msg("任务【"+item.text.text+"】 环节步骤不能为空");
								return ;
							}
							_step.bzxh = item.props["hjbz"].value;
							if(!item.props["shztlx"].value){
								parent.layer.msg("任务【"+item.text.text+"】审核主体类型不能为空");
								return ;
							}
							_step.ztlx = item.props["shztlx"].value;
							if(!item.props["shzt"].value){
								parent.layer.msg("任务【"+item.text.text+"】审核主体不能为空");
								return ;
							}
							_step.ztid = item.props["shzt"].value;
							if(!item.props["btgth"].value){
								parent.layer.msg("任务【"+item.text.text+"】【审核不通过退回】不能为空");
								return ;
							}
							_step.btgthz = item.props["btgth"].value;

							// _step.rules = [];
							// if(item.props["tj1"].value && item.props["tjysf1"].value && item.props["tjz1"].value){
							// 	var _rule = {};
							// 	_rule.lczdid = item.props["tj1"].value;
							// 	_rule.ysfs = item.props["tjysf1"].value;
							// 	_rule.value1 = item.props["tjz1"].value;
							// 	_step.rules.push(_rule);
							// }
							// if(item.props["tj2"].value && item.props["tjysf2"].value && item.props["tjz2"].value){
							// 	var _rule = {};
							// 	_rule.lczdid = item.props["tj2"].value;
							// 	_rule.ysfs = item.props["tjysf2"].value;
							// 	_rule.value1 = item.props["tjz2"].value;
							// 	_step.rules.push(_rule);
							// }
							// if(item.props["tj3"].value && item.props["tjysf3"].value && item.props["tjz3"].value){
							// 	var _rule = {};
							// 	_rule.lczdid = item.props["tj3"].value;
							// 	_rule.ysfs = item.props["tjysf3"].value;
							// 	_rule.value1 = item.props["tjz3"].value;
							// 	_step.rules.push(_rule);
							// }
							_steps.push(_step);
							
						}
					}
					$.ajax({
						type : 'POST',
						url : ahcourt.ctx + '/setting/flowconfig/SaveTX.do',
						datatype : 'json',
						async : false,
						data : {lcmk:flowId,lcbb:flowVersion,txnr:data,steps:JSON.stringify(_steps)},
						success : function(result) {
							if(result == 1){
								parent.loadLcbbByLcmk("10301");
								parent.loadIframeForSelectedFlow();
								var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引
								parent.layer.close(index);
							}else{
								parent.layer.msg("保存失败，请检查各字段值是否合法。");
							}
						}
					});
				}
			}
		}
	});
	
});


function getRoles() {
	$.ajax({
		type : 'POST',
		url : ahcourt.ctx + '/setting/flowconfig/getRoles.do',
		datatype : 'json',
		data : {},
		success : function(data) {
			for(var i = 0 ; data && i <data.length ; i++){
				roles.push({name:data[i].jsmc,value:data[i].id});
			}
		}
	});
}

function getJobs(){
	$.ajax({
		type : 'POST',
		url : ahcourt.ctx + '/setting/flowconfig/getJobs.do',
		datatype : 'json',
		data : {},
		success : function(data) {
			for(var i = 0 ; data && i <data.length ; i++){
				jobs.push({name:data[i].zdmc,value:data[i].zdbh});
			}
		}
	});
}

function getConditions(){
	$.ajax({
		type : 'POST',
		url : ahcourt.ctx + '/setting/flowconfig/getField.do',
		datatype : 'json',
		data : {
			lcmk : flowId
		},
		success : function(data) {
			for(var i = 0 ; data && i <data.length ; i++){
				data[i].name = data[i].zdms;
				data[i].value = data[i].id;
				conditionList.push(data[i]);
			}
		}
	});
}

function getDepartement(){
	$.ajax({
		type : 'POST',
		url : ahcourt.ctx + '/setting/flowconfig/getDepartement.do',
		datatype : 'json',
		data : {},
		success : function(data) {
			for(var i = 0 ; data && i <data.length ; i++){
				data[i].name = data[i].zzjgmc;
				data[i].value = data[i].zzjgid;
				departements.push(data[i]);
			}
		}
	});
}



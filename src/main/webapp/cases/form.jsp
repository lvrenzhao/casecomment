<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>表单组件</title>
		<jsp:include page="/header.jsp?libs=jqgrid;steps;icheck;bsfileinput;ztree;layer;laydate" />
    </head>
    <body>
    	<div class="form_center width1200 clearfix" style="padding: 15px 0;">
    		<div class="form_item wb100 fl">
				<label>项目名称</label>
				<input type="text" class="form-control" placeholder="请输入项目名称"/>
			</div>
			<div class="clearfix">
				<div class="form_item wb25">
					<label>计费方式</label>
					<select class="form-control">
						<option value="">--请选择--</option>
						<option value="以建筑面积计算">以建筑面积计算</option>
					</select>
				</div>
			</div>
			<div class="clearfix">
				<div class="form_item wb25 fl">
					<label>预计总面积（㎡）</label>
					<select class="form-control">
						<option value="">--请选择--</option>
						<option value="以建筑面积计算">以建筑面积计算</option>
					</select>
				</div>
				<div class="form_item wb25 fl">
					<label>专业类别</label>
					<div class="i-checkslayout">
						<div class="radio i-checks">
							<label class="default_radio"> 
								<input type="radio" value="1" name="types" style="position: absolute; opacity: 0;"> <i></i> 土建工程
							</label> 
							<label> 
								<input type="radio" value="2" name="types" style="position: absolute; opacity: 0;"> <i></i> 安装工程
							</label>
						</div>
					</div>
				</div>
			</div>
			<div class="clearfix">
				<div class="form_item wb25 fl">
					<label>服务内容</label>
					<div class="i-checkslayout">
						<div class="checkbox i-checks">
							<label class="default_radio"> 
								<input type="checkbox" value="1" name="service" style="position: absolute; opacity: 0;"> <i></i> 工程量计算
							</label> 
							<label> 
								<input type="checkbox" value="2" name="service" style="position: absolute; opacity: 0;"> <i></i> 清单编制
							</label>
							<label> 
								<input type="checkbox" value="3" name="service" style="position: absolute; opacity: 0;"> <i></i> 控制价
							</label>
						</div>
					</div>
				</div>
				<div class="form_item wb25 fl">
					<label>综合误差率（%）</label>
					<input type="text" class="form-control" placeholder="请输入综合误差率"/>
				</div>
				<div class="form_item wb25 fl">
					<label>合同起止日期</label>
					<div class="form_area clearfix">
						<input type="text" class="form-control wb45 fl" placeholder="开始时间" onclick="laydate({istime: true,format: 'YYYY-MM-DD'})"/>
						<label class="wb10 fl">~</label>
						<input type="text" class="form-control wb45 fl" placeholder="到期时间" onclick="laydate({istime: true,format: 'YYYY-MM-DD'})"/>
					</div>
				</div>
			</div>
			<div class="form_item wb25 fl">
				<label>期望工期（工作日）</label>
				<input type="text" class="form-control" placeholder="请输入期望工期"/>
			</div>
			<div class="form_item wb50 fl">
				<label>编制或审核要求</label>
				<select class="form-control">
					<option value="">--请选择--</option>
					<option value="编制或审核要求">编制或审核要求</option>
				</select>
			</div>
			<div class="form_item wb25 fl">
				<label>是否需要现场工作（天）</label>
				<div class="input-group m-b">
					<span class="input-group-addon"> <input type="checkbox"> </span>
                    <input type="text" class="form-control">
                </div>
			</div>
			<div class="form_item wb25 fl">
				<label>所在省份</label>
				<select class="form-control">
					<option value="">--请选择--</option>
					<option value="安徽省">安徽省</option>
				</select>
			</div>
			<div class="form_item wb25 fl">
				<label>所在城市</label>
				<select class="form-control">
					<option value="">--请选择--</option>
					<option value="合肥">合肥</option>
				</select>
			</div>
			<div class="form_item wb25 fl">
				<label>所在区县</label>
				<select class="form-control">
					<option value="">--请选择--</option>
					<option value="政务区">政务区</option>
				</select>
			</div>
			<div class="form_item wb25 fl">
				<label>联系电话</label>
				<input type="text" class="form-control" placeholder="18255153698"/>
			</div>
			<div class="clearfix">
				<div class="form_item wb25 fl">
					<label>交付截至日期</label>
					<input type="text" class="form-control" onclick="laydate({istime: true,format: 'YYYY-MM-DD'})"/>
				</div>
			</div>
			<div class="form_item wb100 fl">
				<label>项目描述</label>
				<textarea  class="form-control" placeholder="请输入项目描述"></textarea>
			</div>
			<div class="form_item wb100 fl">
				<label>附件</label>
				<input id="paper" class="inpu-sm" type="file" multiple name="file">
			</div>
    	</div>
    	
    	<div class="clearfix form_line" style="padding: 15px 0;">
    		<div class="form_item wb25 fl">
				<label>联系电话：</label>
				<div class="right">
					<input type="text" class="form-control" placeholder="18255153698"/>
				</div>
			</div>
    	</div>
    	
    	<script type="text/javascript">
    		$(function(){
    			$('.i-checks').iCheck({
					radioClass : 'iradio_square-green',
					checkboxClass : 'icheckbox_square-green',
				});
			
				$(".default_radio").find(".iradio_square-green").addClass("checked");
				initFileimages("#paper", 1);
    		})
    		
    		
    		// 上传多图附件
			function initFileimages(id, num) {
				var fileinput = $(id).fileinput({
					language : 'zh',
					uploadUrl : smartec.ctx + '/basic/file/fileupload.do',
					enctype : 'multipart/form-data',
					mainClass : 'file-caption-main',
					// 单位kb
					maxFileSize : 51200,
					maxFileCount : num,
					showPreview : false,
					autoReplace : true,
					showUpload : true,
					showCaption : true,
				}).on("fileuploaded", function(event, data, previewId, index) {
					
					var result = data.response;
					pt +=result.id+";";
					if(pt_address=='title_paper'){
						title_paper=pt;
						
					}else if(pt_address=='qualificat_paper'){
						qualificat_paper=pt;
						
					}else if(pt_address=='edu_paper'){
						edu_paper=pt;
					}
					else if(pt_address=='idptcard'){
						idptcard=pt;
					}
					
					console.log(result);
				}).on("fileuploaderror", function(event, data, msg) {
				})
				
				return fileinput;
			}
    		
    		
    	</script>
 	</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>双评工作平台</title>
    <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
    <jsp:include page="/header.jsp?libs=icheck;layer" />
  </head>
  <body>
  <div class="bmbox_layout title_fixed clearfix">
    <div class="bmbox_title">
      <h5>添加专家</h5>
      <div class="bmbox_tool">
        <button id="btn_submit" style="" class="btn btn-primary  btn-smx" type="button"><i class="fa fa-check"></i> 提交</button>
      </div>
    </div>
    <div class="bmbox_content clearfix">
      <div class="form_center accountbasic clearfix" style="padding: 15px 0;">

        <div class="form_item wb60 fl">
          <label>选择用户<span>*</span></label>
          <div class="input-group">
            <input type="hidden" id="user_id" value="${professional.userid}" />
            <input type="text" class="form-control" readonly id="user_name" value="${professional.xm}">
            <span class="input-group-btn">
            <button type="button" id="selectuser"  class="btn btn-primary">选择用户</button>
        </span>
          </div>
        </div>

        <div class="form_item wb60 fl">
          <label>专业<span>*</span></label>
          <div class="i-checkslayout">
            <div class="checkbox i-checks">
              <label class="default_radio">
                <input type="checkbox" id="zy80401" value="80401" name="zy" style="position: absolute; opacity: 0;"> <i></i> 刑事
              </label>
              <label>
                <input type="checkbox" id="zy80402" value="80402" name="zy" style="position: absolute; opacity: 0;"> <i></i> 民事
              </label>
              <label>
                <input type="checkbox" id="zy80403" value="80403" name="zy" style="position: absolute; opacity: 0;"> <i></i> 行政
              </label>
              <label>
                <input type="checkbox" id="zy80404" value="80404" name="zy" style="position: absolute; opacity: 0;"> <i></i> 赔偿
              </label>
              <label>
                <input type="checkbox" id="zy80405" value="80405" name="zy" style="position: absolute; opacity: 0;"> <i></i> 执行
              </label>
              <label>
                <input type="checkbox" id="zy80406" value="80406" name="zy" style="position: absolute; opacity: 0;"> <i></i> 其他
              </label>
            </div>
          </div>
        </div>

        <div class="form_item wb60 fl">
          <label>工作头衔<span>*</span></label>
          <input type="text" id="txt_gztx" class="form-control bmrequire" placeholder="" value="${professional.tx}"/>
        </div>

        <div class="form_item wb60 fl">
          <label>专家标签<span>*</span></label>
          <div class="i-checkslayout">
            <div class="checkbox i-checks">
              <label class="default_radio">
                <input type="checkbox" id="bq80501" value="80501" name="bq" style="position: absolute; opacity: 0;"> <i></i> 人大代表
              </label>
              <label>
                <input type="checkbox" id="bq80502" value="80502" name="bq" style="position: absolute; opacity: 0;"> <i></i> 政协委员
              </label>
              <label>
                <input type="checkbox" id="bq80503" value="80503" name="bq" style="position: absolute; opacity: 0;"> <i></i> 资深检察官
              </label>
              <label>
                <input type="checkbox" id="bq80504" value="80504" name="bq" style="position: absolute; opacity: 0;"> <i></i> 专业学者
              </label>
            </div>
          </div>
        </div>

        <div class="form_item wb100 fl">
          <label>专家介绍<span>*</span></label>
          <textarea rows="10" id="txt_js" class="bmrequire">${professional.js}</textarea>
        </div>

      </div>
    </div>
  </div>
  <input type="hidden" id="mode" value="${mode}">
  <input type="hidden" id="zjid" value="${professional.zjid}">
  <input type="hidden" id="zy" value="${professional.zy}">
  <input type="hidden" id="bq" value="${professional.bq}">
  <script>
    $(function(){

        var mode = $("#mode").val();

        if(mode == "edit"){
          $("#selectuser").attr("disabled","disabled");

          //console.log($("#zy").val());
          if($("#zy").val()){
              $.each($("#zy").val().split(";"),function(index,value){
                  if(value){
                    $("#zy"+value).attr("checked","checked");
                  }
              });
          }

            if($("#bq").val()){
                $.each($("#bq").val().split(";"),function(index,value){
                    if(value){
                        $("#bq"+value).attr("checked","checked");
                    }
                });
            }

        }
//        else if (mode == "new"){}


        $("#btn_submit").click(function() {
            var state = checkmyform($(".accountbasic"),true);

            if (state) {
                var zy = "",bq="";
                $('input[name="zy"]:checked').each(function(){
                    zy += $(this).val()+";";
                });
                $('input[name="bq"]:checked').each(function(){
                    bq += $(this).val()+";";
                });

                //var jsids = str1.replace(/,/g, ';');
                $.ajax({
                    type : 'POST',
                    url : ahcourt.ctx + "/setting/professional/save.do",
                    datatype : 'json',
                    data : {
                        zjid : $("#zjid").val(),
                        zy :zy,
                        bq : bq,
                        tx : $("#txt_gztx").val(),
                        userid : $("#user_id").val(),
                        js : $("#txt_js").val()
                    },
                    success : function(data) {
                        if (data > 0) {
                            layer.msg("保存成功！");
                            parent.$("#table1").jqGrid().setGridParam({}).trigger("reloadGrid");
                            var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引
                            parent.layer.close(index);
                        } else {
                            layer.msg("保存失败");
                        }
                    }
                });
            } else {
                layer.msg("验证失败请重新填写！");
            }
        });


        $('.i-checks').iCheck({
            radioClass : 'iradio_square-green',
            checkboxClass : 'icheckbox_square-green',
        });
        $('#selectuser').click(function() {
            layer.open({
                type : 2,
                title : '添加要提醒的人员',
                shadeClose : false,
                shade : 0.3,
                area : [ '500px', '300px' ],
                content : ahcourt.ctx + '/views/basic/select_user.jsp?ele=user_name&hid=user_id&mult=0&useto=pro',
                cancel : function(index) {
                    layer.close(index);
                }
            });
        })
    })
  </script>
  </body>
</html>
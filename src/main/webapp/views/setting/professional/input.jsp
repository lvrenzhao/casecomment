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
      <div class="form_center clearfix" style="padding: 15px 0;">

        <div class="form_item wb60 fl">
          <label>选择用户</label>
          <div class="input-group">
            <input type="hidden" id="user_id" />
            <input type="text" class="form-control" readonly id="user_name">
            <span class="input-group-btn">
          <button type="button" id="selectuser" class="btn btn-primary">添加通知人员</button>
        </span>
          </div>
        </div>

        <div class="form_item wb60 fl">
          <label>专业</label>
          <div class="i-checkslayout">
            <div class="checkbox i-checks">
              <label class="default_radio">
                <input type="checkbox" value="1" name="service" style="position: absolute; opacity: 0;"> <i></i> 刑事
              </label>
              <label>
                <input type="checkbox" value="2" name="service" style="position: absolute; opacity: 0;"> <i></i> 民事
              </label>
              <label>
                <input type="checkbox" value="3" name="service" style="position: absolute; opacity: 0;"> <i></i> 行政
              </label>
              <label>
                <input type="checkbox" value="3" name="service" style="position: absolute; opacity: 0;"> <i></i> 赔偿
              </label>
              <label>
                <input type="checkbox" value="3" name="service" style="position: absolute; opacity: 0;"> <i></i> 执行
              </label>
              <label>
                <input type="checkbox" value="3" name="service" style="position: absolute; opacity: 0;"> <i></i> 其他
              </label>
            </div>
          </div>
        </div>

        <div class="form_item wb60 fl">
          <label>工作头衔</label>
          <input type="text" class="form-control" placeholder=""/>
        </div>

        <div class="form_item wb100 fl">
          <label>专家介绍</label>
          <textarea rows="10"></textarea>
        </div>

      </div>
    </div>
  </div>
  <script>
    $(function(){
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
                content : ahcourt.ctx + '/views/basic/select_user.jsp?ele=user_name&hid=user_id&mult=0',
                cancel : function(index) {
                    layer.close(index);
                }
            });
        })
    })
  </script>
  </body>
</html>
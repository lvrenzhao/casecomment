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
  <div class="form_center clearfix" style="padding: 15px 0;">
    <div class="form_item wb100 fl">
      <label>三精评选公告标题</label>
      <input type="text" class="form-control" placeholder="请输入三精评选公告的标题"/>
    </div>
    <div class="form_item wb30 fl">
      <label>标题颜色</label>
      <div class="i-checkslayout">
        <div class="radio i-checks">
          <label class="default_radio">
            <input type="radio" value="1" name="types" checked style="position: absolute; opacity: 0;"> <i></i> 黑色（普通）
          </label>
          <label>
            <input type="radio" value="2" name="types" style="position: absolute; opacity: 0;"> <i></i> 红色（重要）
          </label>
        </div>
      </div>
    </div>
    <div class="form_item wb20 fl">
      <label>上传截止日期</label>
      <input type="text" class="form-control" placeholder=""/>
    </div>
    <div class="form_item wb100 fl">
      <label>短信提醒</label>
      <div class="input-group">
        <input type="hidden" id="user_id" />
        <input type="text" class="form-control" id="user_name">
        <span class="input-group-btn">
          <button type="button" id="selectuser" class="btn btn-primary">添加通知人员</button>
        </span>
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
                title : '添加要通知的人员',
                shadeClose : false,
                shade : 0.3,
                area : [ '500px', '300px' ],
                content : ahcourt.ctx + '/views/basic/select_user.jsp?ele=user_name&hid=user_id&mult=1',
                cancel : function(index) {
                    layer.close(index);
                }
            });
        })
    })
  </script>
  </body>
</html>
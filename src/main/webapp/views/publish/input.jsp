<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>双评工作平台</title>
  <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
  <jsp:include page="/header.jsp?libs=icheck;layer;summernote" />
</head>
<body>

<div class="bmbox_layout title_fixed clearfix">
  <div class="bmbox_title">
    <h5>发布信息</h5>
    <div class="bmbox_tool">
      <button id="btn_submit" style="display: none" class="btn btn-primary  btn-smx" type="button"><i class="fa fa-check"></i> 提交</button>
      <button id="btn_pass" style="display: none;" class="btn btn-primary btn-smx" type="button"><i class="fa fa-check"></i> 同意</button>
      <button id="btn_reject" style="display: none;" class="btn btn-danger btn-smx" type="button"><i class="fa fa-close"></i> 不同意</button>
    </div>
  </div>
  <div class="bmbox_content clearfix">
    <form class="business_form">
    <div class="form_center clearfix" style="padding: 15px 0;">
      <div class="form_item wb100 fl">
        <label>信息标题<span>*</span></label>
        <input type="text" id="bt" name="bt" class="form-control bmrequire" placeholder="请输入三精评选公告的标题" value="${publish.bt}" />
      </div>
      <div class="form_item wb28 fl">
        <label>标题颜色</label>
        <div class="i-checkslayout">
          <div class="radio i-checks">
            <label class="default_radio">
              <input type="radio" value="#000000" name="ztys" checked style="position: absolute; opacity: 0;"> <i></i> 黑色（普通）
            </label>
            <label>
              <input type="radio" value="#a94442" name="ztys" style="position: absolute; opacity: 0;"> <i></i> 红色（重要）
            </label>
          </div>
        </div>
      </div>
      <div class="form_item wb20 fl">
        <label>信息类型<span>*</span></label>

        <select class="form-control bmrequire" id="xxlx" name="xxlx" >
          <option>请选择...</option>
        </select>

      </div>

      <div class="form_item wb100 fl">
        <label>公告内容<span>*</span></label>
        <div class="summernote bmrequire" id="xxnr" name="xxnr" style="">

        </div>

      </div>
    </div>
    </form>
  </div>
</div>

<input type="hidden" id="mode" name="mode" value="${mode}">
<input type="hidden" id="xxid" value="${publish.xxid}">

<input type="hidden" id="hidxxlx" value="${publish.xxlx}">
<input type="hidden" id="hidxxnr" value="${publish.xxnr}">
<input type="hidden" id="hidbtys" value="${publish.btys}">

<script>
    $(function(){

        $('.summernote').summernote({
            lang: 'zh-CN',
            height: $('body').height()-280,
        });

        initDictSelect('802', '#xxlx')


        var mode = $("#mode").val();

        if(mode == 2){
            //审核模式
//            $("#btn_submit").hide();
//            $("#btn_pass").show();
//            $("#btn_reject").show();
        }else if(mode == 3){
          //查看模式
            $("#btn_submit").hide();
            $("#btn_pass").hide();
            $("#btn_reject").hide();
            initView();

        }else {
            //新建模式
            $("#btn_submit").show();
            $("#btn_pass").hide();
            $("#btn_reject").hide();
        }

        $('.i-checks').iCheck({
            radioClass : 'iradio_square-green',
            checkboxClass : 'icheckbox_square-green',
        });




        $("#btn_submit").click(function() {

            var bt=$("#bt").val();
            if(!bt){ layer.msg("请填写标题~!");$("#bt").focus();return; }

            var xxlx=$("#xxlx").val();
            if(!xxlx){ layer.msg("请选择信息类型~!");$("#xxlx").focus();return; }

            var xxnr=$(".summernote").code();
            if(!xxnr || xxnr.length <= 10){ layer.msg("请填写公告内容,且公告内容至少超过10个字符~!");return; }
            //console.log(xxnr);

            var ztys = $("input[name='ztys']:checked").val();

                $.ajax({
                    type : 'POST',
                    url : ahcourt.ctx + "/publish/save.do",
                    datatype : 'json',
                    data : {
                        bt:bt,xxlx:xxlx,xxnr:xxnr,btys:ztys
                    },
                    success : function(data) {
                        if (data > 0) {
                            $(".business_form")[0].reset();
                            $('.summernote').code("");
                            $("#xxid").val("");
                            layer.msg("保存成功！");
                        } else {
                            layer.msg("保存失败");
                        }
                    }
                });

        });

    })

    function initView(){
        var hidxxlx = $("#hidxxlx").val();
        if(hidxxlx){
          $("#xxlx").val(hidxxlx);
        }

        var hidxxnr = $("#hidxxnr").val();
        //console.log(hidxxnr);
        if(hidxxnr){
            $('.summernote').code(hidxxnr);
        }

        var hidbtys = $("#hidbtys").val();
        console.log(hidbtys);
        if(hidbtys){
            $(":radio[name='btys'][value='" + hidbtys + "']").prop("checked", "checked");
        }
    }

</script>

</body>
</html>
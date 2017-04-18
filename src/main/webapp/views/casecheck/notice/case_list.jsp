<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>双评工作平台</title>
    <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
    <jsp:include page="/header.jsp?libs=jqgrid;layer" />
  </head>
  <body>
  <div class="bmbox_layout  clearfix">
    <div class="bmbox_title ">
      <h5>2016年3月份案件评查	<small>&nbsp;&nbsp;<i class="fa fa-gg"></i> 常规评查</small>&nbsp;&nbsp;<small><i class="fa fa-user"></i> 吕仁钊</small>&nbsp;&nbsp;<small><i class="fa fa-clock-o"></i> 2016-03-01</small></h5>
      <div class="bmbox_tool">

        <button id="btn_pass" style="display: none;" class="btn btn-primary btn-sm btn-smx" type="button"><i class="fa fa-check"></i> 通过</button>
        <button id="btn_reject" style="display: none;" class="btn btn-danger btn-sm btn-smx" type="button"><i class="fa fa-close"></i> 不通过</button>
      </div>
    </div>
    <div class="bmbox_content clearfix pd10">

      <div class="bmbox_layout  clearfix">
        <div class="bmbox_title" style="border-top-color: #e0e0e0;">
          <h5><i class="fa fa-tasks"></i> 本次评查案件列表</h5>
          <div class="bmbox_tool">
            <button id="btn_addnewcase" style="display: none;" class="btn btn-white btn-sm btn-smx" type="button"><i class="fa fa-plus"></i> 添加案件</button>
          </div>
        </div>
        <div class="bmbox_content clearfix">
          <table id="table1" class="table table-striped"></table>
        </div>
      </div>

    </div>
  </div>

  <div id="addnewcase" style="display: none;">
    <div id="search_box" class="form_center clearfix">
      <div class="form_item wb100 fl">
        <label>案号</label>
        <input type="text" id="khmc" class="form-control input-sm" placeholder="请输入案号" maxlength="255" />
      </div>
      <div class="form_item wb40 fl">
        <label>专家类型</label>
        <select class="form-control">
          <option value="">--请选择--</option>
          <option value="以建筑面积计算">民事</option>
        </select>
      </div>
      <div class="form_item wb40 fl">
        <label>专家</label>
        <select class="form-control">
          <option value="">--请选择--</option>
          <option value="以建筑面积计算">张三</option>
        </select>
      </div>
      <div class="form_item wb20 fl">
        <button id="" class="btn btn-primary" type="button" style="margin-top: 30px;">提交</button>
      </div>
    </div>
  </div>
  <script>
    $(function(){
        //获取模式
        var mode = $("#mode").val();
        if(!mode){mode = 1;}

        var cols =[ {
            label : 'ajid',
            name : 'ajid',
            hidden : true,
            key : true,
            frozen : true
        }, {
            label : 'ggid',
            name : 'ggid',
            hidden : true,
            frozen : true
        },{
            label : '操作',
            name : 'ggid',
            width : 170,
            align : 'center',
            sortable : false,
            formatter :opts[mode-1] ,
            frozen : true
        },{
            label : '案号',
            name : 'xmmc',
            frozen : true,
            width : 100
        }, {
            label : '归属法院',
            name : 'xmzt',
            width : 150
        }, {
            label : '承办部门',
            name : 'htmc',
            width : 100
        }, {
            label : '承办人',
            name : 'xmlxmc',
            width : 80
        }, {
            label : '案件类型',
            name : 'zylbmc',
            width : 80
        }, {
            label : '案由',
            name : 'xmfzrmc',
            width : 120
        }, {
            label : '结案方式',
            name : 'xmjlmc',
            width : 80
        }, {
            label : '结案时间',
            name : 'xmcymc',
            width : 80
        }, {
            label : '评查专家',
            name : 'pszj',
            width : 80
        } ];

        if(mode == 1){
            //查看模式，不可修改
            cols[2].width = 120;//操作列宽度缩小写，因为查看模式没有删除和更换专家操作
            //增加评查时间和质量等级列
            cols.push({label : '评查时间',name : 'pcsj',width : 80});
            cols.push({label : '质量等级',name : 'yqgq',width : 80});
        }else if(mode == 2){
            //审核模式，可修改
            $("#btn_pass").show();
            $("#btn_reject").show();
            $("#btn_addnewcase").show();
        }


        $("#btn_addnewcase").click(function(){
            layer.open({
                type : 1,
                shift : 5,
                title : '添加案件',
                shadeClose : false,
                shade : 0.3,
                area : [ '500px', '200px' ],
                content : $("#addnewcase"),
                cancel : function(index) {
                    layer.close(index);
                }
            });
        });

        $("#table1").jqGrid({
            url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
            datatype : "json",
            mtype : "post",
            height : gridHeight(),
            width : gridWidth(),
            rownumbers : true,
            shrinkToFit : true,
            rowNum : 1000000,
            colModel : cols
        });
    });
    function gridWidth() {
        return $('body').width() - 22;
    }
    function gridHeight() {
        return $('body').height() -145;
    }

    function formatter_grid1_opt_1(cellvalue, options, rowObject) {
        return '<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="评查信息"><i class="fa fa-info-circle"></i> 评查信息</button>';
    }
    function formatter_grid1_opt_2(cellvalue, options, rowObject) {
        return '<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="verify(\'' + rowObject.ggid + '\')" title="删除"><i class="fa fa-trash"></i> 删除</button>'
            +'<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="verify(\'' + rowObject.ggid + '\')" title="更换专家"><i class="fa fa-exchange"></i> 更换专家</button>';
    }
    var opts = [formatter_grid1_opt_1,formatter_grid1_opt_2];
  </script>
  <input type="hidden" id="mode" name="mode" value="${mode}">
  </body>
</html>
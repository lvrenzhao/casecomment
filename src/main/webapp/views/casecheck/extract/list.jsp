<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>双评工作平台</title>
    <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
    <jsp:include page="/header.jsp?libs=icheck;jqgrid;ztree;layer" />
    <style>
      .moreview,.viewmore2{ display: none;}

    </style>
  </head>
  <body>
  <div class="bmbox_layout">
    <div class="bmbox_title home-righttab" style="padding-right: 0px;margin-right: 0px;">
      <ul class="nav nav-tabs navs-3" style="width: 100%;">
        <li class="active">
          <a data-toggle="tab" href="#tab-1">
            <i class="fa fa-flag"></i> 案件抽取
          </a>
        </li>
        <li class="pull-right">
          <a data-toggle="tab" href="#tab-2" class="pull-right">
            <i class="fa fa-cart-plus"></i> 已抽取案件 <span class="badge badge-primary"> 100 </span>
          </a>
        </li>
      </ul>
    </div>
    <div class="bmbox_content">
      <div class="tab-content">
        <div id="tab-1" class="tab-pane active">
          <div class="backdrop"></div>
          <div id="search_box1" class=" business_search form_center clearfix">
            <div class="form_item wb100 fl pdt_10" >
              <span style="font-size: 14px;font-weight: 800;line-height: 26px" class="pull-left moreview"><i class="fa fa-sliders"></i> 配置抽取规则</span>

              <button id="btn-endextract" class="btn btn-white  fr mr5" type="button" style="display: none;">收起 <i class="fa fa-arrow-up "></i></button>
              <button id="btn-open" class="btn btn-white  fr mr5" type="button" style="display: none;">展开 <i class="fa fa-arrow-down "></i></button>

              <button id="btn-extract-checked" class="btn btn-primary fr mr10" type="button" style="display: none;"><i class="fa fa-cart-plus"></i> 抽取选中案件</button>
              <div id="btn-extract-group" class="input-group fr mr10" style="width:200px;display: none;">
                <input type="text" class="form-control" placeholder="案件数">
                <span class="input-group-btn">
                  <button class="btn btn-primary" type="button"><i class="fa fa-cart-plus"></i> 系统随机抽取</button>
                </span>
              </div>

              <button id="btn-beginextract" class="btn btn-white fr mr5" type="button">开始抽取案件 <i class="fa fa-arrow-down "></i></button>
            </div>
            <div class="form_item wb100 fl moreview">
              <label>案件性质<span style="color: red;">*</span></label>
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

            <div class="form_item wb100 fl moreview">
              <label>案件类型</label>
              <div class="i-checkslayout">
                <div class="checkbox i-checks">
                  <label class="default_radio">
                    <input type="checkbox" value="1" name="service" style="position: absolute; opacity: 0;"> <i></i> 抗诉
                  </label>
                  <label>
                    <input type="checkbox" value="2" name="service" style="position: absolute; opacity: 0;"> <i></i> 发回改判
                  </label>
                  <label>
                    <input type="checkbox" value="3" name="service" style="position: absolute; opacity: 0;"> <i></i> 再审
                  </label>
                  <label>
                    <input type="checkbox" value="3" name="service" style="position: absolute; opacity: 0;"> <i></i> 审理周期超过一年半以上
                  </label>
                  <label>
                    <input type="checkbox" value="3" name="service" style="position: absolute; opacity: 0;"> <i></i> 执行异议复议
                  </label>
                </div>
              </div>
            </div>

            <div class="form_item wb40 fl moreview">
              <label>归属法院<span style="color: red;">*</span></label>
              <div style="position: relative;">
                <div class="input-group">
                  <input id="zzid" value="${bean.zzid }" type="hidden" /> <input type="text" class="form-control input-sm bmrequire" retype="text" readonly id="citySel" value="${bean.zzjgmc }"> <span class="input-group-btn">
								<button type="button" class="btn btn-primary btn-sm" id="menuBtn">选择</button>
							</span>
                </div>
                <div id="menuContent" class="menuContent">
                  <ul id="treeDemo" class="ztree"></ul>
                </div>
              </div>
            </div>
            <div class="form_item wb60 fl moreview" >
              <label>&nbsp;</label>
              <div class="i-checkslayout">
                <div class="checkbox i-checks">
                  <label class="default_radio">
                    <input type="checkbox" value="1" name="service" style="position: absolute; opacity: 0;"> <i></i> 是否包含下级法院案件
                  </label>
                </div>
              </div>
            </div>

            <div class="form_item wb15 fl moreview">
              <label>承办部门</label>
              <input type="text" id="khmc" class="form-control input-sm" placeholder="" maxlength="255" />
            </div>
            <div class="form_item wb15 fl moreview">
              <label>承办人</label>
              <input type="text" id="khmc" class="form-control input-sm" placeholder="" maxlength="255" />
            </div>

            <div class="form_item wb15 fl moreview">
              <label>案号</label>
              <input type="text" id="khmc" class="form-control input-sm"  placeholder="" maxlength="255" />
            </div>

            <div class="form_item wb20 fl moreview">
              <label>案由</label>
              <input type="text" id="khmc" class="form-control input-sm" placeholder="" maxlength="255" />
            </div>

            <div class="form_item wb25 fl moreview">
              <label>结案日期<span style="color: red;">*</span></label>
              <div>
                <input type="text" id="" class="form-control input-sm wb48 fl" placeholder="" maxlength="255" />
                <span style="display: inline-block;float: left;padding: 5px 0px 0px 0px;"> ~ </span>
                <input type="text" id="" class="form-control input-sm wb48 fl" placeholder="" maxlength="255" />
              </div>

            </div>

            <div class="form_item wb10 fl moreview">
              <button id="" class="btn btn-primary btn-sm " type="button" style="margin-top: 30px;"><i class="fa fa-search"></i> 查询</button>
            </div>

          </div>
          <div class="clearfix pd10">
            <table id="table1" class="table table-striped"></table>
            <div id="pager1"></div>
          </div>
        </div>
        <div id="tab-2" class="tab-pane">
          <div id="search_box2" class="form_center clearfix">



            <div class="form_item wb100 fl ">
              <label>归属法院占比</label>
              <div class="i-checkslayout">
                <div class="checkbox i-checks">
                  <label class="default_radio">
                    <input type="radio" value="1" name="service" style="position: absolute; opacity: 0;" checked> <i></i> 全部
                  </label>
                  <label>
                    <input type="radio" value="2" name="service" style="position: absolute; opacity: 0;"> <i></i> 合肥(20%)
                  </label>
                  <label>
                    <input type="radio" value="3" name="service" style="position: absolute; opacity: 0;"> <i></i> 芜湖(20%)
                  </label>
                  <label>
                    <input type="radio" value="3" name="service" style="position: absolute; opacity: 0;"> <i></i> 安庆(20%)
                  </label>
                  <label>
                    <input type="radio" value="3" name="service" style="position: absolute; opacity: 0;"> <i></i> 淮南(20%)
                  </label>
                  <label>
                    <input type="radio" value="3" name="service" style="position: absolute; opacity: 0;"> <i></i> 淮北(20%)
                  </label>
                </div>
              </div>
            </div>

            <div class="form_item wb80 fl ">
              <label>案件性质占比</label>
              <div class="i-checkslayout">
                <div class="checkbox i-checks">
                  <label class="default_radio">
                    <input type="radio" value="1" checked name="x1" style="position: absolute; opacity: 0;"> <i></i> 全部
                  </label>
                  <label class="default_radio">
                    <input type="radio" value="1" name="x1" style="position: absolute; opacity: 0;"> <i></i> 刑事(18%)
                  </label>
                  <label>
                    <input type="radio" value="2" name="x1" style="position: absolute; opacity: 0;"> <i></i> 民事(22%)
                  </label>
                  <label>
                    <input type="radio" value="3" name="x1" style="position: absolute; opacity: 0;"> <i></i> 行政(20%)
                  </label>
                  <label>
                    <input type="radio" value="3" name="x1" style="position: absolute; opacity: 0;"> <i></i> 赔偿(20%)
                  </label>
                  <label>
                    <input type="radio" value="3" name="x1" style="position: absolute; opacity: 0;"> <i></i> 执行(20%)
                  </label>
                  <label>
                    <input type="radio" value="3" name="x1" style="position: absolute; opacity: 0;"> <i></i> 其他(0%)
                  </label>
                </div>
              </div>
            </div>

            <div class="form_item wb20 fl pdt_10">
              <button id="btn-endextract2" class="btn btn-white  fr mr5" type="button" style="display: none;margin-top: 20px">收起 <i class="fa fa-arrow-up "></i></button>
              <button id="btn-open2" class="btn btn-white  fr mr5" type="button" style="margin-top: 20px">展开 <i class="fa fa-arrow-down "></i></button>
            </div>

            <div class="form_item wb100 fl viewmore2">
              <label>案件类型</label>
              <div class="i-checkslayout">
                <div class="checkbox i-checks">
                  <label class="default_radio">
                    <input type="checkbox" value="1" name="service" style="position: absolute; opacity: 0;"> <i></i> 抗诉
                  </label>
                  <label>
                    <input type="checkbox" value="2" name="service" style="position: absolute; opacity: 0;"> <i></i> 发回改判
                  </label>
                  <label>
                    <input type="checkbox" value="3" name="service" style="position: absolute; opacity: 0;"> <i></i> 再审
                  </label>
                  <label>
                    <input type="checkbox" value="3" name="service" style="position: absolute; opacity: 0;"> <i></i> 审理周期超过一年半以上
                  </label>
                  <label>
                    <input type="checkbox" value="3" name="service" style="position: absolute; opacity: 0;"> <i></i> 执行异议复议
                  </label>
                </div>
              </div>
            </div>

            <div class="form_item wb15 fl viewmore2">
              <label>承办部门</label>
              <input type="text" id="khmc" class="form-control input-sm" placeholder="" maxlength="255" />
            </div>
            <div class="form_item wb15 fl viewmore2">
              <label>承办人</label>
              <input type="text" id="khmc" class="form-control input-sm" placeholder="" maxlength="255" />
            </div>

            <div class="form_item wb15 fl viewmore2">
              <label>案号</label>
              <input type="text" id="khmc" class="form-control input-sm"  placeholder="" maxlength="255" />
            </div>

            <div class="form_item wb20 fl viewmore2">
              <label>案由</label>
              <input type="text" id="khmc" class="form-control input-sm" placeholder="" maxlength="255" />
            </div>

            <div class="form_item wb25 fl viewmore2">
              <label>结案日期<span style="color: red;">*</span></label>
              <div>
                <input type="text" id="" class="form-control input-sm wb48 fl" placeholder="" maxlength="255" />
                <span style="display: inline-block;float: left;padding: 5px 0px 0px 0px;"> ~ </span>
                <input type="text" id="" class="form-control input-sm wb48 fl" placeholder="" maxlength="255" />
              </div>

            </div>

            <div class="form_item wb10 fl viewmore2">
              <button id="" class="btn btn-primary btn-sm " type="button" style="margin-top: 30px;"><i class="fa fa-search"></i> 查询</button>
            </div>

            <!--<div class="form_item wb50 fl">
              <label>评查活动标题</label>
              <input type="text" id="khmc" class="form-control input-sm" placeholder="" maxlength="255" />
            </div>
            <div class="form_item wb50 fl">
              <button id="" class="btn btn-success btn-sm " type="button" style="margin-top:30px;">发起常规评查</button>
              <button id="" class="btn btn-info btn-sm " type="button" style="margin-top:30px;">发起专项评查</button>
              <button id="" class="btn btn-warning btn-sm " type="button" style="margin-top:30px;">发起重点评查</button>
            </div>-->
          </div>
          <div class="clearfix pd10">
            <table id="table2" class="table table-striped"></table>
            <div id="pager2"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script>
    var mode, zNodes;
    $(function(){

        //#####此处根据用户所在机构加载所在机构及以下机构。
        $.ajax({
            type : 'POST',
            url : ahcourt.ctx + "/setting/organization/getlist.do",
            datatype : 'json',
            async : false,
            success : function(data) {
                zNodes = data;
            }
        });

        $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        $("#menuBtn").click(function() {
            showMenu();
            return false;
        });


        $("#btn-beginextract").click(function() {
            $(".moreview").show();
            $(this).hide();
            $("#btn-endextract").show();
            $("#btn-extract-group").show();
            $("#btn-extract-checked").show();
            $('#table1').setGridHeight($('body').height()-445);
        });
        $("#btn-endextract").click(function() {
            $(".moreview").hide();
            $(this).hide();
            $("#btn-open").show();
            $('#table1').setGridHeight($('body').height()-185);
        });

        $("#btn-open").click(function() {
            $(".moreview").show();
            $(this).hide();
            $("#btn-endextract").show();
            $('#table1').setGridHeight($('body').height()-445);
        });


        $("#btn-endextract2").click(function() {
            $(".viewmore2").hide();
            $(this).hide();
            $("#btn-open2").show();
            $('#table2').setGridHeight($('body').height()-270);
        });

        $("#btn-open2").click(function() {
            $(".viewmore2").show();
            $(this).hide();
            $("#btn-endextract2").show();
            $('#table2').setGridHeight($('body').height()-400);
        });


        $('.i-checks').iCheck({
            radioClass : 'iradio_square-green',
            checkboxClass : 'icheckbox_square-green',
        });


        $("#table1").jqGrid({
            url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
            datatype : "json",
            mtype : "post",
            multiselect : true,
            height : gridHeight(),
            width : gridWidth(),
            rownumbers : true,
            shrinkToFit : true,
            rowNum : 1000000,
            colModel : [ {
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
                width : 100,
                align : 'center',
                sortable : false,
                formatter :formatter_grid1_opt_1 ,
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
                label : '案件性质',
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
            }
            ],
            pager:"#pager1",
            viewrecords: true
        });




        $("#table2").jqGrid({
            url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
            datatype : "json",
            mtype : "post",
            height : $('body').height() -270,
            width : gridWidth(),
            rownumbers : true,
            shrinkToFit : true,
            rowNum : 1000000,
            colModel : [ {
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
                formatter :formatter_grid2_opt_1 ,
                frozen : true
            },{
                label : '案号',
                name : 'ah',
                frozen : true,
                formatter:formatter_grid2_opt_2,
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
                label : '案件性质',
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
                label : '分配专家',
                name : 'xmcymc',
                width : 80
            }
            ],
            pager:"#pager2",
            viewrecords: true
        });
    });
    function gridWidth() {
        return $('body').width() - 22;
    }
    function gridHeight() {
        return $('body').height() -185;
    }

    function formatter_grid1_opt_1(cellvalue, options, rowObject) {
        return '<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="添加"><i class="fa fa-cart-plus"></i> 添加到已抽取</button>';
    }
    function formatter_grid2_opt_1(cellvalue, options, rowObject) {
        return '<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="更换专家"><i class="fa fa-exchange"></i> 更换专家</button>'
            +'<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="移除"><i class="fa fa-trash"></i> 移除</button>';
    }

    function formatter_grid2_opt_2(cellvalue, options, rowObject) {
        return '<i class="fa fa-warning" style="color:#ff6600;"></i>'+'<a href="javascript:;" onclick="viewupload()">'+cellvalue+'</a>';
    }


    function viewupload() {
        layer.open({
            type : 2,
            shift : 5,
            title : '查看案件资料',
            shadeClose : false,
            shade : 0.3,
            area : [ '60%', '80%' ],
            content : ahcourt.ctx + '/casecheck/notice/upload.do?ggid=',
            cancel : function(index) {
                layer.close(index);
            }
        });
    }

    // 选择组织机构
    var setting = {
        view : {
            dblClickExpand : false
        },
        data : {
            simpleData : {
                enable : true
            }
        },
        callback : {
            onClick : onClick
        }
    };
    function onClick(e, treeId, treeNode) {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo"), nodes = zTree.getSelectedNodes(), v = "", zzid = "";
        nodes.sort(function compare(a, b) {
            return a.id - b.id;
        });
        v += nodes[0].name;
        zzid = nodes[0].id;
        if (v.length > 0)
            v = v.substring(0, v.length);
        var cityObj = $("#citySel");
        cityObj.val(v);
        $("#zzid").val(zzid);
        cityObj.removeClass("border-red");
        hideMenu();
    }
    function showMenu() {
        $("#menuContent").slideDown("fast");
        $("body").bind("mousedown", onBodyDown);
    }
    function hideMenu() {
        $("#menuContent").fadeOut("fast");
        $("body").unbind("mousedown", onBodyDown);
    }
    function onBodyDown(event) {
        if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length > 0)) {
            hideMenu();
        }
    }

  </script>
  </body>
</html>
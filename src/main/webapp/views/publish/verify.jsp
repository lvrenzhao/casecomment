<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>双评工作平台</title>
  <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
  <jsp:include page="/header.jsp?libs=jqgrid;layer;laydate" />
</head>
<body>
<div class="bmbox_layout">
  <div class="bmbox_title home-righttab">
    <ul class="nav nav-tabs navs-3">
      <li class="active">
        <a data-toggle="tab" href="#tab-1">
          <i class="fa fa-bell"></i> 待审核
        </a>
      </li>
      <li class="">
        <a data-toggle="tab" href="#tab-2">
          <i class="fa fa-history"></i> 已审核
        </a>
      </li>
    </ul>
  </div>
  <div class="bmbox_content">
    <div class="tab-content">
      <div id="tab-1" class="tab-pane active">
        <div class="clearfix pd10">
          <table id="table1" class="table table-striped"></table>
          <div id="pager1"></div>
        </div>
      </div>
      <div id="tab-2" class="tab-pane">
        <div id="search_box1" class="form_center clearfix">
          <div class="form_item wb25 fl">
            <label>公告标题</label>
            <input type="text" id="bt" name="bt" class="form-control input-sm" placeholder="请输入公告标题" maxlength="255" />
          </div>
          <!--<div class="form_item wb15 fl">
            <label>状态</label>
            <select class="form-control input-sm" id="remarks" name="remarks">
              <option value="">--请选择--</option>
            </select>
          </div>-->
          <div class="form_item wb15 fl">
            <label>信息类型</label>
            <select class="form-control input-sm" id="xxlx" name="xxlx">
              <option value="">--请选择--</option>
            </select>
          </div>
          <div class="form_item wb35 fl">
            <label>发布日期</label>
            <div>
              <input type="text" id="createdate1" name="createdate1" class="form-control input-sm wb45 fl" placeholder="" maxlength="255"  onclick="laydate({istime: true,format: 'YYYY/MM/DD'})"/>
              <span style="display: inline-block;float: left;padding: 5px 10px 0px 10px;">~</span>
              <input type="text" id="createdate2" name="createdate2" class="form-control input-sm wb45 fl" placeholder="" maxlength="255" onclick="laydate({istime: true,format: 'YYYY/MM/DD'})" />
            </div>

          </div>
          <div class="form_item wb10 fl">
            <button id="btn_search" class="btn btn-primary btn-sm" type="button" style="margin-top: 30px;"><i class="fa fa-search"></i> 查询</button>
          </div>
        </div>
        <div class="clearfix pd10">
          <table id="table2" class="table table-striped"></table>
          <div id="pager2"></div>
        </div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
    $(function(){

        initDictSelect('802', '#xxlx')

        $('#btn_search').click(function() {
            $("#table2").jqGrid().setGridParam({
                page:1,
                postData : {
                    bt : $('#bt').val(),
                    xxlx : $('#xxlx').val(),
                    createdate1 : $('#createdate1').val(),
                    createdate2 : $('#createdate2').val()
                }
            }).trigger("reloadGrid");
        })

        $("#table1").jqGrid({
            url : ahcourt.ctx + '/publish/verifylistjson.do',
            datatype : "json",
            mtype : "post",
            height : gridHeight(),
            width : gridWidth(),
            rownumbers : true,
            shrinkToFit : true,
            rowNum : 20,
            rowList : [ 10, 20, 30 ],
            colModel : [ {
                label : 'xxid',
                name : 'xxid',
                hidden : true,
                key : true
            },{
                label : 'jobid',
                name : 'jobid',
                hidden : true,
                key : true
            },{
                label : '操作',
                name : 'xxid',
                width : 50,
                align : 'center',
                sortable : false,
                formatter : formatter_grid1_opts
            }, {
                label : '公告标题',
                name : 'bt',
                width : 300,
                formatter : formatter_bt
            }, {
                label : '状态',
                name : 'ztmc',
                align : 'center',
                width : 80,
                formatter : formatter_zt
            }, {
                label : '信息类型',
                name : 'xxlxmc',
                align : 'center',
                width : 100
            }, {
                label : '发布人',
                name : 'createByMC',
                width : 100
            }, {
                label : '发布时间',
                name : 'createDate',
                width : 100
            } ],
            pager : '#pager1'
            ,viewrecords: true

        });

        $("#table2").jqGrid({
            url : ahcourt.ctx + '/publish/verifyhistorylistjson.do',
            datatype : "json",
            mtype : "post",
            height : gridHeight()-65,
            width : gridWidth(),
            rownumbers : true,
            shrinkToFit : true,
            rowNum : 20,
            rowList : [ 10, 20, 30 ],
            colModel : [ {
                label : 'xxid',
                name : 'xxid',
                hidden : true,
                key : true
            },{
                label : '操作',
                name : 'xxid',
                width : 80,
                align : 'center',
                sortable : false,
                formatter : formatter_grid2_opts
            }, {
                label : '公告标题',
                name : 'bt',
                width : 300
            }, {
                label : '状态',
                name : 'ztmc',
                align : 'center',
                width : 80,
                formatter : formatter_zt
            }, {
                label : '信息类型',
                name : 'xxlxmc',
                align : 'center',
                width : 100
            }, {
                label : '发布人',
                name : 'createByMC',
                width : 100
            }, {
                label : '发布时间',
                name : 'createDate',
                width : 100
            }, {
                label : '审核人',
                name : 'shr',
                width : 100
            } , {
                label : '审核时间',
                name : 'shsj',
                width : 100
            }, {
                label : '审核意见',
                name : 'shyj',
                width : 200,
                formatter:formatter_grid2_shyj
            }],
            pager : '#pager2'
            ,viewrecords: true
        });


    })


    function formatter_bt(cellvalue, options, rowObject) {
        return "<span style='color:"+rowObject.btys+"'>"+cellvalue+"</span>";
    }

    function formatter_zt(cellvalue, options, rowObject) {
        if (cellvalue == '审核不通过') {
            return '<lable class="label label-danger">审核不通过</lable>'
        } else if (cellvalue == '审核通过') {
            return '<lable class="label label-primary">审核通过</lable>'
        } else {
            return '<lable class="label label-default ">待审核</lable>'
        }
    }

    function formatter_grid1_opts(cellvalue, options, rowObject) {
        return '<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="verify(2,\'' + rowObject.xxid + '\',\'' + rowObject.jobid + '\')" title="审核"><i class="fa fa-eye"></i> 审核</button>';
    }

    function formatter_grid2_opts(cellvalue, options, rowObject) {
        return '<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="verify(3,\'' + rowObject.xxid + '\')" title="查看公告详细"><i class="fa fa-info-circle"></i> 详细</button>';
    }

    function formatter_grid2_shyj(cellvalue, options, rowObject) {
        if(rowObject.shyj){
            return '<a href="javascript:void(0)" onclick="showintro(\'' + rowObject.shyj + '\')">查看</a>';
        }else{
            return '';
        }
    }
    function gridWidth() {
        return $('body').width() - 22;
    }
    function gridHeight() {
        return $('body').height() -135;
    }

    function verify(mode,xxid,jobid) {
        //console.log(jobid);

        layer.open({
            type : 2,
            shift : 5,
            title :  mode==3?"查看":"审核",
            shadeClose : false,
            shade : 0.3,
            area : [ '95%', '90%' ],
            content : ahcourt.ctx + '/publish/input.do?mode='+mode+'&xxid=' + xxid+"&jobid="+jobid,
            cancel : function(index) {
                layer.close(index);
            }
        });
    }
    function showintro(intro) {
        //console.log(intro)
        layer.open({
            type : 1,
            shift : 5,
            title : '查看审核意见',
            shadeClose : false,
            shade : 0.3,
            area : [ '400px', '300px' ],
            content :intro == undefined?"无":intro,
            end : function(index) {
                layer.close(index);
            }
        });
    }
</script>
</body>
</html>
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
<div id="search_box1" class="form_center clearfix">
  <div class="form_item wb25 fl">
    <label>标题</label>
    <input type="text" id="bt" name="bt" class="form-control input-sm" placeholder="请输入公告标题" maxlength="255" />
  </div>
  <div class="form_item wb15 fl">
    <label>信息类型</label>
    <select class="form-control input-sm" id="xxlx" name="xxlx">
      <option value="">--请选择--</option>
    </select>
  </div>
  <div class="form_item wb35 fl">
    <label>发布日期</label>
    <div>
      <input type="text" id="createdate1" name="createdate1" class="form-control input-sm wb45 fl" placeholder="" maxlength="255" />
      <span style="display: inline-block;float: left;padding: 5px 10px 0px 10px;">~</span>
      <input type="text" id="createdate2" name="createdate2" class="form-control input-sm wb45 fl" placeholder="" maxlength="255" />
    </div>

  </div>
  <div class="form_item wb10 fl">
    <button id="btn_search" class="btn btn-primary btn-sm" type="button" style="margin-top: 30px;"><i class="fa fa-search"></i> 查询</button>
  </div>
</div>
<div class="clearfix pd10">
  <table id="table1" class="table table-striped"></table>
  <div id="pager1"></div>
</div>
<script>
    $(function(){

        initDictSelect('802', '#xxlx')

        $('#btn_search').click(function() {
            $("#table1").jqGrid().setGridParam({
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
            url : ahcourt.ctx + '/publish/mylistjson.do',
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
                width : 100,
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
            pager : '#pager1'
            ,viewrecords: true
        });
    })

    function formatter_zt(cellvalue, options, rowObject) {
        if (cellvalue == '审核不通过') {
            return '<lable class="label label-danger">未过期</lable>'
        } else if (cellvalue == '审核通过') {
            return '<lable class="label label-primary">未过期</lable>'
        } else {
            return '<lable class="label label-default ">待审核</lable>'
        }
    }

    function formatter_grid2_opts(cellvalue, options, rowObject) {
        return '<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="verify(1,\'' + rowObject.ggid + '\')" title="查看公告详细"><i class="fa fa-info-circle"></i> 详细</button>';
    }

    function formatter_grid2_shyj(cellvalue, options, rowObject) {
        return '<a href="javascript:void(0)">...</a>';
    }
    function gridWidth() {
        return $('body').width() - 22;
    }
    function gridHeight() {
        return $('body').height() -100;
    }

    function verify(mode,ggid) {
        layer.open({
            type : 2,
            shift : 5,
            title : mode==1?"查看":"审核",
            shadeClose : false,
            shade : 0.3,
            area : [ '95%', '90%' ],
            content : ahcourt.ctx + '/publish/input.do?mode='+mode+'&ggid=' + ggid,
            cancel : function(index) {
                layer.close(index);
            }
        });
    }
</script>
</body>
</html>
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
    <style>

        body{background-color: #f3f3f4}

        .ibox{
            clear: both;
            margin-bottom: 25px;
            margin-top: 0;
            padding: 0;
        }
        .ibox-content {
            clear: both;
            background-color: #fff;
            color: inherit;
            padding: 15px;
            /*padding-bottom: 30px;*/
            border-color: #e7eaec;
            border-radius: 5px;
            -webkit-border-image: none;
            -o-border-image: none;
            border-image: none;
            border-style: solid solid none;
            border-width: 1px 0;
        }
        .bg1{background-color: #12a3f4;}
        .bg1 h5,.bg1 h1{color:#fff}

        .bg2{background-color:#90c133 }
        .bg2 h5,.bg2 h1{color:#fff}

        .bg3{background-color:#12a3f4}
        .bg3 h5,.bg3 h1{color:#fff}

        .bg4{background-color:#90c133 }
        .bg4 h5,.bg4 h1{color:#fff}

        .ibox-content h1{text-align: center}
        .subunit{font-size:14px;}
        .submoney{font-size:14px;}
        .cnymoney{font-size: 20px}
        .fa-level-up{color:#a8d925}
        .bg2 .fa-level-up{color:#12a3f4}
        .bg4 .fa-level-up{color:#12a3f4}
        .fa-level-down{color:#ea394c}
    </style>
    <script>
        $(function () {
            loadGrid1();
            loadGrid2();
            loadGrid3();
        });
        function loadGrid1() {
            $("#table1").jqGrid({
                url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
                datatype : "json",
                mtype : "post",
                height : $('body').height()-300,
                width : $('body').width() * 0.5 -20,
                rownumbers : true,
                shrinkToFit : true,
                rowNum : 20,
                rowList : [ 10, 20, 30 ],
                colModel : [
                    {label : 'ggid',name : 'ggid',hidden : true,key : true },
                    {label : '公告标题',name : 'ggbt',width : 300,formatter : function(cellvalue, options, rowObject) {
                        var style = "";
                        if(rowObject.btys == 2){
                            style = "color:red"
                        }
                        return '<a href="javascript:;" onclick="openDetails()"><span style="'+style+'">'+cellvalue+'</span></a>';
                    }},
                    {label : '发布人',name : 'lxrmc',width : 100},
                    {label : '发布时间', name : 'fbsj',width : 100}
                ],
                pager : '#pager1'
                ,viewrecords: true
            });
        }
        function loadGrid2() {
            $("#table2").jqGrid({
                url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
                datatype : "json",
                mtype : "post",
                height : $('body').height()*0.5-135,
                width : $('body').width() * 0.5 - 5 ,
                rownumbers : true,
                shrinkToFit : true,
                rowNum : 20,
                rowList : [ 10, 20, 30 ],
                colModel : [
                    {label : 'ggid',name : 'ggid',hidden : true,key : true },
                    {label : '公告标题',name : 'ggbt',width : 300},//###已读未读区分，红色，黑色区分
                    {label : '发布人',name : 'lxrmc',width : 100},
                    {label : '发布时间', name : 'fbsj',width : 100}
                ],
                pager : '#pager2'
                ,viewrecords: true
            });
        }
        function loadGrid3() {
            $("#table3").jqGrid({
                url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
                datatype : "json",
                mtype : "post",
                height : $('body').height()*0.5-125,
                width : $('body').width() * 0.5 - 5 ,
                rownumbers : true,
                shrinkToFit : true,
                rowNum : 20,
                rowList : [ 10, 20, 30 ],
                colModel : [
                    {label : 'ggid',name : 'ggid',hidden : true,key : true },
                    {label : '公告标题',name : 'ggbt',width : 300},//###已读未读区分，红色，黑色区分
                    {label : '发布人',name : 'lxrmc',width : 100},
                    {label : '发布时间', name : 'fbsj',width : 100}
                ],
                pager : '#pager3'
                ,viewrecords: true
            });
        }
        
        function openDetails(type,key) {
            
        }
    </script>
</head>
<body style="overflow: hidden" class="">
<div class="form_item wb50 fl fullbox no-margins no-padding">
    <div class="form_item wb100 no-margins" style="height: 175px; padding: 10px !important; ">
        <div class="bmbox_layout clearfix" style="overflow: hidden">
            <div class="bmbox_title">
                <h5>我的任务</h5>
                <div class="bmbox_tool">
                </div>
            </div>
            <div class="bmbox_content fullbox clearfix" style="padding-bottom: 60px">
                <div class="form_item wb50 fl">
                    <div class="ibox m10" id="countbox1">
                        <div class="ibox-content bg1">
                            <h5 style="text-align: center">待评查的案件数</h5>
                            <h1 class="no-margins"><span id="label_count_1">5</span></h1>
                        </div>
                    </div>
                </div>
                <div class="form_item wb50 fl">
                    <div class="ibox m10" id="countbox2">
                        <div class="ibox-content bg1"> <h5 style="text-align: center">待评选三精案件数</h5>
                            <h1 class="no-margins"><span id="label_count_2">1111</span></h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="form_item wb100 no-margins " style="height: 100%;padding: 0px 10px 185px 10px !important; ">
        <div class="bmbox_layout clearfix" style="overflow: hidden">
            <div class="bmbox_title">
                <h5>未读的系统信息</h5>
                <div class="bmbox_tool">
                </div>
            </div>
            <div class="bmbox_content fullbox clearfix" style="padding-bottom: 60px">
                <table id="table1"></table>
                <div id="pager1"></div>
            </div>
        </div>
    </div>
</div>
<div class="form_item wb50 fl fullbox no-margins no-padding">
    <div class="form_item wb100 no-margins " style="padding:10px 10px 10px 0px;height: 50%;">
        <div class="bmbox_layout clearfix" style="overflow: hidden">
            <div class="bmbox_title">
                <h5>未读的案件评查公告</h5>
                <div class="bmbox_tool">
                </div>
            </div>
            <div class="bmbox_content fullbox clearfix" style="padding-bottom: 60px">
                <table id="table2"></table>
                <div id="pager2"></div>
            </div>
        </div>
    </div>
    <div class="form_item wb100 no-margins" style="padding:0px 10px 10px 0px;height: 50%;">
        <div class="bmbox_layout clearfix" style="overflow: hidden">
            <div class="bmbox_title">
                <h5>未读的三精评选公告</h5>
                <div class="bmbox_tool">
                </div>
            </div>
            <div class="bmbox_content fullbox clearfix" style="padding-bottom: 60px">
                <table id="table3"></table>
                <div id="pager3"></div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
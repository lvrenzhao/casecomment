<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>双评工作平台</title>
    <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
    <jsp:include page="/header.jsp?libs=jqgrid;layer;ztree" />
    <style>
      #table_score th{text-align: center;vertical-align: middle}
      #table_score td{vertical-align: middle}
    </style>
  </head>
  <body>

  <div class="bmbox_layout title_fixed">
    <div class="bmbox_title home-righttab">
      <ul class="nav nav-tabs navs-3">
        <li class="active">
          <a data-toggle="tab" href="#tab-1">
            邀请专家
          </a>
        </li>
        <li class="">
          <a data-toggle="tab" href="#tab-2">
            评查案件
          </a>
        </li>
        <li>
          <a data-toggle="tab" href="#tab-3">
            五类案件
          </a>
        </li>
        <li>
          <a data-toggle="tab" href="#tab-4">
            质量情况
          </a>
        </li>
        <li>
          <a data-toggle="tab" href="#tab-5">
            评查排名
          </a>
        </li>
      </ul>
    </div>
    <div class="bmbox_content">
      <div class="tab-content">
        <div id="tab-1" class="tab-pane active">
          <div class="alert alert-info">
            本次评查活动共邀请专家 2 人，其中人大代表 0 人，政协委员 0 人，资深检察官 2 人，专家学者 0 人，其他院外人士  人。
          </div>
          <div class="clearfix pd10">
            <table id="table1" class="table table-striped"></table>
            <div id="pager1"></div>
          </div>
        </div>
        <div id="tab-2" class="tab-pane">
          <table class="table table-bordered" id="table_score">
            <thead>
            <tr>
              <th class="wb20">法院</th>
              <th class="wb5">刑事</th>
              <th class="wb5">民事</th>
              <th class="wb5">行政</th>
              <th class="wb5">赔偿</th>
              <th class="wb5">执行</th>
              <th class="wb7">总计</th>
              <th class="wb5">优秀</th>
              <th class="wb7">优秀率</th>
              <th class="wb5">合格</th>
              <th class="wb7">合格率</th>
              <th class="wb5">瑕疵</th>
              <th class="wb7">瑕疵率</th>
              <th class="wb5">差错</th>
              <th class="wb7">差错率</th>
            </tr>
            </thead>
            <tbody>
            <tr style="background-color:#B1D2EC">
              <td class="wb20">安徽省高级人民法院</td>
              <td class="wb5"><a href="#">3</a></td>
              <td class="wb5"><a href="#">4</a></td>
              <td class="wb5"><a href="#">8</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb5"><a href="#">10</a></td>
              <td class="wb7"><a href="#">37</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb7"><a href="#">35%</a></td>
              <td class="wb5"><a href="#">22</a></td>
              <td class="wb7"><a href="#">55%</a></td>
              <td class="wb5"><a href="#">5</a></td>
              <td class="wb7"><a href="#">10%</a></td>
              <td class="wb5"><a href="#">2</a></td>
              <td class="wb7"><a href="#">5%</a></td>
            </tr>
            <tr>
              <td class="wb20">合肥市中级人民法院</td>
              <td class="wb5"><a href="#">3</a></td>
              <td class="wb5"><a href="#">4</a></td>
              <td class="wb5"><a href="#">8</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb5"><a href="#">10</a></td>
              <td class="wb7"><a href="#">37</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb7"><a href="#">35%</a></td>
              <td class="wb5"><a href="#">22</a></td>
              <td class="wb7"><a href="#">55%</a></td>
              <td class="wb5"><a href="#">5</a></td>
              <td class="wb7"><a href="#">10%</a></td>
              <td class="wb5"><a href="#">2</a></td>
              <td class="wb7"><a href="#">5%</a></td>
            </tr>
            <tr>
              <td class="wb20">蜀山区人民法院</td>
              <td class="wb5"><a href="#">3</a></td>
              <td class="wb5"><a href="#">4</a></td>
              <td class="wb5"><a href="#">8</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb5"><a href="#">10</a></td>
              <td class="wb7"><a href="#">37</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb7"><a href="#">35%</a></td>
              <td class="wb5"><a href="#">22</a></td>
              <td class="wb7"><a href="#">55%</a></td>
              <td class="wb5"><a href="#">5</a></td>
              <td class="wb7"><a href="#">10%</a></td>
              <td class="wb5"><a href="#">2</a></td>
              <td class="wb7"><a href="#">5%</a></td>
            </tr>
            <tr>
              <td class="wb20">长丰县人民法院</td>
              <td class="wb5"><a href="#">3</a></td>
              <td class="wb5"><a href="#">4</a></td>
              <td class="wb5"><a href="#">8</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb5"><a href="#">10</a></td>
              <td class="wb7"><a href="#">37</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb7"><a href="#">35%</a></td>
              <td class="wb5"><a href="#">22</a></td>
              <td class="wb7"><a href="#">55%</a></td>
              <td class="wb5"><a href="#">5</a></td>
              <td class="wb7"><a href="#">10%</a></td>
              <td class="wb5"><a href="#">2</a></td>
              <td class="wb7"><a href="#">5%</a></td>
            </tr>
            <tr style="background-color: #B1D2EC">
              <td class="wb20">小计</td>
              <td class="wb5"><a href="#">3</a></td>
              <td class="wb5"><a href="#">4</a></td>
              <td class="wb5"><a href="#">8</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb5"><a href="#">10</a></td>
              <td class="wb7"><a href="#">37</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb7"><a href="#">35%</a></td>
              <td class="wb5"><a href="#">22</a></td>
              <td class="wb7"><a href="#">55%</a></td>
              <td class="wb5"><a href="#">5</a></td>
              <td class="wb7"><a href="#">10%</a></td>
              <td class="wb5"><a href="#">2</a></td>
              <td class="wb7"><a href="#">5%</a></td>
            </tr>
            <tr>
              <td class="wb20">宣城市中级人民法院</td>
              <td class="wb5"><a href="#">3</a></td>
              <td class="wb5"><a href="#">4</a></td>
              <td class="wb5"><a href="#">8</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb5"><a href="#">10</a></td>
              <td class="wb7"><a href="#">37</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb7"><a href="#">35%</a></td>
              <td class="wb5"><a href="#">22</a></td>
              <td class="wb7"><a href="#">55%</a></td>
              <td class="wb5"><a href="#">5</a></td>
              <td class="wb7"><a href="#">10%</a></td>
              <td class="wb5"><a href="#">2</a></td>
              <td class="wb7"><a href="#">5%</a></td>
            </tr>
            <tr>
              <td class="wb20">广德县人民法院</td>
              <td class="wb5"><a href="#">3</a></td>
              <td class="wb5"><a href="#">4</a></td>
              <td class="wb5"><a href="#">8</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb5"><a href="#">10</a></td>
              <td class="wb7"><a href="#">37</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb7"><a href="#">35%</a></td>
              <td class="wb5"><a href="#">22</a></td>
              <td class="wb7"><a href="#">55%</a></td>
              <td class="wb5"><a href="#">5</a></td>
              <td class="wb7"><a href="#">10%</a></td>
              <td class="wb5"><a href="#">2</a></td>
              <td class="wb7"><a href="#">5%</a></td>
            </tr>
            <tr>
              <td class="wb20">绩溪县人民法院</td>
              <td class="wb5"><a href="#">3</a></td>
              <td class="wb5"><a href="#">4</a></td>
              <td class="wb5"><a href="#">8</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb5"><a href="#">10</a></td>
              <td class="wb7"><a href="#">37</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb7"><a href="#">35%</a></td>
              <td class="wb5"><a href="#">22</a></td>
              <td class="wb7"><a href="#">55%</a></td>
              <td class="wb5"><a href="#">5</a></td>
              <td class="wb7"><a href="#">10%</a></td>
              <td class="wb5"><a href="#">2</a></td>
              <td class="wb7"><a href="#">5%</a></td>
            </tr>
            <tr style="background-color: #B1D2EC">
              <td class="wb20">小计</td>
              <td class="wb5"><a href="#">3</a></td>
              <td class="wb5"><a href="#">4</a></td>
              <td class="wb5"><a href="#">8</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb5"><a href="#">10</a></td>
              <td class="wb7"><a href="#">37</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb7"><a href="#">35%</a></td>
              <td class="wb5"><a href="#">22</a></td>
              <td class="wb7"><a href="#">55%</a></td>
              <td class="wb5"><a href="#">5</a></td>
              <td class="wb7"><a href="#">10%</a></td>
              <td class="wb5"><a href="#">2</a></td>
              <td class="wb7"><a href="#">5%</a></td>
            </tr>
            <tr style="background-color:#1c94c4">
              <td class="wb20">总计</td>
              <td class="wb5"><a href="#">3</a></td>
              <td class="wb5"><a href="#">4</a></td>
              <td class="wb5"><a href="#">8</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb5"><a href="#">10</a></td>
              <td class="wb7"><a href="#">37</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb7"><a href="#">35%</a></td>
              <td class="wb5"><a href="#">22</a></td>
              <td class="wb7"><a href="#">55%</a></td>
              <td class="wb5"><a href="#">5</a></td>
              <td class="wb7"><a href="#">10%</a></td>
              <td class="wb5"><a href="#">2</a></td>
              <td class="wb7"><a href="#">5%</a></td>
            </tr>
            </tbody>
          </table>
        </div>
        <div id="tab-3" class="tab-pane">
          <table class="table table-bordered" id="table_score">
            <thead>
            <tr>
              <th class="wb20">法院</th>
              <th class="wb5">抗诉</th>
              <th class="wb5">发回改判</th>
              <th class="wb5">再审</th>
              <th class="wb5">审理周期一年半以上</th>
              <th class="wb5">执行异议复议</th>
              <th class="wb7">总计</th>
              <th class="wb5">优秀</th>
              <th class="wb7">优秀率</th>
              <th class="wb5">合格</th>
              <th class="wb7">合格率</th>
              <th class="wb5">瑕疵</th>
              <th class="wb7">瑕疵率</th>
              <th class="wb5">差错</th>
              <th class="wb7">差错率</th>
            </tr>
            </thead>
            <tbody>
            <tr style="background-color:#B1D2EC">
              <td class="wb20">安徽省高级人民法院</td>
              <td class="wb5"><a href="#">3</a></td>
              <td class="wb5"><a href="#">4</a></td>
              <td class="wb5"><a href="#">8</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb5"><a href="#">10</a></td>
              <td class="wb7"><a href="#">37</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb7"><a href="#">35%</a></td>
              <td class="wb5"><a href="#">22</a></td>
              <td class="wb7"><a href="#">55%</a></td>
              <td class="wb5"><a href="#">5</a></td>
              <td class="wb7"><a href="#">10%</a></td>
              <td class="wb5"><a href="#">2</a></td>
              <td class="wb7"><a href="#">5%</a></td>
            </tr>
            <tr>
              <td class="wb20">合肥市中级人民法院</td>
              <td class="wb5"><a href="#">3</a></td>
              <td class="wb5"><a href="#">4</a></td>
              <td class="wb5"><a href="#">8</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb5"><a href="#">10</a></td>
              <td class="wb7"><a href="#">37</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb7"><a href="#">35%</a></td>
              <td class="wb5"><a href="#">22</a></td>
              <td class="wb7"><a href="#">55%</a></td>
              <td class="wb5"><a href="#">5</a></td>
              <td class="wb7"><a href="#">10%</a></td>
              <td class="wb5"><a href="#">2</a></td>
              <td class="wb7"><a href="#">5%</a></td>
            </tr>
            <tr>
              <td class="wb20">蜀山区人民法院</td>
              <td class="wb5"><a href="#">3</a></td>
              <td class="wb5"><a href="#">4</a></td>
              <td class="wb5"><a href="#">8</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb5"><a href="#">10</a></td>
              <td class="wb7"><a href="#">37</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb7"><a href="#">35%</a></td>
              <td class="wb5"><a href="#">22</a></td>
              <td class="wb7"><a href="#">55%</a></td>
              <td class="wb5"><a href="#">5</a></td>
              <td class="wb7"><a href="#">10%</a></td>
              <td class="wb5"><a href="#">2</a></td>
              <td class="wb7"><a href="#">5%</a></td>
            </tr>
            <tr>
              <td class="wb20">长丰县人民法院</td>
              <td class="wb5"><a href="#">3</a></td>
              <td class="wb5"><a href="#">4</a></td>
              <td class="wb5"><a href="#">8</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb5"><a href="#">10</a></td>
              <td class="wb7"><a href="#">37</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb7"><a href="#">35%</a></td>
              <td class="wb5"><a href="#">22</a></td>
              <td class="wb7"><a href="#">55%</a></td>
              <td class="wb5"><a href="#">5</a></td>
              <td class="wb7"><a href="#">10%</a></td>
              <td class="wb5"><a href="#">2</a></td>
              <td class="wb7"><a href="#">5%</a></td>
            </tr>
            <tr style="background-color: #B1D2EC">
              <td class="wb20">小计</td>
              <td class="wb5"><a href="#">3</a></td>
              <td class="wb5"><a href="#">4</a></td>
              <td class="wb5"><a href="#">8</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb5"><a href="#">10</a></td>
              <td class="wb7"><a href="#">37</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb7"><a href="#">35%</a></td>
              <td class="wb5"><a href="#">22</a></td>
              <td class="wb7"><a href="#">55%</a></td>
              <td class="wb5"><a href="#">5</a></td>
              <td class="wb7"><a href="#">10%</a></td>
              <td class="wb5"><a href="#">2</a></td>
              <td class="wb7"><a href="#">5%</a></td>
            </tr>
            <tr>
              <td class="wb20">宣城市中级人民法院</td>
              <td class="wb5"><a href="#">3</a></td>
              <td class="wb5"><a href="#">4</a></td>
              <td class="wb5"><a href="#">8</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb5"><a href="#">10</a></td>
              <td class="wb7"><a href="#">37</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb7"><a href="#">35%</a></td>
              <td class="wb5"><a href="#">22</a></td>
              <td class="wb7"><a href="#">55%</a></td>
              <td class="wb5"><a href="#">5</a></td>
              <td class="wb7"><a href="#">10%</a></td>
              <td class="wb5"><a href="#">2</a></td>
              <td class="wb7"><a href="#">5%</a></td>
            </tr>
            <tr>
              <td class="wb20">广德县人民法院</td>
              <td class="wb5"><a href="#">3</a></td>
              <td class="wb5"><a href="#">4</a></td>
              <td class="wb5"><a href="#">8</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb5"><a href="#">10</a></td>
              <td class="wb7"><a href="#">37</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb7"><a href="#">35%</a></td>
              <td class="wb5"><a href="#">22</a></td>
              <td class="wb7"><a href="#">55%</a></td>
              <td class="wb5"><a href="#">5</a></td>
              <td class="wb7"><a href="#">10%</a></td>
              <td class="wb5"><a href="#">2</a></td>
              <td class="wb7"><a href="#">5%</a></td>
            </tr>
            <tr>
              <td class="wb20">绩溪县人民法院</td>
              <td class="wb5"><a href="#">3</a></td>
              <td class="wb5"><a href="#">4</a></td>
              <td class="wb5"><a href="#">8</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb5"><a href="#">10</a></td>
              <td class="wb7"><a href="#">37</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb7"><a href="#">35%</a></td>
              <td class="wb5"><a href="#">22</a></td>
              <td class="wb7"><a href="#">55%</a></td>
              <td class="wb5"><a href="#">5</a></td>
              <td class="wb7"><a href="#">10%</a></td>
              <td class="wb5"><a href="#">2</a></td>
              <td class="wb7"><a href="#">5%</a></td>
            </tr>
            <tr style="background-color: #B1D2EC">
              <td class="wb20">小计</td>
              <td class="wb5"><a href="#">3</a></td>
              <td class="wb5"><a href="#">4</a></td>
              <td class="wb5"><a href="#">8</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb5"><a href="#">10</a></td>
              <td class="wb7"><a href="#">37</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb7"><a href="#">35%</a></td>
              <td class="wb5"><a href="#">22</a></td>
              <td class="wb7"><a href="#">55%</a></td>
              <td class="wb5"><a href="#">5</a></td>
              <td class="wb7"><a href="#">10%</a></td>
              <td class="wb5"><a href="#">2</a></td>
              <td class="wb7"><a href="#">5%</a></td>
            </tr>
            <tr style="background-color:#1c94c4">
              <td class="wb20">总计</td>
              <td class="wb5"><a href="#">3</a></td>
              <td class="wb5"><a href="#">4</a></td>
              <td class="wb5"><a href="#">8</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb5"><a href="#">10</a></td>
              <td class="wb7"><a href="#">37</a></td>
              <td class="wb5"><a href="#">12</a></td>
              <td class="wb7"><a href="#">35%</a></td>
              <td class="wb5"><a href="#">22</a></td>
              <td class="wb7"><a href="#">55%</a></td>
              <td class="wb5"><a href="#">5</a></td>
              <td class="wb7"><a href="#">10%</a></td>
              <td class="wb5"><a href="#">2</a></td>
              <td class="wb7"><a href="#">5%</a></td>
            </tr>
            </tbody>
          </table>
        </div>
        <div id="tab-4" class="tab-pane">
          <table class="table table-bordered" id="table_score" >
            <thead>
            <tr>
              <th class="wb5">序号</th>
              <th class="wb20">评审内容</th>
              <th class="wb45">评分标准</th>
              <th class="wb5">分值</th>
              <th class="wb5">累计扣分</th>
              <th class="wb5">扣分案件</th>
              <th class="wb5">平均扣分</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td class="wb5">1</td>
              <td class="wb20">事实证据与实体处理</td>
              <td class="wb45">审理查明的事实是否全面、客观、清楚</td>
              <td class="wb5">8</td>
              <td class="wb5">30</td>
              <td class="wb5">5</td>
              <td class="wb5">6</td>
            </tr>

            <tr>
              <td class="wb5">1</td>
              <td class="wb20">事实证据与实体处理</td>
              <td class="wb45">是否有其他不规范情形</td>
              <td class="wb5">8</td>
              <td class="wb5">30</td>
              <td class="wb5">5</td>
              <td class="wb5">6</td>
            </tr>

            <tr>
              <td class="wb5">1</td>
              <td class="wb20">审理程序</td>
              <td class="wb45">是否严格遵守规定</td>
              <td class="wb5">8</td>
              <td class="wb5">30</td>
              <td class="wb5">5</td>
              <td class="wb5">6</td>
            </tr>

            <tr>
              <td class="wb5">1</td>
              <td class="wb20">审理程序</td>
              <td class="wb45">庭审是否规范严谨，能否有序组织举证，质证，认证和辩论。</td>
              <td class="wb5">8</td>
              <td class="wb5">30</td>
              <td class="wb5">5</td>
              <td class="wb5">6</td>
            </tr>
            </tbody>
          </table>
        </div>
        <div id="tab-5" class="tab-pane">

          <div id="search_box1" class=" form_center clearfix">
            <div class="form_item wb30 fl moreview">
              <label>归属法院</label>
              <div style="position: relative;">
                <div class="input-group">
                  <input id="zzid" value="${bean.zzid }" type="hidden" /> <input type="text" class="form-control input-sm bmrequire" retype="text" readonly id="citySel" value="${bean.zzjgmc }"> <span class="input-group-btn">
                                  <button type="button" class="btn btn-primary btn-sm" id="menuBtn">选择</button>
                              </span>

                </div>
                <button type="button" class="btn btn-white btn-sm " style="float: right;margin-top: -30px;margin-right: -50px;" id="">清空</button>
                <div id="menuContent" class="menuContent" style="z-index: 9999999">
                  <ul id="treeDemo" class="ztree"></ul>
                </div>
              </div>
            </div>

            <div class="form_item wb20 fl moreview" style="padding-left: 60px;">
              <label>案件性质</label>
              <select class="form-control input-sm">
                <option>--请选择--</option>
                <option>民事</option>
              </select>
            </div>

            <%--<div class="form_item wb20 fl moreview">--%>
              <%--<label>排名依据</label>--%>
              <%--<select class="form-control input-sm">--%>
                <%--<option>总分</option>--%>
                <%--<option>审理程序</option>--%>
                <%--<option>事实证据与实体处理	</option>--%>
              <%--</select>--%>
            <%--</div>--%>

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
    $(function () {


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

        $("#table1").jqGrid({
            url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
            datatype : "json",
            mtype : "post",
            height : $('body').height()-175,
            width : $('body').width()-22,
            rownumbers : true,
            shrinkToFit : true,
            rowNum : 1000000,
            colModel : [ {
                label : '操作',
                name : 'ggid',
                width : 50,
                align : 'center',
                sortable : false,
                formatter :formatter_grid1_opt_1 ,
                frozen : true
            },{
                label : '专家',
                name : 'pczz',
                frozen : true,
                width : 100
            },{
                label : '来自',
                name : 'lz',
                frozen : true,
                width : 300
            },{
                label : '本次评查案件',
                name : 'bc',
                frozen : true,
                width : 100
            }
//            ,{
//                label : '本次评查活动寄语',
//                name : '',
//                frozen : true,
//                width : 500
//            }
            ],
            pager:"#pager1"
            ,viewrecords: true
        });

        $("#table2").jqGrid({
            url : ahcourt.ctx + '/assets/data/casecheck_notice_verify_table1.json',
            datatype : "json",
            mtype : "post",
            height : $('body').height()-200,
            width : $('body').width()-22,
            rownumbers : true,
            shrinkToFit : true,
            rowNum : 1000000,
            colModel : [ {
                label : '案号',
                name : 'ah',
                frozen : true,
                width : 100
            },{
                label : '归属法院',
                name : 'gsfy',
                frozen : true,
                width : 150
            },{
                label : '案件性质',
                name : 'xz',
                frozen : true,
                width : 100
            },{
                label : '得分',
                name : 'fs',
                frozen : true,
                width : 80
            }
            ],
            pager:"#pager2"
            ,viewrecords: true
        });

    })

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

    function formatter_grid1_opt_1(cellvalue, options, rowObject) {
        return '<button class="btn btn-link btn-xs _myproject_list_btn_view_busPro" type="button" onclick="" title="专家介绍"><i class="fa fa-info-circle"></i></button>';
    }
  </script>
  </body>
</html>
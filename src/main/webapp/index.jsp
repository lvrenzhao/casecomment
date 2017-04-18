<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>双评工作平台</title>
    <!-- library list = slimscroll;metismenu;bsfileinput;icheck;jqgrid;laydate;layer;steps;ztree -->
    <jsp:include page="/header.jsp?libs=metismenu;slimscroll" />
    <link href="${ctx_assets}/css/index.css" rel="stylesheet">
    <script type="text/javascript" src="${ctx_assets}/js/contabs.js"></script>
    <script type="text/javascript" src="${ctx_assets}/js/index.js"></script>

</head>
<body class="ofh" style="min-width: 1280px;">
    <div id="idx-header">
            <a class="navbar-brand fullbox" href="javascript:void(0)"><img src="${ctx_assets}/img/logo.png" style="width:30px;height: 30px; display: inline-block;color:#0088CC;" /> 安徽省法院案件质量网上双评工作平台</a>
            <ul class="header-nav pull-right" style="color: #0088CC">
                <li>
                    <a href="javascript:void(0)" onclick="$('#menu_wdzh').trigger('click')"><i class="fa fa-user"></i> ${user.xm} ( ${user.zzjgmc} )</a>
                </li>
            </ul>
    </div>
    <div id="idx-main">
        <div id="idx-main-nav">

            <ul class="nav" id="side-menu">
                <c:forEach var="menu" items="${menus}" varStatus="status">
                    <li class="<c:if test="${status.index == 0}"> active </c:if> ">
                        <a class="J_menuItem" href="${menu.cdurl }" data-index="${menu.cdid}"><i class="${menu.tb}"></i><span class="nav-label">${menu.cdmc }</span> <span style="display:inline-block;height:1px;width: 35px;float: right;"><span id="${menu.bz }" class="badge badge-white pull-right" style="font-weight: normal;"></span></span><c:if test="${not empty menu.submenus}"><span class="fa arrow"></span></c:if></a>

                        <c:if test="${not empty menu.submenus}">
                            <ul class="nav nav-second-level">
                                <c:forEach var="menu_lv2" items="${menu.submenus}" varStatus="level2_index">
                                        <li>
                                            <a class="J_menuItem"  href="${menu_lv2.cdurl }" data-index="${menu_lv2.cdid}"><i class="${menu_lv2.tb }"></i><span class="nav-label">${menu_lv2.cdmc }</span> <span style="display:inline-block;height:1px;width: 35px;float: right;"><span id="${menu_lv2.bz }" class="badge badge-white pull-right" style="font-weight: normal;"></span></span><c:if test="${not empty menu_lv2.submenus}"><span class="fa arrow" style=""></span></c:if></a>

                                            <c:if test="${not empty menu_lv2.submenus}">
                                                <ul class="nav nav-third-level">
                                                    <c:forEach var="menu_lv3" items="${menu_lv2.submenus}" varStatus="level3_index">
                                                        <li><a class="J_menuItem"  href="${menu_lv3.cdurl }" data-index="${menu_lv3.cdid}"><i class="${menu_lv3.tb }"></i><span class="nav-label">${menu_lv3.cdmc }</span> <span id="${menu_lv3.bz }" class="badge badge-white pull-right" style="font-weight: normal;"></span></a></li>
                                                    </c:forEach>
                                                </ul>
                                            </c:if>
                                        </li>
                                </c:forEach>
                            </ul>
                        </c:if>
                    </li>
                </c:forEach>

                <li style="visibility: hidden;">
                    <a class="J_menuItem" id="menu_wdzh" href="${ctx}/setting/user/myaccount.do" data-index="menu_wdzh"><i class="fa fa-user"></i> <span class="nav-label">我的账户</span></a>
                </li>
            </ul>
        </div>
        <div id="idx-main-page">
            <div class="content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i></button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <c:if test="${not empty menus[0].cdurl}">
                        <a href="javascript:;" class="active J_menuTab" data-id="${menus[0].cdurl}">${menus[0].cdmc}</a>
                        </c:if>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i></button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span></button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive"><a>定位当前选项卡</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                        </li>
                        <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                        </li>
                    </ul>
                </div>
                <a href="${ctx}/logout.do" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
            </div>
            <div class="J_mainContent" id="content-main">
                <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${menus[0].cdurl}" frameborder="0" data-id="${menus[0].cdurl}" seamless></iframe>
            </div>
        </div>
    </div>
</body>
</html>
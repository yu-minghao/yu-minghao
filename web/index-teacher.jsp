<%--
  Created by IntelliJ IDEA.
  User: Lucky 赵
  Date: 2021/5/8
  Time: 13:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>师生交流后台管理</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/common.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/main.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/font/iconfont.css">
</head>
<body>
<%--网页头部--%>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <ul class="navbar-list clearfix">
                <li>
                    <a class="on" href="${pageContext.request.contextPath}/index.jsp">首页</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/index.jsp" target="_blank"></a>
                </li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li>
                    用户：<span style='color:blueviolet'>
                            <%=session.getAttribute("username") %>&nbsp;
                        </span>

                        <span style='color:blueviolet'>
                            <%=session.getAttribute("role") %>
                        </span>
                </li>
                <li><a href="${pageContext.request.contextPath}/loginOutServlet">退出</a></li>
            </ul>
        </div>
    </div>
</div>

<%--网页主体--%>
<div class="container clearfix">
    <%--左边菜单栏--%>
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>菜单</h1>
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
                <li>
                    <a href="#"><i class="icon-font">&#xe003;</i>上传资料</a>
                    <ul class="sub-menu">
                        <li><a href="${pageContext.request.contextPath}/teaUploadInfo.jsp"><i class="icon-font">&#xe008;</i>上传资料</a></li>
                        <li><a href="${pageContext.request.contextPath}/uploadServlet?action=findAllFile"><i class="icon-font">&#xe004;</i>资料信息管理</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="icon-font">&#xe018;</i>上传视频</a>
                    <ul class="sub-menu">
                        <li><a href="${pageContext.request.contextPath}/teaUploadVideo.jsp"><i class="icon-font">&#xe037;</i>上传视频</a></li>
                        <li><a href="${pageContext.request.contextPath}/VideoInfoManage.jsp"><i class="icon-font">&#xe037;</i>视频信息管理</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <!--主体内容-->
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list">
                <i class="icon-font">&#xe06b;</i>
                <span>欢迎使用师生交流系统</span>
            </div>
        </div>
        <div class="result-wrap">
            <div class="result-title">
                <h1>欢迎使用教师子系统</h1>
            </div>
        </div>
    </div>
</div>
</body>
</html>

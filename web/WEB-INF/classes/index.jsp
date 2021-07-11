<%--
  Created by IntelliJ IDEA.
  User: Lucky 赵
  Date: 2021/5/8
  Time: 12:45
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
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <ul class="navbar-list clearfix">
                <li>
                    <a class="on" href="${pageContext.request.contextPath}/index.jsp">首页</a>
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
                <li>
                    <a href="${pageContext.request.contextPath}/loginOutServlet">退出</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="container clearfix">
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>菜单</h1>
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
                <li>
                    <a href="#"><i class="icon-font">&#xe003;</i>教师信息管理</a>
                    <ul class="sub-menu">
                        <li>
                            <a href="${pageContext.request.contextPath}/addTea.jsp">
                                <i class="icon-font">&#xe008;</i>添加教师
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/userServlet?action=findAllTea">
                                <i class="icon-font">&#xe004;</i>教师信息管理
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="icon-font">&#xe003;</i>学生信息管理</a>
                    <ul class="sub-menu">
                        <li>
                            <a href="${pageContext.request.contextPath}/addStu.jsp">
                                <i class="icon-font">&#xe008;</i>添加学生
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/userServlet?action=findAllStu">
                                <i class="icon-font">&#xe004;</i>学生信息管理
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list">
                <i class="icon-font">&#xe06b;</i>
                <span>欢迎使用师生交流系统</span>
            </div>
        </div>
        <div class="result-wrap">
            <div class="result-title">
                <h1>欢迎来到师生交流系统！！！</h1>
            </div>
        </div>
    </div>
</div>
</body>
</html>

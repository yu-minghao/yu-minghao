<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%--
  Created by IntelliJ IDEA.
  User: Lucky 赵
  Date: 2021/5/8
  Time: 13:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
    <title>师生交流后台管理</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/common.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/main.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/page.css"/>
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
                    <a href="#"><i class="icon-font">&#xe003;</i>下载资料</a>
                    <ul class="sub-menu">
                        <li><a href="${pageContext.request.contextPath}/downloadFileServlet?action=findAllFile"><i class="icon-font">&#xe008;</i>下载文档</a>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/downloadFileServlet?action=findAllVideo"><i class="icon-font">&#xe004;</i>下载视频</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <!--主体内容-->
    <div class="main-wrap">
        <div class="crumb-list">
            <a href="index-student.jsp">
                <i class="icon-font"></i>
                首页
            </a>
            <span class="crumb-step">&gt;</span>
            <span class="crumb-name">下载资料</span>
        </div>
        <div class="result-wrap">
            <form name="myform" id="myform" method="post">
                <div class="result-title">
                    <div class="result-list">
                        <%--<a href="${pageContext.request.contextPath}/addTea.jsp"><i class="icon-font"></i>新增教师</a>
                        <a id="batchDel" href="javascript:void(0)"><i class="icon-font">&#xe037;</i>批量删除</a>--%>
                        <a id="updateOrd" href="javascript:void(0)"><i class="icon-font"></i>更新排序</a>
                    </div>
                </div>
                <div class="result-content">
                    <table class="result-tab" width="100%">
                        <c:forEach var="item" items="${sessionScope.list}">
                            <tr>
                                <th class="tc" width="5%">
                                    <input class="allChoose" name="sel" type="checkbox">
                                </th>
                                <td>${item.id}</td>
                                    <%--                                <td>${item.title}</td>--%>
                                <td>${fn:substring(item.title, 32,fn:length(item.title))}</td>
                                <td>${item.author}</td>
                                <td>${item.path}</td>
                                <td>${item.time}</td>
                                <td>
                                    <a class="link-update"
                                       href="${pageContext.request.contextPath}/downloadFileServlet?action=downloadfile&filename=${item.title}">下载</a>
                                </td>
                            </tr>
                        </c:forEach>
                        <%--<tr>
                            <th>视频编号</th>
                            <th>视频名</th>
                            <th>下载</th>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>第一次上机.mp4</td>
                            <td><a class="link-update" href="#">下载</a></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>第二次上机.mp4</td>
                            <td><a class="link-update" href="#">下载</a></td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>数据库原理分析.mp4</td>
                            <td><a class="link-update" href="#">下载</a></td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>师生交流系统E-R图.mp4</td>
                            <td><a class="link-update" href="#">下载</a></td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>java基础.mp4</td>
                            <td><a class="link-update" href="#">下载</a></td>
                        </tr>--%>
                    </table>
                    <div class="list-page">
                        <ul class="pagination">
                            <li><a href="#">«</a></li>
                            <li><a  class="active" href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">»</a></li>
                        </ul>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>

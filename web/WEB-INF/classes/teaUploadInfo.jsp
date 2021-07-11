
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
                    <a class="on" href="${pageContext.request.contextPath}/index-teacher.jsp">首页</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/index.jsp" target="_blank">后台网站首页</a>
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
                        <li>
                            <a href="${pageContext.request.contextPath}/teaUploadInfo.jsp">
                                <i class="icon-font">&#xe008;</i>上传资料
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/uploadServlet?action=findAllFile">
                                <i class="icon-font">&#xe004;</i>资料信息管理
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="icon-font">&#xe018;</i>上传视频</a>
                    <ul class="sub-menu">
                        <li>
                            <a href="${pageContext.request.contextPath}/teaUploadVideo.jsp">
                                <i class="icon-font">&#xe037;</i>上传视频
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/uploadServlet?action=findAllVideo">
                                <i class="icon-font">&#xe037;</i>视频信息管理
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <%--主体内容--%>
    <div class="crumb-wrap">
        <div class="crumb-list">
            <a href="${pageContext.request.contextPath}/index-teacher.jsp">
                <i class="icon-font"></i>教师首页
            </a>
            <span class="crumb-step">&gt;</span>
            <a href="${pageContext.request.contextPath}/uploadServlet?action=findAllFile">资料信息管理</a>
            <span class="crumb-step">&gt;</span>
            <span class="crumb-name">上传资料</span>
        </div>
        <div class="result-wrap">
            <form name="infoForm" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/uploadServlet?action=addFile">
                <input type="hidden" name="action" value="addFile"/>
                <table>
                    <tr>
                        <td>作者：</td>
                        <td>
                            <label>
                                <input type="text" name="author" value="${sessionScope.username}">
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>上传资料：</td>
                        <td>
                            <input type="file" name="file" value="选择文件" class="button1">
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="2">
                            <input type="submit" value="上传" class="button">&nbsp;&nbsp;
                            <input type="reset" value="重置" class="button">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
</body>
</html>

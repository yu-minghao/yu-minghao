
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>师生交流后台管理</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/common.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/main.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/page.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/font/iconfont.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/JS/jquery-1.11.3.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#all").click(function () {
                if (this.checked) {
                    $(":checkbox").prop("checked", true);
                } else {
                    $(":checkbox").prop("checked", false);
                }
            });
            $("#batchDel").click(function () {
                $("#myForm").submit();
            });
        });
    </script>
</head>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none">
                <a href="index.jsp" class="navbar-brand">后台管理</a>
            </h1>
            <ul class="navbar-list clearfix">
                <li><a class="on" href="index.jsp">首页</a></li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li>
                    用户：<span style='color:blueviolet'>
                            <%=session.getAttribute("username") %>&nbsp;
                        </span>
                    欢迎登录！角色：
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
                    <a href="#"><i class="icon-font">&#xe033;</i>学生信息管理</a>
                    <ul class="sub-menu">
                        <li>
                            <a href="${pageContext.request.contextPath}/addStu.jsp">
                                <i class="icon-font">&#xe008;</i>添加学生
                            </a>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/userServlet?action=findAllStu">
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
                <a href="${pageContext.request.contextPath}/index.jsp">
                    <i class="icon-font"></i>首页
                </a>
                <span class="crumb-step">&gt;</span>
                <span class="crumb-name">学生信息管理</span>
            </div>
        </div>
        <div class="search-wrap">
            <div class="search-content">
                <form action="#" method="post">
                    <table class="search-tab">
                        <tr>
                            <th width="70">按名字:</th>
                            <td>
                                <label>
                                    <input class="common-text" placeholder="关键字" name="keywords" type="text">
                                </label>
                            </td>
                            <td>
                                <a href="lostmood.jsp" ><input class="btn btn-primary btn2" name="sub" value="查询" type="submit"></a>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div class="result-wrap">
            <form name="myForm" id="myForm" method="post" action="${pageContext.request.contextPath}/userServlet">
                <input type="hidden" name="action" value="delMoreStu"/>
                <div class="result-title">
                    <div class="result-list">
                        <a href="${pageContext.request.contextPath}/addStu.jsp">
                            <i class="icon-font"></i>新增学生
                        </a>
                        <a id="batchDel" href="javascript:myForm.submit();">
                            <i class="icon-font">&#xe037;</i>批量删除
                        </a>
                        <a id="updateOrd" href="${pageContext.request.contextPath}/userServlet?action=findAllStu">
                            <i class="icon-font"> </i>更新排序
                        </a>
                    </div>
                </div>
                <div class="result-content">
                    <table class="result-tab" width="100%">
                        <tr>
                            <th class="tc" width="5%">
                                <label for="all">
                                    <input class="allChoose" id="all" name="sel" type="checkbox">
                                </label>
                            </th>
                            <th>ID</th>
                            <th>学号</th>
                            <th>姓名</th>
                            <th>密码</th>
                            <th>审核状态</th>
                            <th>操作</th>
                        </tr>
                        <c:forEach items="${list}" var="item">
                            <tr>
                                <td class="tc">
                                    <label>
                                        <input name="sel" id="sel" value="${item.stuid}" type="checkbox"/>
                                    </label>
                                </td>
                                <td>${item.stuid}</td>
                                <td>${item.stuno}</td>
                                <td>${item.stuname}</td>
                                <td>${item.stupassword}</td>
                                <td>1</td>
                                <td>
                                    <a class="link-update"
                                       href="${pageContext.request.contextPath}/userServlet?action=updateBeforeStu&stuId=${item.stuid}">修改&nbsp;</a>|
                                    <a class="link-del"
                                       href="${pageContext.request.contextPath}/userServlet?action=delStu&stuId=${item.stuid}">&nbsp;删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    <div class="list-page">
                        <ul class="pagination">
                            <li><a href="#">«</a></li>
                            <li><a class="active" href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">»</a></li>
                        </ul>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!--/main-->
</div>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: Lucky 赵
  Date: 2021/5/17
  Time: 21:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>师生交流后台管理</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/common.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/main.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/font/iconfont.css">
    <style>
        .th-left {
            width: 80px;
            height: 50px;
            border: 2px solid #E2E2E2;
            border-radius: 10px;
            text-align: right;
        }

        .th-right {
            width: 600px;
            height: 50px;
            border: 2px solid #E2E2E2;
            border-radius: 10px;
            text-align: left;
        }

        .button {
            width: 90px;
            height: 25px;
            border-radius: 10px;
            outline: none;
            border: none;
            background-color: #4facfe;
        }

        .input {
            border-radius: 6px;
            width: 60%;
            height: 70%;
        }
    </style>
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
                <li><a href="${pageContext.request.contextPath}/loginOutServlet">退出</a></li>
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
                        <li><a href="${pageContext.request.contextPath}/addTea.jsp"><i class="icon-font">&#xe008;</i>添加教师</a>
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
    <%--主体内容--%>
    <div class="crumb-wrap">
        <div class="crumb-list">
            <a href="${pageContext.request.contextPath}/index-student.jsp">
                <i class="icon-font"></i>首页
            </a>
            <span class="crumb-step">&gt;</span>
            <a href="${pageContext.request.contextPath}/userServlet?action=findAllStu">学生信息管理</a>
            <span class="crumb-step">&gt;</span>
            <span class="crumb-name">修改学生信息</span>
        </div>
        <div class="main-wrap" style="margin-left: 215px;margin-top:10px ">
            <form action="${pageContext.request.contextPath}/userServlet" method="post">
                <input type="hidden" name="action" value="updateStu"/>
                <input type="hidden" name="stuId" value="${users.stuid}"/>
                <table>
                    <tr>
                        <th class="th-left">
                            <span style="color: red">*</span>学号:
                        </th>
                        <th class="th-right">
                            <label>
                                <input type="text" value="${users.stuno}" name="stuNo" class="input">
                            </label>
                        </th>
                    </tr>
                    <tr>
                        <th class="th-left">
                            <span style="color: red">*</span>姓名:
                        </th>
                        <th class="th-right">
                            <label>
                                <input type="text" value="${users.stuname}" name="stuName" class="input">
                            </label>
                        </th>
                    </tr>
                    <tr>
                        <th class="th-left">
                            <span style="color: red">*</span>密码:
                        </th>
                        <th class="th-right">
                            <label>
                                <input class="input" type="password" name="stuPassword" value="${users.stupassword}">
                            </label>
                        </th>
                        </th>
                    </tr>
                    <tr>
                        <th class="th-left"></th>
                        <th class="th-right">
                            <input type="submit" class="button" value="提交">
                            <input type="reset" class="button" style="background-color: #F3F3F3" value="返回">
                        </th>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
</body>
</html>

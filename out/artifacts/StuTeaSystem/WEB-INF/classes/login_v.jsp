<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>" rel="external nofollow" >

    <title>My JSP 'login.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css" rel="external nofollow" >
    -->

</head>

<body>
<%--本页面提供登录表单,还有显示错误信息 --%>
<h1>登录</h1>
<%
    //读取uname的cookie
    String uname="";
    Cookie[] cs=request.getCookies();
    if(cs!=null){
        for(Cookie c:cs){
            if("uname".equals(c.getName())){
                uname=c.getValue();
            }
        }
    }
%>

<%
    String message="";
    String msg=(String)request.getAttribute("msg");
    if(msg!=null){
        message=msg;
    }
%>

<font color="red"><b><%=message %></b></font>
<form action="${pageContext.request.contextPath}/loginServlet" method="post">
    用户名：<input type="text" name="username" value=<%=uname %> /><br>
    密 码：<input type="password" name="pawword" /><br>
    验证码:<input type="text" name="verifycode" size="3">
    <img src="${pageContext.request.contextPath}/VerifyServlet" >
    <!-- <a href="javascript:_change()" rel="external nofollow" >换一张</a> -->

    <input type="submit" value="登录" />

</form>
</body>
</html>
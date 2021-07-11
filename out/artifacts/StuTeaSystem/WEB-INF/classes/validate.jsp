
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录界面</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/login.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/font/iconfont.css">
    <script type="text/javascript">
        function login() {
            var username = document.getElementById("username");
            if (username.value === "" || username.value == null) {
                alert("请输入账号");
                username.focus();
                return false;
            }
            var password = document.getElementById("password");
            if (password.value === "" || password.value == null) {
                alert("请输入密码");
                password.focus();
                return false;
            }
            //提交
            document.getElementById("form").submit();
        }
    </script>
</head>
<%--<body onload="document.form1.username.focus();">--%>
<body>
<script type ="text/javascript">
    function refresh(){
        loginForm.imgValidate.src="validate.jsp?id=" + Math.random();
    }
</script>
欢迎登录本系统<br>
<form name = "loginForm" action="${pageContext.request.contextPath}/loginDoServlet" method="post">
    请您输入账号:<input type="text" name="account" /><br>
    请您输入密码:<input type="password" name="password" /><br>
    请输入验证码:<input type="text" name="code" size="10">
    <img name="imgValidate" src="validate.jsp" onclick="refresh()"><br>
    <input type = "submit" value="登录">
</form>
</body>
<%--<div id="login-box">
    <h1>登录</h1>
    <form id="form1" name="form1" method="post" action="${pageContext.request.contextPath}/loginDoServlet">
        <div class="input-box">
            <i class="icon iconfont">&#xe6a3;</i>
            <label>
                <input type="text" id="username" name="username" placeholder="Username">
            </label>
        </div>
        <div class="input-box">
            <i class="icon iconfont">&#xe6a8;</i>
            <label>
                <input type="password" id="password" name="password" placeholder="Password">
            </label>
        </div>
        <div class="input-box">
            <label style="margin-left: 40px;margin-top: 20px;height: 15px;">
                <i class="icon iconfont">&#xe620;</i>
                <select id="role" name="role">
                    <option value="学生">学生</option>
                    <option value="教师">教师</option>
                    <option value="管理员">管理员</option>
                </select>
            </label>
        </div>
        <div>
            <a href="javascript:login()" style="text-underline: none">
                <button id="login">登录</button>
            </a>
        </div>
        <div class="password">
            <span>忘记密码？</span>
            <a href="#">注册</a>
        </div>
    </form>
</div>
</body>--%>
</html>
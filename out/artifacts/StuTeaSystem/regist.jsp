<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title></title>
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <link rel="stylesheet" type="text/css" href="css/body.css"/>
  <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
  <script type="text/javascript">
    $(function(){
      //给用户名输入框绑定事件处理程序
      $("#code").blur(function(){
        validateCode();
      });
      $("#password").blur(function(){
        validatePassword1();
      });
      $("#againpassword").blur(function(){
        validateAgainPassword();
      });
      $("#realname").blur(function(){
        validateRealname();
      });
      $("#sex").blur(function(){
        validateSex();
      });
      $("#status").blur(function(){
        validateStatus();
      });
      $("#js-btn-login").click(function(){
        if(validateCode() && validatePassword() && validateAgainPassword() && validateRealname()){
          //根据不同用户提交给不同的Servlet
          if($("#type").val() == "0"){
            $("#regist").attr("action","${pageContext.request.contextPath}/stuUserServlet");
          }
          if($("#type").val() == "1"){
            $("#regist").attr("action","${pageContext.request.contextPath}/teacherServlet");
          }
          if($("#type").val() == "2"){
            $("#regist").attr("action","${pageContext.request.contextPath}/adminServlet");
          }
          //所有属性都非空
          $("#regist").submit();
        }
      });
    });

    function validateCode(){
      var un = $("#code").val();
      if(un == null || $.trim(un) == ""){
        alert("请输入学号!");
        return false;
      }
      return true;
    }
    function validatePassword(){
      var pd1 = $("#password").val();
      if(pd1 == null || $.trim(pd1) == ""){
        alert("请输入密码!");
        return false;
      }
      return true;
    }
    function validateAgainPassword(){
      var pd1 = $("#password").val();
      var pd2 = $("#againpassword").val();
      if(pd2 == null || $.trim(pd2) == ""){
        alert("请确认密码!");
        return false;
      }
      //判断两个密码是否一致
      if(pd1 != pd2){
        alert("密码不一致!");
        return false;
      }
      return true;
    }
    function validateRealname(){
      var rn = $("#realname").val();
      //判断姓名是否为空
      if(rn == null || $.trim(rn) == ""){
        alert("请输入真实姓名!");
        return false;
      }
      return true;
    }
  </script>
</head>
<body>
<div class="container">
  <section id="content">
    <form action="#" method="post" id="regist">
      <input type="hidden" name="action" value="regist"/>
      <h1>用户注册</h1>
      <input type="text" placeholder=" 用户" name="code" required=""  id="code" />
      <input type="password" placeholder=" 密码" name="password" required="" id="password" />
      <input type="password" class="form-control" placeholder="再次输入密码" name="passwords" id="againpassword"  />
      <input type="text" placeholder="真实姓名"	name="realname" id="realname" />
      <input id="status" name="status" type="text" placeholder="状态" />
      <select type="text"  name="sex" id="sex">
        <option value="男">男</option>
        <option value="女">女</option>
      </select>
      <select id="type">
        <option value="0">学生</option>
        <option value="1">教师</option>
      </select>
      <div class="">
        <span class="help-block u-errormessage" id="js-server-helpinfo">&nbsp;</span>
      </div>
      <div>
        <input type="submit" value="注册" class="btn btn-primary" id="js-btn-login"/>
        <a href="login.jsp">登录</a>
      </div>
    </form>
  </section>
</div>
</body>
</html>

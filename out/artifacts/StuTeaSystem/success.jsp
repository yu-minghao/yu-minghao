<body>
<h1>succ1</h1>
<%
    String username=(String)session.getAttribute("username");
    if(username==null){
 /*
 向request域中保存错误信息，转发到login.jsp
 */
        request.setAttribute("msg", "请先登录再访问");
        request.getRequestDispatcher("/session2/login_v.jsp").forward(request, response);
        return;
    }
%>

欢迎登陆成功<%=username %>
</body>
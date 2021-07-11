package com.zcib.Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet(name = "loginServlet", urlPatterns = "/loginServlet")
public class LoginServlet extends HttpServlet {

    /**
     * @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
     */
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException
    {
        /**
         * 获取校验码
         */
        String sessionCode = (String) req.getSession()
                .getAttribute("session_vcode");

        String paraCode = req.getParameter("verifycode");

        if (!paraCode.equalsIgnoreCase(sessionCode))
        {
            req.setAttribute("msg", "验证码错误");
            req.getRequestDispatcher("/login_v.jsp").forward(req, resp);
            return;
        }

        /**
         * 获取表单信息
         */
        req.setCharacterEncoding("utf-8");

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        /**
         * 校验用户名和密码
         */
        if (!"kevin".equalsIgnoreCase(username))// 成功
        {
            Cookie cookie = new Cookie("uname", username);
            resp.addCookie(cookie);

            /*
             * 成功就保存用户信息到session，并重定向succ1.jsp
             */
            HttpSession session = req.getSession();
            session.setAttribute("username", username);
            resp.sendRedirect("/success.jsp");
        }
        else
        {// 失败
            // 如果失败，保存错误信息到requset，转发到login.jsp
            // (服务器内部跳转只有一个request请求，重定向会有新的request，就不能获取错误信息)
            req.setAttribute("msg", "用户名或密码错误");
            RequestDispatcher rd = req
                    .getRequestDispatcher("/login_v.jsp");
            rd.forward(req, resp);// 转发

        }

    }

}

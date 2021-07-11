package com.zcib.Servlet;

import com.zcib.Utils.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

/**
 * @author 
 * @date 2021年05月29日 18:56
 */

@WebServlet(name = "loginDoServlet", urlPatterns = "/loginDoServlet")
public class LoginDoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        HttpSession session=request.getSession();
        //1.接收数据
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        /**
         * 获取校验码
         */
        String sessionCode = (String) request.getSession().getAttribute("session_vcode");
        String paraCode = request.getParameter("verifycode");
        if (!sessionCode.equalsIgnoreCase(paraCode)) {
            request.setAttribute("msg", "验证码错误");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }
        DBUtil dbUtil = new DBUtil();
        Map<String, String> record = null;
        if ("学生".equals(role)) {
            try {
                record = dbUtil.validateStudent(username, password);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            //把登录成功的信息保存到session中
            if (record != null) {
                session.setAttribute("name", record.get("stuname"));
            }
        } else if ("教师".equals(role)) {
            try {
                record = dbUtil.validateTeacher(username, password);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            //把登录成功的信息保存到session中
            if (record != null) {
                session.setAttribute("name", record.get("teaname"));
            }
        } else if ("管理员".equals(role)) {
            try {
                record = dbUtil.validateAdmin(username, password);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

            //把登录成功的信息保存到session中
            if (record != null) {
                session.setAttribute("name", record.get("adName"));
            }
        }
        if (record != null) {
            session.setAttribute("role", role);
            session.setAttribute("username", username);
            if ("学生".equals(role)) {
                request.getRequestDispatcher("/index-student.jsp").forward(request,response);
            }else if ("教师".equals(role)) {
                request.getRequestDispatcher("/index-teacher.jsp").forward(request,response);
            }else {
                request.getRequestDispatcher("/index.jsp").forward(request,response);
            }
        } else {
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }
    }
}

package com.zcib.Servlet;

import com.zcib.DoMain.User;
import com.zcib.Service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * @author 
 * @date 2021年05月16日 16:53
 */

@WebServlet(name = "userServlet", urlPatterns = "/userServlet")
public class UserServlet extends HttpServlet {

    private final UserService userService = new UserService();
    private final User user = new User();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        String action = request.getParameter("action");
        if ("addStu".equals(action)) {
            try {
                addStu(request, response);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        } else if ("updateBeforeStu".equals(action)) {
            try {
                updateBeforeStu(request, response);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        } else if ("updateStu".equals(action)) {
            try {
                updateStu(request, response);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        } else if ("findAllStu".equals(action)) {
            try {
                findAllStu(request, response);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        } else if ("delStu".equals(action)) {
            try {
                delStu(request, response);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        } else if ("delMoreStu".equals(action)){
            try {
                delMoreStu(request,response);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        } else if ("addTea".equals(action)) {
            try {
                addTea(request, response);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        } else if ("updateBeforeTea".equals(action)) {
            try {
                updateBeforeTea(request, response);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        } else if ("updateTea".equals(action)) {
            try {
                updateTea(request, response);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        } else if ("findAllTea".equals(action)) {
            try {
                findAllTea(request, response);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        } else if ("delTea".equals(action)) {
            try {
                delTea(request, response);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }else if ("delMoreTea".equals(action)){
            try {
                delMoreTea(request,response);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    /**
     * 1.添加学生信息
     * @param request
     * @param response
     * @throws SQLException
     * @throws ServletException
     * @throws IOException
     */
    private void addStu(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {

        //获取表单信息
        String stuNo = request.getParameter("stuNo");
        String stuName = request.getParameter("stuName");
        String stuPassword = request.getParameter("stuPassword");

        //将表单信息封装到User对象中
        user.setStuNo(stuNo);
        user.setStuName(stuName);
        user.setStuPassword(stuPassword);
        userService.addStu(user);
        request.getRequestDispatcher("/addStu.jsp").forward(request, response);
    }

    /**
     * 2.修改学生信息
     * @param request
     * @param response
     * @throws SQLException
     * @throws ServletException
     * @throws IOException
     */
    private void updateBeforeStu(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        //获取要修改的学生id
        String stuId = request.getParameter("stuId");
        int i = Integer.parseInt(stuId);
        //调用Service的findByStuId方法获取该学生信息
        Map<String, Object> users = userService.findByStuId(i);
        request.setAttribute("users", users);
        request.getRequestDispatcher("/updateStu.jsp").forward(request, response);
    }

    /**
     * 2.修改学生信息
     * @param request
     * @param response
     * @throws SQLException
     * @throws ServletException
     * @throws IOException
     */
    private void updateStu(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {

        //获取要修改的学生信息
        String stuId = request.getParameter("stuId");
        String stuNo = request.getParameter("stuNo");
        String stuName = request.getParameter("stuName");
        String stuPassword = request.getParameter("stuPassword");

        //将数据封装到User对象中
        user.setStuId(Integer.parseInt(stuId));
        user.setStuNo(stuNo);
        user.setStuName(stuName);
        user.setStuPassword(stuPassword);

        //调用Service中的update方法进行修改
        userService.updateStu(user);

        //调用finAll方法显示修改后的学生信息列表
        findAllStu(request, response);
    }

    /**
     * 3.查询学生信息
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     * @throws SQLException
     */
    private void findAllStu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
            //查询所有学生信息，调用Service中的findAll方法
            List<Map<String, Object>> list = userService.findAllStu();

            //将学生信息放在request中
            request.getSession().setAttribute("list", list);

            //请求转发给stuInfoManage.jsp
            request.getRequestDispatcher("/stuInfoManage.jsp").forward(request, response);
    }

    /**
     * 4.删除学生信息
     * @param request
     * @param response
     * @throws ServletException
     * @throws SQLException
     * @throws IOException
     */
    private void delStu(HttpServletRequest request, HttpServletResponse response) throws ServletException, SQLException, IOException {
        //获取学生id
        String stuId = request.getParameter("stuId");
        userService.delStu(stuId);
        findAllStu(request, response);
    }

    /**
     * 1.添加教师信息
     * @param request
     * @param response
     * @throws SQLException
     * @throws ServletException
     * @throws IOException
     */

    /**
     *批量删除学生信息
     * @param request
     * @param response
     */
    private void delMoreStu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        /*
         * 删除多条记录
         * 1.首先获取checkbox中被选中的id号
         * 2.检查数据的正确性
         * 3.调用service层删除
         * 4.调用findAll方法
         */
        final String[] stuIds = request.getParameterValues("sel");
        if (stuIds==null|| stuIds.length==0){
            request.setAttribute("msg","您未选择要删除的记录！");
            request.getRequestDispatcher("/stuInfoManage.jsp").forward(request,response);
        }
        userService.delMoreStu(stuIds);
        findAllStu(request,response);
    }
    private void addTea(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {

        //获取表单信息
        String teaNo = request.getParameter("teaNo");
        String teaName = request.getParameter("teaName");
        String teaPassword = request.getParameter("teaPassword");

        //将表单信息封装到User对象中
        user.setTeaNo(teaNo);
        user.setTeaName(teaName);
        user.setTeaPassword(teaPassword);
        userService.addTea(user);
        request.getRequestDispatcher("/addTea.jsp").forward(request, response);
    }

    /**
     * 2.修改教师信息
     * @param request
     * @param response
     * @throws SQLException
     * @throws ServletException
     * @throws IOException
     */
    private void updateBeforeTea(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        //获取要修改的教师id
        String teaId = request.getParameter("teaId");
        int i = Integer.parseInt(teaId);
        //调用Service的findByStuId方法获取该教师信息
        Map<String, Object> user = userService.findByTeaId(i);
        request.setAttribute("user", user);
        request.getRequestDispatcher("/updateTea.jsp").forward(request, response);
    }

    /**
     * 2.修改教师信息
     * @param request
     * @param response
     * @throws SQLException
     * @throws ServletException
     * @throws IOException
     */
    private void updateTea(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {

        //获取要修改的教师信息
        String teaId = request.getParameter("teaId");
        String teaNo = request.getParameter("teaNo");
        String teaName = request.getParameter("teaName");
        String teaPassword = request.getParameter("teaPassword");

        //将数据封装到User对象中
        user.setTeaId(Integer.parseInt(teaId));
        user.setTeaNo(teaNo);
        user.setTeaName(teaName);
        user.setTeaPassword(teaPassword);

        //调用Service中的update方法进行修改
        userService.updateTea(user);

        //调用finAll方法显示删除后的教师信息列表
        findAllTea(request, response);
    }

    /**
     * 3.删除教师信息
     * @param request
     * @param response
     * @throws ServletException
     * @throws SQLException
     * @throws IOException
     */
    private void delTea(HttpServletRequest request, HttpServletResponse response) throws ServletException, SQLException, IOException {
        //获取教师id
        String teaId = request.getParameter("teaId");
        userService.delTea(teaId);
        findAllTea(request, response);
    }

    /**
     * 4.查询教师信息
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     * @throws SQLException
     */
    private void findAllTea(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        //查询所有教师信息，调用Service中的findAllTea方法
        List<Map<String, Object>> list = userService.findAllTea();

        //将教师信息放在request中
        request.setAttribute("list", list);

        //请求转发给teaInfoManage.jsp
        request.getRequestDispatcher("/teaInfoManage.jsp").forward(request, response);
    }

    /**
     * 批量删除教师信息
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void delMoreTea(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        /*
         * 删除多条记录
         * 1.首先获取checkbox中被选中的id号
         * 2.检查数据的正确性
         * 3.调用service层删除
         * 4.调用findAll方法
         */
        final String[] teaIds = request.getParameterValues("sel");
        if (teaIds==null||teaIds.length==0){
            request.setAttribute("msg","您未选择要删除的记录！");
            request.getRequestDispatcher("/teaInfoManage.jsp").forward(request,response);
        }
        userService.delMoreTea(teaIds);
        findAllTea(request,response);
    }
}

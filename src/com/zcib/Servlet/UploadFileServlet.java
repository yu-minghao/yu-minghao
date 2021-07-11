package com.zcib.Servlet;

import com.zcib.Service.FileService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.sql.SQLException;
import java.util.*;

/**
 * @author 
 * @date 2021年05月31日 16:19
 */

@WebServlet(name = "uploadServlet", urlPatterns = "/uploadServlet")
public class UploadFileServlet extends HttpServlet {

    private static final com.zcib.DoMain.File file1 = new com.zcib.DoMain.File();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        String action = request.getParameter("action");
        if ("addFile".equals(action)) {
            try {
                addFile(request, response);
                request.getRequestDispatcher("/teaUploadInfo.jsp").forward(request, response);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        } else if ("addVideo".equals(action)) {
            try {
                addFile(request, response);
                request.getRequestDispatcher("/teaUploadVideo.jsp").forward(request, response);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        } else if ("findAllFile".equals(action) || "findAllVideo".equals(action)) {
            try {
                findAllFile(request, response);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        } else if ("downloadFindAllFile".equals(action)) {
            try {
                downloadFile(request, response);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        } else if ("deleteFile".equals(action) || "deleteVideo".equals(action)) {
            try {
                deleteFile(request, response);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    private void deleteFile(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String action = request.getParameter("action");
        String id = request.getParameter("id");//获取文件id
        if ("deleteFile".equals(action)) {
            FileService.deleteFile(id);
            List<Map<String, Object>> list = FileService.findAllFile();
            request.getSession().setAttribute("list", list);
            request.getRequestDispatcher("/InfoManage.jsp").forward(request, response);
        } else if ("deleteVideo".equals(action)) {
            FileService.deleteVideo(id);
            List<Map<String, Object>> list = FileService.findAllVideo();
            request.getSession().setAttribute("list", list);
            request.getRequestDispatcher("/VideoInfoManage.jsp").forward(request, response);
        }
    }

    private void downloadFile(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        //查询所有文件信息，调用Service中的findAllFile方法
        List<Map<String, Object>> list = FileService.findAllFile();
        System.out.println(list);

        //将文件放在request中
        request.getSession().setAttribute("list", list);

        //请求转发给InfoManage.jsp
        request.getRequestDispatcher("/stuDownloadInfo.jsp").forward(request, response);
    }

    /**
     * 1.查询所有文件信息，调用Service中的findAllFile或findAllVideo方法
     * 2.将文件放在request中
     * 3.请求转发给InfoManage.jsp或VideoInfoManage.jsp
     *
     * @param request
     * @param response
     * @throws SQLException
     * @throws ServletException
     * @throws IOException
     */
    private void findAllFile(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {

        String action = request.getParameter("action");
        if ("findAllFile".equals(action)) {
            List<Map<String, Object>> list = FileService.findAllFile();
            request.getSession().setAttribute("list", list);
            request.getRequestDispatcher("/InfoManage.jsp").forward(request, response);
        } else if ("findAllVideo".equals(action)) {
            List<Map<String, Object>> list = FileService.findAllVideo();
            request.getSession().setAttribute("list", list);
            request.getRequestDispatcher("/VideoInfoManage.jsp").forward(request, response);
        }
    }


    public void addFile(HttpServletRequest request, HttpServletResponse response) throws SQLException, UnsupportedEncodingException {
        /*
         * 1.创建工厂对象
         * 2.使用工厂对象创建解析器
         * 3.通过解析器解析request请求，获取FileItem集合
         * 4.通过循环遍历依次取出表单项，如果是文件则存入磁盘。
         */
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        String author = request.getParameter("author");
        HttpSession session = request.getSession();
        author = (String) session.getAttribute(author);
        file1.setAuthor(author);
        System.out.println(author);

        //得到上传文件的保存目录，将上传的文件存放于WEB-INF目录下，不允许外界直接访问，保证上传文件的安全
        String savePath = this.getServletContext().getRealPath("uploadFile\\");
        //上传时生成的临时文件保存目录
        String tempPath = this.getServletContext().getRealPath("/WEB-INF/temp");
        java.io.File file = new java.io.File(tempPath);
        if (!file.exists() && !file.isDirectory()) {
            file.mkdir();
        }

        //1.创建工厂对象
        DiskFileItemFactory factory = new DiskFileItemFactory();
        //2.使用工厂对象创建解析器
        ServletFileUpload sfu = new ServletFileUpload(factory);

        //设置工厂的缓冲区的大小，当上传的文件大小超过缓冲区的大小时，就会生成一个临时文件存放到指定的临时目录当中。
        factory.setSizeThreshold(1024 * 100);
        //设置上传时生成的临时文件的保存目录
        factory.setRepository(file);
        //限制单个文件的大小，应放置在解析之前
        sfu.setFileSizeMax(10 * 1024 * 1024);//限制大小为10M
        //限制整个请求的大小
        sfu.setSizeMax(200 * 1024 * 1024);//限制大小为200M

        String filename = "";
        try {
            //3.通过解析器解析request请求，获取FileItem集合
            List<FileItem> list = sfu.parseRequest(request);
            //4.通过循环遍历依次取出表单项，如果是文件则存入磁盘。
            for (FileItem item : list) {
                if (item.isFormField()) {//该表单项是一个普通表单项
                    //获取表单项的名字和值
                    String name = item.getFieldName();//该表单项的名字
                    String value = item.getString("UTF-8");//该表单项的值，使用utf-8防止中文乱码.e
                    if ("author".equals(name)) {
                        file1.setAuthor(value);
                        System.out.println(name + ":" + value);
                    }
                } else {//该表单项是文件表单项
                    //获取文件路径，不同浏览器返回值不同
                    filename = item.getName();
                    //判断是否是图片
//					int index = filename.lastIndexOf(".");
//					String suffix = filename.substring(index+1);
//					if(!("jpg".equals(suffix)||"gif".equals(suffix))){
//						return "";
//						}
                    //截取文件名
                    int index = filename.lastIndexOf("\\");
                    if (index != -1) {//如果文件名中有\，则表示有路径，需截取
                        filename = filename.substring(index + 1);
                        //防止重名，给名字前加上一个唯一的前缀

                    }
                    filename = UUID.randomUUID().toString().replace("-", "") + filename;
                    file1.setTitle(filename);
                                                          String path = "uploadFile\\"+filename;
                    // filename = path + filename;
                    file = new File(this.getServletContext().getRealPath(path));

                    if (!file.exists()) {
                        file.getParentFile().mkdirs();//如果文件的父目录不存在，则创建它们
                    }

                    //保存文件到磁盘
                    item.write(file);
                }
            }
            file1.setPath(savePath);
            file1.setTime(new Date());

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        String action = request.getParameter("action");
        if ("addFile".equals(action)) {
            FileService.addFile(file1);
        } else {
            FileService.addVideo(file1);
        }
    }
}

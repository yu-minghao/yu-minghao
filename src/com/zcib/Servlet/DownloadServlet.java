package com.zcib.Servlet;

import Decoder.BASE64Encoder;
import org.apache.commons.io.IOUtils;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

/**
 * @author 
 * @date 2021年05月21日 23:47
 */

//@WebServlet(name = "downloadServlet", urlPatterns = "/downloadServlet")
public class DownloadServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String filePath="uploadFile\\";
        //获取文件绝对路径
        String path = this.getServletContext().getRealPath(filePath);
        //获取文件名
        String filename = filePath.substring(filePath.lastIndexOf("/")+1);
        // 为了使下载框中显示中文文件名称不出乱码！
        filename = filenameEncoding(filename,request);
        //输入流
        FileInputStream input = new FileInputStream(path);
        //设置响应头
        String contentType = this.getServletContext().getMimeType(filename);//通过文件名称获取MIME类型
        String contentDisposition = "attachment;filename=" + filename;
        response.setHeader("Content-Type", contentType);
        response.setHeader("Content-Disposition", contentDisposition);
        //获取绑定了响应端的输出流
        ServletOutputStream output = response.getOutputStream();
        IOUtils.copy(input, output);//把输入流中的数据写入到输出流中。
        input.close();

    }

    /*private void down(String filePath, HttpServletRequest request, HttpServletResponse response) throws IOException {
        //获取文件绝对路径
        String path = this.getServletContext().getRealPath(filePath);
        //获取文件名
        String filename = filePath.substring(filePath.lastIndexOf("/")+1);

        // 为了使下载框中显示中文文件名称不出乱码！
        filename = filenameEncoding(filename,request);

        //输入流
        FileInputStream input = new FileInputStream(path);

        //设置响应头
        String contentType = this.getServletContext()
                .getMimeType(filename);//通过文件名称获取MIME类型
        String contentDisposition = "attachment;filename=" + filename;
        response.setHeader("Content-Type", contentType);
        response.setHeader("Content-Disposition", contentDisposition);

        //获取绑定了响应端的输出流
        ServletOutputStream output = response.getOutputStream();

        IOUtils.copy(input, output);//把输入流中的数据写入到输出流中。

        input.close();
    }
*/
    // 用来对下载的文件名称进行编码的！
    public static String filenameEncoding(String filename, HttpServletRequest request) throws IOException {
        String agent = request.getHeader("User-Agent"); //获取浏览器
        if (agent.contains("Firefox")) {
            BASE64Encoder base64Encoder = new BASE64Encoder();
            filename = "=?utf-8?B?"
                    + base64Encoder.encode(filename.getBytes("utf-8"))
                    + "?=";
        } else if(agent.contains("MSIE")) {
            filename = URLEncoder.encode(filename, "utf-8");
        } else {
            filename = URLEncoder.encode(filename, "utf-8");
        }
        return filename;
    }
}
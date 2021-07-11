package com.zcib.Service;

import com.zcib.Dao.FileDao;
import com.zcib.DoMain.File;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * @author 
 * @date 2021年05月30日 13:30
 */
public class FileService {
    private static final FileDao fileDao = new FileDao();
    /**
     * 文件处理*/
    public static void addFile(File file) throws SQLException {
        fileDao.addFile(file);
    }

    public static List<Map<String, Object>> findAllFile() throws SQLException {
        return fileDao.findAllFile();
    }

    public static void deleteFile(String id) throws SQLException {
        fileDao.deleteFile(id);
    }

    /**
     * 视频处理*/
    public static void addVideo(File video) throws SQLException {
        fileDao.addVideo(video);
    }

    public static List<Map<String, Object>> findAllVideo() throws SQLException {
        return fileDao.findAllVideo();
    }

    public static void deleteVideo(String id) throws SQLException {
        fileDao.deleteVideo(id);
    }
}

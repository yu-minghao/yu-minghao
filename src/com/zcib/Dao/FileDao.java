package com.zcib.Dao;

import com.zcib.DoMain.File;
import com.zcib.Utils.DBUtil;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * @author
 * @date 2021年05月30日 13:31
 */
public class FileDao {

    /**
     * 文件处理*/
    public void addFile(File file) throws SQLException {
        String sql="insert into file(title,author,path,time) values(?,?,?,?)";
        long time = file.getTime().getTime();
        Date date = new Date(time);
        Object[] objects={
                file.getTitle(),
                file.getAuthor(),
                file.getPath(),
                date
        };
        DBUtil.update(sql, objects);
    }


    public List<Map<String, Object>> findAllFile() throws SQLException {
        String sql = "select * from file order by time desc";
        return DBUtil.find(sql);
    }

    public void deleteFile(String id) throws SQLException {
        String sql="delete from file where id=?";
        int i = Integer.parseInt(id);
        DBUtil.update(sql,i);
    }


    /**
     * 视频处理*/
    public void addVideo(File video) throws SQLException {
        String sql="insert into video(title,author,path,time) values(?,?,?,?)";
        long time = video.getTime().getTime();
        Date date = new Date(time);
        Object[] objects={
                video.getTitle(),
                video.getAuthor(),
                video.getPath(),
                date
        };
        DBUtil.update(sql, objects);
    }

    public List<Map<String, Object>> findAllVideo() throws SQLException {
        String sql = "select * from video order by time desc";
        return DBUtil.find(sql);
    }

    public void deleteVideo(String id) throws SQLException {
        String sql="delete from video where id=?";
        int i = Integer.parseInt(id);
        DBUtil.update(sql,i);
    }
}

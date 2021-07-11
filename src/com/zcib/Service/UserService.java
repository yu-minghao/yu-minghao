package com.zcib.Service;

import com.zcib.Dao.UserDao;
import com.zcib.DoMain.User;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * @author 
 * @date 2021年05月17日 20:04
 */
public class UserService {
    private final UserDao userDao = new UserDao();

    /*
     * 对学生处理
     * */
    public void addStu(User user) throws SQLException {
        userDao.addStu(user);
    }

    public Map<String, Object> findByStuId(int stuId) throws SQLException {
        return userDao.findByStuId(stuId);
    }

    public void updateStu(User user) throws SQLException {
        userDao.updateStu(user);
    }

    public List<Map<String, Object>> findAllStu() throws SQLException {
        return userDao.findAllStu();
    }

    public void delStu(String stuId) throws SQLException {
        userDao.delStu(stuId);
    }

    /*
     * 对教师处理
     * */
    public void addTea(User user) throws SQLException {
        userDao.addTea(user);
    }

    public Map<String, Object> findByTeaId(int teaId) throws SQLException {
        return userDao.findByTeaId(teaId);
    }

    public void updateTea(User user) throws SQLException {
        userDao.updateTea(user);
    }

    public List<Map<String, Object>> findAllTea() throws SQLException {
        return userDao.findAllTea();
    }

    public void delTea(String teaId) throws SQLException {
        userDao.delTea(teaId);
    }

    public void delMoreStu(String[] stuIds) throws SQLException {
        userDao.delMoreStu(stuIds);
    }

    public void delMoreTea(String[] teaIds) throws SQLException {
        userDao.delMoreTea(teaIds);
    }
}

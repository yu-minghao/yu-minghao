package com.zcib.Dao;

import com.zcib.DoMain.User;
import com.zcib.Utils.DBUtil;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * @author
 * @date 2021年05月16日 18:15
 */
public class UserDao {
    /**
     * 添加学生
     * @param user
     * @throws SQLException
     */
    public void addStu(User user) throws SQLException {
        String sql = "insert into studentinfo values(default,?,?,?)";
        Object[] objects = {
                user.getStuNo(),
                user.getStuName(),
                user.getStuPassword()
        };
        DBUtil.update(sql, objects);
    }

    /**
     * 通过id查询数据库中所有学生信息
     * @param stuId
     * @return
     * @throws SQLException
     */
    public Map<String, Object> findByStuId(int stuId) throws SQLException {
        String sql = "select * from studentinfo where stuId=?";
        List<Map<String, Object>> maps = DBUtil.find(sql, stuId);
        return maps.get(0);
    }

    /**
     * 修改学生信息
     * @param user
     * @throws SQLException
     */
    public void updateStu(User user) throws SQLException {
        String sql = "update studentinfo set stuNo=?,stuName=?,stuPassword=? where stuId=?";
        Object[] objects = {
                user.getStuNo(),
                user.getStuName(),
                user.getStuPassword(),
                user.getStuId()
        };
        DBUtil.update(sql, objects);
    }

    /**
     * 查询数据库中所有学生信息
     * @return
     * @throws SQLException
     */
    public List<Map<String, Object>> findAllStu() throws SQLException {
        String sql = "select * from studentinfo";
        return DBUtil.find(sql);
    }

    /**
     * 删除学生信息
     * @param stuId
     * @throws SQLException
     */
    public void delStu(String stuId) throws SQLException {
        String sql = "delete from studentinfo where stuId=?";
        int i = Integer.parseInt(stuId);
        DBUtil.update(sql, i);
    }

    /**
     * 添加教师
     * @param user
     * @throws SQLException
     */
    public void addTea(User user) throws SQLException {
        String sql = "insert into teacherinfo values(default,?,?,?)";
        Object[] objects = {
                user.getTeaNo(),
                user.getTeaName(),
                user.getTeaPassword()
        };
        DBUtil.update(sql, objects);
    }

    /**
     * 通过id查询数据库中所有教师信息
     * @param teaId
     * @return
     * @throws SQLException
     */
    public Map<String, Object> findByTeaId(int teaId) throws SQLException {
        String sql = "select * from teacherinfo where teaId=?";
        List<Map<String, Object>> maps = DBUtil.find(sql, teaId);
        return maps.get(0);
    }

    /**
     * 修改教师信息
     * @param user
     * @throws SQLException
     */
    public void updateTea(User user) throws SQLException {
        String sql = "update teacherinfo set teaNo=?,teaName=?,teaPassword=? where teaId=?";
        Object[] objects = {
                user.getTeaNo(),
                user.getTeaName(),
                user.getTeaPassword(),
                user.getTeaId()
        };
        DBUtil.update(sql, objects);
    }

    /**
     * 查询数据库中所有教师信息
     * @return
     * @throws SQLException
     */
    public List<Map<String, Object>> findAllTea() throws SQLException {
        String sql = "select * from teacherinfo";
        return DBUtil.find(sql);
    }

    /**
     * 删除教师信息
     * @param teaId
     * @throws SQLException
     */
    public void delTea(String teaId) throws SQLException {
        String sql = "delete from teacherinfo where teaId=?";
        int i = Integer.parseInt(teaId);
        DBUtil.update(sql, i);
    }

    /**
     * 批量删除教师信息
     * @param teaIds
     */
    public void delMoreTea(String[] teaIds) throws SQLException {
        if(teaIds.length>0){
            StringBuilder sql = new StringBuilder("delete from teacherinfo where id in(");
            Integer params[]=new Integer[teaIds.length];
            for(int i=0;i<teaIds.length;i++){
                params[i]=new Integer(teaIds[i]);
                if(i==teaIds.length-1){
                    sql.append("?)");
                }else{
                    sql.append("?,");
                }
            }
            DBUtil.update(sql.toString(),(Object[])params);
        }
    }

    /**
     * 批量删除学生信息
     * @param stuIds
     */
    public void delMoreStu(String[] stuIds) throws SQLException {
        if (stuIds.length>0){
            final StringBuilder sql = new StringBuilder("delete from studentinfo where in (");
            final Integer params[] = new Integer[stuIds.length];
            for (int i = 0; i < stuIds.length; i++) {
                params[i] =new Integer(stuIds[i]);
                if (i==stuIds.length-1){
                    sql.append("?)");
                }else {
                    sql.append("?,");
                }
            }
            DBUtil.update(sql.toString(), (Object[]) params);
        }
    }
}

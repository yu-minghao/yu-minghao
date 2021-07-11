package com.zcib.Utils;

import java.io.InputStream;
import java.sql.*;
import java.util.*;

/**
 * @author 
 * @date 2021年05月16日 16:54
 */
public class DBUtil {
    private static final String url;
    private static final String root;
    private static final String password;

    static {
        Properties prop = new Properties();
        InputStream in = DBUtil.class.getClassLoader().getResourceAsStream("db.properties");
        try {
            prop.load(in);
            String driver = prop.getProperty("driver");
            url = prop.getProperty("url");
            root = prop.getProperty("root");
            password = prop.getProperty("password");
            //1.加载数据库驱动
            Class.forName(driver);
        } catch (Exception e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    /**
     * 2.建立数据库连接
     *
     * @return
     * @throws SQLException
     */
    public static Connection getConn() throws SQLException {
        Connection conn = DriverManager.getConnection(url, root, password);
        return conn;
    }

    /**
     * 3.关闭数据库资源
     *
     * @param connection
     * @param preparedStatement
     * @param resultSet
     * @throws SQLException
     */
    public static void close(Connection connection, PreparedStatement preparedStatement, ResultSet resultSet) throws SQLException {

        if (resultSet != null) {
            resultSet.close();
        }
        if (preparedStatement != null) {
            preparedStatement.close();
        }
        if (connection != null) {
            connection.close();
        }
    }

    /**
     * 数据更新
     * @param sql
     * @param objects
     * @return
     * @throws SQLException
     */
    public static int update(String sql, Object... objects) throws SQLException {
        int flag=0;
        //1.连接数据库
        Connection conn = getConn();
        //2.创建PreparedStatement对象
        PreparedStatement pre = conn.prepareStatement(sql);
        //3.参数设置
        for (int i = 0; i < objects.length; i++) {
            pre.setObject(i + 1, objects[i]);
        }
        flag=pre.executeUpdate();
        //4.关闭连接
        close(conn, pre, null);
        return flag;
    }

    /**
     * 查询信息
     *
     * @param sql
     * @param objects
     * @return
     * @throws SQLException
     */
    public static List<Map<String, Object>> find(String sql, Object... objects) throws SQLException {
        //连接数据库
        Connection conn = getConn();
        PreparedStatement pre = conn.prepareStatement(sql);
        if (objects != null) {
            for (int i = 0; i < objects.length; i++) {
                pre.setObject(i + 1, objects[i]);
            }
        }
        ResultSet rs = pre.executeQuery();
        List<Map<String, Object>> list = RSToList(rs);
        close(conn, pre, rs);
        return list;
    }

    /**
     * 将一个ResultSet对象转换为一个List<Map<String,Object>>对象
     *
     * @param rs
     * @return
     * @throws SQLException
     */
    private static List<Map<String, Object>> RSToList(ResultSet rs) throws SQLException {
        List<Map<String, Object>> list = new ArrayList<>();
        ResultSetMetaData metaData = rs.getMetaData();//获取表结构
        while (rs.next()) {
            //创建一个Map对象
            Map<String, Object> map = new HashMap<String, Object>();
            for (int i = 1; i <= metaData.getColumnCount(); i++) {
                //表的字段名（metaData.getColumnName(i)为key，对应的值为value）
                map.put(metaData.getColumnName(i).toLowerCase(), rs.getObject(i));
            }
            list.add(map);//将该学生的信息添加到list中
        }
        return list;
    }

    /**
     * 查询学生信息是否正确
     *
     * @param username
     * @param password
     * @return
     * @throws SQLException
     */
    public Map<String, String> validateStudent(String username, String password) throws SQLException {
        Map<String, String> record = null;
        Connection conn = getConn();
        String sql = "select * from studentinfo where stuName='" + username + "'and stuPassword='" + password + "'";
        PreparedStatement pre = conn.prepareStatement(sql);
        ResultSet rs = pre.executeQuery(sql);
        //把查询到的数据转化成List<Map<String,String>>
        List<Map<String, String>> data = getHashMap(rs);
        if (data.size() > 0) {
            record = data.get(0);
        }
        close(conn, pre, rs);
        return record;
    }

    /**
     * 查询教师信息是否正确
     *
     * @param username
     * @param password
     * @return
     * @throws SQLException
     */
    public Map<String, String> validateTeacher(String username, String password) throws SQLException {
        Map<String, String> record = null;
        Connection conn = getConn();
        String sql = "select * from teacherinfo where teaName='" + username + "'and teaPassword='" + password + "'";
        PreparedStatement pre = conn.prepareStatement(sql);
        ResultSet rs = pre.executeQuery(sql);
        List<Map<String, String>> data = getHashMap(rs);
        if (data.size() > 0) {
            record = data.get(0);
        }
        close(conn, pre, rs);
        return record;
    }

    /**
     * 查询教务人员信息是否正确
     *
     * @param username
     * @param password
     * @return
     * @throws SQLException
     */
    public Map<String, String> validateAdmin(String username, String password) throws SQLException {
        Map<String, String> record = null;
        Connection conn = getConn();
        String sql = "select * from admin where adName='" + username + "'and adPassword='" + password + "'";
        PreparedStatement pre = conn.prepareStatement(sql);
        ResultSet rs = pre.executeQuery(sql);
        List<Map<String, String>> data = getHashMap(rs);
        if (data.size() > 0) {
            record = data.get(0);
        }
        close(conn, pre, rs);
        return record;
    }

    /**
     * 将一个ResultSet对象转换为一个List<Map<String,String>>对象
     *
     * @param rs
     * @return
     * @throws SQLException
     */
    private List<Map<String, String>> getHashMap(ResultSet rs) throws SQLException {
        List<Map<String, String>> dataTable = new ArrayList<Map<String, String>>();
        ResultSetMetaData rsmd = rs.getMetaData();

        while (rs.next()) {
            Map<String, String> item = new HashMap<String, String>();
            for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                if (rsmd.getColumnTypeName(i).equals("CLOB")) {
                    Clob colClob = rs.getClob(i);
                    if (colClob == null) {
                        putToHash(item, rsmd.getColumnName(i).toLowerCase(), "");
                    } else {
                        putToHash(item, rsmd.getColumnName(i).toLowerCase(), getClobToString(rs.getClob(i)));
                    }
                } else {
                    putToHash(item, rsmd.getColumnName(i).toLowerCase(), rs.getString(i));
                }
            }
            dataTable.add(item);
        }
        return dataTable;
    }

    /**
     * @param item
     * @param key
     * @param value
     */
    private static void putToHash(Map<String, String> item, String key, String value) {
        if (value != null) {
            item.put(key, value);
        }
    }

    /**
     * @param clob
     * @return
     * @throws SQLException
     */
    private static String getClobToString(Clob clob) throws SQLException {
        return clob.getSubString(((long) 1), ((int) (clob.length())));
    }


}

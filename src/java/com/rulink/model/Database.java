/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rulink.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Computer
 */
public class Database {

    private Connection connect;

    public Database() {
        try {
            Class.forName(DatabaseInfo.DRIVER);

            connect = DriverManager.getConnection(
                    DatabaseInfo.URL,
                    DatabaseInfo.USER,
                    DatabaseInfo.PASSWORD);
        } catch (Exception e) {
            throw new RuntimeException(e);

        }
    }

    public Map<String, Object> querySingle(String sql, Object... args) {
        try {
            PreparedStatement pstmt = connect.prepareStatement(sql);

            for (int i = 0; i < args.length; i++) {
                pstmt.setObject(i + 1, args[i]);
            }

            ResultSet rs = pstmt.executeQuery();
            ResultSetMetaData md = rs.getMetaData();

            if (rs.next()) {
                Map<String, Object> map = new HashMap<String, Object>();

                for (int i = 1; i <= md.getColumnCount(); i++) {
                    map.put(md.getColumnLabel(i), rs.getObject(i));
                }
                rs.close();
                pstmt.close();
                return map;
            } else {
                return null;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public Map<String, Object> querySingleId(String sql, Object... args) {
        try {

            PreparedStatement pstmt = connect.prepareStatement(sql);

            for (int i = 0; i < args.length; i++) {
                pstmt.setObject(i + 1, args[i]);
            }

            ResultSet rs = pstmt.executeQuery();
            ResultSetMetaData md = rs.getMetaData();

            if (rs.next()) {
                Map<String, Object> map = new HashMap<String, Object>();

                for (int i = 1; i <= md.getColumnCount(); i++) {
                    map.put(md.getColumnLabel(i), rs.getObject(i));
                }

                return map;
            } else {
                return null;
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public List<Map<String, Object>> queryList(String sql, Object... args) {
        try {
            List<Map<String, Object>> list
                    = new ArrayList<Map<String, Object>>();

            PreparedStatement pstmt = connect.prepareStatement(sql);

            for (int i = 0; i < args.length; i++) {
                pstmt.setObject(i + 1, args[i]);
            }

            ResultSet rs = pstmt.executeQuery();
            ResultSetMetaData md = rs.getMetaData();

            while (rs.next()) {
                Map<String, Object> map = new HashMap<String, Object>();

                for (int i = 1; i <= md.getColumnCount(); i++) {
                    map.put(md.getColumnLabel(i), rs.getObject(i));
                }

                list.add(map);
            }

            return list;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public int queryCountId(String sql, Object... args) {
        try {
            PreparedStatement pstmt = connect.prepareStatement(sql);

            for (int i = 0; i < args.length; i++) {
                pstmt.setObject(i + 1, args[i]);
            }

            pstmt.executeUpdate();

            ResultSet rs = pstmt.getResultSet();
            rs.next();
            int chkC = rs.getInt(1);

            rs.close();
            pstmt.close();
            return chkC;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }//end of queryCountId

    public int add(String sql, Object... args) {
        try {
            PreparedStatement pstmt = connect.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            for (int i = 0; i < args.length; i++) {
                pstmt.setObject(i + 1, args[i]);
            }

            pstmt.executeUpdate();

            //  Find Auto Increment Id
            ResultSet rs = pstmt.getGeneratedKeys();

            rs.next();

            return rs.getInt(1);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    public int insertDB(String[] genCol, String sql, Object... args) {
        try {
            String generatedColumns[] = genCol;

            PreparedStatement pstmt = connect.prepareStatement(sql, generatedColumns);

            for (int i = 0; i < args.length; i++) {
                pstmt.setObject(i + 1, args[i]);
            }

            pstmt.executeUpdate();

            ResultSet rs = pstmt.getGeneratedKeys();

            rs.next();
            int generatedKey = rs.getInt(1);

            return generatedKey;

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }//end of method insertDB

    public int insertRc(String[] genCol, String sql, Object... args) {
        try {
            String generatedColumns[] = genCol;

            PreparedStatement pstmt = connect.prepareStatement(sql);

            for (int i = 0; i < args.length; i++) {
                pstmt.setObject(i + 1, args[i]);
            }

            int up = pstmt.executeUpdate();

            // rs.next();
            //  int generatedKey = rs.getInt(1);
            if (pstmt != null) {
                pstmt.close();
            }
            return up;

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }//end of method insertDB

    public int update(String sql, Object... args) {
        try {
            PreparedStatement pstmt = connect.prepareStatement(sql);

            for (int i = 0; i < args.length; i++) {
                pstmt.setObject(i + 1, args[i]);
            }

            int chkUpdate = pstmt.executeUpdate();
            pstmt.close();
            return chkUpdate;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public int delete(String sql, String id) {
        try {
            PreparedStatement pstmt = connect.prepareStatement(sql);
            pstmt.setString(1, id);
            int chkUpdate = pstmt.executeUpdate();
            pstmt.close();
            return chkUpdate;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public int remove(String sql, int id) {
        return update(sql, id);
    }

    public int removeKeys(String sql, String year, String semester, String sectionNo, String courseNo) {
        return update(sql, year, semester, sectionNo, courseNo);
    }

    public void beginTransaction() {
        try {
            connect.setAutoCommit(false);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void commit() {
        try {
            connect.commit();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }//end of commit

    public void rollback() {
        try {
            connect.rollback();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }//end of rollback

    public void close() {
        try {
            if (connect != null) {
                connect.close();
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }//end of close

    Map<String, Object> querySingle() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}

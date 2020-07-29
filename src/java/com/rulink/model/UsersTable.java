/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rulink.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import lombok.Data;

@Data
public class UsersTable {

    Database db;

    public UsersTable(Database db) {
        this.db = db;
    }

    // Call getter setter
    public Users setAltmodel(Map<String, Object> row) {
        if (row != null) {
            Users user = Users.builder()
                    ._id((Integer) row.get("id"))
                    .userName((String) row.get("username"))
                    .passWord((String) row.get("password"))
                    .facC((Integer) row.get("fac"))
                    .level_Status((Integer) row.get("level_status"))
                    .insert_Date((java.sql.Date) row.get("insert_date"))
                    .update_Date((java.sql.Date) row.get("update_date"))
                    .build();
            return user;
        } else {
            return null;
        }
    }

    public List<Users> findAll() {
        List<Users> list = new ArrayList<Users>();
        String sql = "SELECT * FROM users";
        List<Map<String, Object>> result = db.queryList(sql);

        for (Map<String, Object> row : result) {
            list.add(setAltmodel(row));
        }

        return list;
    }

    public Users findByUsername(String user) {

        String sql = "SELECT * FROM users WHERE username = ?";

        Map<String, Object> row = db.querySingle(sql, user);
        return setAltmodel(row);

    }

//    public boolean checkUserName(String x) {
//        String sql = "SELECT USER_NAME,USER_PASSWORD,FACULTY_NO,MAJOR_NO,"
//                + "TO_CHAR(INSERT_DATE, 'dd/mm/yyyy', 'NLS_CALENDAR=''THAI BUDDHA'' NLS_DATE_LANGUAGE=THAI')INSERT_DATE,PERIOD,PROGRAM_TYPE"
//                + " FROM XINT_STD_USERS WHERE USER_NAME = ?";
//        Map<String, Object> row = db.querySingle(sql, x);
//
//        try {
//            if (row != null) {
//                return true;
//            } else {
//                return false;
//            }
//        } catch (Exception e) {
//            return false;
//        }
//        // return setAltmodel(row);
//
//    }
//
    public boolean insert(Users obj, String dateNow) {
        // int colorNo = getColorNo();
        String sql = "INSERT INTO users(username, password, fac, level_status, insert_date, update_date) VALUES (?,?,?,?,?,?)";

        String[] genCol = {"username"};
        int chk = db.insertRc(genCol, sql, obj.getUserName(), obj.getPassWord(), obj.getFacC(), obj.getLevel_Status(), dateNow, null);

        try {
            if (chk > 0) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            return false;
        }

    }//end of insert

    public Boolean update(Users obj, String insert_Date, String dateNow) {

        String sql = "UPDATE users SET username = ?, password = ?, fac = ?, level_status = ?, insert_date = ?, update_date = ? WHERE id = ?";

        int chkUpdate = db.update(sql, obj.getUserName(), obj.getPassWord(), obj.getFacC(), obj.getLevel_Status(), insert_Date, dateNow, obj.get_id());
        try {
            return chkUpdate > 0;

        } catch (Exception e) {
            return false;
        }

    }

    public Boolean delete(String iD) {

        String sql = "DELETE FROM users WHERE id = ?";

        int chkUpdate = db.delete(sql, iD);
        try {
            return chkUpdate > 0;

        } catch (Exception e) {
            return false;
        }

    }
}

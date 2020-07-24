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
                    .maJor((Integer) row.get("major"))
                    .facC((Integer) row.get("fac"))
                    .level_Status((Integer) row.get("level_status"))
                    .insert_Date((String) row.get("insert_date"))
                    .update_Date((String) row.get("update_date"))
                    // .telephone(null)
                    .build();
            return user;
        } else {
            return null;
        }
    }

    public List<Users> findAll() {
        List<Users> list = new ArrayList<Users>();
//        String sql = "SELECT id, link_name, link_tag, link_description, link_major, link_fac FROM overall_link";
        String sql = "SELECT id, username, password, fac, level_status FROM users";
        List<Map<String, Object>> result = db.queryList(sql);

        for (Map<String, Object> row : result) {
            list.add(setAltmodel(row));
        }

        return list;
    }

    public Users findByUsername(String user) {

        String sql = "SELECT id, username, password, fac, level_status FROM users WHERE username = ?";

        Map<String, Object> row = db.querySingle(sql, user);
        return setAltmodel(row);

    }
}

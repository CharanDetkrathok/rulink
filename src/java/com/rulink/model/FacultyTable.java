package com.rulink.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class FacultyTable {

    Database db;

    public FacultyTable(Database db) {
        this.db = db;
    }

    // Call getter setter
    public Faculty setAltmodel(Map<String, Object> row) {
        if (row != null) {
            Faculty fac = Faculty.builder()
                    .id_Fac((Integer) row.get("id"))
                    .fac_Name((String) row.get("fac_name"))
                    .fac_No((Integer) row.get("fac_no"))
                    .build();
            return fac;
        } else {
            return null;
        }
    }

    public List<Faculty> findAll() {
        List<Faculty> list = new ArrayList<Faculty>();
//        String sql = "SELECT id, link_name, link_tag, link_description, link_major, link_fac FROM overall_link";
        String sql = "SELECT * FROM faculty";
        List<Map<String, Object>> result = db.queryList(sql);

        for (Map<String, Object> row : result) {
            list.add(setAltmodel(row));
        }

        return list;
    }

    public Faculty findByFacultyId(int id) {
        String sql = "SELECT * FROM faculty WHERE id = ?";
        Map<String, Object> row = db.querySingle(sql, id);
        return setAltmodel(row);
    }
}

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
        String sql = "SELECT * FROM faculty";
        List<Map<String, Object>> result = db.queryList(sql);

        for (Map<String, Object> row : result) {
            list.add(setAltmodel(row));
        }

        return list;
    }

    public Faculty findByFacultyNo(int f_no) {
        String sql = "SELECT * FROM faculty WHERE fac_no = ?";
        Map<String, Object> row = db.querySingle(sql, f_no);
        return setAltmodel(row);
    }

    public Faculty findByFacultyName(String f_name) {
        String sql = "SELECT * FROM faculty WHERE fac_name = ?";
        Map<String, Object> row = db.querySingle(sql, f_name);
        return setAltmodel(row);
    }

    public Faculty findByFacultyId(int f_id) {
        String sql = "SELECT * FROM faculty WHERE id = ?";
        Map<String, Object> row = db.querySingle(sql, f_id);
        return setAltmodel(row);
    }

    public boolean insert(Faculty obj) {
        // int colorNo = getColorNo();
        String sql = "INSERT INTO faculty(fac_name,fac_no) VALUES (?,?)";

        String[] genCol = {"username"};
        int chk = db.insertRc(genCol, sql, obj.getFac_Name(), obj.getFac_No());

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

    public Boolean update(Faculty obj) {

        String sql = "UPDATE faculty SET fac_name = ?, fac_no = ? WHERE id = ?";

        int chkUpdate = db.update(sql, obj.getFac_Name(), obj.getFac_No(), obj.getId_Fac());
        try {
            return chkUpdate > 0;

        } catch (Exception e) {
            return false;
        }

    }

    public Boolean delete(String iD) {

        String sql = "DELETE FROM faculty WHERE id = ?";

        int chkUpdate = db.delete(sql, iD);
        try {
            return chkUpdate > 0;

        } catch (Exception e) {
            return false;
        }

    }

}

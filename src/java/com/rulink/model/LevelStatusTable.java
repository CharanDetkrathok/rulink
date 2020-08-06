package com.rulink.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class LevelStatusTable {

    Database db;

    public LevelStatusTable(Database db) {
        this.db = db;
    }

    // Call getter setter
    public LevelStatus setAltmodel(Map<String, Object> row) {
        if (row != null) {
            LevelStatus level = LevelStatus.builder()
                    .id_level((Integer) row.get("id"))
                    .level_Name((String) row.get("level_name"))
                    .level_No((Integer) row.get("level_no"))
                    .build();
            return level;
        } else {
            return null;
        }
    }

    public List<LevelStatus> findAll() {
        List<LevelStatus> list = new ArrayList<LevelStatus>();
        String sql = "SELECT * FROM level";
        List<Map<String, Object>> result = db.queryList(sql);

        for (Map<String, Object> row : result) {
            list.add(setAltmodel(row));
        }

        return list;
    }

    public LevelStatus findBylevelId(int id) {
        String sql = "SELECT * FROM level WHERE id = ?";
        Map<String, Object> row = db.querySingle(sql, id);
        return setAltmodel(row);
    }

    public LevelStatus findBylevelName(String name) {
        String sql = "SELECT * FROM level WHERE level_name = ?";
        Map<String, Object> row = db.querySingle(sql, name);
        return setAltmodel(row);
    }

    public LevelStatus findBylevelNo(int no) {
        String sql = "SELECT * FROM level WHERE level_no = ?";
        Map<String, Object> row = db.querySingle(sql, no);
        return setAltmodel(row);
    }

    public boolean insert(LevelStatus obj) {
        // int colorNo = getColorNo();
        String sql = "INSERT INTO level(level_name,level_no) VALUES (?,?)";

        String[] genCol = {"username"};
        int chk = db.insertRc(genCol, sql, obj.getLevel_Name(), obj.getLevel_No());

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

    public Boolean update(LevelStatus obj) {

        String sql = "UPDATE level SET level_name = ?, level_no = ? WHERE id = ?";

        int chkUpdate = db.update(sql, obj.getLevel_Name(), obj.getLevel_No(), obj.getId_level());
        try {
            return chkUpdate > 0;

        } catch (Exception e) {
            return false;
        }

    }

    public Boolean delete(String iD) {

        String sql = "DELETE FROM level WHERE id = ?";

        int chkUpdate = db.delete(sql, iD);
        try {
            return chkUpdate > 0;

        } catch (Exception e) {
            return false;
        }

    }
}

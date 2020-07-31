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
}

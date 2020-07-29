package com.rulink.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


public class OverallLinkTable {
    Database db;

    public OverallLinkTable(Database db) {
        this.db = db;
    }
    
    // Call getter setter
    public OverallLink setAltmodel(Map<String, Object> row) {
        if (row != null) {
            OverallLink all_link = OverallLink.builder()
                    .id_Link((Integer) row.get("id"))
                    .link_Name((String) row.get("link_name"))
                    .link_Tag((String) row.get("link_tag"))
                    .link_Description((String) row.get("link_description"))
                    .link_Fac((Integer) row.get("link_fac"))
                    .build();
            return all_link;
        } else {
            return null;
        }
    }

    public List<OverallLink> findAll() {
        List<OverallLink> list = new ArrayList<OverallLink>();
        String sql = "SELECT * FROM overall_link";
        List<Map<String, Object>> result = db.queryList(sql);

        for (Map<String, Object> row : result) {
            list.add(setAltmodel(row));
        }

        return list;
    }

    public OverallLink findByLinkName(String linkName) {

        String sql = "SELECT * FROM overall_link WHERE link_name = ?";

        Map<String, Object> row = db.querySingle(sql, linkName);
        return setAltmodel(row);

    }
}

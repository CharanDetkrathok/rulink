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
                    .link_Id((Integer) row.get("id"))
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

    public OverallLink findByLinkId(int id) {

        String sql = "SELECT * FROM overall_link WHERE id = ?";

        Map<String, Object> row = db.querySingle(sql, id);
        return setAltmodel(row);

    }

    public boolean insert(OverallLink obj) {
        // int colorNo = getColorNo();
        String sql = "INSERT INTO overall_link(link_name, link_tag, link_description, link_fac) VALUES (?,?,?,?)";

        String[] genCol = {"username"};
        int chk = db.insertRc(genCol, sql, obj.getLink_Name(), obj.getLink_Tag(), obj.getLink_Description(), obj.getLink_Fac());

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

    public Boolean update(OverallLink obj) {

        String sql = "UPDATE overall_link SET link_name = ?, link_tag = ?, link_description = ?, link_fac = ? WHERE id = ?";

        int chkUpdate = db.update(sql, obj.getLink_Name(), obj.getLink_Tag(), obj.getLink_Description(), obj.getLink_Fac(),obj.getLink_Id());
        try {
            return chkUpdate > 0;

        } catch (Exception e) {
            return false;
        }

    }

    public Boolean delete(String iD) {

        String sql = "DELETE FROM overall_link WHERE id = ?";

        int chkUpdate = db.delete(sql, iD);
        try {
            return chkUpdate > 0;

        } catch (Exception e) {
            return false;
        }

    }

}

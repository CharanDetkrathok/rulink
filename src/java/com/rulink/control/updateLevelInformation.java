package com.rulink.control;

import com.rulink.model.*;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class updateLevelInformation extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        Database db = new Database();
        LevelStatusTable getlevelTable = new LevelStatusTable(db);
        List<LevelStatus> levelAll = getlevelTable.findAll();

        if (request.getParameter("submit") != null) { // กดปุ่มบันทึกจะทำ Condition นี้

            String id = request.getParameter("_id_");
            String name = request.getParameter("level_Name");
            String no = request.getParameter("level_No");

            boolean checkDuplicateName = false;
            boolean checkDuplicateNo = false;

            if ((name != "") && (no != "")) {

                for (int i = 0; i < levelAll.size(); i++) { // loop เพื่อ check ในฐานข้อมูลทั้งหมดว่ามีข้อมูลซ้ำหรือไม่

                    if (!levelAll.get(i).getId_level().equals(Integer.valueOf(id))) { // ตรวจสอบข้อมูลทุกตัว ยกเว้น id ตัวเอง

                        if (levelAll.get(i).getLevel_Name().equals(name)) { // ถ้าข้อมูลมีอยู่แล้วให้ checkDuplicateName = true; ชื่อสังกัดซ้ำ
                            checkDuplicateName = true;
                            System.out.println(checkDuplicateName);
                            System.out.println(i);
                        }
                        if (levelAll.get(i).getLevel_No().equals(Integer.valueOf(no))) { // ถ้าข้อมูลมีอยู่แล้วให้ checkDuplicateNo = true; รหัสสังกัดซ้ำ
                            checkDuplicateNo = true;
                            System.out.println(checkDuplicateNo);
                            System.out.println(i);
                        }
                    }

                }

                LevelStatus level = getlevelTable.findBylevelId(Integer.valueOf(id));

                if (checkDuplicateName) { // กรณีชื่อมีอยู่ใน database อยู่แล้ว

                    if (checkDuplicateNo) { // กรณีชื่อ และรหัสสังกัด(คณะ)(ซ้ำ) มีอยู่ใน database อยู่แล้ว ทั้งสองอย่างเข้า Condition นี้

                        request.setAttribute("DUPLICATE_NUMBER_ERROR", true);

                    }

                    request.setAttribute("level", level);
                    request.setAttribute("DUPLICATE_NAME_ERROR", true);
                    RequestDispatcher rs = request.getRequestDispatcher("Views/edit-level-information.jsp");
                    rs.forward(request, response);

                } else if (checkDuplicateNo) { // กรณีรหัสสังกัด(คณะ)(ซ้ำ) มีอยู่ใน database อยู่แล้ว แต่ชื่อไม่ซ้ำ

                    request.setAttribute("level", level);
                    request.setAttribute("DUPLICATE_NUMBER_ERROR", true);
                    RequestDispatcher rs = request.getRequestDispatcher("Views/edit-level-information.jsp");
                    rs.forward(request, response);

                } else {

                    LevelStatus levelultyUpdate = new LevelStatus();
                    levelultyUpdate.setId_Fac(Integer.parseInt(id));
                    levelultyUpdate.setFac_Name(name);
                    levelultyUpdate.setFac_No(Integer.parseInt(no));

                    boolean updateLevelStatus = getlevelTable.update(levelultyUpdate);

                    if (updateLevelStatus == true) {

                        RequestDispatcher rs = request.getRequestDispatcher("levelManagement");
                        rs.forward(request, response);

                    } else {

                        System.out.println("มีบางอย่างผิดพลาด");

                    }

                }

                db.close();

            } else {

                // เมื่อกดปุ่ม บันทึก เพื่อเพิ่มข้อมูลลิ้งค์ ตรวจสอบว่าข้อมูลมีครบทุก fields หรือไม่ ถ้าไม่ใช่ กลับไปกรอกใหม่
                // ***Condition นี้จะทำงานกรณีที่ required="true" ไม่ทำงานใน input tag <input name="xxx" required="true">***
                // ***required="true" คือคำสั่งการบังคับว่าต้องมีข้อมูลในกล่อง ถ้าไม่มีจะไม่ยอมให้กดปุ่ม submit ผ่าน***
                request.setAttribute("LEVEL_MESSAGE_ERROR", "error message");
                RequestDispatcher rs = request.getRequestDispatcher("Views/edit-level-information.jsp");
                rs.forward(request, response);
            }

        } else { // หน้าแรกของการเพิ่มข้อมูล

            String id = request.getParameter("levelID");
            LevelStatus level = getlevelTable.findByLevelStatusId(Integer.valueOf(id));

            request.setAttribute("level", level);
            RequestDispatcher rs = request.getRequestDispatcher("Views/edit-level-information.jsp");
            rs.forward(request, response);

        }

        db.close();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

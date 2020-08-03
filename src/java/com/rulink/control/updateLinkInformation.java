package com.rulink.control;

import com.rulink.model.*;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class updateLinkInformation extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        Database db = new Database();

        OverallLinkTable getOverallLink = new OverallLinkTable(db);

        if (request.getParameter("linkID") != null) { // กรณีกดปุ่ม แก้ไข จาก Views/link-management.jsp จะส่ง ID มาเพื่อค้นข้อมูลนำไปแก้ไข

            String linkID = request.getParameter("linkID");

            OverallLink link = getOverallLink.findByLinkId(Integer.parseInt(linkID));

            FacultyTable getFac = new FacultyTable(db);
            List<Faculty> fac = getFac.findAll();

            request.setAttribute("link", link);
            request.setAttribute("fac", fac);
            RequestDispatcher rs = request.getRequestDispatcher("Views/edit-link-information.jsp");
            rs.forward(request, response);

        } else if (request.getParameter("submit") != null) {

            String link_Id = request.getParameter("_id_");
            String link_Name = request.getParameter("link_name");
            String link_Tag = request.getParameter("link_tag");
            String link_Fac = request.getParameter("link_fac");
            String link_Description = request.getParameter("link_description");

            if ((link_Id != "") && (link_Name != "") && (link_Tag != "") && (link_Fac != "") && (link_Description != "")) {
                OverallLink linkUpdate = new OverallLink();
                linkUpdate.setLink_Id(Integer.valueOf(link_Id));
                linkUpdate.setLink_Name(link_Name);
                linkUpdate.setLink_Tag(link_Tag);
                linkUpdate.setLink_Description(link_Description);
                linkUpdate.setLink_Fac(Integer.parseInt(link_Fac));

                boolean updateLink = getOverallLink.update(linkUpdate);
                if (updateLink == true) {

                    RequestDispatcher rs = request.getRequestDispatcher("linkManagement");
                    rs.forward(request, response);
                    System.out.println("บันทึกแล้ว");

                } else {

                    System.out.println("มีบางอย่างผิดพลาด");

                }
            } else if (request.getAttribute("EDIT_LINK_ERROR") == "0") { // กรณีที่กรอกข้อมูลไม่ครบจะเข้ามาทำงาน if นี้เพื่อขึ้นตัวหนังสือสีแดงเตือน 

                OverallLink link = getOverallLink.findByLinkId(Integer.parseInt(link_Id));

                FacultyTable getFac = new FacultyTable(db);
                List<Faculty> fac = getFac.findAll();

                request.setAttribute("link", link);
                request.setAttribute("fac", fac);
                request.setAttribute("EDIT_LINK_ERROR", "message error");
                RequestDispatcher rs = request.getRequestDispatcher("Views/edit-link-information.jsp");
                rs.forward(request, response);

            } else { // เมื่อกรอกข้อมูลไม่ครบ จะเข้ามาทำงานที่นี่เพื่อ set EDIT_LINK_ERROR และจะเรียก class นี้อีกรอบ และจะเข้า else if (request.getAttribute("EDIT_LINK_ERROR") == "0") ด้านบน
                
                request.setAttribute("EDIT_LINK_ERROR", "0"); // กรอกข้อมูลไม่ครบ กรอกใหม่ 
                RequestDispatcher rs = request.getRequestDispatcher("updateLinkInformation");
                rs.forward(request, response);
            }

        } else {
            System.out.println("test");
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

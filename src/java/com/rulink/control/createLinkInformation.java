package com.rulink.control;

import com.rulink.model.*;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class createLinkInformation extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        Database db = new Database();

        OverallLinkTable getLink = new OverallLinkTable(db);
        List<OverallLink> link = getLink.findAll();

        if (request.getParameter("submit") != null) { // เมื่อกดปุ่ม บันทึก เพื่อเพิ่มข้อมูลลิ้งค์ ตรวจสอบว่าข้อมูลมีครบทุก fields หรือไม่ ถ้าใช่ ทำการบันทึก 

            String link_Name = request.getParameter("link_name");
            String link_Tag = request.getParameter("link_tag");
            String link_Fac = request.getParameter("link_fac");
            String link_Description = request.getParameter("link_description");

            if ((link_Name != "") && (link_Tag != "") && (link_Description != "")) {

                OverallLink linkInsert = new OverallLink();
                linkInsert.setLink_Name(link_Name);
                linkInsert.setLink_Tag(link_Tag);
                linkInsert.setLink_Fac(Integer.parseInt(link_Fac));
                linkInsert.setLink_Description(link_Description);

                boolean insertLink = getLink.insert(linkInsert);

                if (insertLink == true) {

                    RequestDispatcher rs = request.getRequestDispatcher("linkManagement");
                    rs.forward(request, response);

                } else {

                    System.out.println("มีบางอย่างผิดพลาด");

                }

            } else {

                // เมื่อกดปุ่ม บันทึก เพื่อเพิ่มข้อมูลลิ้งค์ ตรวจสอบว่าข้อมูลมีครบทุก fields หรือไม่ ถ้าไม่ใช่ กลับไปกรอกใหม่
                // ***Condition นี้จะทำงานกรณีที่ required="true" ไม่ทำงานใน input tag <input name="xxx" required="true">***
                // ***required="true" คือคำสั่งการบังคับว่าต้องมีข้อมูลในกล่อง ถ้าไม่มีจะไม่ยอมให้กดปุ่ม submit ผ่าน***
                FacultyTable getFac = new FacultyTable(db);
                List<Faculty> fac = getFac.findAll();

                // เอาข้อมูลที่กรอกมาบางช่อง แต่ไม่ครบไปเติมที่ช่องเดิม
                OverallLink link_up = new OverallLink();
                link_up.setLink_Name(link_Name);
                link_up.setLink_Tag(link_Tag);
                link_up.setLink_Description(link_Description);
                link_up.setLink_Fac(Integer.parseInt(link_Fac));

                request.setAttribute("link", link_up);
                request.setAttribute("fac", fac);
                request.setAttribute("LINK_MESSAGE_ERROR", "false");
                RequestDispatcher rs = request.getRequestDispatcher("Views/create-link-information.jsp");
                rs.forward(request, response);

                db.close();

            }

        } else {
            // หน้าแรกการบันทึก

            FacultyTable getFac = new FacultyTable(db);
            List<Faculty> fac = getFac.findAll();

            request.setAttribute("fac", fac);

            RequestDispatcher rs = request.getRequestDispatcher("Views/create-link-information.jsp");
            rs.forward(request, response);

            db.close();

        }
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

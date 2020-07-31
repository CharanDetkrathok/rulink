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

        if (request.getParameter("link_name") != "" && request.getParameter("link_name") != "" ) { // เมื่อกดปุ่ม บันทึก เพื่อเพิ่มข้อมูลลิ้งค์ ตรวจสอบว่าข้อมูลมีครบทุก fields หรือไม่ ถ้าใช่ ทำการบันทึก

            String link_Name = request.getParameter("link_name");
            String link_Tag = request.getParameter("link_tag");
            String link_Fac = request.getParameter("link_fac");
            String link_Description = request.getParameter("link_description");

            System.out.println("name :"+link_Name);
            System.out.println("tag :"+link_Tag);
            System.out.println("fac :"+link_Fac);
            System.out.println("description :"+link_Description);

            db.close();

        } else {

            FacultyTable getFac = new FacultyTable(db);
            List<Faculty> fac = getFac.findAll();

            request.setAttribute("link", link);
            request.setAttribute("fac", fac);
            request.setAttribute("link_create_error", "false");
            RequestDispatcher rs = request.getRequestDispatcher("Views/create-link-information.jsp");
            rs.forward(request, response);

            System.out.println("yyyyy");
            db.close();
        }
//        } else {
//            
//            FacultyTable getFac = new FacultyTable(db);
//            List<Faculty> fac = getFac.findAll();
//
//            request.setAttribute("link", link);
//            request.setAttribute("fac", fac);
//
//            RequestDispatcher rs = request.getRequestDispatcher("Views/create-link-information.jsp");
//            rs.forward(request, response);
//            db.close();
//        }
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

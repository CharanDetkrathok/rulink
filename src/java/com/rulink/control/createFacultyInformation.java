package com.rulink.control;

import com.rulink.model.*;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class createFacultyInformation extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        if (request.getParameter("submit") != null) { // กดปุ่มบันทึกจะทำ Condition นี้

            String name = request.getParameter("fac_name");
            String no = request.getParameter("fac_no");

            if ((name != "") && (no != "")) {

                Database db = new Database();
                FacultyTable getFacTable = new FacultyTable(db);
                Faculty facName = getFacTable.findByFacultyName(name);
                Faculty facNo = getFacTable.findByFacultyNo(Integer.parseInt(no));

                if (facName != null) { // กรณีชื่อมีอยู่ใน database อยู่แล้ว

                    if (facNo != null) { // กรณีชื่อ และรหัสสังกัด(คณะ)(ซ้ำ) มีอยู่ใน database อยู่แล้ว ทั้งสองอย่างเข้า Condition นี้

                        request.setAttribute("DUPLICATE_NUMBER_ERROR", true);

                    }

                    request.setAttribute("facNo", facNo);
                    request.setAttribute("facName", facName);
                    request.setAttribute("DUPLICATE_NAME_ERROR", true);
                    RequestDispatcher rs = request.getRequestDispatcher("Views/create-faculty-information.jsp");
                    rs.forward(request, response);

                } else if (facNo != null) { // กรณีรหัสสังกัด(คณะ)(ซ้ำ) มีอยู่ใน database อยู่แล้ว แต่ชื่อไม่ซ้ำ

                    request.setAttribute("facNo", facNo);
                    request.setAttribute("facName", facName);
                    request.setAttribute("DUPLICATE_NUMBER_ERROR", true);
                    RequestDispatcher rs = request.getRequestDispatcher("Views/create-faculty-information.jsp");
                    rs.forward(request, response);

                } else {

                    Faculty facultyInsert = new Faculty();
                    facultyInsert.setFac_Name(name);
                    facultyInsert.setFac_No(Integer.parseInt(no));

                    boolean insertFaculty = getFacTable.insert(facultyInsert);

                    if (insertFaculty == true) {

                        RequestDispatcher rs = request.getRequestDispatcher("facultyManagement");
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
                request.setAttribute("FAC_MESSAGE_ERROR", "error message");
                RequestDispatcher rs = request.getRequestDispatcher("Views/create-faculty-information.jsp");
                rs.forward(request, response);
            }

        } else { // หน้าแรกของการเพิ่มข้อมูล

            RequestDispatcher rs = request.getRequestDispatcher("Views/create-faculty-information.jsp");
            rs.forward(request, response);

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

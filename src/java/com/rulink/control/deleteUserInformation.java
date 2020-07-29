package com.rulink.control;

import com.rulink.model.Database;
import com.rulink.model.Faculty;
import com.rulink.model.FacultyTable;
import com.rulink.model.LevelStatus;
import com.rulink.model.LevelStatusTable;
import com.rulink.model.Users;
import com.rulink.model.UsersTable;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class deleteUserInformation extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        //int id = Integer.parseInt(request.getParameter("userID"));
        String id = request.getParameter("userID");
        Database db = new Database();
        UsersTable getUser = new UsersTable(db);
        
        boolean deleteUserResult = getUser.delete(id);

        if (deleteUserResult != false) {
            request.setAttribute("delete_message", true);

            List<Users> user = getUser.findAll();

            LevelStatusTable getLevel = new LevelStatusTable(db);
            List<LevelStatus> level = getLevel.findAll();

            FacultyTable getFac = new FacultyTable(db);
            List<Faculty> fac = getFac.findAll();

            request.setAttribute("user", user);
            request.setAttribute("level", level);
            request.setAttribute("fac", fac);

            RequestDispatcher rs = request.getRequestDispatcher("Views/user-management.jsp");
            rs.forward(request, response);
            
        } else {
            System.out.println(deleteUserResult);
            //กรณีลบข้อมูลไม่สำเร็จ
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

package com.rulink.login;

import com.rulink.model.*;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lombok.*;

@Data
public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        //prepare paramiter
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Database db = new Database();
        UsersTable getUserTable = new UsersTable(db);

        Users getUser = getUserTable.findByUsername(username);

        if (getUser != null) {
            if (password.equals(getUser.getPassWord())) {
                HttpSession session = request.getSession();
                session.setAttribute("user", getUser);
                RequestDispatcher rs = request.getRequestDispatcher("Views/main.jsp");
                rs.forward(request, response);
            } else {
                request.setAttribute("err_message", "0"); // password ผิด
                request.setAttribute("username", username);
                request.setAttribute("password", password);
                RequestDispatcher rs = request.getRequestDispatcher("Views/login.jsp");
                rs.forward(request, response);
            }
        } else {
            request.setAttribute("err_message", "1");// ไม่มี user อยู่ในระบบ
            request.setAttribute("username", username);
            request.setAttribute("password", password);
            RequestDispatcher rs = request.getRequestDispatcher("Views/login.jsp");
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

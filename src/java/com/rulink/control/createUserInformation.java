package com.rulink.control;

import com.rulink.model.Database;
import com.rulink.model.Faculty;
import com.rulink.model.FacultyTable;
import com.rulink.model.LevelStatus;
import com.rulink.model.LevelStatusTable;
import com.rulink.model.Users;
import com.rulink.model.UsersTable;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class createUserInformation extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        if (request.getParameter("confirm_password") != null) {

            String userName = request.getParameter("username");
            String passWord = request.getParameter("password");
            String confirm_Password = request.getParameter("confirm_password");
            String fac = request.getParameter("fac");
            String level = request.getParameter("level");
            String insert_Date = request.getParameter("insert_date");

            if (confirm_Password.equalsIgnoreCase(passWord)) {

                Database db = new Database();

                UsersTable insertUser = new UsersTable(db);
                Users user = new Users();
                user.setUserName(userName);
                user.setPassWord(passWord);
                user.setFacC(Integer.parseInt(fac));
                user.setLevel_Status(Integer.parseInt(level));

                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date date = new java.util.Date();

                String dateNow = formatter.format(date);
                System.out.println(dateNow);

                boolean insertUserResult = insertUser.insert(user, dateNow);

                if (insertUserResult != false) {
                    request.setAttribute("create_user", true);

                    UsersTable getUser2 = new UsersTable(db);
                    List<Users> user2 = getUser2.findAll();

                    LevelStatusTable getLevel2 = new LevelStatusTable(db);
                    List<LevelStatus> level2 = getLevel2.findAll();

                    FacultyTable getFac2 = new FacultyTable(db);
                    List<Faculty> fac2 = getFac2.findAll();

                    request.setAttribute("user", user2);
                    request.setAttribute("level", level2);
                    request.setAttribute("fac", fac2);

                    RequestDispatcher rs = request.getRequestDispatcher("Views/user-management.jsp");
                    rs.forward(request, response);
                    db.close();
                } else {
                    System.out.println(insertUserResult);
                    //กรณีเพิ่มไขไม่สำเร็จ
                }
            } else {
                Database db = new Database();

                LevelStatusTable getLevel = new LevelStatusTable(db);
                List<LevelStatus> level_2 = getLevel.findAll();

                FacultyTable getFac = new FacultyTable(db);
                List<Faculty> fac_2 = getFac.findAll();

                request.setAttribute("level", level_2);
                request.setAttribute("fac", fac_2);
                request.setAttribute("error_confirm_password", "1");
                RequestDispatcher rs = request.getRequestDispatcher("Views/create-user-information.jsp");
                rs.forward(request, response);
                System.out.println("password ไม่ตรง");
                db.close();
            }

        } else {
            Database db = new Database();

            LevelStatusTable getLevel = new LevelStatusTable(db);
            List<LevelStatus> level = getLevel.findAll();

            FacultyTable getFac = new FacultyTable(db);
            List<Faculty> fac = getFac.findAll();

            request.setAttribute("create_user", true);
            request.setAttribute("level", level);
            request.setAttribute("fac", fac);
            RequestDispatcher rs = request.getRequestDispatcher("Views/create-user-information.jsp");
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

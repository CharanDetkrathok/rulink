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

public class updateUserInformation extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        if (request.getParameter("userName") != null) { // ถูกเรียกใช้จากการกดปุ่ม แก้ไขข้อมูล จาก user-management.jsp

            String username = request.getParameter("userName");

            Database db = new Database();

            UsersTable getUser = new UsersTable(db);
            Users user = getUser.findByUsername(username);

            LevelStatusTable getLevel = new LevelStatusTable(db);
            List<LevelStatus> level = getLevel.findAll();

            FacultyTable getFac = new FacultyTable(db);
            List<Faculty> fac = getFac.findAll();

            request.setAttribute("user", user);
            request.setAttribute("level", level);
            request.setAttribute("fac", fac);
            RequestDispatcher rs = request.getRequestDispatcher("Views/edit-user-information.jsp");
            rs.forward(request, response);

            db.close();
        } else if (request.getAttribute("userName") != null) {// แก้ไขข้อมูลไม่สำเร็จ (รหัสผ่าน กับ ยืนยันรหัสผ่าน ไม่ตรงกัน)

            String username = (String) request.getAttribute("userName");

            Database db = new Database();

            UsersTable getUser = new UsersTable(db);
            Users user = getUser.findByUsername(username);

            LevelStatusTable getLevel = new LevelStatusTable(db);
            List<LevelStatus> level = getLevel.findAll();

            FacultyTable getFac = new FacultyTable(db);
            List<Faculty> fac = getFac.findAll();

            request.setAttribute("user", user);
            request.setAttribute("level", level);
            request.setAttribute("fac", fac);
            request.setAttribute("error_confirm_password", "1");
            RequestDispatcher rs = request.getRequestDispatcher("Views/edit-user-information.jsp");
            rs.forward(request, response);

            db.close();
        } else { // จะถูกเรียกใช้เมื่อ ทำการกรอกข้อมมูลในหน้าแก้ไข และถูกกดปุ่มบันทึก การแก้ไขข้อมูล 

            String _id = request.getParameter("_id_");
            String userName = request.getParameter("username");
            String passWord = request.getParameter("password");
            String confirm_Password = request.getParameter("confirm_password");
            String fac = request.getParameter("fac");
            String level = request.getParameter("level");
            String insert_Date = request.getParameter("insert_date");

            if (confirm_Password.equalsIgnoreCase(passWord)) {

                Database db = new Database();

                UsersTable updateUser = new UsersTable(db);
                Users user = new Users();
                user.set_id(Integer.valueOf(_id));
                user.setUserName(userName);
                user.setPassWord(passWord);
                user.setFacC(Integer.parseInt(fac));
                user.setLevel_Status(Integer.parseInt(level));

                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date date = new java.util.Date();

                String dateNow = formatter.format(date);

                boolean updateUserResult = updateUser.update(user, insert_Date, dateNow);

                if (updateUserResult != false) {
                    
                    request.setAttribute("edit_user", true);
                    
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
                } else {
                    System.out.println(updateUserResult);
                    //กรณีแก้ไขไม่สำเร็จ
                }

                db.close();

            } else {

                request.setAttribute("userName", userName); // password ไม่ตรงกัน
                RequestDispatcher rs = request.getRequestDispatcher("updateUserInformation");
                rs.forward(request, response);
            }
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

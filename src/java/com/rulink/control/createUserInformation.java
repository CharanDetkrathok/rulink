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

        if (request.getParameter("submit") != null) {

            String userName = request.getParameter("username");
            String passWord = request.getParameter("password");
            String confirm_Password = request.getParameter("confirm_password");
            String fac = request.getParameter("fac");
            String level = request.getParameter("level");
            String insert_Date = request.getParameter("insert_date");

            Database db = new Database();

            UsersTable insertUser = new UsersTable(db);
            UsersTable getUser = new UsersTable(db);
            List<Users> userList = getUser.findAll();

            LevelStatusTable getLevel = new LevelStatusTable(db);
            List<LevelStatus> levelList = getLevel.findAll();

            FacultyTable getFac = new FacultyTable(db);
            List<Faculty> facList = getFac.findAll();

            Users user = new Users();
            user.setUserName(userName);
            user.setPassWord(passWord);
            user.setFacC(Integer.parseInt(fac));
            user.setLevel_Status(Integer.parseInt(level));

            // กรณีที่กรอกข้อมูลครบถ้วน จะทำการเก็บลง database
            if ((userName != "") && (passWord != "") && (confirm_Password != "") && (fac != "") && (level != "")) {

                if (confirm_Password.equalsIgnoreCase(passWord)) {

                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                    java.util.Date date = new java.util.Date();

                    String dateNow = formatter.format(date);

                    boolean insertUserResult = insertUser.insert(user, dateNow);

                    if (insertUserResult != false) { // insert ได้แล้วกลับไปที่หน้าการจัดการหลัก
                        
                        RequestDispatcher rs = request.getRequestDispatcher("userManagement");
                        rs.forward(request, response);

                    } else {
                        System.out.println(insertUserResult);
                        //กรณีเพิ่มไขไม่สำเร็จ
                    }
                } else { // กรณีที่ password และ confirm password ไม่ตรงกัน

                    request.setAttribute("user", user);
                    request.setAttribute("level", levelList);
                    request.setAttribute("fac", facList);
                    request.setAttribute("CONFIRM_PASSWORD_ERROR", "message error");
                    RequestDispatcher rs = request.getRequestDispatcher("Views/create-user-information.jsp");
                    rs.forward(request, response);
                    db.close();
                    
                }

            } else { // ข้อมูลไม่ครบ
                
                // ***Condition นี้จะทำงานกรณีที่ required="true" ไม่ทำงานใน input tag <input name="xxx" required="true">***
                // ***required="true" คือคำสั่งการบังคับว่าต้องมีข้อมูลในกล่อง ถ้าไม่มีจะไม่ยอมให้กดปุ่ม submit ผ่าน***
                
                request.setAttribute("user", user);
                request.setAttribute("level", levelList);
                request.setAttribute("fac", facList);
                request.setAttribute("MESSAGE_ERROR", "message error");
                RequestDispatcher rs = request.getRequestDispatcher("Views/create-user-information.jsp");
                rs.forward(request, response);
                db.close();
                
            }

        } else { // ถูกเรียกครั้งแรก
            System.out.println("ถูกเรียกครั้งแรก");
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

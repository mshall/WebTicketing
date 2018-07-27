/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author shimaa
 */
public class Login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException, InterruptedException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            Connect c = new Connect();
            Connection con = c.getConn();
            Statement stmt = con.createStatement();
            ResultSet result = stmt.executeQuery("SELECT `vendor-admin`.`UserName`, `vendor-admin`.`Password`,`vendor-admin`.tag FROM `vendor-admin`;");

            /* TODO output your page here. You may use following sample code. */
            String uname = request.getParameter("uname");
            String pass = request.getParameter("psw");

            HttpSession session = request.getSession();
            while (result.next()) {
                if (result.getString(1).equals(uname) && result.getString(2).equals(pass) && result.getString(3).equals("Admin")) {
                    con.close();
                    session.setAttribute("pass", pass);
                    session.setAttribute("Uname", uname);
                    response.sendRedirect("AdminHome.jsp");

                } else if (result.getString(1).equals(uname) && result.getString(2).equals(pass) && result.getString(3).equals("Tech")) {

                    session.setAttribute("pass", pass);
                    session.setAttribute("Uname", uname);
                    response.sendRedirect("TechnicalHome.jsp");
                } else {
//                     session.invalidate();
                        out.print("Sorry,DB details are wrong  username /password");
//                        response.wait(1);
//                     request.setAttribute("ErrorMessage", "Sorry,DB details are wrong  username /password");
//                    response.sendRedirect("Login.jsp");
                    }
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
        //processRequest(request, response);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InterruptedException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
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

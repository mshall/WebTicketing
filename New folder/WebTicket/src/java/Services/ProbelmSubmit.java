/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author shimaa
 */
public class ProbelmSubmit extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */

            Connect c = new Connect();
            Connection conn = c.getConn();

            String Tid = request.getParameter("TID");
            String Mid = request.getParameter("MID");
            String CP = request.getParameter("CP");
            String Mobile = request.getParameter("Mob");
            String PD = request.getParameter("PD");

            PreparedStatement st = conn.prepareStatement("select * from terminal WHERE `Terminal-id`=? ");
            st.setInt(1, Integer.parseInt(Tid));
            ResultSet result = st.executeQuery();
            if (result.wasNull()) {
                out.print("Terminal Not exists ");

            } else {
                PreparedStatement st1 = conn.prepareStatement("select * FROM merchant where `Merchant-id`=? ");
                st1.setInt(1, Integer.parseInt(Mid));
                ResultSet result2 = st.executeQuery();

                if (result2.wasNull()) {
                    out.print("Merchant id not correct ");

                } else {

                    PreparedStatement Prestmt = conn.prepareStatement("INSERT INTO problemassignment (`Problem-Details`, `merchant_Merchant-id`,`terminal_Terminal-id`,"
                            + "`ContactPerson`,`Mobile`) VALUES(?,?,?,?,?);");
                    Prestmt.setString(1, PD);
                    Prestmt.setInt(2, Integer.parseInt(Tid));
                    Prestmt.setInt(3, Integer.parseInt(Mid));
                    Prestmt.setString(4, CP);
                    Prestmt.setInt(5, Integer.parseInt(Mobile));
                    Prestmt.executeUpdate();
                    out.write("<p> <h1> your Problem is submitted to the system and we will replay as soon as possible  </h1></p> ");
                    response.wait(1);
                    response.sendRedirect("index.jsp");
                }
            }

        }

    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

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
            Logger.getLogger(ProbelmSubmit.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProbelmSubmit.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InterruptedException ex) {
            Logger.getLogger(ProbelmSubmit.class.getName()).log(Level.SEVERE, null, ex);
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

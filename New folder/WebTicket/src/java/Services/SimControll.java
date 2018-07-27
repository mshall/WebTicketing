/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
public class SimControll extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT = "addSIM.jsp";
    private static String LIST_USER = "SIM.jsp";
    private SimOp dao;

    public SimControll() throws SQLException, ClassNotFoundException {
        super();
     
    }
protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
            /* TODO output your page here. You may use following sample code. */
            HttpSession se = request.getSession();
            String name = (String) se.getAttribute("Uname");
            String pass = (String) se.getAttribute("pass");

            dao = new SimOp(name, pass);
        
}
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(TechnicalControll.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TechnicalControll.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String forward = "";
        String action = request.getParameter("action");
        try {
            if (action.equalsIgnoreCase("Store")) {
                int s = Integer.parseInt(request.getParameter("SID"));
                dao.StoreSim(s);
                forward = LIST_USER;
                request.setAttribute("users", dao.getAllSIMs());

            } else if (action.equalsIgnoreCase("listUser")) {

                forward = LIST_USER;
                request.setAttribute("users", dao.getAllSIMs());
 
            } else if (action.equalsIgnoreCase("Search")) {
                String uname = request.getParameter("search");
                forward = LIST_USER;
                request.setAttribute("users", dao.getSimByOp(uname));
            } else {
                forward = INSERT_OR_EDIT;
            }
        } catch (SQLException ex) {
            Logger.getLogger(MerchantControll.class.getName()).log(Level.SEVERE, null, ex);
        }
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
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
            Logger.getLogger(TechnicalControll.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TechnicalControll.class.getName()).log(Level.SEVERE, null, ex);
        }
        Sim s = new Sim();

        s.setOp(request.getParameter("operator"));
        s.setStatus(request.getParameter("Status"));
        s.setSerial(Integer.parseInt(request.getParameter("serial")));

        dao.addSim(s);

        RequestDispatcher view = request.getRequestDispatcher(LIST_USER);
        request.setAttribute("users", dao.getAllSIMs());
        view.forward(request, response);

    }

}

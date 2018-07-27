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
public class MerchantControll extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT = "addMerchant.jsp";
    private static String LIST_USER = "Merchant.jsp";
    private MerchantOp dao;
    private boolean flag = true;
    private int userId=0;

    public MerchantControll() throws SQLException, ClassNotFoundException {
        super();

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession se = request.getSession();
            String name = (String) se.getAttribute("Uname");
            String pass = (String) se.getAttribute("pass");

            dao = new MerchantOp(name, pass);
        }
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
            if (action.equalsIgnoreCase("delete")) {
                int userId = Integer.parseInt(request.getParameter("MID"));
                dao.DelMerchant(userId);
                forward = LIST_USER;
                request.setAttribute("users", dao.AllMerchant());

            } else if (action.equalsIgnoreCase("edit")) {
                forward = INSERT_OR_EDIT;
      
                 userId = Integer.parseInt(request.getParameter("MID"));
                Merchant user = dao.getUserById(userId);
                        flag=false;
                request.setAttribute("user", user);

            } else if (action.equalsIgnoreCase("listUser")) {

                forward = LIST_USER;
                request.setAttribute("users", dao.AllMerchant());

            } else if (action.equalsIgnoreCase("Search")) {
                String uname = request.getParameter("Search");
                forward = LIST_USER;
                request.setAttribute("users", dao.getUserByName(uname));
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

        Merchant merchant = new Merchant();
        merchant.setmName(request.getParameter("mName"));
        merchant.setMcp(request.getParameter("CP"));
        merchant.setPhone1(request.getParameter("p1"));
        merchant.setPhone2(request.getParameter("p2"));
        merchant.setMemail(request.getParameter("email"));
        merchant.setCity(request.getParameter("City"));
        merchant.setStreet(request.getParameter("st"));
        merchant.setAID(Integer.parseInt(request.getParameter("Ames")));
        merchant.setPID(Integer.parseInt(request.getParameter("pid")));
        merchant.setMCC(Integer.parseInt(request.getParameter("mcc")));
        merchant.setmClass(request.getParameter("Class"));
        merchant.setCurrancy(request.getParameter("Currency"));
        merchant.setmStatus(request.getParameter("Status"));

        try {
            if (flag) {

                dao.addMerchant(merchant);

            } else {

//                String userid = request.getParameter("ID");
                merchant.setMid(userId);
                
                dao.UpdateMerchant(merchant);

            }

            RequestDispatcher view = request.getRequestDispatcher(LIST_USER);
            request.setAttribute("users", dao.AllMerchant());
            view.forward(request, response);
            
        } catch (SQLException ex) {
            Logger.getLogger(MerchantControll.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}

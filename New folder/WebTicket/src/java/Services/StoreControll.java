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
public class StoreControll extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT = "addstore.jsp";
    private static String LIST_USER = "Store.jsp";
    private StoreOp dao;
    private boolean flag=true;
 public StoreControll() throws SQLException, ClassNotFoundException {
        super();
      
    }
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
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
       HttpSession se = request.getSession();
            String name = (String) se.getAttribute("Uname");
            String pass = (String) se.getAttribute("pass");

            dao = new StoreOp(name, pass);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(TechnicalControll.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String forward = "";
        String action = request.getParameter("action");
        try {
            if (action.equalsIgnoreCase("delete")) {
                int userId = Integer.parseInt(request.getParameter("SID"));
                dao.DelStore(userId);
                forward = LIST_USER;
                request.setAttribute("users", dao.AllStore());

            } else if (action.equalsIgnoreCase("edit")) {
                flag=false;
                forward = INSERT_OR_EDIT;
                int userId = Integer.parseInt(request.getParameter("SID"));
                Store user = dao.getUserById(userId);
                request.setAttribute("user", user);

            } else if (action.equalsIgnoreCase("listUser")) {

                forward = LIST_USER;
                request.setAttribute("users", dao.AllStore());

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
        Store user = new Store();
        String Name = request.getParameter("Sname");
        String CP = request.getParameter("CP");
        String Phone1 = request.getParameter("p1");
        String Phone2 = request.getParameter("p2");
        String city = request.getParameter("ct");
        String st = request.getParameter("st");
        String status = request.getParameter("Status");
        user.setName(Name);
        user.setCP(CP);
        user.setP1(Phone1);
        user.setP2(Phone2);
        user.setStatus(status);
        user.setCity(city);
        user.setStreet(st);

        
        String userid = request.getParameter("SID");
        try {
            if (flag) {

                dao.addStore(user);

            } else {
                user.setStore_id(Integer.parseInt(userid));
                dao.UpdateStore(user);
            }

            RequestDispatcher view = request.getRequestDispatcher(LIST_USER);
            request.setAttribute("users", dao.AllStore());
            view.forward(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(MerchantControll.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

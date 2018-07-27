/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
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
public class TechnicalControll extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT = "addTechnical.jsp";
    private static String LIST_USER = "Technical.jsp";
    private TechnicalOP dao;
private boolean  flag=true; // add 
    public TechnicalControll() throws SQLException, ClassNotFoundException {
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
            dao = new TechnicalOP(name, pass);
        }
    }

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
        //   processRequest(request, response);
        String forward = "";
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("delete")) {
            int userId = Integer.parseInt(request.getParameter("TechId"));
            dao.deleteTech(userId);
            forward = LIST_USER;
            request.setAttribute("users", dao.getAllTechs());

        } else if (action.equalsIgnoreCase("edit")) {
            forward = INSERT_OR_EDIT;
            int userId = Integer.parseInt(request.getParameter("TechId"));
            Technical user = dao.getUserById(userId);
            flag=false;
            request.setAttribute("user", user);

        } else if (action.equalsIgnoreCase("listUser")) {
            forward = LIST_USER;
            request.setAttribute("users", dao.getAllTechs());

        } else if (action.equalsIgnoreCase("Search")) {
            String uname = request.getParameter("search");
            forward = LIST_USER;
            request.setAttribute("users", dao.getUserByName(uname));
        } else {
            forward = INSERT_OR_EDIT;
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws IOException if an I/O error occurs
     * @throws ServletException if a servlet-specific error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Technical user = new Technical();
        user.setTname(request.getParameter("name"));
        user.setCP(request.getParameter("CP"));
        user.setPhone1(request.getParameter("Phone1"));
        user.setPhone2(request.getParameter("Phone2"));
        user.setEmail(request.getParameter("email"));
        user.setStreet(request.getParameter("Street"));
        user.setCity(request.getParameter("City"));
        user.setUserName(request.getParameter("uname"));
        user.setPassword(request.getParameter("pass1"));
        user.setStatus(request.getParameter("Status"));

        
        if (flag){
            
            dao.addTech(user);
        }
        else 
        {
             String userid = request.getParameter("ID");    
             user.setTechId(Integer.parseInt(userid));
            dao.updateTech(user);
        }
       
        RequestDispatcher view = request.getRequestDispatcher(LIST_USER);
        request.setAttribute("users", dao.getAllTechs());
        view.forward(request, response);
    }

}

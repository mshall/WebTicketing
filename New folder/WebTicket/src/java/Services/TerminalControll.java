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
public class TerminalControll extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT = "addTerminal.jsp";
    private static String LIST_Terminals = "Terminals.jsp";
    
    private TerminalOp dao;
    private boolean flag = true;
    

    public TerminalControll() throws SQLException, ClassNotFoundException {
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

            dao = new TerminalOp(name, pass);
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
        if (action.equalsIgnoreCase("store")) {
            try {
                int userId = Integer.parseInt(request.getParameter("TID"));
                dao.StoreTerminal(userId);
                forward = LIST_Terminals;
                request.setAttribute("users", dao.getAllTerminals());
            } catch (SQLException ex) {
                Logger.getLogger(TerminalControll.class.getName()).log(Level.SEVERE, null, ex);
            }      
        } else if (action.equalsIgnoreCase("edit")) {
            forward = INSERT_OR_EDIT;
            flag = false;
            int userId = Integer.parseInt(request.getParameter("TID"));
            Terminal user = dao.getTerminalById(userId);
            request.setAttribute("user", user);

        } else if (action.equalsIgnoreCase("ListTerminals")) {
            forward = LIST_Terminals;
            request.setAttribute("users", dao.getAllTerminals());

        } else if (action.equalsIgnoreCase("Search")) {
            int Tid = Integer.parseInt(request.getParameter("TID"));
            forward = LIST_Terminals;
            request.setAttribute("users", dao.getTerminalById(Tid));
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
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

            Terminal Ter = new Terminal();
            Ter.setModel(request.getParameter("Model"));
            Ter.setSerialNumber(Integer.parseInt(request.getParameter("Serial")));
            Ter.setTClass(request.getParameter("Class"));
            Ter.setCurrency(request.getParameter("Currency"));
            Ter.setStatus(request.getParameter("Status"));
            Ter.setMCC(Integer.parseInt(request.getParameter("mcc")));
            Ter.setCondition(request.getParameter("cond"));

            String[] feature = request.getParameterValues("Feature");

            Ter.setSale(Boolean.parseBoolean(feature[0]));
            Ter.setOnlineReturned(Boolean.parseBoolean(feature[1]));
            Ter.setOffLineReturned(Boolean.parseBoolean(feature[2]));
            Ter.setOfflineSale(Boolean.parseBoolean(feature[3]));
            Ter.setOnlineVoid(Boolean.parseBoolean(feature[4]));
            Ter.setOffLineVoid(Boolean.parseBoolean(feature[5]));
            Ter.setPreauth(Boolean.parseBoolean(feature[6]));
            Ter.setAmex(Boolean.parseBoolean(feature[7]));
            Ter.setInstatiment(Boolean.parseBoolean(feature[8]));
            Ter.setPrepainSerives(Boolean.parseBoolean(feature[9]));
            Ter.setDiners(Boolean.parseBoolean(feature[10]));
            Ter.setPermuim(Boolean.parseBoolean(feature[11]));

            Ter.setManualEntry(Boolean.parseBoolean(feature[12]));

            String userid = request.getParameter("TID");
            if (flag) {

                dao.addTerminal(Ter);

            } else {
                Ter.setTerminaL_id(Integer.parseInt(userid));
                dao.editTerminal(Ter);
            }
            RequestDispatcher view = request.getRequestDispatcher(LIST_Terminals);
            request.setAttribute("users", dao.getAllTerminals());
            view.forward(request, response);
        
    }

}

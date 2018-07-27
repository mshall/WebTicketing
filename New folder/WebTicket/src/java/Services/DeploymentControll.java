package Services;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
public class DeploymentControll extends HttpServlet {
private static final long serialVersionUID = 1L;
    private static String Deploy = "DeployToMerchant.jsp";
    private static String LIST_Terminals = "Deployment.jsp";
    private DeployOp dao;

    public DeploymentControll() {
        super();
    }

    /**
     *
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

            dao = new DeployOp();
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
            if (action.equalsIgnoreCase("Deploy")) {
                forward = Deploy;
                int userId = Integer.parseInt(request.getParameter("TID"));
                DepolyedTerminal user = dao.getTerminalById(userId);
                request.setAttribute("user", user);

            } else if (action.equalsIgnoreCase("listUser")) {
                forward = LIST_Terminals;
                request.setAttribute("users", dao.getAllTerminals());

            } else if (action.equalsIgnoreCase("Search")) {

                int Tid = Integer.parseInt(request.getParameter("TID"));
                forward = LIST_Terminals;
                request.setAttribute("users", dao.getTerminalById(Tid));

            }
            else if (action.equalsIgnoreCase("GetSim1")){
               String op = request.getParameter("sim1");
               forward = Deploy;
                request.setAttribute("serial", dao.GetSim(op));
                
                
            }
              else if (action.equalsIgnoreCase("GetSim2")){
               String op = request.getParameter("sim2");
               forward = Deploy;
                request.setAttribute("serial", dao.GetSim(op));
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(DeploymentControll.class.getName()).log(Level.SEVERE, null, ex);
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
        DepolyedTerminal Ter = new DepolyedTerminal();
//        Ter.getMID(request.getParameter("Model"));
//        Ter.setSerialNumber(Integer.parseInt(request.getParameter("Serial")));
//    Ter.setMID(Integer.parseInt(request.getParameter("MerchantID")));
//    Ter.setOp1();
//        String userid = request.getParameter("TID");
        
      
//        dao.deployTerminal(Ter);

       
//        RequestDispatcher view = request.getRequestDispatcher(LIST_Terminals);
//        request.setAttribute("users", dao.getAllTerminals());
//        view.forward(request, response);

    }

}

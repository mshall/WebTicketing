package Services;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author shimaa
 */
public class TotalStoreInfo extends HttpServlet {

    private Connection con;

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
            {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession se = request.getSession();
            String name = (String)se.getAttribute("Uname");
            String pass = (String)se.getAttribute("pass");
   
            Connect c = new Connect(name, pass);
            con = c.getConn();
            Statement stmt = con.createStatement();

            ResultSet result = stmt.executeQuery("select store.`store-name`, Count(terminal.`Terminal-id`), Count(sim.`SimSerial`)\n"
                    + "from terminal Join store Join sim GROUP by `store-name`;");
            String str = "<div class=\"table responsive \" ><table  border=\"1\"> <thead> <tr><th> Store-Name #</th><th>  Terminals # </th><th> SIM #</th> <th></th></tr></thead>";
            if (result.getFetchSize() != 0) {
                while (result.next()) {
                    str += "<tbody> <tr><td> " + result.getString(1) + "</td>";

                    str += "<td> " + result.getString(2) + "</td>";

                    str += "<td> " + result.getString(3) + "</td></tr></tbody>";

                }
                str += "</table></div>";
                out.write(str);
            } else {
                str = "NO Available Stores";
                out.write(str);
            }

        } catch (IOException ex) {
        
            Logger.getLogger(TotalStoreInfo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(TotalStoreInfo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(TotalStoreInfo.class.getName()).log(Level.SEVERE, null, ex);
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

}

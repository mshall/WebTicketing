package Services;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author shimaa
 */
public class Connect {

    public Connection Con;

    public Connect() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web-tk", "root", "root");

    }

    public Connect(String uname, String pass) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web-tk", "root", "root");
    }

    public Connection getConn() throws SQLException, ClassNotFoundException {
        return Con;
    }

}

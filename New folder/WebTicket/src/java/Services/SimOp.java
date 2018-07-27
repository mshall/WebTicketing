/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author shimaa
 */
public class SimOp {

    Connection con;

    public SimOp(String name, String pass) throws SQLException, ClassNotFoundException {
        Connect c = new Connect(name, pass);
        con = c.getConn();

    }

    public void addSim(Sim s) {
        try {
            // Parameters start with 1
            PreparedStatement Prestmt = con.prepareStatement("INSERT INTO sim(`SimSerial`,operator,`SimStatus`) VALUES(?,?,?)");

            Prestmt.setInt(1, s.getSerial());
            Prestmt.setString(2, s.getOp());
            Prestmt.setString(3, s.getStatus());

            Prestmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void StoreSim(int serial) throws SQLException {

        PreparedStatement Prestmt = con.prepareStatement("UPDATE sim set `SimStatus`='Stored' where `SimSerial`=?");
        Prestmt.setInt(1, serial);

        Prestmt.executeUpdate();

    }

    public List<Sim> getAllSIMs() {
        List<Sim> Sims = new ArrayList<Sim>();
        try {
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * from sim;");
            while (rs.next()) {
                Sim s = new Sim();
                s.setSid(rs.getInt(1));
                s.setSerial(rs.getInt(1));
                s.setOp(rs.getString(2));
                s.setStatus(rs.getString(3));
                s.setStoreid(rs.getInt(5));
                s.setMid(rs.getInt(6));
                s.setTid(rs.getInt(7));

                Sims.add(s);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return Sims;
    }

    public List<Sim> getSimByOp(String op) {
        List<Sim> Sims = new ArrayList<Sim>();

        try {
            PreparedStatement preparedStatement = con.
                    prepareStatement("SELECT  * from sim "
                            + "where sim.operator like '%?%'");
            preparedStatement.setString(0, op);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Sim s = new Sim();
             s.setSid(rs.getInt(1));
                s.setSerial(rs.getInt(2));
                s.setOp(rs.getString(3));
                s.setStatus(rs.getString(4));
                s.setStoreid(rs.getInt(5));
                s.setMid(rs.getInt(6));
                s.setTid(rs.getInt(7));
                Sims.add(s);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return Sims;
    }

}

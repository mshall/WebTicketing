package Services;

import Services.Terminal;
import Services.Connect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author shimaa
 */
public class DeployOp {

    private Connection con;

    public DeployOp(String name, String pass) throws SQLException, ClassNotFoundException {

//        Connect c = new Connect();
//        con = c.getConn();

    }

    DeployOp() throws SQLException, ClassNotFoundException {
        Connect c = new Connect();
        con = c.getConn();
    }

    public void deployTerminal(DepolyedTerminal ter) {
        try {
            // Parameters start with 1
            PreparedStatement Prestmt = con.prepareStatement("UPDATE terminal set `merchant_Merchant-id`=? where `Terminal-id`=?");
            Prestmt.setInt(1, ter.getMID());
            Prestmt.setInt(2, ter.getTID());

            Prestmt.executeUpdate();

            PreparedStatement Prestmt2 = con.prepareStatement("UPDATE sim set sim.`terminal_Terminal-id`=? where sim.`SimSerial`=?");
            Prestmt2.setInt(1, ter.getTID());
            Prestmt2.setInt(2, ter.getSim1());
            Prestmt2.executeUpdate();

            PreparedStatement Prestmt3 = con.prepareStatement("UPDATE sim set sim.`terminal_Terminal-id`=? where sim.`SimSerial`=?");
            Prestmt3.setInt(1, ter.getTID());
            Prestmt3.setInt(2, ter.getSim2());
            Prestmt3.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public DepolyedTerminal getTerminalById(int Tid) throws SQLException {
        PreparedStatement preparedStatement = con.
                prepareStatement("SELECT terminal.`Terminal-id`,terminal.`SerialNumber`,terminal.`merchant_Merchant-id` FROM  terminal "
                        + "Where terminal.`Terminal-id`=?");
        preparedStatement.setInt(1, Tid);
        ResultSet rs = preparedStatement.executeQuery();

        DepolyedTerminal ter = new DepolyedTerminal();
        if (rs.next()) {

            ter.setTID(rs.getInt(1));
            ter.setTerSerial(rs.getInt(2));
            ter.setMID(rs.getInt(3));
//            ter.setMerchant(rs.getString(4));

        }

        return ter;
    }

    public List<DepolyedTerminal> getAllTerminals() {
        List<DepolyedTerminal> Terminals = new ArrayList<DepolyedTerminal>();
        try {
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("SELECT terminal.`Terminal-id`,terminal.`SerialNumber`,terminal.`merchant_Merchant-id` FROM  terminal");

            while (rs.next()) {
//                PreparedStatement r = con.prepareStatement("SELECT terminal.`Terminal-id`,sim.operator, sim.`SimSerial`\n"
//                        + "FROM terminal join sim on sim.`terminal_Terminal-id`=terminal.`Terminal-id` and terminal.`Terminal-id`=?;");
//                r.setInt(1, rs.getInt(1));
//                ResultSet sim = r.executeQuery();

                DepolyedTerminal ter = new DepolyedTerminal();
                ter.setTID(rs.getInt(1));
                ter.setTerSerial(rs.getInt(2));
                ter.setMID(rs.getInt(3));
//                ter.setMerchant("dhdhd");

//                if (sim.first()) {
//                    ter.setOp1("V");
//                    ter.setSim1(787979797);
//
//                } else if (sim.last()) {
//                    ter.setOp2("O");
//                    ter.setSim2(646696);
//                }

                Terminals.add(ter);
            }
        } catch (SQLException e) {
        }

        return Terminals;
    }

    public List<Integer> GetSim(String op) throws SQLException {
        String q = "SELECT sim.`SimSerial` from sim where sim.operator like '%?%' ";
        PreparedStatement pre = con.prepareStatement(q);
        pre.setString(1, op);
        ResultSet rs = pre.executeQuery();
         List<Integer> s= new ArrayList<Integer>();
        
        
        while (rs.next()) {
                s.add(rs.getInt(1));
        }
        return s;
    }
}

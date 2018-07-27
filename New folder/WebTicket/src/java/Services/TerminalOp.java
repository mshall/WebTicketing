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
public class TerminalOp {

    private Connection con;

    public TerminalOp(String name, String pass) throws SQLException, ClassNotFoundException {

        Connect c = new Connect(name, pass);
        con = c.getConn();

    }

    public void addTerminal(Terminal ter) {
        try {
            // Parameters start with 1
            PreparedStatement Prestmt = con.prepareStatement("INSERT INTO terminal (`Model`,`SerialNumber`,`Condition`,`Status`,`Currancy`,`MCC`,`Class`\n"
                    + ",`Sale`,`OnlineReturned`,`OffLinereturned`,`OfflineSale`,`OnlineVoid`,`OffLineVoid`,`Preauth`,`Amex`,instatiment,`prepaid Services`,`Diners`\n"
                    + ",`Premuim`,`ManualEntry`) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

            Prestmt.setString(1, ter.getModel());
            Prestmt.setInt(2, ter.getSerialNumber());
            Prestmt.setString(3, ter.getCondition());
            Prestmt.setString(4, ter.getStatus());
            Prestmt.setString(5, ter.getCurrency());
            Prestmt.setInt(6, ter.getMCC());
            Prestmt.setString(7, ter.getTClass());
            Prestmt.setBoolean(8, ter.isSale());
            Prestmt.setBoolean(9, ter.isOnlineReturned());
            Prestmt.setBoolean(10, ter.isOffLineReturned());
            Prestmt.setBoolean(11, ter.isOfflineSale());
            Prestmt.setBoolean(12, ter.isOnlineVoid());
            Prestmt.setBoolean(13, ter.isOffLineVoid());
            Prestmt.setBoolean(14, ter.isPreauth());
            Prestmt.setBoolean(15, ter.isAmex());
            Prestmt.setBoolean(16, ter.isInstatiment());
            Prestmt.setBoolean(17, ter.isPrepainSerives());
            Prestmt.setBoolean(18, ter.isDiners());
            Prestmt.setBoolean(19, ter.isPermuim());
            Prestmt.setBoolean(20, ter.isManualEntry());

            Prestmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editTerminal(Terminal ter) {
        try {
            // Parameters start with 1
            PreparedStatement Prestmt = con.prepareStatement("UPDATE terminal SET `Model`=?, `SerialNumber`=?,`Condition`=?, `Status`=?,`Currancy`=?, `MCC`=?,`Class`=?,`Sale`=?,\n"
                    + "`OnlineReturned`=?,`OffLinereturned`=?, `OfflineSale`=?, `OnlineVoid`=?, `OffLineVoid`=?, `Preauth`=?,`Amex`=?,\n"
                    + "instatiment=?,`prepaid Services`=?, `Diners`=?, `Premuim`=?,`ManualEntry`=? WHERE `Terminal-id`=?");

            Prestmt.setString(1, ter.getModel());
            Prestmt.setInt(2, ter.getSerialNumber());
            Prestmt.setString(3, ter.getCondition());
            Prestmt.setString(4, ter.getStatus());
            Prestmt.setString(5, ter.getCurrency());
            Prestmt.setInt(6, ter.getMCC());
            Prestmt.setString(7, ter.getTClass());
            Prestmt.setBoolean(8, ter.isSale());
            Prestmt.setBoolean(9, ter.isOnlineReturned());
            Prestmt.setBoolean(10, ter.isOffLineReturned());
            Prestmt.setBoolean(11, ter.isOfflineSale());
            Prestmt.setBoolean(12, ter.isOnlineVoid());
            Prestmt.setBoolean(13, ter.isOffLineVoid());
            Prestmt.setBoolean(14, ter.isPreauth());
            Prestmt.setBoolean(15, ter.isAmex());
            Prestmt.setBoolean(16, ter.isInstatiment());
            Prestmt.setBoolean(17, ter.isPrepainSerives());
            Prestmt.setBoolean(18, ter.isDiners());
            Prestmt.setBoolean(19, ter.isPermuim());
            Prestmt.setBoolean(20, ter.isManualEntry());

            Prestmt.setInt(21, ter.getTerminaL_id());

            Prestmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

 
    public void StoreTerminal(int TermialID) throws SQLException {

        /* PreparedStatement Prestmt = con.prepareStatement("UPDATE terminal set `merchant_Merchant-id`=null where `Terminal-id`=?");
        Prestmt.setInt(1, TermialID);

        Prestmt.executeUpdate();*/
        PreparedStatement Prestmt2 = con.prepareStatement("UPDATE terminal set terminal.`Status`='Stored' where `Terminal-id`=?");
        Prestmt2.setInt(1, TermialID);

        Prestmt2.executeUpdate();

    }

    public List<Terminal> getAllTerminals() {
        List<Terminal> Terminals = new ArrayList<Terminal>();
        try {
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM terminal;");
            while (rs.next()) {
                Terminal ter = new Terminal();
                ter.setTerminaL_id(rs.getInt(1));
                ter.setModel(rs.getString(2));
                ter.setSerialNumber(rs.getInt(3));
                ter.setCondition(rs.getString(4));
                ter.setStatus(rs.getString(5));
                ter.setCurrency(rs.getString(6));
                ter.setMCC(rs.getInt(7));
                ter.setTClass(rs.getString(8));

                ter.setSale(rs.getBoolean(9));
                ter.setOnlineReturned(rs.getBoolean(10));
                ter.setOffLineReturned(rs.getBoolean(11));
                ter.setOfflineSale(rs.getBoolean(12));
                ter.setOnlineVoid(rs.getBoolean(13));
                ter.setOffLineVoid(rs.getBoolean(14));

                ter.setPreauth(rs.getBoolean(15));
                ter.setAmex(rs.getBoolean(16));
                ter.setInstatiment(rs.getBoolean(17));
                ter.setPrepainSerives(rs.getBoolean(18));
                ter.setDiners(rs.getBoolean(19));
                ter.setPermuim(rs.getBoolean(20));
                ter.setManualEntry(rs.getBoolean(21));

                Terminals.add(ter);
            }
        } catch (SQLException e) {
        }

        return Terminals;
    }

    public Terminal getTerminalById(int TerminaId) {
        Terminal ter = new Terminal();
        try {
            PreparedStatement preparedStatement = con.
                    prepareStatement("select * from terminal where terminal.`Terminal-id`=?");
            preparedStatement.setInt(1, TerminaId);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {

                ter.setTerminaL_id(rs.getInt(1));
                ter.setModel(rs.getString(2));
                ter.setSerialNumber(rs.getInt(3));
                ter.setCondition(rs.getString(4));
                ter.setStatus(rs.getString(5));
                ter.setCurrency(rs.getString(6));
                ter.setMCC(rs.getInt(7));
                ter.setTClass(rs.getString(8));

                ter.setSale(rs.getBoolean(9));
                ter.setOnlineReturned(rs.getBoolean(10));
                ter.setOffLineReturned(rs.getBoolean(11));
                ter.setOfflineSale(rs.getBoolean(12));
                ter.setOnlineVoid(rs.getBoolean(13));
                ter.setOffLineVoid(rs.getBoolean(14));

                ter.setPreauth(rs.getBoolean(15));
                ter.setAmex(rs.getBoolean(16));
                ter.setInstatiment(rs.getBoolean(17));
                ter.setPrepainSerives(rs.getBoolean(18));
                ter.setDiners(rs.getBoolean(19));
                ter.setPermuim(rs.getBoolean(20));
                ter.setManualEntry(rs.getBoolean(21));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ter;
    }

}

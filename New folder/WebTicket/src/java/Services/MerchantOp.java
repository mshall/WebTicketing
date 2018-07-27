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
public class MerchantOp {

    private Connection con;

    public MerchantOp(String name, String pass) throws SQLException, ClassNotFoundException {

        Connect c = new Connect(name, pass);
        con = c.getConn();

    }

    public void addMerchant(Merchant m) throws SQLException {

        PreparedStatement Prestmt = con.prepareStatement("INSERT INTO merchant (`MerchantName`, `ContactPerson`,"
                + " `Email`, `City`,`Street`,"
                + " `Phone1`,`Phone 2`, `Currancy`, `Class`,"
                + "`MCC`,`Status`, `AMex MerchantID`,`PremiumID`)  "
                + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?);");

        Prestmt.setString(1, m.getmName());
        Prestmt.setString(2, m.getMcp());
        Prestmt.setString(3, m.getMemail());
        Prestmt.setString(4, m.getCity());
        Prestmt.setString(5, m.getStreet());
        Prestmt.setString(6, m.getPhone1());
        Prestmt.setString(7, m.getPhone2());
        Prestmt.setString(8, m.getCurrancy());
        Prestmt.setString(9, m.getmClass());
        Prestmt.setInt(10, m.getMCC());

        Prestmt.setString(11, m.getmStatus());

        Prestmt.setInt(12, m.getAID());
        Prestmt.setInt(13, m.getPID());
        Prestmt.executeUpdate();

    }

    public void DelMerchant(int mid) throws SQLException {
        PreparedStatement preparedStatement = con.prepareStatement("DELETE FROM merchant where `Merchant-id`=?");
        // Parameters start with 1
        preparedStatement.setInt(1, mid);
        preparedStatement.executeUpdate();
    }

    public void UpdateMerchant(Merchant m) throws SQLException {
        PreparedStatement Prestmt = con.prepareStatement("UPDATE merchant SET `MerchantName`=?, `ContactPerson`=?, `Email`=? ,`City`=?,\n" +
"`Street`=?,`Phone1`=?, `Phone 2`=?, `Currancy`=?, `Class`=?, `MCC`=?,`Status`=?, `AMex MerchantID`=?, `PremiumID`=?  where `Merchant-id`=?");
        // Parameters start with 1

        Prestmt.setString(1, m.getmName());
        Prestmt.setString(2, m.getMcp());
        Prestmt.setString(3, m.getMemail());
        Prestmt.setString(4, m.getCity());
        Prestmt.setString(5, m.getStreet());
        Prestmt.setString(6, m.getPhone1());
        Prestmt.setString(7, m.getPhone2());
        Prestmt.setString(8, m.getCurrancy());
        Prestmt.setString(9, m.getmClass());
        Prestmt.setInt(10, m.getMCC());
        Prestmt.setString(11, m.getmStatus());
        Prestmt.setInt(12, m.getAID());
        Prestmt.setInt(13, m.getPID());
        Prestmt.setInt(14, m.getMid());
        Prestmt.executeUpdate();
    }

    public List<Merchant> AllMerchant() throws SQLException {
        List<Merchant> Merchants = new ArrayList<Merchant>();

        Statement statement = con.createStatement();
        ResultSet rs = statement.executeQuery("SELECT * FROM merchant;");
        while (rs.next()) {
            Merchant user = new Merchant();
            user.setMid(rs.getInt(1));
            user.setmName(rs.getString(2));
            user.setMcp(rs.getString(3));
            user.setMemail(rs.getString(4));
            user.setCity(rs.getString(5));
            user.setStreet(rs.getString(6));
            user.setPhone1(rs.getString(7));
            user.setPhone2(rs.getString(8));
            user.setCurrancy(rs.getString(9));
            user.setmClass(rs.getString(10));
            user.setMCC(rs.getInt(11));
            user.setmStatus(rs.getString(12));
            user.setAID(rs.getInt(13));
            user.setPID(rs.getInt(14));

            Merchants.add(user);
        }

        return Merchants;
    }

    public Merchant getUserById(int userId) throws SQLException {
        Merchant user = new Merchant();
        PreparedStatement preparedStatement = con.
                prepareStatement("SELECT * FROM merchant where merchant.`Merchant-id`=?");
        preparedStatement.setInt(1, userId);
        ResultSet rs = preparedStatement.executeQuery();

        if (rs.next()) {
            user.setMid(rs.getInt(1));
            user.setmName(rs.getString(2));
            user.setMcp(rs.getString(3));
            user.setMemail(rs.getString(4));
            user.setCity(rs.getString(5));
            user.setStreet(rs.getString(6));
            user.setPhone1(rs.getString(7));
            user.setPhone2(rs.getString(8));
            user.setCurrancy(rs.getString(9));
            user.setmClass(rs.getString(10));
            user.setMCC(rs.getInt(11));
            user.setmStatus(rs.getString(12));
            user.setAID(rs.getInt(13));
            user.setPID(rs.getInt(14));

        }
        return user;
    }

    public List<Merchant> getUserByName(String Name) {
        List<Merchant> Merchant = new ArrayList<Merchant>();
        try {
            PreparedStatement preparedStatement = con.
                    prepareStatement("select * FROM merchant where merchant.`MerchantName` like \"%?%\" ");

            preparedStatement.setString(1, Name);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Merchant user = new Merchant();
                user.setMid(rs.getInt(1));
                user.setmName(rs.getString(2));
                user.setMcp(rs.getString(3));
                user.setMemail(rs.getString(4));
                user.setCity(rs.getString(5));
                user.setStreet(rs.getString(6));
                user.setPhone1(rs.getString(7));
                user.setPhone2(rs.getString(8));
                user.setCurrancy(rs.getString(9));
                user.setmClass(rs.getString(10));
                user.setMCC(rs.getInt(11));
                user.setmStatus(rs.getString(12));
                user.setAID(rs.getInt(13));
                user.setPID(rs.getInt(14));

                Merchant.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return Merchant;
    }
}

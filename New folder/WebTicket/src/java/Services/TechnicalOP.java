package Services;

import java.sql.Connection;
import Services.Connect;
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
public class TechnicalOP {

    private Connection con;

    public TechnicalOP(String name, String pass) throws SQLException, ClassNotFoundException {

        Connect c = new Connect(name, pass);
        con = c.getConn();

    }

    public void addTech(Technical tech) {
        try {
            // Parameters start with 1

            PreparedStatement Prestmt = con.prepareStatement("INSERT INTO technical(`Name`,`ContactPerson`,`Email`,`City`,`Street`,`UserName`,`Password`,`Phone1`,`Phone2`,`Status`,`Vendor`) "
                    + "VALUES (?,?,?,?,?,?,?,?,?,?,?);");

            Prestmt.setString(1, tech.getTname());
            Prestmt.setString(2, tech.getCP());
            Prestmt.setString(3, tech.getEmail());
            Prestmt.setString(4, tech.getCity());
            Prestmt.setString(5, tech.getStreet());
            Prestmt.setString(6, tech.getUserName());
            Prestmt.setString(7, tech.getPassword());
            Prestmt.setString(8, tech.getPhone1());
            Prestmt.setString(9, tech.getPhone2());
            Prestmt.setString(10, tech.getStatus());
            Prestmt.setString(11, tech.getVendor());

            Prestmt.executeUpdate();

           PreparedStatement Pre = con.prepareStatement("INSERT INTO `vendor-admin` (`Name`,`Email`,`Phone1`,`UserName`,`Password`,tag) VALUES (?,?,?,?,?,?);");
            Pre.setString(1, tech.getTname());
            Pre.setString(2, tech.getEmail());
            Pre.setString(3, tech.getPhone1());
            Pre.setString(4, tech.getUserName());
            Pre.setString(5, tech.getPassword());
            Pre.setString(6, "Tech");

            Pre.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteTech(int userId) {
        try {
            PreparedStatement preparedStatement = con.prepareStatement("DELETE FROM technical WHERE `Technical-id`=?");
            // Parameters start with 1
            preparedStatement.setInt(1, userId);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateTech(Technical tech) {
        try {
            PreparedStatement Prestmt = con.prepareStatement("update technical set `Name`=?,`ContactPerson`=?,`Email`=?,`City`=?,`Street`=?,`UserName`=?,`Password`=?,`Phone1`=?,`Phone2`=?,"
                    + "`Status`=?,`Vendor`=? where `Technical-id`=?;");
            // Parameters start with 1

            Prestmt.setString(1, tech.getTname());
            Prestmt.setString(2, tech.getCP());
            Prestmt.setString(3, tech.getEmail());
            Prestmt.setString(4, tech.getCity());
            Prestmt.setString(5, tech.getStreet());

            Prestmt.setString(6, tech.getUserName());
            Prestmt.setString(7, tech.getPassword());
            Prestmt.setString(8, tech.getPhone1());
            Prestmt.setString(9, tech.getPhone2());
            Prestmt.setString(10, tech.getStatus());
            Prestmt.setString(11, tech.getVendor());

            Prestmt.setInt(12, tech.getTechId());
            Prestmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Technical> getAllTechs() {
        List<Technical> Technicals = new ArrayList<Technical>();
        try {
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("select  * FROM technical;");
            while (rs.next()) {
                Technical user = new Technical();
                user.setTechId(rs.getInt(1));
                user.setTname(rs.getString(2));
                user.setCP(rs.getString(3));
                user.setEmail(rs.getString(4));
                user.setCity(rs.getString(5));
                user.setStreet(rs.getString(6));
                user.setUserName(rs.getString(7));
                user.setPassword(rs.getString(8));
                user.setPhone1(rs.getString(9));
                user.setPhone2(rs.getString(10));
                user.setStatus(rs.getString(11));
                user.setVendor(rs.getString(12));

                Technicals.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return Technicals;
    }

    public Technical getUserById(int userId) {
        Technical user = new Technical();
        try {
            PreparedStatement preparedStatement = con.
                    prepareStatement("select * FROM technical where technical.`Technical-id`=?");
            preparedStatement.setInt(1, userId);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                user.setTechId(rs.getInt(1));
                user.setTname(rs.getString(2));
                user.setCP(rs.getString(3));
                user.setEmail(rs.getString(4));
                user.setCity(rs.getString(5));
                user.setStreet(rs.getString(6));
                user.setUserName(rs.getString(7));
                user.setPassword(rs.getString(8));
                user.setPhone1(rs.getString(9));
                user.setPhone2(rs.getString(10));
                user.setStatus(rs.getString(11));
                user.setVendor(rs.getString(12));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    public List<Technical> getUserByName(String Name) {
        List<Technical> Technicals = new ArrayList<Technical>();
        try {
            PreparedStatement preparedStatement = con.
                    prepareStatement("select * FROM technical where technical.technical.`Name` like \"%?%\" ");
            preparedStatement.setString(1, Name);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Technical user = new Technical();
                user.setTechId(rs.getInt(1));
                user.setTname(rs.getString(2));
                user.setCP(rs.getString(3));
                user.setEmail(rs.getString(4));
                user.setCity(rs.getString(5));
                user.setStreet(rs.getString(6));
                user.setUserName(rs.getString(7));
                user.setPassword(rs.getString(8));
                user.setPhone1(rs.getString(9));
                user.setPhone2(rs.getString(10));
                user.setStatus(rs.getString(11));
                user.setVendor(rs.getString(12));
                Technicals.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return Technicals;
    }
}

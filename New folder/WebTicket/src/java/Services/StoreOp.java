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
public class StoreOp {

    private Connection con;

    public StoreOp(String name, String pass) throws SQLException, ClassNotFoundException {

        Connect c = new Connect(name, pass);
        con = c.getConn();

    }

    public void addStore(Store m) throws SQLException {

        PreparedStatement Prestmt = con.prepareStatement("INSERT INTO store (`store-name`, `Contact-Person`,`Status`,`Phone1`,`Phone 2`,"
                + "`store-city`,`store-street`) VALUES (?,?,?,?,?,?,?);");

        Prestmt.setString(1, m.getName());
        Prestmt.setString(2, m.getCP());
        Prestmt.setString(3, m.getStatus());
        Prestmt.setString(4, m.getP1());
        Prestmt.setString(5, m.getP2());
        Prestmt.setString(6, m.getCity());
        Prestmt.setString(7, m.getStreet());

        Prestmt.executeUpdate();
    }

    public void DelStore(int sid) throws SQLException {
        PreparedStatement preparedStatement = con.prepareStatement("DELET FROM store where store.`store-id`=?");
        // Parameters start with 1
        preparedStatement.setInt(1, sid);
        preparedStatement.executeUpdate();
    }

    public void UpdateStore(Store m) throws SQLException {
        PreparedStatement Prestmt = con.prepareStatement("UPDATE store SET `store-name`=?, `Contact-Person`=?,`Status`=?,`Phone1`=?,`Phone 2`=?,"
                + "`store-city`=?,`store-street`=? where store.`store-id`=?");
        // Parameters start with 1

        Prestmt.setString(1, m.getName());
        Prestmt.setString(2, m.getCP());
        Prestmt.setString(3, m.getStatus());
        Prestmt.setString(4, m.getP1());
        Prestmt.setString(5, m.getP2());
        Prestmt.setString(6, m.getCity());
        Prestmt.setString(7, m.getStreet());

        Prestmt.setInt(8, m.getStore_id());
        Prestmt.executeUpdate();
    }

    public List<Store> AllStore() throws SQLException {
        List<Store> Stores = new ArrayList<Store>();
        Statement statement = con.createStatement();
        ResultSet rs = statement.executeQuery("select * from store;");
        while (rs.next()) {
            Store store = new Store();
            store.setStore_id(rs.getInt(1));
            store.setCity(rs.getString(2));
            store.setStreet(rs.getString(3));
            store.setStatus(rs.getString(4));
            store.setP1(rs.getString(5));
            store.setP2(rs.getString(6));
            store.setCP(rs.getString(7));
            store.setName(rs.getString(8));
            Stores.add(store);
        }
        return Stores;
    }

    public Store getUserById(int userId) throws SQLException {
        Store user = new Store();
        PreparedStatement preparedStatement = con.
                prepareStatement("select * from store"
                        + " where store.`store-id`=?");
        preparedStatement.setInt(1, userId);
        ResultSet rs = preparedStatement.executeQuery();

        if (rs.next()) {
            user.setStore_id(rs.getInt(1));
            user.setCity(rs.getString(2));
            user.setStreet(rs.getString(3));
            user.setStatus(rs.getString(4));
            user.setP1(rs.getString(5));
            user.setP2(rs.getString(6));
            user.setCP(rs.getString(7));
            user.setName(rs.getString(8));
        }
        return user;
    }

    public List<Store> getUserByName(String Name) {
        List<Store> Store = new ArrayList<Store>();
        try {
            PreparedStatement preparedStatement = con.
                    prepareStatement("select * from store"
                            + "  where store.`store-name` like \"%?%\" ");

            preparedStatement.setString(1, Name);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Store user = new Store();
                user.setStore_id(rs.getInt(1));
                user.setCity(rs.getString(2));
                user.setStreet(rs.getString(3));
                user.setStatus(rs.getString(4));
                user.setP1(rs.getString(5));
                user.setP2(rs.getString(6));
                user.setCP(rs.getString(7));
                user.setName(rs.getString(8));
                Store.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return Store;
    }
}

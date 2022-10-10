/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.cabbookingapp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ThileebanS
 */
@WebServlet(name = "updatevehicle", urlPatterns = {"/updatevehicle"})
public class updatevehicle extends HttpServlet {


//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
//        PrintWriter out = response.getWriter();
//        out.println("Registered Success");

        String id = request.getParameter("id");
        String updatename = request.getParameter("name");
        String updatefullname = request.getParameter("fullname");

        Connection connection = null;
        Statement statement = null;
        ResultSet rs = null;

        //String URL = "jdbc.mysql://localhost:3306/cabbooking";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cabbooking", "root", "pass");
            //statement = connection.createStatement();
            //String insertQuery = update new_table set firstName=?, contact=? where id=?;
            PreparedStatement pst = connection.prepareStatement("update vehicles set vehiclecategory=?, vehicletype=? where vehicleid=?");
            pst.setString(1, updatename);
            pst.setString(2, updatefullname);
            pst.setString(3, id);
            pst.executeUpdate();
            response.sendRedirect("vehicle.jsp");
            connection.close();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(addDriver.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(addDriver.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    

}

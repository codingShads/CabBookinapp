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
@WebServlet(name = "updateSales", urlPatterns = {"/updateSales"})
public class updateSales extends HttpServlet {

   
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        
//    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
//        PrintWriter out = response.getWriter();
//        out.println("Registered Success");

        String saleid = request.getParameter("saleid");
        String drivername = request.getParameter("drivername");
        String customername = request.getParameter("customername");
        String vehicleno = request.getParameter("vehicleno");
        String tripfare = request.getParameter("tripfare");
        String tripstart = request.getParameter("tripstart");
        String tripend = request.getParameter("tripend");
        String tripstatus = request.getParameter("tripstatus");
        String vehicletype = request.getParameter("vehicletype");
        String email = request.getParameter("email");
        String contactno = request.getParameter("contactno");

        Connection connection = null;
        Statement statement = null;
        ResultSet rs = null;

        //String URL = "jdbc.mysql://localhost:3306/cabbooking";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cabbooking", "root", "pass");
            //statement = connection.createStatement();
            //String insertQuery = update new_table set firstName=?, contact=? where id=?;
            PreparedStatement pst = connection.prepareStatement("update sales set drivername=?, customername=?, vehicleno=?,"
                    + "tripfare=?, tripstart=?, tripend=?, tripstatus=?, vehicletype=?,email=?,contactno=? where salesid=?");
            pst.setString(1, drivername);
            pst.setString(2, customername);
            pst.setString(3, vehicleno);
            pst.setString(4, tripfare);
            pst.setString(5, tripstart);
            pst.setString(6, tripend);
            pst.setString(7, tripstatus);
            pst.setString(8, vehicletype);
            pst.setString(9, email);
            pst.setString(10, contactno);
            pst.setString(11, saleid);
            pst.executeUpdate();
            response.sendRedirect("salesDetail.jsp");
            connection.close();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(addDriver.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(addDriver.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


}

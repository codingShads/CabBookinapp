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
@WebServlet(name = "Deleteuser", urlPatterns = {"/Deleteuser"})
public class Deleteuser extends HttpServlet {

//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");

        String id = request.getParameter("d");
        Integer uid = Integer.parseInt(id);

        Connection connection = null;
        Statement statement = null;
        ResultSet rs = null;

        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cabbooking", "root", "pass");
            statement = connection.createStatement();
            statement.executeUpdate("delete from new_table where id='" + uid + "'");
            response.sendRedirect("admin.jsp");
            connection.close();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(addDriver.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(addDriver.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}

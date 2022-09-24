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
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ThileebanS
 */
@WebServlet(name = "addSales", urlPatterns = {"/addSales"})
public class addSales extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String fullname = request.getParameter("fullname");
        String cartype = request.getParameter("vehicle");
        String pickup = request.getParameter("pickup");
        String drop = request.getParameter("drop");
        String mail = request.getParameter("mail");
        String phone = request.getParameter("phone");
        RequestDispatcher dispatcher = null;
        Connection conn = null;
        
        
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cabbooking", "root","pass");
            PreparedStatement pst = conn.prepareStatement("insert into sales (customername,vehicletype,tripstart,tripend,email,contactno) values (?,?,?,?,?,?)");
            
            pst.setString(1, fullname);
            pst.setString(2, cartype);
            pst.setString(3, pickup);
            pst.setString(4, drop);
            pst.setString(5, mail);
            pst.setString(6, phone);
            
            int rowCount = pst.executeUpdate();
            dispatcher = request.getRequestDispatcher("index.jsp");
            if(rowCount>0){
                request.setAttribute("status", "success");
            }else{
                request.setAttribute("status", "failed");
            }
            
            dispatcher.forward(request, response);
            
        }catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(register.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}

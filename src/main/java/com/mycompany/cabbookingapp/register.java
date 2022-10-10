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
@WebServlet(name = "register", urlPatterns = {"/register"})
public class register extends HttpServlet {

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String user = request.getParameter("fullname");
        String mail = request.getParameter("mail");
        String password = request.getParameter("password");
        String mobile = request.getParameter("mobile");
        RequestDispatcher dispatcher = null;
        Connection conn = null;
        
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cabbooking", "root","pass");
            PreparedStatement pst = conn.prepareStatement("insert into new_table (email,password,mobile,name) values (?,?,?,?)");
            
            pst.setString(1, mail);
            pst.setString(2, password);
            pst.setString(3, mobile);
            pst.setString(4, user);
            
            int rowCount = pst.executeUpdate();
            dispatcher = request.getRequestDispatcher("login.jsp");
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

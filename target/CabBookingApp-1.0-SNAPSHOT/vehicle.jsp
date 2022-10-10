<%-- 
    Document   : admin
    Created on : Sep 10, 2022, 9:38:06 AM
    Author     : ThileebanS
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="ClientCSS.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <title>Vehicle Dashboard</title>
    </head>
    <body>
        <section id="menu">
            <div class="logo">
                <img src="" alt="">
                <h2>Admin</h2>
            </div>

            <div class="submenu">
                <li><i class="fas fa-bars"></i><a href="salesDetail.jsp">Sales</a></li>
                <li><i class="fas fa-bell"></i><a href="driver.jsp">Driver Info</a></li>
                <li><i class="fas fa-bell"></i><a href="vehicle.jsp">Vehicle Info</a></li>
                <li><i class="fas fa-bell"></i></i><a href="customerBoard.jsp">Customer Info</a></li>
                <li><i class="fas fa-bars"></i><a href="admin.jsp">User Info</a></li>

            </div>
        </section>

        <section id="interface">
            <div class="navigation">
                <div class="n1">
                    <div class="search">
                        <h1>Vehicle Information</h1>
                    </div>
                </div>

                <%
                    try {
                        Connection connection = null;
                        Statement statement = null;
                        ResultSet rs = null;

                        Class.forName("com.mysql.jdbc.Driver");
                        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cabbooking", "root", "pass");
                        statement = connection.createStatement();
                        rs = statement.executeQuery("select * from user");

                        while (rs.next()) {

                %>
                <div class="profile">
                    <i class="fas fa-bell"></i>
                    <h1><% out.print(rs.getString("user"));%></h1>
                </div>
                <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }%>
            </div>

            <h3 class="i-name">
                Dashboard
            </h3>

            <div class="values">
                <%
                    try {
                        Connection conn = null;
                        Statement state = null;
                        ResultSet RS = null;

                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cabbooking", "root", "pass");
                        state = conn.createStatement();


                %>

                <div class="val-box">
                    <i class="fas fa-users"></i>
                    <div>
                        <%                            
                            RS = state.executeQuery("select count(*) from user");
                            RS.next();
                        %>
                        <h3><%out.print(RS.getInt(1));%></h3>

                        <span>Admin Users</span>
                    </div>

                </div>

                <div class="val-box">
                    <i class="fas fa-users"></i>
                    <div>
                        <%       
                            ResultSet RS1 = null;
                            RS1 = state.executeQuery("select count(*) from driver");
                            RS1.next();
                        %>
                        <h3><%out.print(RS1.getInt(1));%></h3>
                        <span>Total Drivers</span>
                    </div>
                </div>

                <div class="val-box">
                    <i class="fas fa-users"></i>
                    <div>
                        <%       
                            ResultSet RS2 = null;
                            RS2 = state.executeQuery("select count(*) from customers");
                            RS2.next();
                        %>
                        <h3><%out.print(RS2.getInt(1));%></h3>
                        <span>Total Customers</span>
                    </div>
                </div>

                <div class="val-box">
                    <i class="fas fa-users"></i>
                    <div>
                        <%       
                            ResultSet RS3 = null;
                            RS3 = state.executeQuery("select count(*) from sales");
                            RS3.next();
                        %>
                        <h3><%out.print(RS3.getInt(1));%></h3>
                        <span>Total Sales</span>
                    </div>
                </div>

                <%
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </div>
            
            <div class="onlyButton">
                <a href="addVehicle.jsp">Add Vehicle</a>
            </div>

            <div class="board">
                <table width="100%">
                    <thead>
                        <tr>
                            <td>Vehicle Name</td>
                            <td>Vehicle Type</td>
                            <td>Vehicle No</td>
                            <td>Other</td>
                            <td>Action</td>
                            <td>Action</td>
                        </tr>
                    </thead>
                    <tbody>

                        <%
                            try {
                                Connection connection = null;
                                Statement statement = null;
                                ResultSet rs = null;

                                Class.forName("com.mysql.jdbc.Driver");
                                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cabbooking", "root", "pass");
                                statement = connection.createStatement();
                                rs = statement.executeQuery("select * from vehicles");

                                while (rs.next()) {

                        %>
                        <tr>
                            <td class="people">
                                <img src="" alt="">
                                <div class="people-de">
                                    <h5><% out.print(rs.getString("vehiclecategory"));%></h5>
                                    <p>john@example.com</p>
                                </div>
                            </td>
                            <td class="people-des">
                                <h5><% out.print(rs.getString("vehicletype"));%></h5>
                                <p>Web dev</p>
                            </td>
                            <td class="active">
                                <p><% out.print(rs.getString("vehicleno"));%></p>
                            </td>
                            <td class="role">
                                <p>owner</p>
                            </td>
                            <td class="edit">
                                <a href="updateVehicle.jsp?vehicle=<%rs.getString("vehicleid");%>">Edit</a>
                            </td>
                            <td>
                                <form action="Deletevehicle?v=<% rs.getInt("vehicleid"); %>" method='POST'>
                                    <input type='submit' name='delete' value='Delete' id="<% rs.getString("vehicleid");%>"></form>
                            </td>
                        </tr>


                        <% }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }%>



                    </tbody>
                </table>
            </div>
        </section>
    </body>
</html>

<%-- 
    Document   : updateSales
    Created on : Sep 21, 2022, 2:43:55 PM
    Author     : ThileebanS
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="ClientCSS.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <title>JSP Page</title>
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
                        <h1>Manage Booking</h1>
                    </div>
                </div>

                <div class="profile">
                    <i class="fas fa-bell"></i>
                    <h1>This is the profile</h1>
                </div>
            </div>

            <h3 class="i-name">
                Booking Information
            </h3>

            <%
                String user = request.getParameter("sale");
                Integer saleid = Integer.parseInt(user);

                Connection connection = null;
                Statement statement = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cabbooking?characterEncoding=utf8", "root", "pass");
                    statement = connection.createStatement();
                    rs = statement.executeQuery("select * from sales where salesid ='"+saleid+"'");

            %>
            <div class="form-add">
                <form action="updateSales" method="POST">
                    <table>
                        <%                            
                            while (rs.next()) {

                        %>
                        <tr>
                            
                            <td><input type="hidden" value="<% out.print(rs.getString("salesid"));%>" id="id" name="saleid"></td>
                        </tr>
                        <tr>
                            <td>Driver Name</td>
                            <td><input type="text" value="<% out.print(rs.getString("drivername"));%>" id="drivername" name="drivername"></td>
                        </tr>
                        <tr>
                            <td>Customer Name</td>
                            <td><input type="text" value="<% out.print(rs.getString("customername"));%>" id="customername" name="customername"></td>
                        </tr>
                        <tr>
                            <td>Vehicle No</td>
                            <td><input type="text" value="<% out.print(rs.getString("vehicleno"));%>" id="vehicleno" name="vehicleno"></td>
                        </tr>
                        <tr>
                            <td>Trip Fare</td>
                            <td><input type="text" value="<% out.print(rs.getString("tripfare"));%>" id="tripfare" name="tripfare"></td>
                        </tr>
                        <tr>
                            <td>Trip Start</td>
                            <td><input type="text" value="<% out.print(rs.getString("tripstart"));%>" id="tripstart" name="tripstart"></td>
                        </tr>
                        <tr>
                            <td>Trip End</td>
                            <td><input type="text" value="<% out.print(rs.getString("tripend"));%>" id="tripend" name="tripend"></td>
                        </tr>
                        <tr>
                            <td>Trip Status</td>
                            <td><input type="text" value="<% out.print(rs.getString("tripstatus"));%>" id="tripstatus" name="tripstatus"></td>
                        </tr>
                        <tr>
                            <td>Vehicle Type</td>
                            <td><input type="text" value="<% out.print(rs.getString("vehicletype"));%>" id="vehicletype" name="vehicletype"></td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td><input type="text" value="<% out.print(rs.getString("email"));%>" id="email" name="email"></td>
                        </tr>
                        <tr>
                            <td>Contact No</td>
                            <td><input type="text" value="<% out.print(rs.getString("contactno"));%>" id="contactno" name="contactno"></td>
                        </tr>
                        <%

                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                        <tr>
                            <td><input type="submit" value="Update" id="btn-add"></td>
                        </tr>

                    </table>

                </form>
            </div>


        </section>
    </body>
</html>

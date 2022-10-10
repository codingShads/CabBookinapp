<%-- 
    Document   : updateVehicle
    Created on : Sep 21, 2022, 1:23:04 PM
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
        <title>Update Vehicle</title>
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
                        <h1>Update Vehicle</h1>
                    </div>
                </div>

                <div class="profile">
                    <i class="fas fa-bell"></i>
                    <h1>This is the profile</h1>
                </div>
            </div>

            <h3 class="i-name">
                Update Vehicle Information
            </h3>

            <%
                String user = request.getParameter("vehicle");
                Integer userid = Integer.parseInt(user);

                Connection connection = null;
                Statement statement = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cabbooking", "root", "pass");
                    statement = connection.createStatement();
                    rs = statement.executeQuery("select * from vehicles where vehicleid ='" + userid + "'");

            %>
            <div class="form-add">
                <form action="updatevehicle" method="POST">
                    <table>
                        <%                            
                            while (rs.next()) {

                        %>
                        <tr>

                            <td><input type="hidden" value="<% out.print(rs.getString("vehicleid"));%>" id="id" name="id"></td>
                        </tr>
                        <tr>
                            <td>Category</td>
                            <td><input type="text" value="<% out.print(rs.getString("vehiclecategory"));%>" id="name" name="name"></td>
                        </tr>
                        <tr>
                            <td>Vehicle Type</td>
                            <td><input type="text" value="<% out.print(rs.getString("vehicletype"));%>" id="fullname" name="fullname"></td>
                        </tr>
                        <tr>
                            <td>Vehicle No</td>
                            <td><input type="text" value="<% out.print(rs.getString("vehicletype"));%>" id="fullname" name="no"></td>
                        </tr>

                        <tr>
                            <td><input type="submit" value="Update" id="btn-add"></td>
                        </tr>

                    </table>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </form>
            </div>


        </section>
    </body>
</html>

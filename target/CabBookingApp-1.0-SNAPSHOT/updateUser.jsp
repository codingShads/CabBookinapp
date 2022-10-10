<%-- 
    Document   : updateUser
    Created on : Sep 21, 2022, 10:28:08 AM
    Author     : ThileebanS
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="ClientCSS.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <title>Update User</title>
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
                        <h1>Update User</h1>
                    </div>
                </div>

                <div class="profile">
                    <i class="fas fa-bell"></i>
                    <h1>This is the profile</h1>
                </div>
            </div>

            <h3 class="i-name">
                Update Users
            </h3>

            <%
                String user = request.getParameter("user");
                Integer userid = Integer.parseInt(user);

                Connection connection = null;
                Statement statement = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cabbooking?characterEncoding=utf8", "root", "pass");
                    statement = connection.createStatement();
                    rs = statement.executeQuery("select * from new_table where id ='"+userid+"'");

            %>
            <div class="form-add">
                <form action="updateUser" method="POST">
                    <table>
                        <%                            
                            while (rs.next()) {

                        %>
                        <tr>
                            
                            <td><input type="hidden" value="<% out.print(rs.getString("id"));%>" id="id" name="id"></td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td><input type="text" value="<% out.print(rs.getString("email"));%>" id="name" name="name"></td>
                        </tr>
                        <tr>
                            <td>Full name</td>
                            <td><input type="text" value="<% out.print(rs.getString("name"));%>" id="fullname" name="fullname"></td>
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

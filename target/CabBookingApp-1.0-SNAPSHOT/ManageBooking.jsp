<%-- 
    Document   : index
    Created on : Aug 23, 2022, 2:02:52 AM
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
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.css" rel="stylesheet" />
        <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
            />
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="main.css">
        <title>Manage Booking</title>
    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-white" id = "fixed">
            <!-- Container wrapper -->
            <div class="container-fluid">
                <!-- Toggle button -->
                <button
                    class="navbar-toggler"
                    type="button"
                    data-mdb-toggle="collapse"
                    data-mdb-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                    >
                    <i class="fas fa-bars"></i>
                </button>

                <!-- Collapsible wrapper -->
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- Navbar brand -->
                    <a class="navbar-brand mt-2 mt-lg-0" href="#">
                        <img
                            src="Logo.jpg"
                            height="15"
                            alt="MDB Logo"
                            loading="lazy"
                            />
                    </a>
                    <!-- Left links -->
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Dashboard</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ManageBooking.jsp">Manage Booking</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Contact us</a>
                        </li>
                    </ul>
                    <!-- Left links -->
                </div>
                <!-- Collapsible wrapper -->

                <!-- Right elements -->
                <div class="d-flex align-items-center">
                    <!-- Icon -->
                    <a class="link-secondary me-3" href="#">
                        <i class="fa fa-taxi"></i>
                    </a>

                    <!-- Notifications -->
                    <div class="dropdown">
                        <a
                            class="link-secondary me-3 dropdown-toggle hidden-arrow"
                            href="#"
                            id="navbarDropdownMenuLink"
                            role="button"
                            data-mdb-toggle="dropdown"
                            aria-expanded="false"
                            >
                            <i class="fas fa-bell"></i>
                            <span class="badge rounded-pill badge-notification bg-danger">1</span>
                        </a>
                        <ul
                            class="dropdown-menu dropdown-menu-end"
                            aria-labelledby="navbarDropdownMenuLink"
                            >
                            <li>
                                <a class="dropdown-item" href="#">Some news</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="#">Another news</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="#">Something else here</a>
                            </li>
                        </ul>
                    </div>
                    <!-- Avatar -->
                    <div class="dropdown">
                        <a
                            class="dropdown-toggle d-flex align-items-center hidden-arrow"
                            href="#"
                            id="navbarDropdownMenuAvatar"
                            role="button"
                            data-mdb-toggle="dropdown"
                            aria-expanded="false"
                            >
                            <img
                                src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp"
                                class="rounded-circle"
                                height="25"
                                alt="Black and White Portrait of a Man"
                                loading="lazy"
                                />
                        </a>
                        <ul
                            class="dropdown-menu dropdown-menu-end"
                            aria-labelledby="navbarDropdownMenuAvatar"
                            >
                            <li>
                                <a class="dropdown-item" href="#">My profile</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="#">Settings</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="#">Logout</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- Right elements -->
            </div>
            <!-- Container wrapper -->
        </nav>
        <!-- Navbar -->
        <div
            class="bg-image"
            style="
            background-image: url('11291.jpg');
            height: 100vh;
            "
            >

            <div class="sub-head">
                <h2>Manage Booking</h2>
            </div>

            <%
                try {
                    Connection connection = null;
                    Statement statement = null;
                    ResultSet rs = null;

                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cabbooking", "root", "pass");
                    statement = connection.createStatement();
                    rs = statement.executeQuery("select * from sales");
            %>
            <div class="center-item">
                <table class="table table-hover">
                    <strong>
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Driver</th>
                            <th scope="col">Vehicle No</th>
                            <th scope="col">Trip Start</th>
                            <th scope="col">Trip End</th>
                            <th scope="col">Trip Status</th>
                            <th scope="col">Vehicle Type</th>
                            <th scope="col">Trip Fare</th>
                        </tr>
                    </thead>
                    <%
                        while (rs.next()) {
                    %>
                    <tbody>
                        <tr>
                            <td><% out.print(rs.getString("salesid"));%></td>
                            <td><% out.print(rs.getString("drivername"));%></td>
                            <td><% out.print(rs.getString("vehicleno"));%></td>
                            <td><% out.print(rs.getString("tripstart"));%></td>
                            <td><% out.print(rs.getString("tripend"));%></td>
                            <td><% out.print(rs.getString("tripstatus"));%></td>
                            <td><% out.print(rs.getString("vehicletype"));%></td>
                            <td><% out.print(rs.getString("tripfare"));%></td>
                        </tr>


                    </tbody>
                    <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }%>
                </strong>
                </table>
            </div>

            


        </div>




    </body>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.js"></script>
</html> 

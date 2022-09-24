<% 
    if(session.getAttribute("name")==null){
        response.sendRedirect("login.jsp");
    }
    %>

<%-- 
    Document   : index
    Created on : Aug 23, 2022, 2:02:52 AM
    Author     : ThileebanS
--%>

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
        <title>Homepage</title>
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
                            alt="Logo"
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
                                <a class="dropdown-item" href="#"> <%session.getAttribute("name"); %></a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="#">Settings</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="logout">Logout</a>
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
            <div class="row">
                <div class="col-md-4">
                    <form action="addSales" method="POST">
                        <div class="form-outline mb-4">
                            <input type="text" id="form6Example1" class="form-control" name="fullname"/>
                            <label class="form-label" for="form6Example1">Full Name</label>
                        </div>
                        <!-- Text input -->
                        <div class="form-outline mb-4">
                            <input type="text" id="form6Example3" class="form-control"/>
                            <select name="vehicle" id="cars" class="form-control">
                                <option value="Budget">Budget</option>
                                <option value="City">City</option>
                                <option value="Car">Car</option>
                                <option value="Van">Van</option>
                            </select>
                            <label class="form-label" for="form6Example3">Select a Vehicle</label>
                        </div>

                        <!-- Text input -->
                        <div class="form-outline mb-4">
                            <input type="text" id="form6Example4" class="form-control" name="pickup"/>
                            <label class="form-label" for="form6Example4">Pickup Location</label>
                        </div>
                        
                        <div class="form-outline mb-4">
                            <input type="text" id="form6Example4" class="form-control" name="drop"/>
                            <label class="form-label" for="form6Example4">Drop Location</label>
                        </div>

                        <!-- Email input -->
                        <div class="form-outline mb-4">
                            <input type="email" id="form6Example5" class="form-control" name="mail"/>
                            <label class="form-label" for="form6Example5">Email</label>
                        </div>

                        <!-- Number input -->
                        <div class="form-outline mb-4">
                            <input type="text" id="form6Example6" class="form-control" name="phone"/>
                            <label class="form-label" for="form6Example6">Phone</label>
                        </div>
                        <!-- Submit button -->
                        <button type="submit" class="btn btn-primary btn-block mb-4">Confirm Booking</button>
                    </form>
                </div>
                <div class="col-md-8"><h1>Welcome to Cab Service</h1></div>
            </div>
        </div>
        
        
        

    </body>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.js"></script>
</html> 

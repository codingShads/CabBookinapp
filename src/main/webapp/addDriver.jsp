<%-- 
    Document   : addDetails
    Created on : Sep 11, 2022, 12:49:09 PM
    Author     : ThileebanS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="ClientCSS.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <title>Add Driver Page</title>
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
                        <h1>Add Driver</h1>
                    </div>
                </div>

                <div class="profile">
                    <i class="fas fa-bell"></i>
                    <h1>This is the profile</h1>
                </div>
            </div>

            <h3 class="i-name">
                Add Driver Information
            </h3>

            <div class="form-add">
                <form action="addDriver" method="POST">
                    <table>
                        <tr>
                            <td>Username:</td>
                            <td><input type="text" id="name" name="name"></td>
                            
                        </tr>
                        <tr>
                            <td>Full name</td>
                            <td><input type="text" id="fullname" name="fullname"></td>
                        </tr>
                        
                        <tr>
                            <td><input type="submit" value="Save" id="btn-add"></td>
                        </tr>
                        
                    </table>
                    
                </form>
            </div>


        </section>
    </body>
</html>

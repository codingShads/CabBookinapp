<%-- 
    Document   : adminlogin
    Created on : Sep 20, 2022, 3:03:06 PM
    Author     : ThileebanS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Font Awesome -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
            />
        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
            />
        <!-- MDB -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.css"
            rel="stylesheet"
            />
        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.js"
        ></script>

        <title>Admin Login</title>
    </head>
    <body>
        <section class="vh-100 gradient-custom">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card bg-dark text-white" style="border-radius: 1rem;">
                            <div class="card-body p-5 text-center">

                                <div class="mb-md-5 mt-md-4 pb-5">

                                    <h2 class="fw-bold mb-2 text-uppercase">Admin Login</h2>
                                    <p class="text-white-50 mb-5">Please enter your login and password!</p>
                                    <form action="adminlogin" method="POST">
                                        <div class="form-outline form-white mb-4">
                                            <input type="email" name = "usermail" id="typeEmailX" class="form-control form-control-lg" />
                                            <label class="form-label" for="typeEmailX">Email</label>
                                        </div>

                                        <div class="form-outline form-white mb-4">
                                            <input type="password" name="password" id="typePasswordX" class="form-control form-control-lg" />
                                            <label class="form-label" for="typePasswordX">Password</label>
                                        </div>

                                        <button class="btn btn-outline-light btn-lg px-5" type="submit">Login</button>
                                    </form>




                                </div>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>

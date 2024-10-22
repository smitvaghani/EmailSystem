﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Email_System.Default" %>
<!DOCTYPE html>

<html>
<head runat="server">
    <title>
        Email: Free, Private & Secure Email
    </title>
    <link rel="icon" href="../Static/Images/logo.ico"/>
    <link rel="stylesheet" href="../Static/lib/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="../Static/Css/home-page.css" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
    <section>
        <nav class="navbar navbar-expand-lg nav-custom custom-shadow">
            <div class="container-fluid">
                <img src="../Static/Images/logo.jpg" class="logo-img" alt="logo">
              <a class="navbar-brand" href="#">Email System</a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"><i class="fas fa-bars fa-lg"></i></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                  <li class="nav-item">
                   <a href="../Account/Login.aspx" class="btn btn-outline-primary">Sign in</a>
                  </li>
                  <li class="nav-item">
                    <a href="../Account/Register.aspx" class="btn btn-primary">Create an account</a>
                  </li>
                </ul>
              </div>
            </div>
        </nav>
    </section>

    <!-- Main Section -->
    <div class="container">
        <div class="row">
            <div class="col-lg-6 first">
                <h1> Secure, smart, <br>
                    and easy to use <br>
                    email
                </h1>
                <h4>
                    Get more done with our email system <br>Send and Recieve mail in instant time, <br>See live status and many more !!
                </h4>
                <a href="../Account/Register.aspx" class="btn btn-primary">Create an account</a>
                <a href="../Account/Login.aspx" class="btn btn-outline-primary">Sign in</a>
            </div>
            <div class="col-lg-6">
                <img class="pro-img" src="../Static/Images/mail.jpeg" alt="Project Photo">
            </div>
        </div>
    </div>

    <!-- Footer -->
    <section id="footer" class="custom-shadow">
        <i class="fab fa-facebook-f social"></i>
        <i class="social fab fa-twitter"></i>
        <i class="social fab fa-instagram"></i>
        <i class="social fas fa-envelope"></i>
        <p>© Copyright 2021 Email System</p>
      </section>
    </form>
    <!-- Jquery -->
    <script src="../Static/lib/jquery/jquery.js"></script>
    <!-- Font Awesome -->
    <script
      defer
      src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"
    ></script>
    <script src="../Static/lib/bootstrap/js/bootstrap.js"></script>
</body>
</html>

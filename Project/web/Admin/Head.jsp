<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Nest Admin</title>
  <link rel="stylesheet" href="../Assets/Templates/Admin/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="../Assets/Templates/Admin/vendors/css/vendor.bundle.base.css">
  <link rel="stylesheet" href="../Assets/Templates/Admin/css/style.css">
  <link rel="stylesheet" href="../Assets/Templates/form.css">
  <link rel="shortcut icon" href="../Assets/Templates/Admin/images/favicon.png" />
</head>
<body>
  <div class="container-scroller d-flex">
    <nav class="sidebar sidebar-offcanvas" id="sidebar">
      <ul class="nav">
        <li class="nav-item sidebar-category">
          <p>Navigation</p>
          <span></span>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="AdminhomePage.jsp">
            <i class="mdi mdi-view-quilt menu-icon"></i>
            <span class="menu-title">Dashboard</span>
          </a>
        </li>
        <li class="nav-item sidebar-category">
          <p>Components</p>
          <span></span>
        </li>
        <li class="nav-item sidebar-category">
          <p>Pages</p>
          <span></span>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
            <i class="mdi mdi-account menu-icon"></i>
            <span class="menu-title">User Pages</span>
            <i class="menu-arrow"></i>
          </a>
          <div class="collapse" id="auth">
            <ul class="nav flex-column sub-menu">
              <li class="nav-item"> <a class="nav-link" href="../Assets/Templates/Admin/pages/samples/login.html"> Login </a></li>
              <li class="nav-item"> <a class="nav-link" href="../Assets/Templates/Admin/pages/samples/login-2.html"> Propertyowner signup </a></li>
              <li class="nav-item"> <a class="nav-link" href="../Assets/Templates/Admin/pages/samples/register.html"> Furnitureowner signup </a></li>
              <li class="nav-item"> <a class="nav-link" href="../Assets/Templates/Admin/pages/samples/register-2.html"> User signup </a></li>
              
            </ul>
          </div>
        </li>
      </ul>
    </nav>
      <div class="container-fluid page-body-wrapper" id="tab" align="center">
     
       
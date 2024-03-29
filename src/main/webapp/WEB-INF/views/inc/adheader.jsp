<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>관리자 페이지</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="../resources/administrator/assets/img/favicon.png" rel="icon">
  <link href="../resources/administrator/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="../resources/administrator/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../resources/administrator/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../resources/administrator/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="../resources/administrator/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="../resources/administrator/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="../resources/administrator/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="../resources/administrator/assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="../resources/administrator/assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: NiceAdmin
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Updated: Mar 17 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="/" class="logo d-flex align-items-center">
        <!-- <img src="assets/img/H-logo1-purple.png" alt=""> -->
        <span class="d-none d-lg-block">HALLO</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <div class="search-bar">
      <form class="search-form d-flex align-items-center" method="POST" action="#">
        <input type="text" name="query" placeholder="Search" title="Enter search keyword">
        <button type="submit" title="Search"><i class="bi bi-search"></i></button>
      </form>
    </div><!-- End Search Bar -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item d-block d-lg-none">
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li><!-- End Search Icon-->

        <!-- End Messages Nav -->

        <li class="nav-item dropdown pe-3">

          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <img src="../resources/administrator/assets/img/profile.jpg" alt="Profile" class="rounded-circle">
            <span class="d-none d-md-block dropdown-toggle ps-2">Admin</span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6>관리자</h6>
              <span>Admin</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                <i class="bi bi-person"></i>
                <span>My Profile</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                <i class="bi bi-gear"></i>
                <span>Account Settings</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="pages-faq.html">
                <i class="bi bi-question-circle"></i>
                <span>Need Help?</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="/member/logout.do">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->

  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link collapsed" href="/admin.do">
          <i class="bi bi-grid"></i>
          <span>Dashboard</span>
        </a>
      </li><!-- End Dashboard Nav -->

      <li class="nav-heading">사이트 관리</li>
      <li class="nav-item">
        <a class="nav-link collapsed" href="/admin/memberlist.do">
          <i class="bi bi-person"></i>
          <span>회원 관리</span>
        </a>
      </li><!-- End Profile Page Nav -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="/admin/hallList.do">
          <i class="bi bi-house-check"></i>
          <span>공연장 관리</span>
        </a>
      </li><!-- End F.A.Q Page Nav -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="/admin/booklist.do">
          <i class="bi bi-calendar-check"></i>
          <span>예약 관리</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link collapsed" href="/admin/notilist.do">
          <i class="bi bi-layout-text-window-reverse"></i>
          <span>공지사항 관리</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link collapsed" href="/admin/qnalist.do">
          <i class="bi bi-question-circle"></i>
          <span>Q&A 관리</span>
        </a>
      </li>
    </ul>
  </aside><!-- End Sidebar-->
  
  <!-- Vendor JS Files -->
  <script src="../resources/administrator/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="../resources/administrator/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../resources/administrator/assets/vendor/chart.js/chart.umd.js"></script>
  <script src="../resources/administrator/assets/vendor/echarts/echarts.min.js"></script>
  <script src="../resources/administrator/assets/vendor/quill/quill.min.js"></script>
  <script src="../resources/administrator/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="../resources/administrator/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="../resources/administrator/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="../resources/administrator/assets/js/main.js"></script>
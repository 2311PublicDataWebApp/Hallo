<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Knight Bootstrap Template - Index</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="../resources/assets/img/favicon.png" rel="icon">
  <link href="../resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="../resources/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="../resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="../resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="../resources/assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Knight
  * Template URL: https://bootstrapmade.com/knight-free-bootstrap-theme/
  * Updated: Mar 17 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
	
	<!-- ======= Header ======= -->
  <header id="header" class="d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">

      <div class="logo">
        <a href="/"><img src="../resources/assets/img/H-logo1-purple.png" alt="" class="img-fluid"></a>
      </div>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="/">HALLO</a></li>
          <li><a class="nav-link scrollto" href="/map.do">지도</a></li>
          <li><a class="nav-link scrollto " href="/notice/list.do">공지사항</a></li>
          <c:if test="${memberId eq null }">          
	          <li><a class="nav-link scrollto" href="/member/login.do">로그인</a></li>
	          <li><a class="nav-link scrollto" href="/member/register.do">회원가입</a></li>
          </c:if>	
          <c:if test="${memberId ne null }">          	          
	          <li class="dropdown"><a href="#"><img src="../resources/administrator/assets/img/profile.jpg" width="30px" alt="Profile" class="rounded-circle"><span>&nbsp&nbsp${memberId}</span> <i class="bi bi-chevron-down"></i></a>
	            <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
	            	<c:if test="${memberId eq 'admin' }">
          				<li><a class="dropdown-item d-flex align-items-center" href="/admin.do">관리자페이지</a></li>
          				<li><hr class="dropdown-divider"></li>
          			</c:if>
	              <li><a class="dropdown-item d-flex align-items-center" href="/member/mypage.do">마이페이지</a></li>
	              <li><hr class="dropdown-divider"></li>
	              <li><a class="dropdown-item d-flex align-items-center" href="/qna/list.do">QNA</a></li>
	              <li><hr class="dropdown-divider"></li>
	              <li><a class="dropdown-item d-flex align-items-center" href="/member/logout.do">로그아웃</a></li>
	            </ul>
	          </li>
          </c:if>	   
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header>
  <br><br><br><br><br><br><br>

  <!-- Vendor JS Files -->
  <script src="../resources/assets/vendor/aos/aos.js"></script>
  <script src="../resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="../resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="../resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="../resources/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="../resources/assets/js/main.js"></script>

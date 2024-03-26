<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>메인</title>
	</head>
	<body>
		<section id="hero">
			<div class="hero-container">
				<a href="index.html" class="hero-logo" data-aos="zoom-in"><img src="../../resources/assets/img/H-logo1.png" style="width:150px; height:150px;" alt=""></a>
				<h1 data-aos="zoom-in">Welcome To HALLO</h1>
				<h2 data-aos="fade-up">If you want to reserve a concert hall, get started</h2>
				<a data-aos="fade-up" data-aos-delay="200" href="#about" class="btn-get-started scrollto">Get Started</a>
			</div>
		</section>
		<jsp:include page="./inc/header.jsp"></jsp:include>
		<!-- ======= Hero Section ======= -->
		<main id="main">
			<!-- ======= About Us Section ======= -->
			<section id="about" class="about">
				<div class="section-title" data-aos="fade-up"></div>
				<div class="container">
					${memberId }
					<c:if test="${memberId eq null }">
						<button type="button" onclick="memberLogin();">로그인</button>				
					</c:if>
					<c:if test="${memberId ne null }">
						<button type="button" onclick="memberLogout();">로그아웃</button>				
					</c:if>
				</div>
			</section>
			<section id="service" class="about">
				<div class="section-title" data-aos="fade-up"></div>
				<div class="container">
					${memberId }
					<c:if test="${memberId eq null }">
						<button type="button" onclick="memberLogin();">로그인</button>				
					</c:if>
					<c:if test="${memberId ne null }">
						<button type="button" onclick="memberLogout();">로그아웃</button>				
					</c:if>
				</div>
			</section>
			<section id="portfolio" class="about">
				<div class="section-title" data-aos="fade-up"></div>
				<div class="container">
					${memberId }
					<c:if test="${memberId eq null }">
						<button type="button" onclick="memberLogin();">로그인</button>				
					</c:if>
					<c:if test="${memberId ne null }">
						<button type="button" onclick="memberLogout();">로그아웃</button>				
					</c:if>
				</div>
			</section>
		</main>
		<jsp:include page="./inc/footer.jsp"></jsp:include>
		<script>
			function memberLogin() {
				location.href="/member/login.do";
			}
			function memberLogout() {
				location.href="/member/logout.do";
			}
		</script>
	</body>
</html>
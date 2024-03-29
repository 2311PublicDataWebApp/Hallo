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
				<a href="/" class="hero-logo" data-aos="zoom-in"><img src="../../resources/assets/img/H-logo1.png" style="width:150px; height:150px;" alt=""></a>
				<h1 data-aos="zoom-in">Welcome To HALLO</h1>
				<h2 data-aos="fade-up">If you want to reserve a concert hall, get started</h2>
				<a data-aos="fade-up" data-aos-delay="200" href="#carousel1" class="btn-get-started scrollto">Get Started</a>
			</div>
		</section>
		<jsp:include page="./inc/header.jsp"></jsp:include>

		<main id="main" class="main">
		<section class="section" id="carousel1">
		      <div class="row">
		        <div class="col-lg-12">
		              <!-- Slides with indicators -->
		              <div id="carouselExampleIndicators" class="carousel slide carousel-fade" data-bs-ride="carousel">
		                <div class="carousel-indicators">
		                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
		                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
		                </div>
		                <div>
			                <div class="carousel-inner">
			                  <div class="carousel-item active">
			                    <img src="./resources/assets/img/carousel1.jpg" height="500px" class="d-block w-100" alt="...">
			                    <div class="carousel-caption d-none d-md-block">
						        	<h1 style="margin:0 0 200px 0; text-shadow: 0 0px 5px #EEEEEE;"><b>더 짜릿하게</b></h1>
						      	</div>
			                  </div>
			                  <div class="carousel-item">
			                    <img src="./resources/assets/img/carousel2.jpg" height="500px" class="d-block w-100" alt="...">
			                  	<div class="carousel-caption d-none d-md-block">
						        	<h1 style="margin:0 0 200px 0; text-shadow: 0 0px 5px #EEEEEE;"><b>더 감미롭게</b></h1>
						      	</div>
			                  </div>
			                  <div class="carousel-item">
			                    <img src="./resources/assets/img/carousel3.jpg" height="500px" class="d-block w-100" alt="...">
			                  	<div class="carousel-caption d-none d-md-block">
						        	<h1 style="margin:0 0 200px 0; text-shadow: 0 0px 5px #EEEEEE;"><b>더 풍성하게</b></h1>
						      	</div>
			                  </div>
			                </div>
			
			                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			                  <span class="visually-hidden">Previous</span>
			                </button>
			                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
			                  <span class="visually-hidden">Next</span>
			                </button>
		                </div>
		              </div><!-- End Slides with indicators -->
		        </div>
		      </div>
		    </section>
		<!-- ======= About Us Section ======= -->
		<section id="about" class="about">
		      <div class="container">
		
		        <div class="section-title" data-aos="fade-up">
		        <br><br><br>
		          <h2>About Us</h2>
		        </div>
		
		        <div class="row">
		          <div class="col-lg-6" data-aos="fade-right">
		            <div class="image">
		              <img src="./resources/assets/img/aboutus.jpg" class="img-fluid" alt="">
		            </div>
		          </div>
		          <div class="col-lg-6" data-aos="fade-left">
		            <div class="content pt-4 pt-lg-0 pl-0 pl-lg-3 ">
		            <br>
		              <h3>국내 최대 공연장 중개 플랫폼</h3>
		              <p class="fst-italic">
		                왜 HALLO를 선택해야 하는가?
		              </p>
		              <ul>
		                <li><i class="bx bx-check-double"></i> 번거로운 과정 없이 간편하게 공연장 예약</li>
		                <li><i class="bx bx-check-double"></i> 주요 공연장 다수 연계</li>
		                <li><i class="bx bx-check-double"></i> 매우 합리적인 가격</li>
		              </ul>
		              <p>
		                We provide the optimal environment for cultural life. Enjoy the HALLO!
		              </p>
		            </div>
		          </div>
		        </div>
		      </div>
		    </section><!-- End About Us Section -->
		  </main><!-- End #main -->
		<jsp:include page="./inc/footer.jsp"></jsp:include>
	</body>
</html>
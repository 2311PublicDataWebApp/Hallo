<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공연장 상세</title>
		<%@ include file="../inc/head.jsp"%>
	</head>
	<body>
		<jsp:include page="../inc/header.jsp"></jsp:include>
		<div class="container" style="height: 1200px;">
			<div class="row">
				<div class="col p-auto">
					<img src="../resources/img/c09f5c46-4212-4ba3-9467-97d77c6229f8.jpg" alt="장소 이미지" class="img-fluid">
				</div>
				<div class="col p-auto">
					<div class="row">
						<div class="col">
							<img src="../resources/img/fbbffdb0-a36e-41dd-a8dd-b8e7a93ef17d.jpg" alt="장소 이미지" class="img-fluid">
						</div>
						<div class="col">
							<img src="../resources/img/e5dc050a-7bb0-4dc9-8ee6-ea3adf4a3615.jpg" alt="장소 이미지" class="img-fluid">
						</div>
					</div>
					<div class="row">
						<div class="col">
							<img src="../resources/img/2c7e50a2-583d-4d71-b671-1aa29a434d18.jpg" alt="장소 이미지" class="img-fluid">
						</div>
						<div class="col">
							<img src="../resources/img/71f4c09c-a21b-4f70-81f4-e42bcaa560f7.jpg" alt="장소 이미지" class="img-fluid">
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-8">
					<div class="row">
						<div class="row">
							<p class="fs-6 fw-light">
								한성대학교
							</p>
						</div>
						<div class="row">
							<p class="fs-1 fw-bold">
								${hall.hallName }
							</p>
						</div>
						<div class="row">
							<p class="fs-5 fw-medium">
								${hall.hallAddress }
							</p>
						</div>
						<div class="d-flex flex-row">
							<p class="fs-6 fw-medium">수용인원</p>
							<p class="fs-6 fw-medium">${hall.hallPeople }명</p>
						</div>
					</div>
					<div class="row"></div>
					<div class="row"></div>
				</div>
				<div class="col-4 pe-4" style="height: 1200px;">
					<div class="sticky-top">
						<div class="card text-center">
							<div class="card-body">
								<div class="row">
									<div class="col-8">
										<h3 class="card-title pe-5">275000 원~</h3>
									</div>
									<div class="col-4">
										<p class="card-text pt-2">/1시간</p>
									</div>
								</div>
								<div class="row px-4">
									<a href="#" class="btn btn-primary">예약하기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</body>
</html>
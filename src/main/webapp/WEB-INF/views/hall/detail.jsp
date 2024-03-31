<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
					<div class="row mb-4">
						<div class="row">
							<p class="fs-6 fw-light">
								${hall.hallSpaceName }
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
					<hr>
					<div class="row my-4">
						<p class="fs-3 fw-mefium">
							주의사항
						</p>
						<c:forEach items="${cautions }" var="caution">
							<p>
								${caution }							
							</p>
						</c:forEach>
					</div>
					<hr>
					<div class="row mt-4">
						<p class="fs-3 fw-mefium">
							환불규정
						</p>
						<c:forEach items="${refunds }" var="refund">
							<p>
								${refund }							
							</p>
						</c:forEach>
					</div>
				</div>
				<div class="col-4 pe-4" style="height: 1200px;">
					<div class="sticky-top z-0">
						<div class="card text-center">
							<div class="card-body py-4">
								<div class="row mb-3">
									<div class="col-8">
										<h3 class="card-title pe-5">${hall.hallFee } 원~</h3>
									</div>
									<div class="col-4">
										<p class="card-text pt-2">/1시간</p>
									</div>
								</div>
								<div class="row px-4">
<%-- 									<a href="/booking/insert.do?hallNo=${hall.hallNo }" class="btn btn-primary">예약하기</a> --%>
									<button class="btn btn-primary" type="button" onclick="letsbooking('${memberId}', ${hall.hallNo })" style="background-color: #6930EF;">예약하기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
		<script>
			function letsbooking(memberId, hallNo) {
				if(memberId != '') {
					location.href="/booking/insert.do?hallNo="+hallNo;
                } else {
                    alert("로그인 후 이용가능한 서비스입니다.")
                }
			}
		</script>
	</body>
</html>
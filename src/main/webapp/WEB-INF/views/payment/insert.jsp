<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
		<meta charset="UTF-8" />
		<title>결제하기</title>
		<%@ include file="../inc/head.jsp"%>
	</head>
	<body>
		<jsp:include page="../inc/header.jsp"></jsp:include>
		<div class="container py-3">
			<div class="row text-center my-4">
				<p class="fs-1 fw-bold">결제하기</p>
			</div>
			<div class="row pt-3">
				<div class="col-7 px-1">
					<div>
						<p class="fs-3">회원정보</p>
						<hr>
						<div class="row g-3 align-items-center mb-3">
							<div class="col-4">
							    <label for="memberName" class="col-form-label">이름</label>
							</div>
							<div class="col-8">
							    <input type="text" id="memberName" name="memberName" class="form-control" value="${member.memberName }">
							</div>
						</div>
						<div class="row g-3 align-items-center mb-3">
							<div class="col-4">
							    <label for="memberPhone" class="col-form-label">전화번호</label>
							</div>
							<div class="col-8">
							    <input type="text" id="memberPhone" name="memberPhone" class="form-control" value="${member.memberPhone }">
							</div>
						</div>
						<div class="row g-3 align-items-center mb-3">
							<div class="col-4">
							    <label for="memberEmail" class="col-form-label">이메일</label>
							</div>
							<div class="col-8">
							    <input type="email" id="memberEmail" name="memberEmail" class="form-control" value="${member.memberEmail }">
							</div>
						</div>
						<input type="hidden" name="memberAddress" id="memberAddress" value="memberAddress">
					</div>
					<div>
						<p class="fs-3">공연장 정보</p>
						<hr>
						<div class="row g-3 align-items-center mb-3">
							<div class="col-4">
							    <label for="hallName" class="col-form-label">이름</label>
							</div>
							<div class="col-8">
								<span id="hallName">${hall.hallName }</span>
							</div>
						</div>
						<div class="row g-3 align-items-center mb-3">
							<div class="col-4">
							    <label for="hallAddress" class="col-form-label">주소</label>
							</div>
							<div class="col-8">
								<span>${hall.hallAddress }</span>
							</div>
						</div>
						<div class="row g-3 align-items-center mb-3">
							<div class="col-4">
							    <label for="hallPeople" class="col-form-label">수용인원</label>
							</div>
							<div class="col-8">
								<span>${hall.hallPeople }</span>
							</div>
						</div>
					</div>
					<div>
						<p class="fs-3">날짜</p>
						<hr>
						<div class="row g-3 align-items-center mb-3">
							<div class="col-4">
							    <label for="startTime" class="col-form-label">시작 날짜</label>
							</div>
							<div class="col-8">
								<span>${booking.bookingStartTime }</span>
							</div>
						</div>
						<div class="row g-3 align-items-center mb-3">
							<div class="col-4">
							    <label for="endTime" class="col-form-label">종료 날짜</label>
							</div>
							<div class="col-8">
								<span>${booking.bookingEndTime }</span>
							</div>
						</div>
					</div>
					<div>
						<p class="fs-3">결제수단 선택</p>
						<hr>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="howtoPay" id="kakaopay" value="kakaopay">
							<label class="form-check-label" for="kakaopay">
								카카오페이
							</label>
						</div>
					</div>
				</div>
				<div class="col-5 px-5">
					<div class="sticky-top">
						<div class="card">
							<div class="card-body">
								<div class="px-3">
									<p class="fs-2">전체 합계</p>
									<div class="row g-3 align-items-center mb-3">
										<div class="col-4">
											<label for="total Time" class="col-form-label">총 시간</label>
										</div>
										<div class="col-8 text-end">
											<span id="totalTime">${booking.totalTime }</span>
										</div>
									</div>
									<div class="row g-3 align-items-center mb-3">
										<div class="col-4">
											<label for="total Time" class="col-form-label">시간당 가격</label>
										</div>
										<div class="col-8 text-end">
											<span>${hall.hallFee }</span>
										</div>
									</div>
									<hr>
									<div class="row g-3 align-items-center mb-3">
										<div class="col-4">
											<label for="total Time" class="col-form-label">최종 결제금액</label>
										</div>
										<div class="col-8 text-end">
											<span id="totalPrice">${hall.hallFee * booking.totalTime }</span>
										</div>
									</div>
								</div>
							</div>
							<div class="px-3 mb-3">
								<div class="row px-4">
									<button type="button" class="btn btn-primary" onclick="requestPay()">예약하기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
		<script>
			var IMP = window.IMP;
			IMP.init("imp53605073");
			
			function requestPay() {
				var pgVal = $("input[name=howtoPay]").val();
				var totalPrice = $("#totalPrice").html();
				var hallName = $("#hallName").html();
				var totalTime = $("#totalTime").html();
				var memberName = $("#memberName").val();
				var memberPhone = $("#memberPhone").val();
				var memberEmail = $("#memberEmail").val();
				var memberAddress = $("#memberAddress").val();
				IMP.request_pay(
					{
						pg: pgVal,
						pay_method: "card",
						merchant_uid : 'merchant_'+new Date().getTime(),
						name: hallName+totalTime+"시간",
						amount: totalPrice,
						buyer_name: memberName,
						buyer_tel: memberPhone,
						buyer_email: memberEmail,
						buyer_addr: memberAddress,
					},
					function (rsp) {
						console.log(rsp);
						if (rsp.success) {
							paymentAjax(rsp);
						} else {
							alert("결제가 실패하였습니다.");
						}
					}
				);
			}
			function paymentAjax(rsp) {
				$.ajax({
					url : "/payment/insert/ajax.do",
					data : {
								"pg_provider" : rsp.pg_provider,
								"merchant_uid" : rsp.merchant_uid,
								"amount" : rsp.amount,
								"buyer_name" : rsp.buyer_name,
								"buyer_tel" : rsp.buyer_tel,
								"buyer_email" : rsp.buyer_email,
								"buyer_addr" : rsp.buyer_addr,
								"name" : rsp.name
							},
					
					type : "POST",
					success : function() {
						alert("결제가 완료되었습니다.");
						location.href = "/payment/detail.do"
					},
					error : function() {
						alert("결제 실패");
					}
				})
			}
		</script>
	</body>
</html>
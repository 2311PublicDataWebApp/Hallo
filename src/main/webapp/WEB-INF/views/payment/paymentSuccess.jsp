<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>결제 완료</title>
	</head>
	<body>
		<jsp:include page="../inc/header.jsp"></jsp:include>
		<div class="container">
			<div class="text-center">
				<p class="fs-2 fw-medium">
					결제가 완료되었습니다.
				</p>
				<button class="btn btn-lg btn-primary" onclick="goHome()" style="background-color: #6930EF;">홈으로</button>
			</div>
		</div>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
		<script>
			function goHome() {
				location.href="/";
			}
		</script>
	</body>
</html>
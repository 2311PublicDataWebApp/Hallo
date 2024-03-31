<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>에러 페이지</title>
		<%@ include file="../inc/head.jsp"%>
	</head>
	<body>
		<jsp:include page="../inc/header.jsp"></jsp:include>
		<div class="container">
			<div class="alert alert-danger mx-5" role="alert">
				<p class="fs-1 fw-bold text-center">
					오류<br>
					관리자에게 문의바랍니다.<br>
					${msg }
				</p>
			</div>
		</div>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</body>
</html>
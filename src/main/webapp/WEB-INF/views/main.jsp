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
		<jsp:include page="./inc/header.jsp"></jsp:include>
		<div class="container">
			${memberId }
			<c:if test="${memberId eq null }">
				<button type="button" onclick="memberLogin();">로그인</button>				
			</c:if>
			<c:if test="${memberId ne null }">
				<button type="button" onclick="memberLogout();">로그아웃</button>				
			</c:if>
		</div>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인</title>
	</head>
	<body>
		<h1>로그인</h1>
		<form action="/member/login.do" method="post">
			<input type="text" name="memberId" placeholder="아이디">
			<input type="password" name="memberPw" placeholder="비번">
			<input type="submit" value="로그인">
		</form>
	</body>
</html>
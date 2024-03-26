<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"crossorigin="anonymous"></script>
	</head>
	<body>
	<div class="container">
		<main class="my-5">
			<h1 class="d-flex justify-content-center mb-4 py-5 p-3 mb-5 rounded border-bottom">로그인</h1>
			<form action="/member/login.do" method="post">
				<div class="d-flex justify-content-center "><input type="text"  name="memberId" placeholder="아이디" style="width: 300px; height: 60px;"></div> <br>
				<div class="d-flex justify-content-center"><input type="password" name="memberPw" placeholder="비밀번호" style="width: 300px; height: 60px;"></div> <br>
				<div class="d-flex justify-content-center"><input type="submit" value="로그인" class="btn btn-lg " style="width: 300px; height: 60px; background-color: #6f42c1; color: #ffffff;"></div> <br>
				<div class="d-flex justify-content-center"><a href="/member/register.do" style="border: none; color: #313131;">회원가입</a></div>
			</form>
		</main>
	</div>
	</body>
</html>
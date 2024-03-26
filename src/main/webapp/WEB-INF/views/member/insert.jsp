<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"crossorigin="anonymous"></script>
		<style>
			ul {
				list-style-type: none;
				padding-left: 0;
				}
			ul label {
				width : 80px;
				float : left;
				text-align : left;
				}
		</style>
	</head>
	<body>
	<div class="container">
		<main class="my-5">
		<form action="/member/register.do" method="post">
			<fieldset>
				<h1 class="mb-4 py-5 p-3 mb-5 rounded border-bottom d-flex justify-content-center">회원가입</h1>
				<ul>
					<br>
					<div class="d-flex justify-content-center ">
					<li>
						<label for="">아이디 </label>
						<input type="text" name="memberId" id="">
					</li>
					</div> <br>
					<div class="d-flex justify-content-center ">
					<li>
						<label for="">비밀번호 </label>
						<input type="password" name="memberPw" id="">
					</li>
					</div> <br>
					<div class="d-flex justify-content-center ">
					<li>
						<label for="">이름 </label>
						<input type="text" name="memberName" id="">
					</li> 
					</div> <br>
					<div class="d-flex justify-content-center ">
					<li>
						<label for="">이메일</label>
						<input type="text" name="memberEmail" id="">
					</li> 
					</div> <br>
					<div class="d-flex justify-content-center ">
					<li>
						<label for="">전화번호</label>
						<input type="text" name="memberPhone" id="">
					</li> 
					</div><br>
					<div class="d-flex justify-content-center ">
					<li>
						<label for="">주소</label>
						<input type="text" name="memberAddress" id="memberAddr">
					</li>
					</div>
				</ul>
			</fieldset>
			<br>
			<div class="d-flex justify-content-center ">
				<input type="submit" value="가입" class="btn btn-lg " style="width: 300px; height: 60px; background-color: #6f42c1; color: #ffffff;">
				<button type="button" id="list" onclick="showMyPage();" class="btn btn-light btn-lg rounded-pill" style="width: 300px; height: 60px; background-color: #AAAAAA; color: #ffffff;">취소</button>
				
			</div>
		</form>
		</main>
	</div>
	</body>
	<script>
	function showMyPage() {
		location.href = "/member/login.do";
	}
	</script>
</html>
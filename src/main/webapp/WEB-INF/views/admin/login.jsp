<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="../inc/adminhead.jsp"></jsp:include>
<body>

	<form action="/admin/adminlogin.do" method="post">
	<div class="content">

		<div class="contentleft">
			<img alt="어드민로고" src="../resources/img/LOGO.PNG">
			<p class="textbox">
			이 페이지는 HALLO 관리자를 위한 로그인 페이지 입니다. 
			<br>
			HALLO 이용 고객님은 www.hallo.co.kr 페이지를 이용해주세요
			</p>
		</div>

		<div class="ContentRight">
			<p id="id">
			아이디 : <input type="text" name="idfield" placeholder="아이디를 입력해주세요">
			비밀번호 : <input type="text" name="idfield" placeholder="비밀번호를 입력해주세요">
			</p>
			<input type="submit" value="로그인">
			<a href="#">아이디 찾기  |</a>
			<a href="#">  비밀번호 찾기</a>
			<h3>임시버튼</h3>
			<h4><a href="/admin/memberManage.do">어드민회원관리</a></h4>
		</div>
	</div>
</form>
</body>
</html>
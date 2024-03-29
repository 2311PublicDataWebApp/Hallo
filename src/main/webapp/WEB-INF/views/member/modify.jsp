<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원정보 수정</title>
		<%@ include file="../inc/head.jsp"%>
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
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<div class="container">
			<div class="row justify-content-center">
				<jsp:include page="../inc/member/sidebar.jsp"></jsp:include>
				<div class="col-md-8 d-flex flex-column flex-shrink-0 p-3">
			<form action="/member/update.do" method="post">
				<input type="hidden" name="memberId" id="" value="${member.memberId }">
				<input type="hidden" name="memberName" id="" value="${member.memberName }">
				<h1 class="mb-4 py-5 p-3 mb-5 text-center">정보수정</h1>
				<div class="row mb-3">
					<div class="col-sm-2"></div>
						<label for="" class="col-sm-4 col-form-label text-center">아이디</label> 
					<div class="col-sm-4 text-center">
						<span >${member.memberId }</span>
					</div>
					<div class="col-sm-2"></div>
				</div>
				<div class="row mb-3">
					<div class="col-sm-2"></div>				
						<label for="" class="col-sm-4 col-form-label text-center">비밀번호</label> 
					<div class="col-sm-4 text-center">
						<input type="password" name="memberPw" id="" value="${member.memberPw }">
					</div>
					<div class="col-sm-2"></div>
				</div>
				<div class="row mb-3">
					<div class="col-sm-2 "></div>
						<label for="" class="col-sm-4 col-form-label text-center">이름</label> 
					<div class="col-sm-4 text-center">
						<span>${member.memberName }</span>
					</div>
					<div class="col-sm-2"></div>
				</div>
				<div class="row mb-3">
					<div class="col-sm-2"></div>
						<label for="" class="col-sm-4 col-form-label text-center">이메일</label> 
					<div class="col-sm-4 text-center">
						<input type="text" name="memberEmail" 	 id="" 	value="${member.memberEmail }">
					</div>
					<div class="col-sm-2"></div>
				</div>
				<div class="row mb-3">
					<div class="col-sm-2"></div>
						<label for="" class="col-sm-4 col-form-label text-center">전화번호</label> 
					<div class="col-sm-4 text-center">
						<input type="text" name="memberPhone" id="" 	value="${member.memberPhone }">
					</div>
					<div class="col-sm-2"></div>
				</div>
				<div class="row mb-3">
					<div class="col-sm-2"></div>
						<label for="" class="col-sm-4 col-form-label text-center">주소</label> 
					<div class="col-sm-4 text-center">
						<input type="text" name="memberAddress" id="" 	value="${member.memberAddress }">
					</div>
					<div class="col-sm-2"></div>
				</div>
				<div class="text-center">
					<input type="submit" value="수정" class="btn btn-lg mt-5" style="width: 150px; height: 50px; background-color: #6f42c1; color: #ffffff;">
					<button type="button" id="list" onclick="showMyPage();" class="btn btn-lg mt-5" style="width: 150px; height: 50px; background-color: #AAAAAA; color: #ffffff;">취소</button>
				</div>
			</form>
			</div>
		</div>
		<!-- 		사이드바 -->
		</div>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
		<script>
		function showMyPage() {
			location.href = "/member/mypage.do";
		}
		</script>
</html>
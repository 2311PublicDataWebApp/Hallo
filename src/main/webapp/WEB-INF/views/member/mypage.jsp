<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지</title>
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
           			<div class="ml-5 mb-5">
           				<h1 class="mb-4 py-5 p-3 mb-5 text-center">마이페이지</h1>
           			</div>
					<div class="row mb-3">
						<div class="col-sm-2"></div>
							<label class="col-sm-4 col-form-label text-center">아이디</label>
						<div class="col-sm-4 text-center">
							<span>${member.memberId }</span>
						</div>
						<div class="col-sm-2"></div>
					</div>
					<div class="row mb-3">
						<div class="col-sm-2"></div>
							<label class="col-sm-4 col-form-label text-center">이름</label>
						<div class="col-sm-4 text-center">
							<span>${member.memberName }</span>
						</div>
						<div class="col-sm-2"></div>
					</div>
					<div class="row mb-3">
						<div class="col-sm-2"></div>
							<label class="col-sm-4 col-form-label text-center">이메일</label>
						<div class="col-sm-4 text-center">
							<span>${member.memberEmail }</span>
						</div>
						<div class="col-sm-2"></div>
					</div>
					<div class="row mb-3">
						<div class="col-sm-2"></div>
							<label class="col-sm-4 col-form-label text-center">전화번호</label>
						<div class="col-sm-4 text-center">
							<span>${member.memberPhone }</span>
						</div>
						<div class="col-sm-2"></div>
					</div>
					<div class="row mb-3">
						<div class="col-sm-2"></div>
							<label class="col-sm-4 col-form-label text-center">주소</label>
						<div class="col-sm-4 text-center">
							<span>${member.memberAddress }</span>
						</div>
						<div class="col-sm-2"></div>
					</div>
				</div>
	        </div>
		</div>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</body>
</html>
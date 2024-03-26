<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지</title>
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
			<div class="row justify-content-center">
				<div class="col-md-4 d-flex flex-column flex-shrink-0 p-3" style="width: 220px;">
	                <hr>
	                <ul class="nav nav-pills flex-column m-auto text-center">
					<li>
                  		<button class="btn btn-light"><a href="/member/update.do" class="nav-link text-black">정보수정</a></button>
                  	</li>
                  	<li>
                    	<button class="btn btn-light"><a onclick="deleteMember('${member.memberId }');" class="nav-link text-black">회원탈퇴 </a></button>
                  	</li>
                  	<li>
                    	<button class="btn btn-light"><a href="/member/reserve.do" class="nav-link text-black"> 예약목록 </a></button>
                  	</li>
                  	<li>
                    	<button class="btn btn-light"><a href="#" class="nav-link text-black"> 문의목록 </a></button>
                	</li>
				</ul>
	            	<hr>
	            </div>
				<div class="col-md-8 d-flex flex-column flex-shrink-0 p-3">
           			<div class="ml-5 mb-5">
           				<h1>마이페이지</h1>
           			</div>
					<div class="row mb-3">
						<div class="col-sm-2"></div>
						<label class="col-sm-4 col-form-label">아이디</label>
						<div class="col-sm-4">
						<span>${member.memberId }</span>
						</div>
						<div class="col-sm-2"></div>
					</div>
					<div class="row mb-3">
						<div class="col-sm-2"></div>
						<label class="col-sm-4 col-form-label">이름</label>
						<div class="col-sm-4">
							<span>${member.memberName }</span>
						</div>
						<div class="col-sm-2"></div>
					</div>
					<div class="row mb-3">
						<div class="col-sm-2"></div>
						<label class="col-sm-4 col-form-label">이메일</label>
						<div class="col-sm-4">
							<span>${member.memberEmail }</span>
						</div>
						<div class="col-sm-2"></div>
					</div>
					<div class="row mb-3">
						<div class="col-sm-2"></div>
						<label class="col-sm-4 col-form-label">전화번호</label>
						<div class="col-sm-4">
							<span>${member.memberPhone }</span>
						</div>
						<div class="col-sm-2"></div>
					</div>
					<div class="row mb-3">
						<div class="col-sm-2"></div>
						<label class="col-sm-4 col-form-label">주소</label>
						<div class="col-sm-4">
							<span>${member.memberAddress }</span>
						</div>
						<div class="col-sm-2"></div>
					</div>
				</div>
	        </div>
		</div>
<!-- 		사이드바 -->
		<a href="/">메인으로 이동</a>
<!-- 		<a href="/member/update.do">수정하기</a> -->
<%-- 		<a href="/member/delete.do?memberId=${member.memberId }">탈퇴하기</a> --%>
<%-- 		<button type="button" onclick="deleteMember('${member.memberId }');">탈퇴하기</button> --%>
<!-- 		</div> -->

		<script>
		function deleteMember(memberId) {
			if (confirm("탈퇴 후에는 해당 아이디로 다시 가입 할 수 없으며 아이디와 데이터는 복구 할 수 없습니다 ")) {
				location.href = "/member/delete.do?memberId=" + memberId;
			}
		}
		</script>
	</body>
</html>
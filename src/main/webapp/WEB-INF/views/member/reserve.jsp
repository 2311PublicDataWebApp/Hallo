<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>예약목록</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"crossorigin="anonymous"></script>
	</head>
	<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-4 d-flex flex-column flex-shrink-0 p-3" style="width: 220px;">
	        	<br><br><br><br><br><br><br><br><br><br><br><br><br>
	                <ul class="nav nav-pills flex-column mb-auto">
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
	                    	<button class="btn btn-light"><a href="#" class="nav-link text-black"> 1:1문의 </a></button>
	                	</li>
	                </ul>
            	
            </div>
		        <div class="col-md-8 d-flex flex-column flex-shrink-0 p-3">
					<div class="m-5 px-5">
						<h1 class="mb-4 py-3">예약목록</h1>
					</div><br>
				<table class="table">
					<thead>
						<tr class="table-info" align="center">
							<th scope="col" style="width: 10%;">번호</th>
							<th scope="col" style="width: 15%;">공연장명</th>
							<th scope="col" style="width: 35%;">대여장소명</th>
							<th scope="col" style="width: 15%;">주소</th>
							<th scope="col" style="width: 15%;">예약시간</th>
							<th scope="col" style="width: 10%;">예약일자</th>
	<!-- 						<th scope="col" style="width: 10%;">첨부파일</th> -->
						</tr>
					</thead>
						<tbody>
							<tr align="center">
								<td>1</td>
								<td>경락하우스</td>
								<td>경락하우스</td>
								<td>차오동</td>
								<td>세시</td>
								<td>내일</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	</body>
	<script>
		function deleteMember(memberId) {
			if (confirm("탈퇴 후에는 해당 아이디로 다시 가입 할 수 없으며 아이디와 데이터는 복구 할 수 없습니다 ")) {
				location.href = "/member/delete.do?memberId=" + memberId;
			}
		}
		</script>
</html>
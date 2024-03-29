<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-md-4 d-flex flex-column flex-shrink-0 p-3" style="width: 220px; height: 500px;">
	<hr>
	<ul class="nav nav-pills flex-column m-auto text-center">
		<li>
			<button class="btn btn-light btn-lg p-4" onclick="updateMember();">정보수정</button>
		</li>
		<li>
			<button class="btn btn-light btn-lg p-4" onclick="deleteMember('${member.memberId }');">회원탈퇴</button>
		</li>
		<li>
			<button class="btn btn-light btn-lg p-4" onclick="bookingList();">예약목록</button>
		</li>
		<li>
			<button class="btn btn-light btn-lg p-4" onclick="qnaList();">문의목록</button>
		</li>
	</ul>
	<hr>
</div>
<script>
	function updateMember() {
		location.href = "/member/update.do";
	}
	
	function deleteMember(memberId) {
		if (confirm("탈퇴 후에는 해당 아이디로 다시 가입 할 수 없으며 아이디와 데이터는 복구 할 수 없습니다 ")) {
			location.href = "/member/delete.do?memberId=" + memberId;
		}
	}
	
	function bookingList() {
		location.href = "/booking/list.do";
	}
	
	function qnaList() {
		location.href = "/qna/list.do";
	}
</script>
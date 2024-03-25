<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>
<link href="../resources/css_qna/qna.css" rel="stylesheet" />
</head>
<body>
	<!-- 공통 / 헤더 -->
	<%-- 	<jsp:include page="../inc/header.jsp"></jsp:include> --%>
	<div class="tempheader"></div>


	<!-- LNB 영역 -->
	<diV class="tempLnb" style=""></diV>


	<!-- contents 영역 -->
	<form action="/qna/qnadetail.do" method="GET">

		<div class="qna_detail_all">

			<!-- 타이틀 영역 -->
			<div class="title qnatitle">
				<h2 class="qna_main_title">1:1문의</h2>
				<h3 class="qna_sub_title">1:1문의 상세</h3>
			</div>
			<!-- 타이틀 닫히는 곳 -->
			<div class="qna_detail">
				<table class='qna_detail_table'>
					<input type="hidden" name="qnaNo" value="${qna.qnaNo }" id="qnaNo">
					<input type="hidden" name="qnaStatus" value="${qna.qnaStatus }" id="qnaStatus">
					<input type="hidden" name="memberId" value="${qna.memberId }" id="memberId">

					<tr class="detail_tr">
						<th>제목</th>
						<td>${qna.qnaTitle }</td>
					</tr>
					<tr class="detail_tr">
						<th>휴대폰번호</th>
						<td>${qna.qnaPhone }</td>
					</tr>
					<tr class="detail_tr">
						<th>상태</th>
						<td>${qna.qnaStatus }</td>
					</tr>
					<tr class="detail_tr">
						<th>작성일시</th>
						<td>${qna.qnaDate }</td>
					</tr>
					<tr class="detail_last_tr">
						<th>내용</th>
						<td class="qna_detail_last_td">${qna.qnaContent }</td>
					</tr>



				</table>
			</div>
			<c:if test="${qna.qnaStatus == 'NEW'}"> 
			<div class="detail_btn">
				<button type="button" class="del_btn" onClick="deleteQna(${qna.qnaNo })">삭제하기</button>
				<button type="button" class="list_btn" onClick="location.href='/qna/qnalist.do';">목록으로</button>
				<button type="button" class="modify_btn" onClick="showModifyPage()">수정하기</button>
			</div>
			</c:if>
			<c:if test="${qna.qnaStatus != 'NEW'}"> 
			<div class="detail_btn">
				<button type="button" class="del_btn" onClick="deleteQna(${qna.qnaNo })">삭제하기</button>
				<button type="button" class="list_btn" onClick="location.href='/qna/qnalist.do';">목록으로</button>
			</div>
			</c:if>
			<script>
				function deleteQna(qnaNo){
			
					if(confirm("삭제하시겠습니까?")){
						location.href = "/qna/qnadelete.do?qnaNo="+qnaNo;
						alert("정상적으로 삭제되었습니다.");
					}else{
						alert("오류가 발생하였습니다.");
					}
					
				}
				
				function showModifyPage() {
					var qnaNo = "${qna.qnaNo }";
					location.href = "/qna/qnamodify.do?qnaNo="+qnaNo;
				}
		</script>


			<div class="tempfooter"></div>
		</div>
	</form>
</body>
</html>
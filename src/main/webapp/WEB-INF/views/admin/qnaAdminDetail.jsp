<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- Admin Head Import -->
<jsp:include page="../inc/admin/adminhead.jsp"></jsp:include>
<!-- /Admin Head Import -->

<body>

	<form action="/admin/qnaAdminDetail.do" method="POST">

		<!-- Admin Header Import -->
		<jsp:include page="../inc/admin/adminheader.jsp"></jsp:include>
		<!-- /Admin Header Import -->

		<div class="adm_all">

			<!-- Admin LNB Import -->
			<jsp:include page="../inc/admin/adminlnb.jsp"></jsp:include>
			<!-- / Admin LNB Import -->
			
			<div class="adm_content">
				<!-- content 시작 부분  -->
					<table class="titletbl">
				<tr>
					<td class="main_title_td">
					<h4 class="section_title">고객센터관리</h4>
					</td>
				</tr>
				<tr>
				<td> 
				<h5 class="section_sub_title">1:1문의 상세</h5>
				</td>
				</tr>
				</table>

				<div class="adm_qna_detail">
					<table class='adm_qna_detail_table'>
						<input type="hidden" name="qnaNo" value="${qna.qnaNo }" id="qnaNo">
						<input type="hidden" name="memberId" value="${qna.memberId }"
							id="memberId">

						<tr class="adm_detail_tr">
							<th class="adm_detail_th">제목</th>
							<td class="admin_detail_td">${qna.qnaTitle }</td>
						</tr>
						<tr class="adm_detail_tr">
							<th class="adm_detail_th">회원명</th>
							<td class="admin_detail_td">${qna.memberName}</td>
						</tr>
						<tr class="adm_detail_tr">
							<th class="adm_detail_th">휴대폰번호</th>
							<td class="admin_detail_td">${qna.qnaPhone }</td>
						</tr>
						<tr class="adm_detail_tr">
							<th class="adm_detail_th">상태</th>
							<c:set var="qStatus" value="${qna.qnaStatus }" />
							<c:if test="${qStatus eq 'NEW' }">
								<td class="admin_detail_td">신규등록</td>
							</c:if>
							<c:if test="${qStatus eq 'END'}">
								<td class="admin_detail_td">답변완료</td>
							</c:if>
						</tr>
						<tr class="adm_detail_tr">
							<th class="adm_detail_th">작성일시</th>
							<td class="admin_detail_td">${qna.qnaDate }</td>
						</tr>
						<tr class="detail_content_tr">
							<th class="detail_content_th adm_detail_th" style="height:100px;">내용</th>
							<td class="admin_detail_td detail_content_td" style="vertical-align:top; padding:10px 0px;">${qna.qnaContent }</td>
						</tr>
						<c:set var="qStatus" value="${qna.qnaStatus }" />
						<c:if test="${qStatus eq 'END' }">
							<tr class="detail_last_tr">
								<th class="adm_detail_th" style="height:200px;">답변</th>
								<td class="admin_detail_td">${qna.qnaComment}</td>
							</tr>
						</c:if>
						<c:if test="${qStatus eq 'NEW'}">
							<tr class="detail_last_tr">
								<th class="adm_detail_th" style="height:150px;">답변</th>
								<td class="admin_detail_td"><textarea cols="50"
										rows="10" name="qnaComment" style="margin-top:-10px; border:1px solid #c0c0c0;"></textarea><br>
								</td>
							</tr>
						</c:if>
					</table>
				</div>

				<div class="detail_btn">
				<c:if test="${qStatus eq 'NEW'}">
					<button type="button" class="adm_list_btn"
						onClick="location.href='/admin/qnaAdminList.do';">목록으로</button>
					<input type="submit" class="adm_reply_btn" onClick="replyalert()"
						value="답변하기" />
				</c:if>		
				<c:if test="${qStatus ne 'NEW'}">
					<button type="button" class="adm_list_btn"
						onClick="location.href='/admin/qnaAdminList.do';">목록으로</button>
				</c:if>		

				
				</div>
				<script>
					function replyalert() {
						if (confirm("답변을 등록하시겠습니까?")) {
							alert("등록되었습니다.");
							var qnaNo = "${qna.qnaNo }";
							return true;
							location.href = "/admin/qnaAdminDetail.do?qnaNo="
									+ qnaNo;
						} else {
							return false;
						}

					}
				</script>

			</div>
			<!-- adm_all ë«íë ë¶ë¶ -->
	</form>







</body>
</html>
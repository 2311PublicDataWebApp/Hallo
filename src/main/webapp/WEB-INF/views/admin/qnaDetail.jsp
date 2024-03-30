<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 상세조회</title>

</head>
<body>
	<jsp:include page="../inc/adheader.jsp"></jsp:include>
	<div id="adqnadetail">
		<main id="main" class="main">
			<div class="pagetitle">
				<h1>Q&A</h1>
			</div>
			<!-- End Page Title -->
			<br>
			<section class="section">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">Q&A</h5>
								<div class="d-flex col-md-12 justify-content-end">
									<form action="/admin/qnaModify.do" method="Post" name="adm_form">
										<button type="button" class="btn"  style="background-color: #FAFAFA; border-color: #e9ecef;"
											onClick="location.href='/admin/qnalist.do';">목록으로</button>
										<input type="submit" class="btn" onClick="return replyalert();" style="background-color: #FAFAFA; border-color: #e9ecef;" value="답변하기"/>
<!-- 											 -->
								</div>
								<br>
								<!-- Default Table -->
								<table class="table table-striped">
									<tbody>
	<input type="hidden" name="qnaNo" value="${qna.qnaNo }" id="qnaNo">
						<input type="hidden" name="memberId" value="${qna.memberId }"
							id="memberId">
										<tr>
											<td style="width:300px;">제목</td>
											<td>${qna.qnaTitle }</td>
										</tr>
										<tr>
											<td>회원명</td>
											<td>${qna.memberName }</td>
										</tr>
										<tr>
											<td>작성자</td>
											<td>${qna.qnaPhone }</td>
										</tr>
										<tr>
											<td>상태</td>
											<c:set var="qStatus" value="${qna.qnaStatus }" />
											<c:if test="${qStatus eq 'NEW' }">
												<td class="admin_detail_td">신규등록</td>
											</c:if>
											<c:if test="${qStatus eq 'END'}">
												<td class="admin_detail_td">답변완료</td>
											</c:if>

										</tr>
										<tr>
											<td>작성일시</td>
											<td>${qna.qnaDate}</td>
										</tr>
										<tr>
											<td>내용</td>
											<td><textarea style="border: 0px; background-color: transparent" readonly>${qna.qnaContent }</textarea></td>
										</tr>
									
										<c:set var="qStatus" value="${qna.qnaStatus }" />
										<c:if test="${qStatus eq 'END' }">
											<tr class="detail_last_tr">
												<td style="height: 200px;">답변</td>
												<td >${qna.qnaComment}</td>
											</tr>
										</c:if>
										<c:if test="${qStatus eq 'NEW'}">
											<tr class="detail_last_tr">
												<td style="height: 150px;">답변</td>
												<td><textarea cols="50"
														rows="10" name="qnaComment"
														style="margin-top: 10px; border: 1px solid #e9ecef;"></textarea><br>
												</td>
											</tr>
										</c:if>
										</form>
									</tbody>
								</table>

							</div>
						</div>
					</div>
				</div>
			</section>
		</main>
	</div>
	<jsp:include page="../inc/adfooter.jsp"></jsp:include>
	<script type="text/javascript">
		function replyalert() {
			if (confirm("답변을 등록하시겠습니까?")) {
				 if( adm_form.qnaComment.value == "" ) {
			        alert("답변을 입력해주세요.");
					 adm_form.qnaComment.focus();
			        return false;}
				 else{
				alert("등록되었습니다.");
				return true;
				location.href = "redirect:/admin/qnaDetail.do?qnaNo=" + qnaNo;
				 }
			} else {
				return false;
			}

		}


	</script>
	<!-- Vendor JS Files -->
	<script
		src="../resources/administrator/assets/vendor/apexcharts/apexcharts.min.js"></script>
	<script
		src="../resources/administrator/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="../resources/administrator/assets/vendor/chart.js/chart.umd.js"></script>
	<script
		src="../resources/administrator/assets/vendor/echarts/echarts.min.js"></script>
	<script
		src="../resources/administrator/assets/vendor/quill/quill.min.js"></script>
	<script
		src="../resources/administrator/assets/vendor/simple-datatables/simple-datatables.js"></script>
	<script
		src="../resources/administrator/assets/vendor/tinymce/tinymce.min.js"></script>
	<script
		src="../resources/administrator/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="../resources/administrator/assets/js/main.js"></script>
</body>
</html>
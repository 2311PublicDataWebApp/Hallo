<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공연장 상세정보</title>

</head>
<body>
<jsp:include page="../inc/adheader.jsp"></jsp:include>
<main id="main" class="main">
		<div class="pagetitle">
			<h1>공연장 상세정보</h1>
		</div>
		<!-- End Page Title -->
		<br>
		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">공연장 상세정보</h5>
							<div class="d-flex col-md-12 justify-content-end">
					            <button type="button" class="btn" style="background-color: #FAFAFA; border-color: #e9ecef;" onClick="showModifyPage(${hall.hallNo});">수정</button>
					            <button type="button" class="btn" style="background-color: #FAFAFA; border-color: #e9ecef;" onClick="deleteHall(${hall.hallNo});">삭제</button>
					            <button type="button" class="btn" style="background-color: #FAFAFA; border-color: #e9ecef;" onClick="location.href='/admin/hallList.do';">목록</button>
							</div>
							<br>
							<!-- Default Table -->
											<input type="hidden" name="hallNo" value="${hall.hallNo }" id="hallNo"/>
							<table class="table table-striped">
								<tbody>
										<tr>
											<td width="230px">공연장명 * </td>
											<td>${hall.hallName }</td>
										</tr>
										<tr>
											<td>대여 장소명</td>
											<td>${hall.hallSpaceName}</td>
										</tr>
										<tr>
											<td>주소 * </td>
											<td>${hall.hallAddress }</td>
										</tr>
										<tr>
											<td>수용 인원</td>
											<td>${hall.hallPeople }</td>
										</tr>
										<tr>
											<td>시간 당 비용</td>
											<td>${hall.hallFee }</td>
										</tr>
										<tr>
											<td>주의사항</td>
											<td>${hall.hallCautions}</td>
										</tr>
										<tr>
											<td>환불규정</td>
											<td>${hall.hallRefunds}</td>
										</tr>
<%-- 										<c:if test="${hall.hallImgFileRename ne null }"> --%>
										<tr>
											<td>첨부파일</td>
<%-- 											<td><span><a style="color:black;" href='../resources/nuploadFiles/${hall.hallImgRename }'>${hall.hallImgName }</a></span></td> --%>
										</tr>
<%-- 										</c:if> --%>
											<tr>
											<td>담당자명 * </td>
											<td>${hall.hallAgentName }</td>
										</tr>
										<tr>
											<td>담당자 연락번호 * </td>
											<td>${hall.hallAgentPhone}</td>
										</tr>
										<tr>
											<td>담당자 이메일</td>
											<td>${hall.hallAgentEmail}</td>
										</tr>
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
			function showModifyPage(hallNo) {
				var hallNo = "${hall.hallNo }";
				location.href = "/admin/hallmodify.do?hallNo=" + hallNo;
			}
			
			function deleteHall(hallNo) {
				if (confirm("삭제하시겠습니까?")) {
					location.href = "/admin/halldelete.do?hallNo=" + hallNo;
				}
			}
			
			function showhallList() {
				location.href = "/admin/hallList.do";
			}
</script>
<!-- Vendor JS Files -->
  <script src="../resources/administrator/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="../resources/administrator/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../resources/administrator/assets/vendor/chart.js/chart.umd.js"></script>
  <script src="../resources/administrator/assets/vendor/echarts/echarts.min.js"></script>
  <script src="../resources/administrator/assets/vendor/quill/quill.min.js"></script>
  <script src="../resources/administrator/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="../resources/administrator/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="../resources/administrator/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="../resources/administrator/assets/js/main.js"></script>
</body>
</html>
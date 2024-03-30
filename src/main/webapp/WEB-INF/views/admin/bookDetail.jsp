<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약정보</title>

</head>
<body>
	<jsp:include page="../inc/adheader.jsp"></jsp:include>
	<main id="main" class="main">
		<div class="pagetitle">
			<h1>예약정보</h1>
		</div>
		<!-- End Page Title -->
		<br>
		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">예약상세정보</h5>
							<div class="d-flex col-md-12 justify-content-end">
								<button type="button" class="btn"
									style="background-color: #FAFAFA; border-color: #e9ecef;"
									onclick="showModifyPage(${book.bookingNo});">수정</button>
								<button type="button" class="btn"
									style="background-color: #FAFAFA; border-color: #e9ecef;"
									onclick="deleteBooking(${book.bookingNo});">삭제</button>
								<button type="button" class="btn"
									style="background-color: #FAFAFA; border-color: #e9ecef;"
									onclick="showBookingList();">목록</button>
							</div>
							<br>
						<input type="hidden" name="bookingNo" value="${book.bookingNo }" id="bookingNo"/>
							<!-- Default Table -->
							<table class="table table-striped">
							
								<tbody>
									<tr>
										<th colspan="2">[예약정보]</th>
									</tr>

									<tr>
										<td style="width: 230px">예약번호</td>
										<td>${book.bookingNo}</td>
									</tr>

									<tr>
										<td>시작일</td>
										<td>${book.bookingStartTime }</td>
									</tr>
									<tr>
										<td>종료일</td>
										<td>${book.bookingEndTime}</td>
									</tr>
									<tr>
										<th colspan="2">[회원정보]</th>
									</tr>
									<tr>
										<td>회원명</td>
										<td>${book.memberName }</td>
									</tr>
									<tr>
										<td>휴대폰번호</td>
										<td>${book.memberPhone}</td>
									</tr>
									<tr>
										<th colspan="2">[공연장 정보]</th>
									</tr>
									<tr>
										<td>공연장명</td>
										<td>${book.hallName }</td>
									</tr>
									<tr>
										<td>대여장소명</td>
										<td>${book.hallSpaceName}</td>
									</tr>
									<tr>
										<td>주소</td>
										<td>${book.hallAddress}</td>
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
			function showModifyPage(bookingNo) {
				location.href = "/admin/bookmodify.do?bookingNo=" + bookingNo;
			}	
			function deleteBooking(bookingNo) {
				if (confirm("삭제하시겠습니까?")) {
					return true;
				} else{
					alert("삭제 실패하였습니다.");
					return false;
				}
			}
			
			function showBookList() {
				location.href = "/admin/booklist.do";
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
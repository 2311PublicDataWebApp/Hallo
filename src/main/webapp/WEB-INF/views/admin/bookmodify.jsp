<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약변경</title>
</head>
<body>
<jsp:include page="../inc/adheader.jsp"></jsp:include>

<main id="main" class="main">
		<div class="pagetitle">
			<h1>예약변경</h1>
		</div>
		<!-- End Page Title -->
		<br>
		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">예약변경</h5>
								<form action="/admin/bookmodify.do" method="post" enctype="multipart/form-data" name="adm_form" onSubmit="return Checkform()">
					                <div class="row mb-3">
					                  <label for="inputText" class="col-sm-2 col-form-label">예약번호</label>
					                  <div class="col-sm-3">
					                  <input type="hidden" name="hallNo" value="${book.bookingNo }" id="hallNo"/>
					                    <span>${book.bookingNo }</span>
					                  </div>
					                  </div>
					                  <div class="row mb-3">
					                  <label for="inputText" class="col-sm-2 col-form-label">시작일</label>
					                  <div class="col-sm-2">
					                    <input type="datetime-local" class="form-control" name="bookingStartTime" value="${book.bookingStartTime }">
					                  </div>
					                </div>
					                <div class="row mb-3">
					                  <label for="inputText" class="col-sm-2 col-form-label">종료일</label>
					                  <div class="col-sm-2">
										<input type="datetime-local" class="form-control" name="bookingEndTime" value="${book.bookingEndTime }">
					                  </div>
					                </div>
					                  <div class="row mb-3">
					                  <label for="inputText" class="col-sm-2 col-form-label">회원명</label>
					                  <div class="col-sm-3">
					                    <span>${book.memberName }</span>
					                  </div>
					                  </div>
					                   <div class="row mb-3">
					                  <label for="inputText" class="col-sm-2 col-form-label">휴대폰번호</label>
					                  <div class="col-sm-2">
					                    <p><input type="number" class="form-control" name="memberPhone" value="${book.memberPhone }"></p>
					                  </div>
					                  </div>
					                <div class="row mb-3">
					                  <label for="inputText" class="col-sm-2 col-form-label">공연장명</label>
					                  <div class="col-sm-5">
										<input type="text" class="form-control" name="hallName" value="${book.hallName }">
					                  </div>
					                  </div>
					                <div class="row mb-3">
					                  <label for="inputText" class="col-sm-2 col-form-label">대여장소명</label>
					                  <div class="col-sm-5">
										<input type="text" class="form-control" name="hallName" value="${book.hallSpaceName }">
					                  </div>
					                </div>
					                 <div class="row mb-3">
					                  <label for="inputText" class="col-sm-2 col-form-label">주소</label>
					                  <div class="col-sm-5">
										<input type="text" class="form-control" name="hallName" value="${book.hallAddress }">
					                 	<input type="button" onclick="execDaumPostcode()" style="margin-left:85%; margin-top:2px;background-color: #FAFAFA; border-color: #e9ecef;" value="주소찾기"><br>
					                  </div>
					                </div>
					                <br><br>
									<div class="d-flex col-md-12 justify-content-end">
								            <input type="button" class="btn" style="background-color: #FAFAFA; border-color: #e9ecef;"onClick="deleteBooking(${book.bookingNo});" value="삭제">
								            <button type="submit" class="btn" onclick="modifyalert();" style="background-color: #FAFAFA; border-color: #e9ecef;">수정</button>
								            <button type="button" class="btn" style="background-color: #FAFAFA; border-color: #e9ecef;"onClick="location.href='/admin/booklist.do';">목록</button>
									</div>
              					</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>

<jsp:include page="../inc/adfooter.jsp"></jsp:include>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
			 function execDaumPostcode() {
			        new daum.Postcode({
			        	oncomplete : function(data){
			        		document.querySelector("#member_roadAddress").value = data.roadAddress;
			        		
			        	}
			        }).open();
			 }
			 
			 function modifyalert(){
					if(confirm("수정하시겠습니까?")){
						alert("수정되었습니다.");
						return true;
					} else{
						return false;
					}
				}
				function deleteBooking(bookingNo) {
					if (confirm("삭제하시겠습니까?")) {
						return true;
					} else{
						alert("삭제 실패하였습니다.");
						return false;
					}
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
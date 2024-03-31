<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
</head>
<body>
<jsp:include page="../inc/adheader.jsp"></jsp:include>

<main id="main" class="main">
		<div class="pagetitle">
			<h1>Notice</h1>
		</div>
		<!-- End Page Title -->
		<br>
		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">NOTICE</h5>
								<form action="/admin/notimodify.do" method="post" enctype="multipart/form-data">
						              <input type="hidden" name="noticeNo" 		 value="${notice.noticeNo }">
						              <input type="hidden" name="noticeFileName" 	 value="${notice.noticeFileName }">
									  <input type="hidden" name="noticeFileRename" value="${notice.noticeFileRename }">
									  <input type="hidden" name="noticeFilePath" 	 value="${notice.noticeFilePath }">
									  <input type="hidden" name="noticeFileLength" value="${notice.noticeFileLength }">
						                <div class="row mb-3">
						                  <label for="inputText" class="col-sm-2 col-form-label">제목</label>
						                  <div class="col-sm-10">
						                    <input type="text" class="form-control" name="noticeSubject" value="${notice.noticeSubject }">
						                  </div>
						                </div>
						                <div class="row mb-3">
						                  <label for="inputNumber" class="col-sm-2 col-form-label">첨부파일</label>
						                  <div class="col-sm-10">
						                  	<div class="box" style="padding: 4px 0 0 6px; height: 35px; border: 1px solid #DCE2E3; border-radius: 5px;">
												<span><a style="color:black;" href='../resources/nuploadFiles/${notice.noticeFileRename }' download>${notice.noticeFileName }</a></span>
											</div>
											<input type="file" name="reloadFile">
						                  </div>
						                </div>
						                <div class="row mb-3">
						                  <label for="inputPassword" class="col-sm-2 col-form-label">내용</label>
						                  <div class="col-sm-10">
						                    <textarea class="form-control" rows="10" cols="51" name="noticeContent">${notice.noticeContent }</textarea>
						                  </div>
						                </div>
						                <br><br>
										<div class="d-flex col-md-12 justify-content-end">
									            <button type="submit" class="btn" style="background-color: #FAFAFA; border-color: #e9ecef;">수정</button>
									            <button type="button" class="btn" style="background-color: #FAFAFA; border-color: #e9ecef;" onclick="showNoticeList();">목록</button>
										</div>
						              </form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>

<jsp:include page="../inc/adfooter.jsp"></jsp:include>
<script type="text/javascript">
			function showNoticeList() {
				location.href = "/admin/notilist.do";
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
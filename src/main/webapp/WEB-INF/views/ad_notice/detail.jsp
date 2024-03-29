<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<jsp:include page="../inc/adheader.jsp"></jsp:include>
<div id="adnoticedetail">
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
							<div class="d-flex col-md-12 justify-content-end">
					            <button type="button" class="btn" style="background-color: #FAFAFA; border-color: #e9ecef;" onclick="showModifyPage();">수정</button>
					            <button type="button" class="btn" style="background-color: #FAFAFA; border-color: #e9ecef;" onclick="deleteNotice(${notice.noticeNo});">삭제</button>
					            <button type="button" class="btn" style="background-color: #FAFAFA; border-color: #e9ecef;" onclick="showNoticeList();">목록</button>
							</div>
							<br>
							<!-- Modal Dialog Scrollable -->
              <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalDialogScrollable">
                Modal Dialog Scrollable
              </button>
              <div class="modal fade" id="modalDialogScrollable" tabindex="-1">
                <div class="modal-dialog modal-dialog-scrollable">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">공지사항</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <table class="table table-striped">
								<tbody>
									
										<tr>
											<td width="230px">번호</td>
											<td>${notice.noticeNo }</td>
										</tr>
										<tr>
											<td>제목</td>
											<td>${notice.noticeSubject }</td>
										</tr>
										<tr>
											<td>작성자</td>
											<td>${notice.noticeWriter }</td>
										</tr>
										<tr>
											<td>등록일</td>
											<td>${notice.noticeDate }</td>
										</tr>
										<c:if test="${notice.noticeFileRename ne null }">
										<tr>
											<td>첨부파일</td>
											<td><span><a style="color:black;" href='../resources/nuploadFiles/${notice.noticeFileRename }' download>${notice.noticeFileName }</a></span></td>
										</tr>
										</c:if>
										<tr>
											<td>내용</td>
											<td><textarea rows="10" style="border:0px; background-color:transparent" readonly>${notice.noticeContent }</textarea></td>
										</tr>
									
								</tbody>
							</table>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                      <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                  </div>
                </div>
              </div><!-- End Modal Dialog Scrollable-->
							<!-- Default Table -->
							<table class="table table-striped">
								<tbody>
									
										<tr>
											<td width="230px">번호</td>
											<td>${notice.noticeNo }</td>
										</tr>
										<tr>
											<td>제목</td>
											<td>${notice.noticeSubject }</td>
										</tr>
										<tr>
											<td>작성자</td>
											<td>${notice.noticeWriter }</td>
										</tr>
										<tr>
											<td>등록일</td>
											<td>${notice.noticeDate }</td>
										</tr>
										<c:if test="${notice.noticeFileRename ne null }">
										<tr>
											<td>첨부파일</td>
											<td><span><a style="color:black;" href='../resources/nuploadFiles/${notice.noticeFileRename }' download>${notice.noticeFileName }</a></span></td>
										</tr>
										</c:if>
										<tr>
											<td>내용</td>
											<td><textarea rows="10" cols="145" style="border:0px; background-color:transparent" readonly>${notice.noticeContent }</textarea></td>
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
			function showModifyPage() {
				var noticeNo = "${notice.noticeNo }";
				location.href = "/admin/notimodify.do?noticeNo=" + noticeNo;
			}
			
			function deleteNotice(noticeNo) {
				if (confirm("삭제하시겠습니까?")) {
					location.href = "/admin/notidelete.do?noticeNo=" + noticeNo;
				}
			}
			
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
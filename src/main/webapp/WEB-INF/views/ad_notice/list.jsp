<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN QNA NEW CSS LIST</title>
</head>
<body>
<jsp:include page="../inc/adheader.jsp"></jsp:include>
			<c:forEach items="${nList }" var="notice" varStatus="i">
              <div class="modal fade" id="modalDialogScrollable${i.count }" tabindex="-1">
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
              </c:forEach>
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
							<!-- Default Table -->
							<table class="table table-hover">
								<thead>
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성날짜</th>
	
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${nList }" var="notice" varStatus="i">
										<tr>
											<td>${notice.noticeNo }</td>
											<td><a data-bs-toggle="modal" data-bs-target="#modalDialogScrollable${i.count }"
												href="/admin/notidetail.do?noticeNo=${notice.noticeNo }">
													${notice.noticeSubject } </a></td>
											<td>${notice.noticeWriter }</td>
											<td>${notice.noticeDate }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
								<div class="d-flex flex-wrap justify-content-center align-items-center pb-5">
				                    <div class="d-flex col-md-6 justify-content-start">
				                        <form class="row g-1" action="/admin/notisearch.do" method="get">
				                            <div class="col-auto">
				                                <select class="form-select" name="searchCondition">
				                                	<option value="all" selected>전체</option>
									                <option value="writer">작성자</option>
									                <option value="title">제목</option>
									                <option value="content">내용</option>
				                                </select>
				                            </div>
				                            <div class="col-auto">
				                                <div class="input-group">
				                                    <input class="form-control" type="search" name="searchKeyword" placeholder="${searchKeyword }">
				                                    <button type="submit" class="btn" style="background-color: #FAFAFA; border-color: #e9ecef;">검색</button>
				                                </div>
				                            </div>
				                        </form>
				                    </div>
								<div class="d-flex col-md-6 justify-content-end">
					            	<button type="button" class="btn" style="background-color: #FAFAFA; border-color: #e9ecef;" onclick="showInsertForm();">글쓰기</button>
								</div>
								<div class="row mt-3 mb-5" style="margin-top:300px;">
									<div class="col-md-12">
										<nav aria-label="Page navigation example">					
											<ul class="pagination justify-content-center" style="font-weight: 600; ">
												<c:if test="${pi.startNavi ne '1' }">
													<li class="page-item">
								                       <a class="page-link rounded-circle" href="/admin/notilist.do?page=${pi.startNavi - 1 }" aria-label="Previous">
								                           <span aria-hidden="true">&laquo;</span>
								                       </a>
													</li>
												</c:if>
												<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
													 <li class="page-item">
					                                     <a class="page-link rounded-circle mx-2" href="/admin/notilist.do?page=${p }" style="border: none; color: #313131;">
					                                         ${p }
					                                     </a>
				                                 	</li>
												</c:forEach>
												<c:if test="${pi.endNavi ne pi.naviTotalCount }">
													<li class="page-item">
					                                     <a class="page-link rounded-circle" href="/admin/notilist.do?page=${pi.endNavi + 1 }" aria-label="Next">
					                                         <span aria-hidden="true">&raquo;</span>
					                                     </a>
				                                 	</li>
												</c:if>
											</ul>
										</nav>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>

<jsp:include page="../inc/adfooter.jsp"></jsp:include>
<script>
			function showInsertForm() {
				// 공지사항 글쓰기 페이지 이동
				location.href="/admin/notiregister.do";
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
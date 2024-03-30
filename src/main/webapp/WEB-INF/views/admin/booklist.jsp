<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약관리</title>
<style>
	#adnoticesearch {
		margin: auto;
	}
</style>
</head>
<body>
	<jsp:include page="../inc/adheader.jsp"></jsp:include>
	
<!-- 	모달 시작 -->
	<!-- //	모달 시작 -->
				<c:forEach items="${bList }" var="book" varStatus="i">    
              <div class="modal fade" id="modalDialogScrollable${i.count }" tabindex="-1">
                <div class="modal-dialog modal-dialog-scrollable">
                  <div class="modal-content" style="margin-top: 40%;">
                    <div class="modal-header">
                      <h5 class="modal-title">[예약 상세정보]</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <table class="table table-striped">
								<tbody>
										<tr>
											<th colspan="2">[예약정보]</th>
										</tr>

										<tr>
											<td style="width:230px">예약번호</td>
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
                    <div class="modal-footer">
                      	<button type="button" class="btn" style="background-color: #FAFAFA; border-color: #e9ecef;" onClick="showModifyPage(${book.bookingNo });">정보변경</button>
						<input type="reset" class="btn" style="background-color: #FAFAFA; border-color: #e9ecef;" value="확인" data-bs-dismiss="modal" aria-label="Close"/>
                    </div>
                  </div>
                </div>
              </div>
              </c:forEach>
	<!-- End Modal Dialog Scrollable-->
	
	
	
	
	<main id="main" class="main">
		<div class="pagetitle">
			<h1>예약 관리</h1>
		</div>
		<!-- End Page Title -->
		<br>
		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">예약 목록</h5>
							<!-- Default Table -->
							<input type="hidden" name="bookingNo" value="${book.bookingNo }" id="bookingNo"/>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>번호</th>
										<th>회원명</th>
										<th>휴대폰번호</th>
										<th>공연장명</th>
										<th>대여 장소명</th>
										<th>주소</th>
										<th>시작일</th>
										<th>종료일</th>
									</tr>
									
								</thead>
								<tbody>
								<c:choose>
										<c:when test="${fn:length(bList) !=0 }">
											<c:forEach items="${bList }" var="book" varStatus="i">
												<tr>
													<td><a data-bs-toggle="modal" data-bs-target="#modalDialogScrollable${i.count }"
													href="/admin/bookingDetail.do?bookingNo=${book.bookingNo }">${i.count }</a></td>
													<td><a data-bs-toggle="modal" data-bs-target="#modalDialogScrollable${i.count }"
													href="/admin/bookingDetail.do?bookingNo=${book.bookingNo }">${book.memberName }</a></td>
													<td><a data-bs-toggle="modal" data-bs-target="#modalDialogScrollable${i.count }"
													href="/admin/bookingDetail.do?bookingNo=${book.bookingNo }">${book.memberPhone }</a></td>
													<td><a data-bs-toggle="modal" data-bs-target="#modalDialogScrollable${i.count }"
													href="/admin/bookingDetail.do?bookingNo=${book.bookingNo }">${book.hallName }</a></td>
													<td><a data-bs-toggle="modal" data-bs-target="#modalDialogScrollable${i.count }"
													href="/admin/bookingDetail.do?bookingNo=${book.bookingNo }">${book.hallSpaceName }</a></td>
													<td><a data-bs-toggle="modal" data-bs-target="#modalDialogScrollable${i.count }"
													href="/admin/bookingDetail.do?bookingNo=${book.bookingNo }">${book.hallAddress }</a></td>
													<td><a data-bs-toggle="modal" data-bs-target="#modalDialogScrollable${i.count }"
													href="/admin/bookingDetail.do?bookingNo=${book.bookingNo }">${book.bookingStartTime}</a></td>
													<td><a data-bs-toggle="modal" data-bs-target="#modalDialogScrollable${i.count }"
													href="/admin/bookingDetail.do?bookingNo=${book.bookingNo }">${book.bookingEndTime}</a></td>
												</tr>
												
											</c:forEach>
											
										</c:when>
										<c:otherwise>
											<td class="admin_list_fifth_td" colspan="8">
												<p class="nullmsg" style="width:30%; margin:0 auto; padding-top:50px;padding-bottom:50px;">
													등록된 예약이 없습니다.<br>
												</p>
										</c:otherwise>
									</c:choose>
									
								</tbody>
							</table>
								<div class="d-flex flex-wrap justify-content-center align-items-center pb-5">
				                    <div class="d-flex col-md-6 justify-content-start">
				                       <form class="row g-1" action="/admin/booksearch.do"
										name="adm_form" method="get">
										<div class="col-auto">
											<select class="form-select" name="searchCondition"  id="searchcon">
												<option value="all">전체</option>
												<option value="memberName">회원명</option>
												<option value="memberPhone">휴대폰번호</option>
												<option value="hallName">공연장명</option>
												<option value="bookingStartTime">시작일</option>
												<option value="bookingEndTime">종료일</option>
											</select>
										</div>	
										<div class="col-auto">
											<div class="input-group">
												<input class="form-control" type="search"
													name="searchKeyword" placeholder="검색어를 입력해주세요"
													>
												<button type="submit" class="btn"
													style="background-color: #FAFAFA; border-color: #e9ecef;"
													onClick="return Checkalert();">검색</button>
												<button type="reset"
													class="btn search_reset"
													onClick="removeWord();"
													style="display:none;background-color: #FAFAFA; border-color:#e9ecef;">초기화</button>
											</div>
										</div>
									</form>
				                    </div>
								<div class="d-flex col-md-6 justify-content-end">
					            	<button type="button" class="btn" style="display:none; background-color: #FAFAFA; border-color: #e9ecef;" onclick="showInsertForm();">글쓰기</button>
								</div>
								<div class="row mt-3 mb-5" style="margin-top:300px;">
									<div class="col-md-12">
										<nav aria-label="Page navigation example">					
											<ul class="pagination justify-content-center" style="font-weight: 600; ">
												<c:if test="${pInfo.startNavi ne '1' }">
													<li class="page-item">
								                       <a class="page-link rounded-circle" href="/admin/booklist.do?page=${pInfo.startNavi - 1 }" aria-label="Previous">
								                           <span aria-hidden="true">&laquo;</span>
								                       </a>
													</li>
												</c:if>
												<c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }" var="p">
													 <li class="page-item">
					                                     <a class="page-link rounded-circle mx-2" href="/admin/booklist.do?page=${p }" style="border: none; color: #313131;">
					                                         ${p }
					                                     </a>
				                                 	</li>
												</c:forEach>
												<c:if test="${pInfo.endNavi ne pInfo.naviTotalCount }">
													<li class="page-item">
					                                     <a class="page-link rounded-circle" href="/admin/booklist.do?page=${pInfo.endNavi + 1 }" aria-label="Next">
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
	<!-- End #main -->

	<jsp:include page="../inc/adfooter.jsp"></jsp:include>
	<script>
	function showModifyPage(bookingNo) {
		location.href = "/admin/bookmodify.do?bookingNo="+bookingNo;
	}
	
	function Checkalert() {
		if (adm_form.searchKeyword.value == "") {
			adm_form.searchKeyword
					.focus();
			alert("검색어를 입력해주세요.");
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
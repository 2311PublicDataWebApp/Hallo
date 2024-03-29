<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 관리</title>
<style>
	#adnoticesearch {
		margin: auto;
	}
</style>
</head>
<body>
	<jsp:include page="../inc/adheader.jsp"></jsp:include>
	<div id="adnoticesearch">
	<main id="main" class="main">
		<div class="pagetitle">
			<h1>Q&A 관리</h1>
		</div>
		<!-- End Page Title -->
		<br>
		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">1:1문의 관리</h5>
							<!-- Default Table -->
							<table class="table table-hover">
								<thead>
									<tr>
										<th>번호</th>
										<th>상태</th>
										<th>제목</th>
										<th>작성자</th>
										<th>휴대폰번호</th>
										<th>작성날짜</th>
	
									</tr>
								</thead>
								<tbody>
								<c:choose>
										<c:when test="${fn:length(qList) !=0 }">
											<c:forEach items="${qList }" var="qna" varStatus="i">
												<tr class="qna_admin_list_td">
													<td><a
														href="/admin/qnaAdminDetail.do?qnaNo=${qna.qnaNo }">${i.count }</a></td>

													<c:set var="qStatus" value="${qna.qnaStatus }" />
													<c:if test="${qStatus eq 'NEW' }">
														<td><a
															href="/admin/qnaAdminDetail.do?qnaNo=${qna.qnaNo }">신규등록</a></td>
													</c:if>
													<c:if test="${qStatus eq 'END'}">
														<td><a
															href="/admin/qnaAdminDetail.do?qnaNo=${qna.qnaNo }">답변완료</a></td>
													</c:if>

													<td><a
														href="/admin/qnaAdminDetail.do?qnaNo=${qna.qnaNo }">${qna.qnaTitle }</a></td>
													<td><a
														href="/admin/qnaAdminDetail.do?qnaNo=${qna.qnaNo }">${qna.memberName }</a></td>
													<td><a
														href="/admin/qnaAdminDetail.do?qnaNo=${qna.qnaNo }">${qna.qnaPhone }</a></td>
													<td><a
														href="/admin/qnaAdminDetail.do?qnaNo=${qna.qnaNo }">${qna.qnaDate}</a></td>
												</tr>
											</c:forEach>
											
														</td>
												</tr>
											</div>
										</c:when>
										<c:otherwise>
											<td class="admin_list_fifth_td" colspan="7">
												<p class="nullmsg" style="width:30%; margin:0 auto; padding-top:50px;padding-bottom:50px;">
													등록된 게시물이 없습니다.<br>
												</p>
										</c:otherwise>
									</c:choose>
									
								</tbody>
							</table>
								<div class="d-flex flex-wrap justify-content-center align-items-center pb-5">
				                    <div class="d-flex col-md-6 justify-content-start">
				                       <form class="row g-1" action="/admin/qnasearch.do"
										name="adm_form" method="get">
										<div class="col-auto">
											<select class="form-select" name="searchCondition"  id="searchqnacon">
												<option value="all">전체</option>
												<option value="memberId">아이디</option>
												<option value="memberName">이름</option>
												<option value="qnaStatus">상태</option>
												<option value="qnaTitle">제목</option>
												<option value="qnaDate">작성일시</option>
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
								                       <a class="page-link rounded-circle" href="/admin/qnalist.do?page=${pInfo.startNavi - 1 }" aria-label="Previous">
								                           <span aria-hidden="true">&laquo;</span>
								                       </a>
													</li>
												</c:if>
												<c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }" var="p">
													 <li class="page-item">
					                                     <a class="page-link rounded-circle mx-2" href="/admin/qnalist.do?page=${p }" style="border: none; color: #313131;">
					                                         ${p }
					                                     </a>
				                                 	</li>
												</c:forEach>
												<c:if test="${pInfo.endNavi ne pInfo.naviTotalCount }">
													<li class="page-item">
					                                     <a class="page-link rounded-circle" href="/admin/qnalist.do?page=${pInfo.endNavi + 1 }" aria-label="Next">
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
	</div>

	<jsp:include page="../inc/adfooter.jsp"></jsp:include>
	<script>
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
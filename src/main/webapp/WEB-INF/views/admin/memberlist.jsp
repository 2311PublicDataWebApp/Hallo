<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<style>
	#adnoticesearch {
		margin: auto;
	}
</style>
</head>
<body>
	<!-- //	모달 시작 -->
				<c:forEach items="${mList }" var="member" varStatus="i">    
              <div class="modal fade" id="modalDialogScrollable${i.count }" tabindex="-1">
                <div class="modal-dialog modal-dialog-scrollable">
                  <div class="modal-content" style="margin-top: 40%;">
                    <div class="modal-header">
                      <h5 class="modal-title">[회원 상세정보]</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <table class="table table-striped">
								<tbody>

										<tr>
											<td style="width:230px">아이디</td>
											<td>${member.memberId }</td>
										</tr>
										<tr>
											<td>회원명</td>
											<td>${member.memberName }</td>
										</tr>
										<tr>
											<td>이메일</td>
											<td>${member.memberEmail }</td>
										</tr>
										<tr>
											<td>휴대폰번호</td>
											<td>${member.memberPhone}</td>
										</tr>
										<tr>
											<td>가입일</td>
											<td>${member.memberDate}</td>
										</tr>
										
									</tbody>
							</table>
                    </div>
                    <div class="modal-footer">
						<input type="reset" class="btn" style="background-color: #FAFAFA; border-color: #e9ecef;" value="확인" data-bs-dismiss="modal" aria-label="Close"/>
                      
                    </div>
                  </div>
                </div>
              </div>
              </c:forEach>
	<!-- End Modal Dialog Scrollable-->
	
	



	<jsp:include page="../inc/adheader.jsp"></jsp:include>
	<div id="adnoticesearch">
	<main id="main" class="main">
		<div class="pagetitle">
			<h1>회원관리</h1>
		</div>
		<!-- End Page Title -->
		<br>
		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">회원조회</h5>
							<!-- Default Table -->
							<table class="table table-hover">
								<thead>
									<tr>
										<th>번호</th>
										<th>아이디</th>
										<th>이름</th>
										<th>이메일</th>
										<th>휴대폰번호</th>
										<th>주소</th>
										<th>가입일</th>
	
									</tr>
								</thead>
								<tbody>
								<c:choose>
										<c:when test="${fn:length(mList) !=0 }">
											<c:forEach items="${mList }" var="member" varStatus="i">
												<tr>
													<td><a data-bs-toggle="modal" data-bs-target="#modalDialogScrollable ${i.count }"
														href="/admin/memberlist.do?memberId=${member.memberId}">${i.count }</a></td>
													<td><a data-bs-toggle="modal" data-bs-target="#modalDialogScrollable${i.count }"
														href="/admin/memberlist.do?memberId=${member.memberId}">${member.memberId }</a></td>
													<td><a data-bs-toggle="modal" data-bs-target="#modalDialogScrollable${i.count }"
														href="/admin/memberlist.do?memberId=${member.memberId}">${member.memberName }</a></td>
													<td><a data-bs-toggle="modal" data-bs-target="#modalDialogScrollable${i.count }"
														href="/admin/memberlist.do?memberId=${member.memberId}">${member.memberEmail }</a></td>
													<td><a data-bs-toggle="modal" data-bs-target="#modalDialogScrollable${i.count }"
														href="/admin/memberlist.do?memberId=${member.memberId}">${member.memberPhone}</a></td>
													<td><a data-bs-toggle="modal" data-bs-target="#modalDialogScrollable${i.count }"
														href="/admin/memberlist.do?memberId=${member.memberId}">${member.memberAddress}</a></td>
													<td><a data-bs-toggle="modal" data-bs-target="#modalDialogScrollable${i.count }"
														href="/admin/memberlist.do?memberId=${member.memberId}">${member.memberDate}</a></td>
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
				                       <form class="row g-1" action="/admin/membersearch.do"
										name="adm_form" method="post">
										<div class="col-auto">
											<select class="form-select" name="searchCondition"  id="searchcon">
												<option value="all">전체</option>
												<option value="memberId">아이디</option>
												<option value="memberName">이름</option>
												<option value="memberEmail">이메일</option>
												<option value="memberPhone">전화번호</option>
												<option value="memberDate">가입일</option>
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
												<button type="button"
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
								                       <a class="page-link rounded-circle" href="/admin/memberlist.do?page=${pInfo.startNavi - 1 }" aria-label="Previous">
								                           <span aria-hidden="true">&laquo;</span>
								                       </a>
													</li>
												</c:if>
												<c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }" var="p">
													 <li class="page-item">
					                                     <a class="page-link rounded-circle mx-2" href="/admin/memberlist.do?page=${p }" style="border: none; color: #313131;">
					                                         ${p }
					                                     </a>
				                                 	</li>
												</c:forEach>
												<c:if test="${pInfo.endNavi ne pInfo.naviTotalCount }">
													<li class="page-item">
					                                     <a class="page-link rounded-circle" href="/admin/memberlist.do?page=${pInfo.endNavi + 1 }" aria-label="Next">
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
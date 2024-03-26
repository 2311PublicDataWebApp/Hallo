<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="../inc/admin/adminhead.jsp"></jsp:include>


<form action="/admin/qnaAdminList.do" method="POST">

	<!-- Admin Header Import -->
	<jsp:include page="../inc/admin/adminheader.jsp"></jsp:include>
	<!-- /Admin Header Import -->

	<div class="adm_all">

		<!-- Admin LNB Import -->
		<jsp:include page="../inc/admin/adminlnb.jsp"></jsp:include>
		<!-- / Admin LNB Import -->


		<div class="adm_content">
			<!-- content 시작 부분  -->
			<h4 class="section_title">고객센터관리</h4>
			<h5 class="section_sub_title">1:1문의 관리</h5>


			<div class="gridSection">

				<table style="border-radius: 8px;"
					class="table table-hover table-striped table-bordered">
					<thead class="thead">
						<tr style="border-top:0;">
							<td style="border:0; text-align:left; vertical-align:bottom; font-size:small; padding-bottom:20px;" colspan="2">총 ${totalCount}명</td>
							<td style="border:0; text-align:center; padding-bottom:20px; " colspan="3">
							<div class="admsearch">
					<form action="/admin/searchCondition.do" method="post">
						<select name="searchCondition" id="searchcon">
							<option value="SearchCondition">검색조건</option>
							<option value="MemberId">아이디</option>
							<option value="MemberName">이름</option>
							<option value="qnaStatus">상태</option>
							<option value="qnaTitle">제목</option>
							<option value="qnaDate">작성일시</option>
						</select> 
						<input type="text" name="SearchValue" placeholder="검색어를 입력해주세요">
						<button onclick="#">조회</button>
					</form>
					</div>
					
					</td>
							<td style="border:0; text-align:right; vertical-align:bottom; padding-bottom:20px;">기본 가입일 최신 순</td>
						</tr>
						<tr class="gridtr">
							<th style="width:50px;" class="firstsection">번호</th>
							<th style="width:100px;" class="secondsection">상태</th>
							<th style="width:400px;" class="thirdsection">제목</th>
							<th style="width:100px;" class="fourthsection">작성자</th>
							<th style="width:150px;" class="fifthsection">휴대폰번호</th>
							<th style="width:200px;" class="sixthsection">작성일</th>
						</tr>
					</thead>
					<tbody class="gridtd">
						<c:choose>
							<c:when test="${fn:length(qList) !=0 }">
								<c:forEach items="${qList }" var="qna" varStatus="i">
									<tr class="qna_admin_list_td">
										<td class="admin_list_first_td">${i.count }</td>
										<c:set var="qStatus" value="${qna.qnaStatus }" />
										<c:if test="${qStatus eq 'NEW' }">
											<td class="list_third_td">신규등록</td>
										</c:if>
										<c:if test="${qStatus eq 'END'}">
											<td class="list_third_td">답변완료</td>
										</c:if>
										<td class="admin_list_third_td">${qna.qnaTitle }</td>
										<td class="admin_list_fourth_td">${qna.memberName }</td>
										<td class="admin_list_fifth_td">${qna.qnaPhone }</td>
										<td class="admin_list_seventh_td">${qna.qnaDate}</td>
									</tr>
								</c:forEach>
								<div class="pageNation">
									<tr align="center" class="qna_pgn">
										<td colspan="6"><c:if test="${pInfo.startNavi ne '1' }">
												<a
													href="/admin/qnaAdminList.do?page=${pInfo.startNavi - 1 }">[이전]</a>
											</c:if> <c:forEach begin="${pInfo.startNavi }"
												end="${pInfo.endNavi }" var="p">
												<a href="/admin/qnaAdminList.do?page=${p }">${p }</a>
											</c:forEach> <c:if test="${pInfo.endNavi ne pInfo.naviTotalCount }">
												<a href="/admin/qnaAdminList.do?page=${pInfo.endNavi + 1 }">[다음]</a>
											</c:if></td>
									</tr>
								</div>
							</c:when>
							<c:otherwise>
								<td class="admin_list_fifth_td" colspan="7">
									<p class="qna_nullmsg">
										등록된 게시물이 없습니다.</br>
									</p>
							</c:otherwise>
						</c:choose>

					</tbody>
				</table>
			</div>
		</div>
		<!-- content 닫히는 부분 -->
		</table>
	</div>
	<!--all 닫히는 부분  -->
</form>
</body>
</html>
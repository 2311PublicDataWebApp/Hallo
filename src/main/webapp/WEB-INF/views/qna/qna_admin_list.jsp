<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../inc/admin/adminhead.jsp"></jsp:include>

<form action="/admin/qnaAdminList.do" method="POST">
	<jsp:include page="../inc/admin/adminheader.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<div class="adm_all">
		<div class="admlnb">
			<ul>
				<li>[어드민]</li>
				<li>회원관리</li>
				<li>공연장관리</li>
				<li>예약관리</li>
				<li>고객센터관리
					<ul>
						<li>1:1문의 관리</li>
						<li>공지사항 관리</li>
					</ul>
				</li>

			</ul>
		</div>
		<!-- nav 닫히는 부분  -->

		<div class="adm_content">
			<!-- content 시작 부분  -->
			<h4 class="section_title">고객센터관리</h4>
			<h5 class="section_sub_title">1:1문의 관리</h5>

			<div class="gridinfo">
				<p class="totalcount">총 100명</p>
				<div class="admsearch">
					<form action="/admin/searchCondition.do" method="post">
						<select name="searchCondition" id="searchcon">
							<option value="SearchCondition">검색조건</option>
							<option value="MemberId">아이디</option>
							<option value="MemberName">이름</option>
							<option value="MemberEmail">이메일</option>
							<option value="MemberPhone">전화번호</option>
						</select> <input type="text" name="SearchValue" placeholder="검색어를 입력해주세요">
						<button onclick="#">조회</button>
					</form>
				</div>
				<!--Search 영역 닫히는 부분  -->
				<p class="scdefaultview">기본 가입일 최신 순</p>
			</div>


			<div class="gridSection">

				<table style="border-radius: 8px;"
					class="table table-hover table-striped table-bordered">
					<thead class="thead">
						<tr class="gridtr">
							<th class="firstsection">번호</th>
							<th class="secondsection">아이디</th>
							<th class="thirdsection">이름</th>
							<th class="fourthsection">이메일</th>
							<th class="fifthsection">전화번호</th>
							<th class="sixthsection">주소</th>
							<th class="seventhsection">가입일</th>
						</tr>
					</thead>
					<tbody class="gridtd">
						<c:choose>
							<c:when test="${fn:length(aList) !=0 }">
								<c:forEach items="${aList }" var="qna" varStatus="i">
									<tr class="qna_admin_list_td">
										<td class="admin_list_first_td">${i.count }</td>
										<td class="admin_list_first_td">${qna.memberId }</td>
										<td class="admin_list_first_td">${qna.memberName }</td>
										<td class="admin_list_first_td">${qna.memberName }</td>
										<td class="admin_list_second_td">
										<a href="/qna/qnadetail.do?qnaNo=${qna.qnaNo }">${qna.qnaTitle }</a></td>
										<td class="admin_list_third_td">${qna.qnaStatus }</td>
										<td class="admin_list_fourth_td">${qna.qnaDate}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<td class="admin_list_fifth_td" colspan="5">
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
		<div class="pageNation">
			<tr align="center" class="qna_pgn">
							<td colspan="5"><c:if test="${pInfo.startNavi ne '1' }">
									<a href="/admin/qnaAdminlist.do?page=${pInfo.startNavi - 1 }">[이전]</a>
								</c:if> <c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }"
									var="p">
									<a href="/admin/qnaAdminlist.do?page=${p }">${p }</a>
								</c:forEach> <c:if test="${pInfo.endNavi ne pInfo.naviTotalCount }">
									<a href="/admin/qnaAdminlist.do?page=${pInfo.endNavi + 1 }">[다음]</a>
								</c:if></td>
						</tr>
				</table>
		</div>
	</div>
	<!-- gridSection 닫히는 부분-->

	</div>
	<!--all 닫히는 부분  -->


	</div>
	<!--all 닫히는 부분  -->
</form>
</body>
</html>
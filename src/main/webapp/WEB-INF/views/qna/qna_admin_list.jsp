<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../inc/admin/adminhead.jsp"></jsp:include>

<form action="/admin/memberManage.do" method="POST">
	<jsp:include page="../inc/admin/adminheader.jsp"></jsp:include>

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

				<table style="border-radius:8px;" class="table table-hover table-striped table-bordered">
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
						<tr>
							<td style="text-align: center;">01</td>
							<td style="text-align: center;">khuser01</td>
							<td style="text-align: center;">일용자</td>
							<td style="text-align: center;">khuser01@mail.com</td>
							<td style="text-align: center;">010-1234-1234</td>
							<td style="text-align: center;">서울시 중구 남대문로 120</td>
							<td style="text-align: center;">2024-03-30</td>
						</tr>
						
					</tbody>
				</table>
			</div>
		</div>
		<!-- content 닫히는 부분 -->
		<div class="pageNation">
			<!-- 			<p><< < 1 2 3 4 5 6 7 8 9 10 > >></p> -->
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
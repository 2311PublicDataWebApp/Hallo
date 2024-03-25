<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 목록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link href="../resources/css_qna/qna.css" rel="stylesheet" />

</head>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<!-- 공통 / 헤더 -->
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<div class="tempheader"></div>

	<!-- LNB 영역 -->
	<diV class="tempLnb" style=""></diV>


	<!-- QNA 영역 코드 시작 -->
	<form action="/qna/list.do" method="post">
		<div class="qna_list_all">

			<div class="title qnatitle">
				<h2 class="qna_main_title">1:1 문의</h2>
				<h3 class="qna_sub_title">1:1문의 목록</h3>
			</div>
			<!-- 타이틀 닫히는 곳 -->


			<div class="qna_list">
				<c:choose>
					<c:when test="${fn:length(qList) !=0 }">
						<input type="button" class="list_reg_btn"
							onclick="location.href='/qna/regist.do';" value="등록하기" />
					</c:when>
					<c:otherwise>
						<input type="hidden" class="list_reg_btn"
							onclick="location.href='/qna/regist.do';" value="등록하기" />
					</c:otherwise>
				</c:choose>

				<br>
				<c:choose>
					<c:when test="${fn:length(qList) !=0 }">
						<span class="myTotal">총 ${mytotalCount }개</span>
					</c:when>
					<c:otherwise>
						<span class="myTotal" style="visibility: hidden">
						총 ${mytotalCount }개</span>
					</c:otherwise>
				</c:choose>




				<table class="qna_list_table">
					<thead>
						<tr>
							<th class="list_first_th">번호</th>
							<th class="list_second_th">제목</th>
							<th class="list_third_th">상태</th>
							<th class="list_fourth_th">작성일시</th>
						</tr>
					</thead>
					<tbody>

						<c:choose>
							<c:when test="${fn:length(qList) !=0 }">
								<c:forEach items="${qList }" var="qna" varStatus="i">
									<tr class="qna_list_td">
										<td class="list_first_td">${i.count }</td>
										<td class="list_second_td"><a
											href="/qna/detail.do?qnaNo=${qna.qnaNo }">${qna.qnaTitle }</a></td>
										<td class="list_third_td">${qna.qnaStatus }</td>
										<td class="list_fourth_td">${qna.qnaDate}</td>
									</tr>
								</c:forEach>


								<!-- 페이지네이션 위치 -->
								<tr align="center" class="qna_pgn">
									<td colspan="5"><c:if test="${pInfo.startNavi ne '1' }">
											<a href="/qna/list.do?page=${pInfo.startNavi - 1 }">[이전]</a>
										</c:if> <c:forEach begin="${pInfo.startNavi }"
											end="${pInfo.endNavi }" var="p">
											<a href="/qna/list.do?page=${p }">${p }</a>
										</c:forEach> <c:if test="${pInfo.endNavi ne pInfo.naviTotalCount }">
											<a href="/qna/list.do?page=${pInfo.endNavi + 1 }">[다음]</a>
										</c:if></td>
								</tr>
							</c:when>
							<c:otherwise>
								<td class="list_fifth_td" colspan="5">
									<p class="qna_nullmsg">
										등록된 게시물이 없습니다.</br>
									</p>
									<button type="button" class="empty_reg_btn"
										onclick="location.href='/qna/regist.do';">등록하기</button>
							</c:otherwise>
						</c:choose>
				</table>

			</div>
			<!-- qna_list 영역 닫히는 곳 -->
	</form>
	</div>
	</div>

	<!-- qna_list_all 전체 div 닫히는 곳-->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<div class="tempfooter"></div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>예약 목록</title>
		<%@ include file="../inc/head.jsp"%>
	</head>
	<body>
		<jsp:include page="../inc/header.jsp"></jsp:include>
		<div class="container text-center">
			<h1>예약 목록</h1>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">번호</th>
						<th scope="col">회원 번호</th>
						<th scope="col">공연장 번호</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${bList }" var="booking" varStatus="i">
		                <tr>
		                	<th scope="row">${i.count }</th>
		                    <td>${booking.bookingNo }</td>
		                    <td>${booking.memberId }</td>
		                    <td>${booking.hallNo }</td>
		                </tr>
	            	</c:forEach>
				</tbody>
			</table>
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<c:if test="${pi.startNavi ne '1' }">
						<li class="page-item">
							<a class="page-link" href="/booking/list.do?page=${pi.startNavi - 1 }"><<</a>
						</li>
					</c:if>
					<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
						<li class="page-item">
							<a class="page-link" href="/booking/list.do?page=${p }">${p }</a>
						</li>
					</c:forEach>
					<c:if test="${pi.endNavi ne pi.naviTotalCount }">
						<li class="page-item">
							<a class="page-link" href="/booking/list.do?page=${pi.endNavi + 1 }">>></a>
						</li>
					</c:if>
				</ul>
			</nav>
		</div>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</body>
</html>
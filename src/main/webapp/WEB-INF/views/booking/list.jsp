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
		<div class="container">
			<h1>예약 목록</h1>
        <table>
            <thead>
                <tr>
                    <th scope="col">번호</th>
					<th scope="col">회원 번호</th>
					<th scope="col">공연장 번호</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach items="${bList }" var="booking">
	                <tr>
	                    <td>
	                    	<a href="/booking/detail.do?bookingNo=${booking.bookingNo }">
	                    		${booking.bookingNo }
	                    	</a>
	                    </td>
	                    <td>${booking.memberId }</td>
	                    <td>${booking.hallNo }</td>
	                </tr>
            	</c:forEach>
            </tbody>
            <tfoot>
				<tr>
					<td colspan="5" style="text-align:center">
						<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
							<a href="/booking/list.do?page=${p }">${p }</a>
						</c:forEach>
					</td>
				</tr>
            </tfoot>
        </table>
		</div>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</body>
</html>
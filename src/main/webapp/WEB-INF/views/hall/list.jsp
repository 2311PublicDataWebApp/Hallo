<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>공연장 목록</title>
    </head>
    <body>
    	<h1>공연장 목록</h1>
        <table>
            <thead>
                <tr>
                    <th scope="col">이름</th>
					<th scope="col">주소</th>
					<th scope="col">수용인원</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach items="${hList }" var="hall">
	                <tr>
	                    <td>
	                    	<a href="/hall/detail.do?hallNo=${hall.hallNo }">
	                    		${hall.hallName }
	                    	</a>
	                    </td>
	                    <td>${hall.hallAddress }</td>
	                    <td>${hall.hallPeople }</td>
	                </tr>
            	</c:forEach>
            </tbody>
            <tfoot>
				<tr>
					<td colspan="5" style="text-align:center">
						<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
							<a href="#">${p }</a>
						</c:forEach>
					</td>
				</tr>
            </tfoot>
        </table>
    </body>
</html>
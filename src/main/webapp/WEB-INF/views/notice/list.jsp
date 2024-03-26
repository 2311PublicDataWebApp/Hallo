<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>공지사항 목록</title>
<!--         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.min.css"/> -->
    	<link rel="stylesheet" href="../resources/css/main.css">
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <h1>공지사항 목록</h1>
        <table>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성날짜</th>
                    <th>첨부파일</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${nList }" var="notice" varStatus="i">            
                <tr>
                    <td>${notice.noticeNo }</td>
                    <td><a href="/notice/detail.do?noticeNo=${notice.noticeNo }">
                    ${notice.noticeSubject }
                    </a></td>
                    <td>${notice.noticeWriter }</td>
                    <td>${notice.noticeDate }</td>
                    <td>${notice.noticeFileName }</td>
                </tr>
            </c:forEach>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="5" style="text-align: center;">
                        <c:if test="${pi.startNavi ne '1' }">
							<a href="/notice/list.do?page=${pi.startNavi - 1 }">[이전]</a>
						</c:if>
						<c:forEach begin="${pi.startNavi }" end="${pi.endNavi }" var="p">
							<a href="/notice/list.do?page=${p }">${p }</a>
						</c:forEach>
						<c:if test="${pi.endNavi ne pi.naviTotalCount }">
							<a href="/notice/list.do?page=${pi.endNavi + 1 }">[다음]</a>
						</c:if>
                    </td>
                </tr>
                <tr>
					<td colspan="4">
						<form action="/notice/search.do" method="get">
							<select name="searchCondition">
								<option value="all">전체</option>
								<option value="writer" selected>작성자</option>
								<option value="title">제목</option>
								<option value="content">내용</option>
							</select>
							<input type="text" name="searchKeyword" placeholder="검색어를 입력해주세요">
							<input type="submit" value="검색">
						</form>
					</td>
					<td>
						<button type="button" onclick="showInsertForm();">글쓰기</button>
					</td>
				</tr>
            </tfoot>
        </table>
        <script>
			function showInsertForm() {
				// 공지사항 글쓰기 페이지 이동
				location.href="/notice/insert.do";
			}
		</script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"></script>
    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
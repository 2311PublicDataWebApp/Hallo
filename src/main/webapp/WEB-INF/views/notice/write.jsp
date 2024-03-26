<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
</head>
<body>
	<h1>공지사항 등록페이지</h1>
	<form action="/notice/insert.do" method="post" enctype="multipart/form-data">
		제목: <input type="text" name="noticeSubject"> <br>
<!-- 		작성자: <input type="text" name="noticeWriter"> <br> -->
		내용: <textarea rows="5" cols="50" name="noticeContent"></textarea> <br>
		첨부파일: <input type="file" name="uploadFile">
		<input type="submit" value="등록">
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 수정</title>
		<link rel="stylesheet" href="../resources/css/main.css">
	</head>
	<body>
		<h1>공지사항 상세 조회</h1>
		<form action="/notice/modify.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="noticeNo" 		 value="${notice.noticeNo }">
			<!--
				1. 파일이 있으면 삭제할 수 있도록 함
				2. 첨부파일을 선택하지 않고 수정할 때 null로 입력되는 것을 방지할 수 있음!
			-->
			<input type="hidden" name="noticeFileName" 	 value="${notice.noticeFileName }">
			<input type="hidden" name="noticeFileRename" value="${notice.noticeFileRename }">
			<input type="hidden" name="noticeFilePath" 	 value="${notice.noticeFilePath }">
			<input type="hidden" name="noticeFileLength" value="${notice.noticeFileLength }">
			<ul>
				<li>
					<label>제목</label>
					<input type="text" name="noticeSubject" value="${notice.noticeSubject }">
				</li>
				<li>
					<label>작성자</label>
					<span>${notice.noticeWriter }</span>
				</li>
				<li>
					<label>내용</label>
					<textarea rows="4" cols="51" name="noticeContent">${notice.noticeContent }</textarea>
				</li>
				<li>
					<label>첨부파일</label>
					<span><a href="../resources/nuploadFiles/${notice.noticeFileRename }" download>${notice.noticeFileName }</a></span>
					<input type="file" name="reloadFile">
				</li>
			</ul>
			<br><br>
			<div>
				<input type="submit" value="등록하기">
				<button type="button" onclick="showNoticeList();">목록으로 이동하기</button>
			</div>
		</form>
		<script type="text/javascript">
			function showNoticeList() {
				location.href = "/notice/list.do";
			}
		</script>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<style>
#notice-write {
    			width: 800px;
    			margin: auto;
    		}
</style>
</head>
<body>
	<jsp:include page="../inc/header.jsp"></jsp:include>
		<div id="notice-write">
			<h1><b>공지사항 등록</b></h1>
				<br><br><br>
				
				<form action="/notice/insert.do" method="post" enctype="multipart/form-data">
                <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">제목</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" name="noticeSubject">
                  </div>
                </div>
                <div class="row mb-3">
                  <label for="inputNumber" class="col-sm-2 col-form-label">첨부파일</label>
                  <div class="col-sm-10">
					<input type="file" name="uploadFile">
                  </div>
                </div>
                <div class="row mb-3">
                  <label for="inputPassword" class="col-sm-2 col-form-label">내용</label>
                  <div class="col-sm-10">
                    <textarea class="form-control" rows="10" cols="51" name="noticeContent"></textarea>
                  </div>
                </div>
                <br><br>
				<div class="d-flex col-md-12 justify-content-end">
			       <button type="submit" class="btn" style="background-color: #FAFAFA; border-color: #e9ecef;">등록</button>
				</div>
              </form>
		</div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>
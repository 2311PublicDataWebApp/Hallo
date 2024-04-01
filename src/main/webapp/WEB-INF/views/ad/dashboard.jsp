<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN Dashboard</title>
</head>
<body>
<jsp:include page="../inc/adheader.jsp"></jsp:include>

<main id="main" class="main">

    <div class="pagetitle">
      <h1>Dashboard</h1>
    </div><!-- End Page Title -->

    <section class="section">
    <div class="row">
        <div class="col-lg-6">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">MEMBER</h5>
              <!-- Default Table -->
              <table class="table">
                <thead>
                  <tr>
                    <th scope="col">No</th>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Phone</th>
                    <th scope="col">Register Date</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
				<c:forEach items="${mList }" var="member" varStatus="i">            
		                <tr>
		               		<td>${i.count}</td>
		                    <td><a href="/admin/memberdetail.do?memberId=${member.memberId }">${member.memberName }</a></td>
		                    <td>${member.memberEmail }</td>
		                    <td>${member.memberPhone }</td>
		                    <td>${member.memberDate }</td>
		                </tr>
		            </c:forEach>
                  </tr>
                </tbody>
              </table>
              <!-- End Default Table Example -->
            </div>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">HALL</h5>
              <!-- Default Table -->
              <table class="table table-hover">
		            <thead>
		                <tr>
		                    <th>공연장</th>
		                    <th>주소</th>
		                    <th>가격</th>
		                    <th>수용인원</th>
		                </tr>
		            </thead>
		            <tbody>
		            <c:forEach items="${mapList }" var="map" varStatus="i">            
		                <tr>
		                    <td>${map.hallName }</td>
		                    <td>${map.hallAddress }</td>
		                    <td>${map.hallFee }</td>
		                    <td>${map.hallPeople }</td>
		                </tr>
		            </c:forEach>
		            </tbody>
		            
		        </table>
              <!-- End Default Table Example -->
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-6">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">RESERVE</h5>
              <!-- Default Table -->
              <table class="table">
                <thead>
                  <tr>
                    <th scope="col">No</th>
                    <th scope="col">회원명</th>
                    <th scope="col">공연장명</th>
                    <th scope="col">시작일</th>
                    <th scope="col">종료일</th>
                  </tr>
                </thead>
                <tbody>
	            <c:forEach items="${bList }" var="book" varStatus="i">            
		                <tr>
		                	<td>${i.count}</td>
		                    <td><a href="/admin/bookDetail.do?bookingNo=${book.bookingNo }">${book.memberName }</a></td>
		                    <td>${book.hallName }</td>
		                    <td>${book.bookingStartTime }</td>
		                    <td>${book.bookingEndTime }</td>
		                </tr>
		            </c:forEach>
                </tbody>
              </table>
              <!-- End Default Table Example -->
            </div>
          </div>
        </div>
        
        <div class="col-lg-6">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">NOTICE</h5>
              <!-- Default Table -->
              <table class="table table-hover">
		            <thead>
		                <tr>
		                    <th>번호</th>
		                    <th>제목</th>
		                    <th>작성자</th>
		                    <th>작성날짜</th>
		                    
		                </tr>
		            </thead>
		            <tbody>
		            <c:forEach items="${nList }" var="notice" varStatus="i">            
		                <tr>
		                    <td>${notice.noticeNo }</td>
		                    <td><a href="/admin/notidetail.do?noticeNo=${notice.noticeNo }">
		                    ${notice.noticeSubject }
		                    </a></td>
		                    <td>${notice.noticeWriter }</td>
		                    <td>${notice.noticeDate }</td>
		                    
		                </tr>
		            </c:forEach>
		            </tbody>
		            
		        </table>
              <!-- End Default Table Example -->
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-6">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Q&A</h5>
              <!-- Default Table -->
              <table class="table">
                <thead>
                  <tr>
                    <th scope="col">No</th>
                    <th scope="col">Title</th>
                    <th scope="col">Status</th>
                    <th scope="col">Writer</th>
                    <th scope="col">Register Date</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${qList }" var="qna" varStatus="i">            
		                <tr>
		               		<td>${i.count}</td>
		                    <td><a href="/admin/qnaDetail.do?qnaNo=${qna.qnaNo }">${qna.qnaTitle}</a></td>
		                    <td>${qna.qnaStatus }</td>
		                    <td>${qna.memberName }</td>
		                    <td>${qna.qnaDate }</td>
		                </tr>
		            </c:forEach>
                 
                  
                </tbody>
              </table>
              <!-- End Default Table Example -->
            </div>
          </div>
        </div>
    </section>
  </main><!-- End #main -->

<jsp:include page="../inc/adfooter.jsp"></jsp:include>
<!-- Vendor JS Files -->
  <script src="../resources/administrator/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="../resources/administrator/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../resources/administrator/assets/vendor/chart.js/chart.umd.js"></script>
  <script src="../resources/administrator/assets/vendor/echarts/echarts.min.js"></script>
  <script src="../resources/administrator/assets/vendor/quill/quill.min.js"></script>
  <script src="../resources/administrator/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="../resources/administrator/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="../resources/administrator/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="../resources/administrator/assets/js/main.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공연장 수정</title>
</head>
<body>
<jsp:include page="../inc/adheader.jsp"></jsp:include>

<main id="main" class="main">
		<div class="pagetitle">
			<h1>공연장 수정</h1>
		</div>
		<!-- End Page Title -->
		<br>
		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">공연장 등록</h5>
								<form action="/admin/hallregister.do" method="post" enctype="multipart/form-data" name="adm_form" onSubmit="return Checkform()">
					                <div class="row mb-3">
					                  <label for="inputText" class="col-sm-2 col-form-label">공연장명 ＊</label>
					                  <div class="col-sm-3">
					                    <input type="text" class="form-control" name="hallName" value="${hall.hallName }">
					                  </div>
					                  </div>
					                  <div class="row mb-3">
					                  <label for="inputText" class="col-sm-2 col-form-label">대여장소명</label>
					                  <div class="col-sm-4">
					                    <input type="text" class="form-control" name="hallSpaceName" value="${hall.hallSpaceName }">
					                  </div>
					                </div>
					                <div class="row mb-3">
					                  <label for="inputText" class="col-sm-2 col-form-label">주소 ＊</label>
					                  <div class="col-sm-5">
										<input type="text"  id="member_roadAddress" class="form-control" name="hallAddress" value="${hall.hallAddress }">
										<input type="button" onclick="execDaumPostcode()" style="margin-left:85%; background-color: #FAFAFA; border-color: #e9ecef;" value="주소찾기"><br>
					                  </div>
					                </div>
					                  <div class="row mb-3">
					                  <label for="inputText" class="col-sm-2 col-form-label">수용인원</label>
					                  <div class="col-sm-2">
					                    <p><input type="number" class="form-control" name="hallPeople" value="${hall.hallPeople }"> </p>
					                  </div>
					                  </div>
					                   <div class="row mb-3">
					                  <label for="inputText" class="col-sm-2 col-form-label">시간 당 비용</label>
					                  <div class="col-sm-2">
					                    <p><input type="number" class="form-control" name="hallFee" value="${hall.hallFee }"></p>
					                  </div>
					                  </div>
					                 <div class="row mb-3">
					                  <label for="inputText" class="col-sm-2 col-form-label">주의사항</label>
					                  <div class="col-sm-5">
					                   <textarea class="form-control" rows="10" cols="51" name="hallCautions">${hall.hallCautions }</textarea>
					                  </div>
					                  </div>
									<div class="row mb-3">
					                  <label for="inputNumber" class="col-sm-2 col-form-label">썸네일이미지</label>
					                  <div class="col-sm-5">
<%-- 										<span><a style="color:black;" href='../resources/nuploadFiles/${hall.hallImgRename }'>${hall.hallImgName }</a></span> --%>
					                  </div>
					                </div>
					                 <div class="row mb-3">
					                  <label for="inputText" class="col-sm-2 col-form-label">환불규정</label>
						                  <div class="col-sm-5">
						                    <textarea class="form-control" rows="10" cols="51" name="hallRefunds">${hall.hallRefunds }</textarea>
						                 </div>
						            </div>
					                 <div class="row mb-3">
					                  <label for="inputText" class="col-sm-2 col-form-label">담당자명 ＊</label>
						                  <div class="col-sm-3">
						                     <input type="text" class="form-control" name="hallAgentName" value="${hall.hallAgentName }">
						                 </div>
						             </div>
					                 <div class="row mb-3">
					                  <label for="inputText" class="col-sm-2 col-form-label">담당자 연락번호 ＊</label>
						                  <div class="col-sm-3">
						                 	  <p><input type="number" class="form-control" name="hallAgentPhone" value="${hall.hallAgentPhone }"></p>
						                 </div>
					                 </div>
					                 <div class="row mb-3">
					                  <label for="inputText" class="col-sm-2 col-form-label">담당자 이메일</label>
					                  <div class="col-sm-3">
					                     <input type="text" class="form-control" name="hallAgentEmail" value="${hall.hallAgentEmail }">
					                 </div>
					                  
					                  
					                  
					                </div>
					                <br><br>
									<div class="d-flex col-md-12 justify-content-end">
								            <button type="submit" class="btn" onclick="return Submit();" style="background-color: #FAFAFA; border-color: #e9ecef;">등록</button>
								            <button type="button" class="btn" style="background-color: #FAFAFA; border-color: #e9ecef;"onClick="location.href='/admin/hallList.do';">목록</button>
									</div>
              					</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>

<jsp:include page="../inc/adfooter.jsp"></jsp:include>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
			 function execDaumPostcode() {
			        new daum.Postcode({
			        	oncomplete : function(data){
			        		document.querySelector("#member_roadAddress").value = data.roadAddress;
			        		
			        	}
			        }).open();
			 }
			 
			function Submit(){
				if(confirm("등록하시겠습니까?")){
					return true;
				} else{
					return false;
				}
			}
				
			 function Checkform() {
				    if( adm_form.hallName.value == "" ) {
				    	adm_form.hallName.focus();
				        alert("공연장명을 입력해주세요.");
				        return false;
				        
				    }
				    
				    if( adm_form.hallAddress.value == "" ) {
				    	adm_form.hallAddress.focus();
				        alert("주소를 입력해주세요.");
				        return false;
				        
				    }
				    if( adm_form.hallAgentName.value == "" ) {
				    	adm_form.hallAgentName.focus();
				        alert("담당자명을 입력해주세요.");
				        return false;
				        
				    }
				    
				    if( adm_form.hallAgentPhone.value == "" ) {
				    	adm_form.hallAgentPhone.focus();
				        alert("담당자 연락 번호를 입력해주세요.");
				        return false;
				        
				    }
				}
			 
			 
		</script>
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
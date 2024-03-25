<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>
<link href="../resources/css_qna/qna.css" rel="stylesheet" />
</head>
<body>

	<!-- 공통 / 헤더 -->
	<%-- 	<jsp:include page="../inc/header.jsp"></jsp:include> --%>
	<div class="tempheader"></div>

	<!-- LNB 영역 -->
	<diV class="tempLnb" style=""></diV>


	<!-- QNA 등록 -->
	<form action="/qna/qnaregist.do" method="post" name="qna_form" onSubmit="return Checkform()">

		<div class="qna_regist_all">
			<div class="title qnatitle">
				<h2 class="qna_main_title">1:1문의</h2>
				<h3 class="qna_sub_title">1:1문의 등록</h3>
			</div>
			<!-- 타이틀 닫히는 곳 -->

			<div class="qna_input">
				<input type="hidden" name="memberID" value="${memberId }"
		id="memberID">
			
			<table class="qna_input_table">
				<tr class="qna_title_area">
					<td class="qna_title">제목</td>
					<td><input type="text" name="qnaTitle" size="48px"></td>
				</tr>
				<tr class="qna_phone_area">
					<td class="qna_phone">휴대폰번호</td>
					<td><input type="text" name="qnaPhone"></td>
				</tr>
				<tr class="qna_content_area">
					<td class="qna_content">내용</td>
					<td><textarea cols="50" rows="10" name="qnaContent"></textarea></td>
				</tr>
			</table>

				
				<div class="btn_qna_submit">
<!-- 					<button type="button" class="qna_reset_btn" onClick="goBack();">이전으로</button> -->
<!-- 					<button type="button" class="qna_submit_btn1" onclick="qnaSubmit();">등록하기</button> -->
					<input type="reset" class="qna_reset_btn" value="이전으로"
					onClick="goBack();">
					<input type="submit" class="qna_submit_btn" 
					value="등록하기" onclick="qnaSubmit();">
				</div>
			</div>
			<!-- qna_input 영역 닫히는 곳 -->
			<script>
			
			function goBack(){
				history.back();
			}
			
			function qnaSubmit(){
				if(confirm("등록하시겠습니까?")){
					location.href = "/qna/qnalist.do";
				}
			}
			
			function Checkform() {

			    if( qna_form.qnaTitle.value == "" ) {
			    
			    	qna_form.qnaTitle.focus();
			        alert("제목을 입력해주세요.");
			        
			        return false;
			        
			    }
			    
			    if( qna_form.qnaPhone.value == "" ) {
				    
			    	qna_form.qnaPhone.focus();
			        alert("휴대폰 번호를 입력해주세요.");
			        
			        return false;
			        
			    }
			    if( qna_form.qnaContent.value == "" ) {
				    
			    	qna_form.qnaContent.focus();
			        alert("내용을 입력해주세요.");
			        
			        return false;
			        
			    }
			    
			    if(qna_form.memberID.value == ""){
					alert("로그인 후 진행해주세요.");
			        
			        return "redirect:/member/login.do";
			        
			    }
			}
			
			</script>

		</div>
		<!--qna all 닫히는 부분-->
	</form>
	<div class="tempfooter"></div>
</body>
</html>
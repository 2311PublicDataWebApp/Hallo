<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 수정</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link href="../resources/css_qna/qna.css" rel="stylesheet" />

</head>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<!-- 공통 / 헤더 -->
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<div class="tempheader"></div>

	<!-- LNB 영역 -->
	<diV class="tempLnb" style=""></diV>


	<!-- QNA 등록 -->
	<form action="/qna/modify.do" method="post" name="qna_form"
		onSubmit="return Checkform()">

		<div class="qna_modify_all qna_regist_all">
			<div class="title qnatitle">
				<h2 class="qna_main_title">1:1문의</h2>
				<h3 class="qna_sub_title">1:1문의 수정</h3>
			</div>
			<!-- 타이틀 닫히는 곳 -->

			<div class="qna_input">
				<input type="hidden" name="memberId" value="${memberId }"
					id="memberId"> <input type="hidden" name="qnaNo"
					value="${qna.qnaNo }" id="qnaNo">

				<table class="qna_modify_table">
					<tr class="qna_title_area">
						<td class="qna_title">제목</td>
						<td><input type="text" name="qnaTitle" size="48px"
							value="${qna.qnaTitle }"></td>
					</tr>
					<tr class="qna_phone_area">
						<td class="qna_phone">휴대폰번호</td>
						<td><input type="text" name="qnaPhone"
							value="${qna.qnaPhone }"></td>
					</tr>
					<tr class="qna_content_area">
						<td class="qna_content">내용</td>
						<td><textarea cols="50" rows="10" name="qnaContent">${qna.qnaContent }</textarea></td>
					</tr>
				</table>


				<div class="btn_qna_submit">
					<button type="button" class="reset_btn" onClick="goBack();">이전으로</button>
					<input type="submit" class="modify_btn"
						onClick="return modifyAlert();" value="수정하기" />
				</div>
			</div>
			<!-- qna_input 영역 닫히는 곳 -->
		</div>
		<!--qna all 닫히는 부분-->
	</form>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<div class="tempfooter"></div>
	<script>
		function goBack() {
			history.back();
		}

		function modifyAlert() {

			if (confirm("수정하시겠습니까?")) {
				return true;
			} else {
				return false;
			}

		}

		function Checkform() {

			if (qna_form.qnaTitle.value == "") {

				qna_form.qnaTitle.focus();
				alert("제목을 입력해주세요.");

				return false;

			}

			if (qna_form.qnaPhone.value == "") {

				qna_form.qnaPhone.focus();
				alert("휴대폰 번호를 입력해주세요.");

				return false;

			}
			if (qna_form.qnaContent.value == "") {

				qna_form.qnaContent.focus();
				alert("내용을 입력해주세요.");

				return false;

			}

			if (qna_form.memberID.value == "") {
				alert("로그인 후 진행해주세요.");

				return "redirect:/member/login.do";

			}
		}
	</script>
</body>
</html>
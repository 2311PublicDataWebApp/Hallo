<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<header>
			<div class="adminheader">
			
				<div class="logotxt">
				<a href="location.href='qna/qnaAdminList.do'">HALLO<br>
				<span class="admintxt">[ADMIN]</span></a></div> 
			
	
	
	<c:if test="${memberId ne null }">
			 <div>    <input type="button" onclick="confirmLogout();">로그아웃</input></div>
	</c:if>
	</div>
	
	
	<script>
	function confirmLogout() {        
		if( confirm("정말 로그아웃 하시겠습니까?") )
		 {location.href="/member/logout.do";
			return true;     
		 } else{
			return false;
		}
		}    
		
	</script>
		</header>
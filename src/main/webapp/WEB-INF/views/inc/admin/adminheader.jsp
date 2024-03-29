<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<header>
			<div class="adminheader">
			
				<div class="logotxt">
				<a href="/admin/qnaAdminList.do">HALLO<br>
				<span class="admintxt">[ADMIN]</span></a></div> 
			
	
	
	<c:if test="${memberId ne null }">
			 <button type="button" class="admlogout" onclick="memberLogout();">로그아웃</button>	
	</c:if>
	</div>
	
	
	<script>
	function memberLogout() {        
		if( confirm("정말 로그아웃 하시겠습니까?") )
		 {
			location.href="/admin/logout.do";
			return true;     
		 } else{
			return false;
		}
		}    
		
	</script>
		</header>
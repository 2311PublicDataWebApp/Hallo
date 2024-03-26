<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
    </head>
    <body>
        <h1>공지사항 상세보기</h1>
        <table>
            <tr>
                <th>번호</th>
                <td>${notice.noticeNo }</td>
            </tr>
            <tr>
                <th>제목</th>
                <td>${notice.noticeSubject }</td>
            </tr>
            <tr>
                <th>작성자</th>
                <td>${notice.noticeWriter }</td>
            </tr>
            <tr>
                <th>작성날짜</th>
                <td>${notice.noticeDate }</td>
            </tr>
            <tr>
                <th>내용</th>
                <td>${notice.noticeContent }</td>
            </tr>
            <tr>
                <th>첨부파일</th>
                <td><img src="../resources/nuploadFiles/${notice.noticeFileRename }"></td>
            </tr>
        </table>
        <div>
			<button type="button" onclick="showModifyPage();">수정하기</button>
			<button type="button" onclick="deleteNotice(${notice.noticeNo});">삭제하기</button>
			<button type="button" onclick="showNoticeList();">목록으로 이동하기</button>
		</div>
		<input type="hidden" id="refNoticeNo" name="refNoticeNo" value="${notice.noticeNo }">
            <table width="500" border="1">
                <tr>
                    <td>
                        <input type="text" id="replyContent" name="replyContent" size="20">
                    </td>
                    <td>
<!--                         <input type="submit" value="등록하기"> -->
							<button id="rSubmit">등록하기</button>
                    </td>
            </table>
		<table width="500" border="1" id="replyTable">
			<tbody></tbody>
		</table>
		<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script type="text/javascript">
			function showModifyPage() {
				var noticeNo = "${notice.noticeNo }";
				location.href = "/notice/modify.do?noticeNo=" + noticeNo;
			}
			
			function deleteNotice(noticeNo) {
				if (confirm("삭제하시겠습니까?")) {
					location.href = "/notice/delete.do?noticeNo=" + noticeNo;
				}
			}
			
			function showNoticeList() {
				location.href = "/notice/list.do";
			}
			
			
			
			
			
			
			getReplyList();
        	function getReplyList() {
        		var refNoticeNo = $("#refNoticeNo").val();
        		$.ajax({
        			url: "/notice/reply/list.do",
        			data: {"refNoticeNo": refNoticeNo},
        			type: "GET",
        			success: function(result) {
        				var tableBody = $("#replyTable tbody");
        				//tableBody.empty();
        				tableBody.html("");
        				var tr;
        				var replyWriter;
        				var replyContent;
        				var rCreateDate;
        				var btnArea;
        				if(result.length > 0) {
        					for(var i in result) {
        						var replyWriterVal = result[i].replyWriter;
        						var replyContentVal = result[i].replyContent;
        						var rCreateDateVal = result[i].rCreateDate;
        						var replyNoVal = result[i].replyNo;
        						tr = $("<tr>") // <tr></tr>
        						replyWriter = $("<td>").text(replyWriterVal); // <td></td>
        						replyContent = $("<td>").text(replyContentVal);
        						rCreateDate = $("<td width='100'>").text(rCreateDateVal);
        						btnArea = $("<td width='90'>")
        						.append("<a href='javascript:void(0)' onclick='modifyViewReply(this, "+replyNoVal+", \""+ replyContentVal +"\");'>수정</a> ")
        						.append("<a href='javascript:void(0)' onclick='removeReply(" + replyNoVal + ");'>삭제</a>");
        						tr.append(replyWriter);
        						tr.append(replyContent);
        						tr.append(rCreateDate);
        						tr.append(btnArea);
        						tableBody.append(tr);
        					}
        				}
        			},
        			error: function() {
        				alert("Ajax 통신 실패! 관리자에게 문의해주세요!");
        			}
        		})
        	}
        	
        	function modifyReply(replyNo, obj) {
        		var inputTag = $(obj).parent().prev().children();
        		var replyContent = inputTag.val();
        		$.ajax({
        			url: "/notice/reply/update.do",
        			data: { "replyNo" : replyNo,
        					"replyContent" : replyContent },
        			type: "POST",
        			success: function(data) {
        				alert("서비스 결과: " + data);				
        				getReplyList();
        			},
        			error: function() {
        				alert("Ajax 통신 실패! 관리자에게 문의하십시오.")
        			}
        		})
        	}
        	
        	function modifyViewReply(obj, rNo, rContent) {
        		//console.log(obj);
        		var nextTr = $(obj).parent().parent().next();
        		
        		if (nextTr.attr("id") != "replyTr") {
        			
	        		var tr = $("<tr id='replyTr'>");
	        		
	        		tr.append("<td colspan='3'><input type='text' size='50' value='"+rContent+"'></td>")
	        		tr.append("<td><button type='button' onclick='modifyReply("+rNo+", this);'>수정완료</button></td>")
	        		$(obj).parent().parent().after(tr);
        		}
        		
        		
       		
        			
        		
        		
        		//$("#replyTable tbody").append(tr);
        		//$("<td>").append("<input type='text'>");
        	}
        	
        	function removeReply(replyNo) {
        		
        		$.ajax({
        			url: "/notice/reply/delete.do",
        			data: { "replyNo" : replyNo },
        			type: "POST",
        			success: function(result) {
        				alert("서비스 결과: " + result);
        				
        				getReplyList();
        			},
        			error: function() {
        				alert("Ajax 통신 실패! 관리자에게 문의하세요~")
        			}
        		})
        	}
        	
        	$("#rSubmit").on("click", function() {

        		var refNoticeNo = $("#refNoticeNo").val();
        		var replyContent = $("#replyContent").val();
        		$.ajax({
        			url: "/notice/reply/add.do",
        			data: { "refNoticeNo" : refNoticeNo, "replyContent" : replyContent },
        			type: "POST",
        			success: function(result) {
        				alert("서비스 결과: " + result);
        				getReplyList();
        				$("#replyContent").val("");
        			},
        			error: function() {
        				alert("Ajax 통신 실패! 관리자에게 문의바랍니다.")
        			}
        		});
        	});
        	
		</script>
		
		
    </body>
</html>
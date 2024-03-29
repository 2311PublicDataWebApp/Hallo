<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset='utf-8' />
		<title>예매하기</title>
		<link href='/docs/dist/demo-to-codepen.css' rel='stylesheet'>
		<style>
			html, body {
				margin: 0;
				padding: 0;
				font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
				font-size: 14px;
			}
			#calendar {
				max-width: 1100px;
				margin: 40px auto;
			}
		</style>
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
		<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js'></script>
		<script src='fullcalendar/dist/index.global.js'></script>
		<script src='/docs/dist/demo-to-codepen.js'></script>
	</head>
	<body>
		<jsp:include page="../inc/header.jsp"></jsp:include>
		<div id='calendar'></div>
		<div>
			<form action="/booking/insert.do" method="post">
				<input type="text" name="startTime" id="bookingStartTime" value="">
				<input type="text" name="endTime" id="bookingEndTime" value="">
				<input type="text" name="memberId" value="${memberId }">
				<input type="text" name="hallNo" value="${hallNo }">
				<input type="submit" value="예약하기">
			</form>
		</div>
		<script>
			document.addEventListener('DOMContentLoaded', function() {
				var calendarEl = document.getElementById('calendar');
			
				var calendar = new FullCalendar.Calendar(calendarEl, {
					initialView: 'timeGridWeek',
					selectable: true,
				    select: function(info) {
				    	$.ajax({
				    		url : "/booking/insert/ajax.do",
				    		success : function() {
								$("#bookingStartTime").val(info.startStr);
								$("#bookingEndTime").val(info.endStr);
				    		},
				    		error : function() {
				    			alert("Ajax 통신 실패");
				    		}
				    	});
				    },
					headerToolbar: {
						left: 'prev',
						center: 'title',
						right: 'next'
					},
					events: [
						<c:forEach items="${bList }" var="booking">
							{
								title: '${booking.bookingNo}',
								start: '${booking.bookingStartTime}',
								end: '${booking.bookingEndTime}'
							},
						</c:forEach>
						{
							title: '.',
							start: '2099-12-31'
						}
					]
				});
				calendar.render();
			});
		</script>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</body>
</html>
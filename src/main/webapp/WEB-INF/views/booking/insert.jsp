<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />


  <title>
    Initialize Globals Demo - Demos | FullCalendar
  </title>


<link href='/docs/dist/demo-to-codepen.css' rel='stylesheet' />


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



<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.5/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.5/main.min.js'></script>
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth',
      initialDate: '2024-03-07',
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      events: [
        {
          title: 'All Day Event',
          start: '2024-03-01'
        },
        {
          title: 'Long Event',
          start: '2024-03-07',
          end: '2024-03-10'
        },
        {
          groupId: '999',
          title: 'Repeating Event',
          start: '2024-03-09T16:00:00'
        },
        {
          groupId: '999',
          title: 'Repeating Event',
          start: '2024-03-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2024-03-11',
          end: '2024-03-13'
        },
        {
          title: 'Meeting',
          start: '2024-03-12T10:30:00',
          end: '2024-03-12T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2024-03-12T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2024-03-12T14:30:00'
        },
        {
          title: 'Birthday Party',
          start: '2024-03-13T07:00:00'
        },
        {
          title: 'Click for Google',
          url: 'https://google.com/',
          start: '2024-03-28'
        }
      ]
    });

    calendar.render();
  });

</script>

</head>
<body>
  <div class='demo-topbar'>
  <button data-codepen class='codepen-button'>Edit in CodePen</button>

  

  
    initialization of calendar with browser globals
  
</div>

  <div id='calendar'></div>
</body>
<!--     <head> -->
<!--         <meta charset="UTF-8"> -->
<!--         <title>예매하기</title> -->
<!--         <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js'></script> -->
<!--     </head> -->
<!--     <body> -->
        <!-- <div id="calModal"></div> -->
<!--         <div id='calendar'></div> -->
<!--         <script> -->
<!-- //             const headerToolbar = { -->
<!-- //                 left: 'prev', -->
<!-- //                 center: 'title', -->
<!-- //                 right: 'next' -->
<!-- //             } -->
<!-- //             const calModalOption = { -->
<!-- //                 height: '700px', -->
<!-- //                 width: '700px', -->
<!-- //                 headerToolbar: headerToolbar, -->
<!-- //                 initialView: 'dayGridMonth', -->
<!-- //                 editable: true -->
<!-- //             } -->
<!-- //             const calendarOption = { -->
<!-- //                 height: '700px', -->
<!-- //                 width: '700px', -->
<!-- //                 headerToolbar: headerToolbar, -->
<!-- //                 plugins: [timeGridPlugin], -->
<!-- //                 initialView: 'timeGridDay', -->
<!-- //                 editable: true -->
<!-- //             } -->
<!-- //             document.addEventListener('DOMContentLoaded', function() { -->
<!-- //                 var calendarEl = document.getElementById('calendar'); -->
<!-- //                 var calendar = new FullCalendar.Calendar(calendarEl, calendarOption); -->
<!-- //                 calendar.render(); -->
<!-- //             }); -->
<!--         </script> -->
<!--     </body> -->
</html>
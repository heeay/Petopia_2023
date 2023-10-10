<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>행사 메인페이지</title>

<!-- css -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- javascript -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- 캘린더 셋팅 -->
<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/core@6.1.9/index.global.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@6.1.9/index.global.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/@fullcalendar/interaction@6.1.9/index.global.min.js'></script>



<!-- overal -->
<style>
    #wrapper{
        width: 1100px;
        height: 800px;
        margin: auto;
        background-color: rgb(255, 248, 240);
        /* border : 1px solid black; */
        box-sizing: border-box;
    }

    #title-area{
        box-sizing: border-box;
        width : 1100px;
        height : 5%;
        /*flex로 띄운 뒤 가운데정렬하기 */
        display : flex;
        justify-content: center;
        font-size: 25px;
      
    }
    #content-area{
       
        width : 1100px;
        height : 90%;
        box-sizing: border-box;
        
    }

</style>

<!-- title -->
<style>

</style>

<!-- calendar -->
<style>
    #calendar{
      
        font-size : 20px;
       
    }
    
 


</style>


</head>
<body>
    <%@ include file="../common/header-min.jsp" %>

    <%@ include file="../common/sideBar.jsp" %>

    <div id="wrapper">
    
        <div id="title-area">
            
            <h4>펫토피아 🐶🐹🐰 이달의 행사</h4>
        </div>

        <div id="content-area">

            <div id="calendar"></div>
           
        </div>

        
    </div>

    <script>


        document.addEventListener('DOMContentLoaded', function() {

        var calendarEl = document.getElementById('calendar');


        var calendar = new FullCalendar.Calendar(calendarEl, {
        
            initialView: 'dayGridMonth', // 초기화면

            eventAdd : (obj) => { // 이벤트 추가
                console.log(obj);
            },

            eventChange : (obj) => { // 이벤트 수정
                console.log(obj);
            },

            eventRemove : (obj) => { // 이벤트 제거
                console.log(obj);
            },

            select : (arg) => {
                var title = prompt('Event Title : ');
                if (title) {
                calendar.addEvent({
                title: title,
                start: arg.start,
                end: arg.end,
                allDay: arg.allDay
                })
                }
                calendar.unselect()
            },

        // plugins: ['dayGrid', 'interaction'],
            events: [
                {
                    id: 1,
                    title: '강형욱 훈련사 강연',
                    start: '2023-10-11',
                    
                },
                {
                    id: 2,
                    title: '퍼그 축제',
                    start: '2023-10-21',
                }
        ]});
        
        // eventContent: { html: '<i>some html</i>' },
        // eventContent: function(arg) {
        // let italicEl = document.createElement('i')

        // if (arg.event.extendedProps.isUrgent) {
        //     italicEl.innerHTML = 'urgent event'
        // } else {
        //     italicEl.innerHTML = 'normal event'
        // }

        // let arrayOfDomNodes = [ italicEl ]
        // return { domNodes: arrayOfDomNodes }
        // }

        
        calendar.render();

        // 클릭시 세부이벤트판으로 이동
        calendar.on('dateClick', function() {
            window.location.href="<%=contextPath%>/detail.mp";
        });

        });
      
      </script>



    <%@ include file="../common/footer.jsp" %>
</body>
</html>



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<jsp:include page="../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/myPage/myPage.css">
<link rel="stylesheet"
	href="/resources/vendor/bootstrap-icons/font/bootstrap-icons.css">
<link href='/resources/css/myPage/calendar.css' rel='stylesheet' />
<title>Insert title here</title>
<script src='/resources/js/myPage/calendar.js'></script>
<script src='/resources/js/myPage/ko.js'></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<style>
html, body {
	margin: 0;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#external-events {
	position: fixed;
	z-index: 2;
	top: 20px;
	left: 20px;
	width: 150px;
	padding: 0 10px;
	border: 1px solid #ccc;
	background: #eee;
}

.demo-topbar+#external-events { /* will get stripped out */
	top: 60px;
}

#external-events .fc-event {
	cursor: move;
	margin: 3px 0;
}

#calendar-container {
	position: relative;
	z-index: 1;
	margin-left: 200px;
}

#calendar {
	max-width: 1100px;
	margin: 20px auto;
}
</style>
<script>
    var calendar =null;
	function loadData(){
	  	  var return_value=null;
	        $.ajax({
	            type:'POST',
	            url:'scheduleLoad',
	            data:{},
	            async: false,
	            dataType:'json',
	        }).done(function(result){
					console.log(result);
					var allEvents=[];
					result.forEach((value,index)=>{
						obj={id:value.schedule_no,title:value.title,allDay:value.allday,start:value.schedule_start,end:value.schedule_end};
	/* 						console.log("key값:"+value);
						console.log("value값:"+value);
						console.log(value.schedule_no);
						console.log(value.title);
						console.log(value.allday);
						console.log(value.schedule_start);
						console.log(value.schedule_end); */
						console.log(obj);
						allEvents.push(obj);
					});
					console.log("스케줄 배열:"+allEvents);
					return_value=allEvents;
					console.log(return_value);
	        }).fail(function(){
	            alert('에러 발생');
	        })
	        console.log("함수 리턴 값:"+return_value);
	        return return_value;
	    }//loaddata function end
$(function() {
	let all_events=loadData();
	console.log("all_events:"+all_events);
    var Calendar= FullCalendar.Calendar;
    var Draggable = FullCalendar.Draggable;
    var containerEl = document.getElementById('external-events');
    var calendarEl = document.getElementById('calendar');
    var checkbox = document.getElementById('drop-remove');

    // initialize the external events
    // -----------------------------------------------------------------

    new Draggable(containerEl, {
      itemSelector: '.fc-event',
      eventData: function(eventEl) {
        return {
          title: eventEl.innerText
        };
      }
    });

    // initialize the calendar
    // -----------------------------------------------------------------

      calendar = new Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      editable: true,
      droppable: true, // this allows things to be dropped onto the calendar
      events:all_events, //json 형태의 데이터 값으로 들어있어야지 일정 목록이 나타난다
      drop: function(info) {
        // is the "remove after drop" checkbox checked?
        if (checkbox.checked) {
          // if so, remove the element from the "Draggable Events" list
          info.draggedEl.parentNode.removeChild(info.draggedEl);
        }
      },
      locale:'ko'
    });

    calendar.render();
  });
    </script>
</head>
<body>
	<section class="container col-lg-12">
		<div class="row">
			<div class="col-lg-3 bg-secondary m-5 text-center">
				<nav id="side_left" class="my-auto">
					<ul class="list-unstyled ">
						<li class="p-1"><a href="/myPage/studyDiaryList">공부일기</span>&nbsp;&nbsp;<i
								class="bi bi-journal-check fs-1"></i></a></li>
						<li class="p-1"><a href="/myPage/scheduleList">일정관리&nbsp;&nbsp;
								<i class="bi bi-calendar-month fs-1"></i>
						</a></li>
						<li class="p-1"><a href="#">1:1 채팅목록&nbsp;&nbsp;<i
								class="bi bi-chat-square-quote fs-1"></i></a></li>
						<li class="p-1"><a href="/myPage/joinGroupList">참가 그룹
								목록&nbsp;&nbsp;<i class="bi bi-chat-quote fs-1"></i>
						</a></li>
						<li class="p-1"><a href="/myPage/categoryUpdate">관심 분야
								수정&nbsp;&nbsp;<i class="bi bi-pencil-fill fs-1"></i>
						</a></li>
						<li class="p-1"><a href="/myPage/userUpdate">회원 정보
								수정&nbsp;&nbsp;<i class="bi bi-tools fs-1"></i>
						</a></li>
						<li class="p-1"><a href="/myPage/applyQuitUserCheck">회원
								탈퇴 신청&nbsp;&nbsp;<i class="bi bi-person-x fs-1"></i>
						</a></li>
					</ul>
				</nav>
			</div>
			<div class="col-8" id="contents">
				<h3>일정관리</h3>
				<hr style="width: 800px">
				<div class='demo-topbar'>
					<button class='addScheduleBtn'>일정 등록</button>

				</div>


				<div id='external-events'>
					<p>
						<strong>Draggable Events</strong>
					</p>

					<div
						class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
						<div class='fc-event-main'>My Event 1</div>
					</div>
					<div
						class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
						<div class='fc-event-main'>My Event 2</div>
					</div>
					<div
						class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
						<div class='fc-event-main'>My Event 3</div>
					</div>
					<div
						class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
						<div class='fc-event-main'>My Event 4</div>
					</div>
					<div
						class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
						<div class='fc-event-main'>My Event 5</div>
					</div>

					<p>
						<input type='checkbox' id='drop-remove' /> <label
							for='drop-remove'>remove after drop</label>
					</p>
				</div>

				<div id='calendar-container'>
					<button id="saveBtn">전체 저장</button>
					<div id='calendar'></div>
				</div>
			</div>
		</div>
		<script>
          $(function(){
        	//일정 저장 클릭 이벤트
            $("#saveBtn").on("click",function(){
                //전체 데이터를 추출하여 Ajax로 DB에 저장
                // calendar.getEvent
                var allEvents=calendar.getEvents();
                console.log(allEvents);
                console.log(typeof allEvents);
                var events=new Array();
                allEvents.forEach(element => {
                    var obj={};
                    obj.title=element._def.title;     //이벤트 명칭
                    obj.allday=element._def.allDay;    //하루종일 여부 true false
                    obj.start=element._instance.range.start;
                    obj.end=element._instance.range.end;     
                    
                    events.push(obj);
                });
                var jsondata=JSON.stringify(events);
                console.log(jsondata);

                saveData(jsondata); //ajax으로 넘기도로 저장할 것이다.
//                loadData();		//저장된 일정을 불러오는 loadData
            });
			//일정 저장 동작 함수(ajax)
            function saveData(jsondata){
                $.ajax({
                    type:'POST',
                    url:'scheduleSave',
                    data:{"jsondata":jsondata},
                    dataType:'text',
                }).done(function(result){
					console.log(result);
                }).fail(function(){
                    alert('에러 발생');
                })
            }//savadata function end
            

            
            
          });

          
          
      </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

.container {
	margin-top: 40px;
}

.btn-primary {
	width: 100%;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/momentjs/2.14.1/moment.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
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
	    function date_to_str(format)

	    {

	        var year = format.getFullYear();

	        var month = format.getMonth() + 1;

	        if(month<10) month = '0' + month;

	        var date = format.getDate();

	        if(date<10) date = '0' + date;

	        var hour = format.getHours();

	        if(hour<10) hour = '0' + hour;

	        var min = format.getMinutes();

	        if(min<10) min = '0' + min;

	        var sec = format.getSeconds();

	        if(sec<10) sec = '0' + sec;

	        

	        return year + "-" + month + "-" + date + "T" + hour + ":" + min + ":" + sec+".000Z";
	    }

$(function() {
	var all_events=loadData();
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
				<li class="p-1"><a href="/myPage/applyQuitUserCheck">회원 탈퇴
						신청&nbsp;&nbsp;<i class="bi bi-person-x fs-1"></i>
				</a></li>
			</ul>
			</nav>
		</div>
		<div class="col-8" id="contents">
			<h3>일정관리</h3>
			<hr style="width: 800px">
			<div class='demo-topbar'>
				<button type="button" class="btn btn-primary btn-lg"
					data-toggle="modal" data-target="#myModal">일정 등록</button>

			</div>


			<div id='external-events'>
				<p>
					<strong>Draggable Events</strong>
				</p>

				<div
					class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
					<div class='fc-event-main'>기상</div>
				</div>
				<div
					class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
					<div class='fc-event-main'>약속</div>
				</div>
				<div
					class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
					<div class='fc-event-main'>공부</div>
				</div>
				<div
					class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
					<div class='fc-event-main'>운동</div>
				</div>
			

				<p>
					<input type='checkbox' id='drop-remove' /> 
					<label for='drop-remove'>remove after drop</label>
				</p>
			</div>

			<div id='calendar-container'>
				<button id="saveBtn">전체 저장</button>
				<div id='calendar'></div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
<!-- 				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>
				 -->
				
				<div class="modal-body">
					
			
						<div class="panel panel-primary">
							<div class="panel-heading">일정 추가</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label class="control-label">일정 내용</label> 
											<input type="text" class="form-control" name="title" id="title">
										</div>
									</div>
									
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label class="control-label">종일 여부</label>
											<input type="checkbox" name="allDay" id="allDay" ><br>
											<label class="control-label">시작일</label>
											<div class='input-group date' id='datepicker1'>
												<input type='text' class="form-control" id='start'/> <span
													class="input-group-addon"> <span
													class="glyphicon glyphicon-calendar"></span>
												</span>
											</div>
										</div>
									</div>
									<div class='col-md-6'>
										<div class="form-group">
											<label class="control-label"></label><br><br>
											<label class="control-label">종료일</label>
											<div class='input-group date' id='datepicker2'>
												<input type='text' class="form-control" id='end'/> <span
													class="input-group-addon"> <span
													class="glyphicon glyphicon-calendar"></span>
												</span>
											</div>
										</div>
									</div>
								</div>
								<input type="button" class="btn btn-primary" id="addBtn" value="Submit">
							</div>
							
						</div>
					<button type="button" class="btn btn-default" data-dismiss="modal" style="float: right;">Close</button>

				</div>
				<div class="modal-footer">
					
			
				</div>
			</div>
		</div>
	</div>


	<script>
	
		$('#myModal').on('shown.bs.modal', function () {
		     $('#myInput').focus()
		   })

          $(function(){
        	  //데이트피커
        	 $('#datepicker1').datetimepicker();
        	  
        	 $('#datepicker2').datetimepicker();
        	  //일정 달력에 등록
        	  $("#addBtn").on("click",function(){
        		 var addObj={};
        		 var allday=false;
        		 if($("#allDay").is(':checked')) allday=true;
        		 console.log("allday값:"+allday);
        		 addObj.title=$("#title").val();
        		 addObj.allday=allday;
        		 
        		// Date.parse("dd/MM/yyyy HH:mm a",$("#start").val()).format("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
        		 var a=Date.parse($("#start").val());
        		 var b=Date.parse($("#end").val());
        	  	console.log(a);
        	  	console.log(b);
        	  	var a_date=date_to_str(new Date(a));
        	  	var b_date=date_to_str(new Date(b));
        	  	console.log(a_date);
        	  	console.log(b_date);
        	  	 addObj.start=a_date;
        		 addObj.end=b_date;
        		
        		console.log(addObj);
        		
        		var strObj=JSON.stringify(addObj);
        		addData(strObj);
        		location.reload();
        	  });
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
                    console.log(obj.allday);
                    obj.start=element._instance.range.start;
                    obj.end=element._instance.range.end;     
                    
                    events.push(obj);
                });
                var jsondata=JSON.stringify(events);
                console.log(jsondata);

                saveData(jsondata); //ajax으로 넘기도로 저장할 것이다.
//                loadData();		//저장된 일정을 불러오는 loadData
            });
			//일정 전체 저장 동작 함수(ajax)
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
            
          //일정 추가 동작 함수(ajax)
            function addData(jsondata){
                $.ajax({
                    type:'POST',
                    url:'scheduleAdd',
                    data:{"jsondata":jsondata},
                    dataType:'text',
                }).done(function(result){
					console.log(result);
                }).fail(function(){
                    alert('에러 발생');
                })
            }//addData function end
            
            
          });

          
          
      </script>
</body>
</html>
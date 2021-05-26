<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="_csrf" th:content="${_csrf.token}">
<meta name="_csrf_header" th:content="${_csrf.headerName}">
<link rel="stylesheet" href="/resources/vendor/bootstrap/css/bootstrap.css">
<title>Insert title here</title>
</head>
<body>
	<input id="user_no" type="hidden" value="${user.user_no }" >
	<section id="timer">
	<h2>개인 타이머</h2>
	<span id="time_output">00:00:00</span>
	<br>
	<div class="content_center">
		<input type="button" id="timer_bnt_save" value="저장"> 
		<input type="button" id="timer_bnt_start" value="시작">
	</div>
	</section>

	<section id="cTimer">
		<h1>시간표</h1>
		<h2 id="clock">00:00:00</h2><br>
		<div id="setting_form">
		</div>
		<button id="start" type="button" class="btn btn-success" >시작</button>
		<button id="openModalBtn" type="button" class="btn btn-primary" >설정</button>
	
		<!-- 모달  -->
		<div id="modalBox" class="modal fade" id="myModal" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
				
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">모달 타이틀</h4>
					</div>
					
					<div class="modal-body ">
						
								<form id="setting_form">
									<div class="form-group">
										<label >교시당 (분)</label>
										<select class="form-control" id="period_time">
										  <option>30</option><option>40</option><option>50</option>
										  <option>60</option><option>70</option><option>80</option>
										  <option>90</option><option>100</option><option>110</option>
										  <option>120</option>
										</select>
									</div>
									
									<div class="form-group">
										<label>교시 수</label><br>
										<select class="form-control" id="lesson_num">
										  <option>1</option><option>2</option><option>3</option>
										  <option>4</option><option>5</option><option>6</option>
										  <option>7</option><option>8</option><option>9</option>
										  <option>10</option><option>11</option><option>12</option>
										</select>
									</div>
									
									<div class="form-group">
										<label>쉬는 시간(분)</label><br>
										<select class="form-control" id="break_time">
										  <option>5</option><option>10</option><option>15</option>
										  <option>20</option><option>25</option><option>30</option>
										</select>
									</div>
									
									<div class="form-group">
										<label>중간 쉬는시간 (1시간)</label><br>
										<select class="form-control" id="extra_break_time">
										  <option>유</option>
										  <option>무</option>
										</select>
									</div>
								</form>
							
						
					</div>
					
					<div class="modal-footer">
						<button type="button" class="btn btn-success" id="setting">확인</button>
						<button type="button" class="btn btn-warning" id="closeModalBtn">취소</button>
					</div>
					
				</div>
			</div>
		</div>

	</section>
	
	
	<script src="/resources/vendor/jquery/jquery.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.js"></script>
	<script type="module" src="/resources/js/timer.js"></script>
	<script type="module" src="/resources/js/class_timer.js"></script>

</body>
</html>
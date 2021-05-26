<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="../common/head.jsp"></jsp:include>
<jsp:include page="../common/header.jsp"></jsp:include>
<meta charset="UTF-8">
<link rel='stylesheet'
href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css'>

<link type="text/css" rel="stylesheet" href="/resources/css/groupSetting.css">
<link type="text/css" rel="stylesheet" href="/resources/css/timer.css">
<link type="text/css" rel="stylesheet" href="/resources/css/groupSidebar_list.css">

<link rel="stylesheet" type="text/css"
   href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">

<script type="text/javascript">

(function($){
  $('#ajaxConGetButton').click(function(){
        AjaxConGet();
    })
    
    /* $('#yesBtn').click(function(){
        AjaxConPost();
    }) */
	
});
function AjaxConGet(){
    var url = "http://localhost:8080/test/ajaxCon";
    $.ajax({
        type:"GET",
        url:url,
        dataType:"html",
        data:{
            name : $('#ajaxConName').val(),
            age : $('#ajaxConAge').val()
        },
        success : function(data){
            alert('ajax GET 통신 성공');
            var $div = $('<div></div>');
            var text = document.createTextNode(data);
            $div.append(data);
            $div.appendTo($('#myDiv'))
        
        },
        error : function(request,status,error){
            alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
            alert(e);
        }
    })
    
}
 
function AjaxConPost(acceptYn){
    var url = "acceptMember.do";
    $.ajax({
        type:"POST",
        url:url,
        dataType:"html",
        data:{
        	studyGroup_no : $('#studyGroup_no').val(),
        	user_no : $('#user_no').val(),
        	isAccept : acceptYn
        },
        success : function(data){
            alert('수락하셨습니다.');
            location.reload();
        },
        error : function(request,status,error){
            alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
            alert(e);
        }
    })
    
}

</script>
</head>

<body>

	<div id="wrapper">
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<!--nav-->
				<li>
					<nav id="side-userbox">
						<input type="image" name="user_name" value="이름">
					</nav>
				</li>
				<li>
					<nav id="side-timer">
						<section id="timer">
							<span id="time_output">00:00:00</span><br>
							<div class="content_center">
								<input type="button" id="timer_bnt_save" value="저장"> <input
									type="button" id="timer_bnt_start" value="시작">
							</div>
						</section>
					</nav>
				</li>
				<li>
					<nav id="side-todo">
						<h3 id="todo">TODO</h3>
						<div id="right-sidebar-userlist">
							<table class="table table-hover" id="list">
								<tr>
									<td><input type="radio">게임하기</td>
								</tr>
								<tr>
									<td><input type="radio">노래듣기</td>
								</tr>
								<tr>
									<td><input type="radio">영어 3시간 공부하기</td>
								</tr>
							</table>
						</div>

					</nav>
				</li>
				<li>
					<nav id="side-groupschedule">GroupSchedule</nav>
				</li>
			</ul>
		</div>
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<a href="#" class="btn" id="menu-toggle"><span
							class="glyphicon glyphicon-menu-hamburger"></span></a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container" class="row" id="group-Main-body">
		<input type="hidden" name="studyGroup_no" value="1">
		<div id="background-body">

			<div class="col-lg-9" id="setting">
				<div id="settingBoard">
					<div id="group-accept" class="table-wrap">
						<div id="acceptTable" class="panel panel-white post panel-shadow"
							>
							<h2>그룹 신청 목록 </h2>
							<input type="hidden" name="studyGroup_no" value="1">
							<%-- <input type="hidden" name="studygroup_no"
								value="${studyGroup.studygroup_no }"> --%>
							<table class="table table--vertical" id="accept-list">
								<tbody class="panel panel-white post panel-shadow" id="accept-list-board">
									<c:forEach var="applyGroupMember" items="${applyUserList}">
										<tr>
											<td>${applyGroupMember.studyGroup_no }</td>
											<td>${applyGroupMember.user_no }</td>
											<td>
												<input type="hidden" id="studyGroup_no" value="${applyGroupMember.studyGroup_no }">
												<input type="hidden" id="user_no" value="${applyGroupMember.user_no}"> 
												<button class="btn btn--primary btn--inside uppercase" id="yesBtn" onclick="AjaxConPost('Y')">수락</button>
											</td>
											<td>
												<button class="btn btn--primary btn--inside uppercase" onclick="AjaxConPost('N')">거절</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>


							</table>
						</div>

						<br>


					</div>


				</div>

			</div>

			<div class="col-lg-3 col-md-12" id="group-Main-right"
				style="right: 0;">
				<div id="group-Main-right-top" class="panel panel-white post panel-shadow" class="col-md-5">
					<div id="right-sidebar-gibox"></div>
					<div id="right-sidebar-fileBox"></div>
				</div>
				<div id="group-Main-right-bottom" class="panel panel-white post panel-shadow" class="col-md-5">
					<div id="right-sidebar-userlist">
						<table class="table table-hover" id="userlist">
							<tr>
								<td>...</td>

							</tr>
							<tr>
								<td>...</td>
							</tr>
							<tr>
								<td>...</td>
							</tr>
							<tr>
								<td>...</td>
							</tr>
						</table>
					</div>
					<div id="right-sidebar-groupchat"></div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/scri.jsp"></jsp:include>
    <jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js'></script>
<script src="../js/side.js"></script>

<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/timer.js"></script>
	

</html>

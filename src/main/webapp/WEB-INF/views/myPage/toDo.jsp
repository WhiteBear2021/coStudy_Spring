<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<jsp:include page="../common/head.jsp"></jsp:include>


<jsp:include page="../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/myPage/myPage.css">
<link rel="stylesheet"
	href="/resources/vendor/bootstrap-icons/font/bootstrap-icons.css">

<link
	href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css'>
<script
	src='https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js'></script>
<link
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css'>

<title>Insert title here</title>
<style type="text/css">
.flex {
	-webkit-box-flex: 1;
	-ms-flex: 1 1 auto;
	flex: 1 1 auto
}

@media ( max-width :991.98px) {
	.padding {
		padding: 1.5rem
	}
}

@media ( max-width :767.98px) {
	.padding {
		padding: 1rem
	}
}

.padding {
	padding: 5rem
}

.card {
	box-shadow: none;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	-ms-box-shadow: none
}

.pl-3, .px-3 {
	padding-left: 1rem !important
}

.card {
	position: relative;
	display: flex;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 1px solid #d2d2dc;
	border-radius: 0
}

.pr-3, .px-3 {
	padding-right: 1rem !important
}

.card .card-body {
	padding: 1.25rem 1.75rem
}

.card-body {
	flex: 1 1 auto;
	padding: 1.25rem
}

.card .card-title {
	color: #000000;
	margin-bottom: 0.625rem;
	text-transform: capitalize;
	font-size: 0.875rem;
	font-weight: 500
}

.add-items {
	margin-bottom: 1.5rem;
	overflow: hidden
}

.d-flex {
	display: flex !important
}

.add-items input[type="text"] {
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
	width: 100%;
	background: transparent
}

.form-control {
	border: 1px solid #f3f3f3;
	font-weight: 400;
	font-size: 0.875rem
}

.form-control {
	display: block;
	width: 100%;
	padding: 0.875rem 1.375rem;
	font-size: 1rem;
	line-height: 1;
	color: #495057;
	background-color: #ffffff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: 2px;
	transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out
}

.add-items .btn {
	margin-left: .5rem
}

.btn {
	font-size: 0.875rem;
	line-height: 1;
	font-weight: 400;
	padding: .7rem 1.5rem;
	border-radius: 0.1275rem
}

.list-wrapper {
	height: 100%;
	max-height: 100%
}

.add-items {
	margin-bottom: 1.5rem;
	overflow: hidden
}

.add-items input[type="text"] {
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
	width: 100%;
	background: transparent
}

.add-items .btn, .add-items .fc button, .fc .add-items button,
	.add-items .ajax-upload-dragdrop .ajax-file-upload,
	.ajax-upload-dragdrop .add-items .ajax-file-upload, .add-items .swal2-modal .swal2-buttonswrapper .swal2-styled,
	.swal2-modal .swal2-buttonswrapper .add-items .swal2-styled, .add-items .wizard>.actions a,
	.wizard>.actions .add-items a {
	margin-left: .5rem
}

.rtl .add-items .btn, .rtl .add-items .fc button, .fc .rtl .add-items button,
	.rtl .add-items .ajax-upload-dragdrop .ajax-file-upload,
	.ajax-upload-dragdrop .rtl .add-items .ajax-file-upload, .rtl .add-items .swal2-modal .swal2-buttonswrapper .swal2-styled,
	.swal2-modal .swal2-buttonswrapper .rtl .add-items .swal2-styled, .rtl .add-items .wizard>.actions a,
	.wizard>.actions .rtl .add-items a {
	margin-left: auto;
	margin-right: .5rem
}

.list-wrapper {
	height: 100%;
	max-height: 100%
}

.list-wrapper ul {
	padding: 0;
	text-align: left;
	list-style: none;
	margin-bottom: 0
}

.list-wrapper ul li {
	font-size: .9375rem;
	padding: .4rem 0;
	border-bottom: 1px solid #f3f3f3
}

.list-wrapper ul li:first-child {
	border-bottom: none
}

.list-wrapper ul li .form-check {
	max-width: 90%;
	margin-top: .25rem;
	margin-bottom: .25rem
}

.list-wrapper ul li .form-check label:hover {
	cursor: pointer
}

.list-wrapper input[type="checkbox"] {
	margin-right: 15px
}

.list-wrapper .remove {
	cursor: pointer;
	font-size: 1.438rem;
	font-weight: 600;
	width: 1.25rem;
	height: 1.25rem;
	line-height: 20px;
	text-align: center
}

.list-wrapper .completed {
	text-decoration: line-through;
	text-decoration-color: #3da5f4
}

.list-wrapper ul li .form-check {
	max-width: 90%;
	margin-top: .25rem;
	margin-bottom: .25rem
}

.list-wrapper ul li .form-check, .list-wrapper ul li .form-check .form-check-label,
	.email-wrapper .mail-sidebar .menu-bar .profile-list-item a .user .u-name,
	.email-wrapper .mail-sidebar .menu-bar .profile-list-item a .user .u-designation,
	.email-wrapper .mail-list-container .mail-list .content .sender-name,
	.email-wrapper .message-body .attachments-sections ul li .details p.file-name,
	.settings-panel .chat-list .list .info p {
	text-overflow: ellipsis;
	overflow: hidden;
	max-width: 100%;
	white-space: nowrap
}

.form-check {
	position: relative;
	display: block;
	margin-top: 10px;
	margin-bottom: 10px;
	padding-left: 0
}

.list-wrapper ul li .form-check, .list-wrapper ul li .form-check .form-check-label,
	.email-wrapper .mail-sidebar .menu-bar .profile-list-item a .user .u-name,
	.email-wrapper .mail-sidebar .menu-bar .profile-list-item a .user .u-designation,
	.email-wrapper .mail-list-container .mail-list .content .sender-name,
	.email-wrapper .message-body .attachments-sections ul li .details p.file-name,
	.settings-panel .chat-list .list .info p {
	text-overflow: ellipsis;
	overflow: hidden;
	max-width: 100%;
	white-space: nowrap
}

.form-check .form-check-label {
	min-height: 18px;
	display: block;
	margin-left: 1.75rem;
	font-size: 0.875rem;
	line-height: 1.5
}

.form-check-label {
	margin-bottom: 0
}

.list-wrapper input[type="checkbox"] {
	margin-right: 15px
}

.form-check .form-check-label input {
	position: absolute;
	top: 0;
	left: 0;
	margin-left: 0;
	margin-top: 0;
	z-index: 1;
	cursor: pointer;
	opacity: 0;
	filter: alpha(opacity = 0)
}

input[type="radio"], input[type="checkbox"] {
	box-sizing: border-box;
	padding: 0
}

.list-wrapper ul li .form-check, .list-wrapper ul li .form-check .form-check-label,
	.email-wrapper .mail-sidebar .menu-bar .profile-list-item a .user .u-name,
	.email-wrapper .mail-sidebar .menu-bar .profile-list-item a .user .u-designation,
	.email-wrapper .mail-list-container .mail-list .content .sender-name,
	.email-wrapper .message-body .attachments-sections ul li .details p.file-name,
	.settings-panel .chat-list .list .info p {
	text-overflow: ellipsis;
	overflow: hidden;
	max-width: 100%;
	white-space: nowrap
}

.form-check .form-check-label input[type="checkbox"]+.input-helper:before
	{
	content: "";
	width: 18px;
	height: 18px;
	border-radius: 2px;
	border: solid #405189;
	border-width: 2px;
	-webkit-transition: all;
	-moz-transition: all;
	-ms-transition: all;
	-o-transition: all;
	transition: all;
	transition-duration: 0s;
	-webkit-transition-duration: 250ms;
	transition-duration: 250ms
}

.form-check .form-check-label input[type="checkbox"]+.input-helper:before,
	.form-check .form-check-label input[type="checkbox"]+.input-helper:after
	{
	position: absolute;
	top: 0;
	left: 0
}

.form-check .form-check-label input[type="checkbox"]+.input-helper:after
	{
	-webkit-transition: all;
	-moz-transition: all;
	-ms-transition: all;
	-o-transition: all;
	transition: all;
	transition-duration: 0s;
	-webkit-transition-duration: 250ms;
	transition-duration: 250ms;
	font-family: Material Design Icons;
	opacity: 0;
	filter: alpha(opacity = 0);
	-webkit-transform: scale(0);
	-ms-transform: scale(0);
	-o-transform: scale(0);
	transform: scale(0);
	content: '\F12C';
	font-size: .9375rem;
	font-weight: bold;
	color: #ffffff
}

.form-check .form-check-label input[type="checkbox"]+.input-helper:before,
	.form-check .form-check-label input[type="checkbox"]+.input-helper:after
	{
	position: absolute;
	top: 0;
	left: 0
}

.form-check .form-check-label input[type="checkbox"]:checked+.input-helper:before
	{
	background: #405189;
	border-width: 0
}

.form-check .form-check-label input[type="checkbox"]+.input-helper:before
	{
	content: "";
	width: 18px;
	height: 18px;
	border-radius: 2px;
	border: solid #405189;
	border-width: 2px;
	-webkit-transition: all;
	-moz-transition: all;
	-ms-transition: all;
	-o-transition: all;
	transition: all;
	transition-duration: 0s;
	-webkit-transition-duration: 250ms;
	transition-duration: 250ms
}

.form-check .form-check-label input[type="checkbox"]+.input-helper:after
	{
	font-family: FontAwesome;
	content: "\f095";
	display: inline-block;
	padding-right: 3px;
	vertical-align: middle;
	color: #fff
}

.text-primary, .list-wrapper .completed .remove {
	color: #405189 !important
}

.list-wrapper .remove {
	cursor: pointer;
	font-size: 1.438rem;
	font-weight: 600;
	width: 1.25rem;
	height: 1.25rem;
	line-height: 20px;
	text-align: center
}

.ml-auto, .list-wrapper .remove, .mx-auto {
	margin-left: auto !important
}

.mdi-close-circle-outline:before {
	content: "\F15A"
}

.list-wrapper ul li {
	font-size: .9375rem;
	padding: .4rem 0;
	border-bottom: 1px solid #f3f3f3
}

.mdi:before {
	font-family: FontAwesome;
	content: "\f00d";
	display: inline-block;
	padding-right: 3px;
	vertical-align: middle;
	font-size: .756em;
	color: #405189
}

.list-wrapper ul {
	padding: 0;
	text-align: left;
	list-style: none;
	margin-bottom: 0
}

.flex-column-reverse {
	flex-direction: column-reverse !important
}

.d-flex, .loader-demo-box, .distribution-chart-legend .distribution-chart,
	.distribution-chart-legend .distribution-chart .item, .list-wrapper ul li,
	.email-wrapper .mail-sidebar .menu-bar .profile-list-item a,
	.email-wrapper .mail-sidebar .menu-bar .profile-list-item a .user,
	.email-wrapper .mail-list-container .mail-list .details, .email-wrapper .message-body .attachments-sections ul li .thumb,
	.email-wrapper .message-body .attachments-sections ul li .details .buttons,
	.lightGallery .image-tile .demo-gallery-poster, .swal2-modal, .navbar .navbar-menu-wrapper .navbar-nav,
	.navbar .navbar-menu-wrapper .navbar-nav .nav-item.nav-profile, .navbar .navbar-menu-wrapper .navbar-nav .nav-item.dropdown .navbar-dropdown .dropdown-item
	{
	display: flex !important
}
</style>
</head>
<body>

	<section class="container col-lg-12 my-2">
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
				<div class="page-content page-container" id="page-content">
					<div class="padding">
						<div class="row container d-flex justify-content-center">
							<div class="col-md-12">
								<div class="card px-3">
									<div class="card-body">
										<h4 class="card-title">Awesome Todo list</h4>

										<!--form 부분  -->
										<form id="commentForm" name="commentForm" method="post">
											<div class="add-items d-flex">
												<input type="text" class="form-control todo-list-input"
													name="todo_content"
													placeholder="What do you need to do today?"> 
													<input
													type="hidden" name="user_no"
													value="${sessionScope.user.user_no}">
												<button
													class="add btn btn-primary font-weight-bold todo-list-add-btn"
													id="addBtn">Add</button>
											</div>
										</form>


										<div class="list-wrapper">
											<ul class="d-flex flex-column-reverse todo-list">
												<!--   <li>
                                    <div class="form-check"> <label class="form-check-label"> <input class="checkbox" type="checkbox"> For what reason would it be advisable. <i class="input-helper"></i></label> </div> <i class="remove mdi mdi-close-circle-outline"></i>
                                </li>
                                <li class="completed">
                                    <div class="form-check"> <label class="form-check-label"> <input class="checkbox" type="checkbox" checked=""> For what reason would it be advisable for me to think. <i class="input-helper"></i></label> </div> <i class="remove mdi mdi-close-circle-outline"></i>
                                </li>
                                <li>
                                    <div class="form-check"> <label class="form-check-label"> <input class="checkbox" type="checkbox"> it be advisable for me to think about business content? <i class="input-helper"></i></label> </div> <i class="remove mdi mdi-close-circle-outline"></i>
                                </li>
                                <li>
                                    <div class="form-check"> <label class="form-check-label"> <input class="checkbox" type="checkbox"> Print Statements all <i class="input-helper"></i></label> </div> <i class="remove mdi mdi-close-circle-outline"></i>
                                </li>
                                <li class="completed">
                                    <div class="form-check"> <label class="form-check-label"> <input class="checkbox" type="checkbox" checked=""> Call Rampbo <i class="input-helper"></i></label> </div> <i class="remove mdi mdi-close-circle-outline"></i>
                                </li> -->
												<li>
													<div class="form-check">
														<label class="form-check-label"> <input
															class="checkbox" type="checkbox"> Print bills <i
															class="input-helper"></i></label>
													</div> <i class="remove mdi mdi-close-circle-outline"></i>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>


			</div>
		</div>
	</section>

	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
<jsp:include page="../common/scri.jsp"></jsp:include><hr>
<script type="text/javascript">
	/* function fn_comment() {
	 $.ajax({
	 type : 'POST',
	 url : "<c:url value='/myPage/toDo'/>",
	 data : $("#commentForm").serialize(),
	 success : function(data) {
	
	 console.log(data);
	 //getCommentList();
	
	 },
	 error : function(request, status, error) {
	 alert("code:" + request.status + "\n" + "message:"
	 + request.responseText + "\n" + "error:" + error);
	 }

	 });
	 } */
	$(function() {

	/* 	if($("input:checkbox[name=cb]").is(":checked") == true) {
			  console.log("클릭");
		} */
		
	
		
		
		getCommentList();

		
		
	
		
		
		console.log($("#commentForm").serialize());
		$("#addBtn").on("click", function() {

			$.ajax({
				type : 'POST',
				url : "<c:url value='/myPage/toDo'/>",
				data : $("#commentForm").serialize(),
				success : function(data) {
					if (data == 'ss') {
						console.log(data);
						getCommentList();
					}

				},
				error : function(request, status, error) {

				}

			});
		});
	});

	function getCommentList() {

		$
				.ajax({
					type : 'GET',
					url : "<c:url value='/myPage/commentList'/>",
					dataType : "json",
					data : $("#commentForm").serialize(),
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					success : function(data) {

						var html = "";
						var cCnt = data.length;
						//console.log(data);

						if (data.length > 0) {
							for (i = 0; i < data.length; i++) {
							
									
								if(data[i].complete==1){
								
									html += '<li>';
									html += '<div class="form-check">';
									html += '<label class="form-check-label">';
									html += '<input class="checkbox" type="checkbox" id="cb" name="cb" value="'+data[i].todo_no+'" checked="checked">'
											+ data[i].todo_content
											+ '<i class="input-helper"></i></label> </div>';
									html+='<div style="display:none;" id="tno">'+data[i].todo_no+'<div>'
									html += '<i class="remove mdi mdi-close-circle-outline"></i>';
								}else{
						
			
									
									html += '<li>';
									html += '<div class="form-check">';
									html += '<label class="form-check-label">';
									html += '<input class="checkbox" type="checkbox" id="cb" name="cb" value="'+data[i].todo_no+'">'
											+ data[i].todo_content
											+ '<i class="input-helper"></i></label> </div>';
									html+='<div style="display:none;" id="tno">'+data[i].todo_no+'<div>'
									html += '<i class="remove mdi mdi-close-circle-outline"></i>';	
								}
									
								

								/*  <li>
								 <div class="form-check"> <label class="form-check-label"> <input class="checkbox" type="checkbox"> Print bills <i class="input-helper"></i></label> </div> <i class="remove mdi mdi-close-circle-outline"></i>
								</li>
								<input class="checkbox" type="checkbox" id="cb" name="cb" checked="checked">'
								*/
							}

						} else {

							html += "<div>";
							html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
							html += "</table></div>";
							html += "</div>";

						}

						$(".todo-list").html(html);
					},
					error : function(request, status, error) {

					}

				});
	}
</script>
<script type="text/javascript">
	(function($) {
		'use strict';
		$(function() {
			var todoListItem = $('.todo-list');
			var todoListInput = $('.todo-list-input');
			$('.todo-list-add-btn')
					.on(
							"click",
							function(event) {
								event.preventDefault();

								var item = $(this).prevAll('.todo-list-input')
										.val();

								if (item) {
									todoListItem
											.append("<li> <div class='form-check'><label class='form-check-label'><input class='checkbox' type='checkbox' />"
													+ item
													+ "<i class='input-helper'></i></label></div><i class='remove mdi mdi-close-circle-outline'></i></li>");
									todoListInput.val("");
								}

							});

			todoListItem.on('change', '.checkbox', function(e) {
				var t_no=$(this).val()
				//클릭 풀었을때
				if ($(this).attr('checked')) {
					$(this).removeAttr('checked');
					console.log("체크1");
				} else {
					//클릭했을때(검정색 만들기)
					e.preventDefault();
					$(this).attr('checked', 'checked');
					console.log("체크2");
					//console.log($(this));
					
					//var t_no=$('#tno').text();
					console.log("todo번호:"+t_no);
/* 					$.ajax({
						type : 'POST',
						url : "<c:url value='/myPage/toDo'/>",
						data : $("#commentForm").serialize(),
						success : function(data) {
							if (data == 'ss') {
								console.log(data);
								getCommentList();
							}

						},
						error : function(request, status, error) {

						}

					}); */
				}

				$(this).closest("li").toggleClass('completed');

			});

			todoListItem.on('click', '.remove', function() {
				$(this).parent().remove();
				console.log("삭제되나");
			}); 

		});
	})(jQuery);
</script>
<script type="text/javascript">


</script>
</html>
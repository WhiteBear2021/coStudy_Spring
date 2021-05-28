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
<link type="text/css" rel="stylesheet"
	href="/resources/css/groupMain_style.css">
<link type="text/css" rel="stylesheet" href="/resources/css/timer.css">
<link type="text/css" rel="stylesheet"
	href="/resources/css/groupSidebar_list.css">



<link rel="stylesheet" type="text/css"
	href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">

</head>
<body>
	<input id="user_no" type="hidden" value="${user.user_no }">
	<div id="wrapper">
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">

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
					<nav id="" >Peed</nav>
				</li>
				<li>
					<nav id="groupSetting"
						onclick="location.href='/groupPage/groupSetting?studygroup_no=${studygroup_no}'">
						가입신청()</nav>
				</li>
				<li>
					<nav id="class_timer">시간표</nav>
				</li>

			</ul>
		</div>
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row" id="topbar">
					<div class="col-lg-12">
						<a href="#" class="btn" id="menu-toggle"><span
							class="glyphicon glyphicon-menu-hamburger"></span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="backback">

		<div class="container" id="group-Main-body">

			<!--       <input type="hidden" name="studyGroup_no" value="1"> <input

         type="hidden" name="studyGroup_no" value="1"> -->
			<div id="background-body">
				<div class="container bootstrap snippets bootdey">
					<div class="col-lg-8" id="peed">
						<div style="overflow: scroll; width: 700px; height: 700px;">


							<c:forEach var="board" items="${boardList}">
								<div class="panel panel-white post panel-shadow">
									<div class="post-heading">
										<div class="pull-left image">
											<img src="${user.user_thumbImg}" class="img-circle avatar"
												alt="user profile image">
										</div>
										<!--작성자 이름  -->
										<div class="pull-left meta">
											<div class="title h5">
												<a href="#"><b>${board.page_board_writer }</b></a> 작성함
											</div>
											<%--  <input type="hidden" value="${board.page_board_no }">
                              <h6 class="text-muted time">${board.page_board_date }</h6>
                              <h1>${board.page_board_no }</h1> --%>
										</div>
									</div>
									<!--글목록  -->
									<div class="post-description">
										<p>${board.page_board_content }</p>


									</div>

									<!--댓글  -->
									<div class="post-footer">
										<div class="input-group">

											<form action="insertGroupReply" method="post">
												<input type="hidden" name="studygroup_no"
													value="${board.studyGroup_no }"> <input
													type="hidden" name="page_board_no"
													value="${board.page_board_no }"> <input
													type="hidden" class="form__field" name="group_reply_writer"
													value="${sessionScope.user.user_id}" /> 
													<input type="text" class="CCCC" name="group_reply_content" 
													placeholder="내용을 입력해주세요." />

												<button type="submit"
													class="btn btn--primary">댓글달기</button>
											</form>

										</div>

										<c:forEach var="relist" items="${relist }">
											<c:if test="${board.page_board_no==relist.page_board_no }">

												<ul class="comments-list">
													<li class="comment"><a class="pull-left" href="#">
															<img class="avatar" src="../img/manager.png" alt="avatar">
													</a>
														<div class="comment-body">
															<div class="comment-heading">
																<h4 class="user">${relist.group_reply_writer }</h4>
															</div>
															<p>${relist.group_reply_content }</p>
														</div></li>
												</ul>
											</c:if>
										</c:forEach>
									</div>



								</div>


							</c:forEach>



						</div>
					</div>
					<div class="col-lg-2 col-md-12" id="group-Main-right"
						style="right: 0">
						<div id="group-Main-right-top"
							class="panel panel-white post panel-shadow" class="col-md-5">
							<div id="right-sidebar-gibox"></div>
							<div id="right-sidebar-fileBox"></div>
							<a
								href="/groupPage/chattingForm/${studygroup_no}/${user.user_no}"
								onclick="window.open(this.href, '_blank', 'width=800, height=1000'); return false;">그룹
								채팅</a> <a
								href="/groupPage/voiceChatting?studygroup_no=${studygroup_no}"
								onclick="window.open(this.href, '_blank', 'width=2000, height=1000'); return false;">음성
								채팅</a>
						</div>
						<div id="group-Main-right-bottom"
							class="panel panel-white post panel-shadow" class="col-md-5">
							<h3>USER LIST</h3>
							<div id="right-sidebar-userlist">
								<table class="table table-hover" id="userlist">
									<c:forEach var="userList" items="${userList }">
										<tr>
											<td>${userList.user_lastName }${userList.user_firstName }</td>
										</tr>
									</c:forEach>


								</table>
							</div>
							<div id="right-sidebar-groupchat"></div>
						</div>
					</div>
				</div>


				<!-- 글작성 -->
				<form action="insert" method="post">
					<div id="write">
						<input type="hidden" name="studygroup_no" value="${studygroup_no}">
						<input id="page_board_content" type="text"
							name="page_board_content" style="width: 595px; height: 60px;">
						<button id="button" class="btn btn--primary"
							type="submit" style="width: 100px; height: 60px;">작성</button>
					</div>

				</form>



			</div>
		</div>
	</div>
	<jsp:include page="../common/scri.jsp"></jsp:include>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
<!-- partial -->
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js'></script>
<script src="/resources/js/side.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="module" src="/resources/js/timer.js"></script>



<script type="text/javascript">
	$(document).on(
			"click",
			".naccs .menu div",
			function() {
				var numberIndex = $(this).index();

				if (!$(this).is("active")) {
					$(".naccs .menu div").removeClass("active");
					$(".naccs ul li").removeClass("active");

					$(this).addClass("active");
					$(".naccs ul").find("li:eq(" + numberIndex + ")").addClass(
							"active");

				}
			});
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<jsp:include page="../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/myPage/myPage.css">
<link rel="stylesheet" href="/resources/vendor/bootstrap-icons/font/bootstrap-icons.css">
<title>Insert title here</title>

</head>
<body>

		<section class="container col-lg-12">
			<div class="row">
				<div class="col-lg-3 bg-secondary m-5 text-center">
						<nav id="side_left" class="my-auto">
							<ul class="list-unstyled ">
								<li class="p-1"><a href="/myPage/studyDiaryList">공부일기</span>&nbsp;&nbsp;<i class="bi bi-journal-check fs-1"></i></a></li>
								<li class="p-1"><a href="/myPage/scheduleList">일정관리&nbsp;&nbsp; <i class="bi bi-calendar-month fs-1"></i></a></li>
								<li class="p-1"><a href="#">1:1 채팅목록&nbsp;&nbsp;<i class="bi bi-chat-square-quote fs-1"></i></a></li>
								<li class="p-1"><a href="/myPage/joinGroupList">참가 그룹 목록&nbsp;&nbsp;<i class="bi bi-chat-quote fs-1"></i></a></li>
								<li class="p-1"><a href="/myPage/categoryUpdate">관심 분야 수정&nbsp;&nbsp;<i class="bi bi-pencil-fill fs-1"></i></a></li>
								<li class="p-1"><a href="/myPage/userUpdate">회원 정보 수정&nbsp;&nbsp;<i class="bi bi-tools fs-1"></i></a></li>
								<li class="p-1"><a href="/myPage/applyQuitUserCheck">회원 탈퇴 신청&nbsp;&nbsp;<i class="bi bi-person-x fs-1"></i></a></li>
							</ul>
						</nav>
				</div>
				<div class="col-lg-8" id="contents">
					<h3>참여 그룹 목록</h3>
					<hr style="width:800px;">
					<div class="row">
								<c:forEach var="studyGroup" items="${joinGroupList}">
									<div class="col-lg-4">
													
										<table class="table table-striped table-hover">
											<thead>
													<tr>
														<th><a href="/groupPage/groupMain?studygroup_no=${studyGroup.studygroup_no }">${studyGroup.studygroup_no }</a></th>
													</tr>
											</thead>
											<tbody>
													<tr>
														<td>
															<figure><img src="group1.jpg" alt="그룹사진없음">
																<figcaption><a href="/CoStudy/groupPage/groupMain?studygroup_no=${studyGroup.studygroup_no }">${studyGroup.studygroup_name }</a></figcaption>
															</figure>
														</td>
													</tr>
													<tr>					
														<td>정보 : ${studyGroup.studygroup_info }<br>
															지역 :	${studyGroup.studygroup_location }<br>
															생성일 :	${studyGroup.made_date }	
														</td>
													</tr>
											</tbody>
										</table>
									</div>	
								</c:forEach>
						</div>
					</div>
					
					
				</div>
		
		</section>		
		<jsp:include page="../common/footer.jsp"></jsp:include> 
</body>
</html>

			  			
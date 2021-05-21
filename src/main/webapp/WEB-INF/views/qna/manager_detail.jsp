<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<jsp:include page="../managerModule/head.jsp"></jsp:include><hr>
<body class="">

	<jsp:include page="../managerModule/header.jsp"></jsp:include><hr>
	<%-- 	<p>${qna_number }</p> --%>
	<div class="pcoded-main-container">
		<div class="pcoded-content">

			<div class="page-header">
				<div class="page-block">
					<div class="row align-items-center">
						<div class="col-md-12">
							<div class="page-header-title">
								<h5 class="m-b-10">공지사항</h5>
							</div>
							<ul class="breadcrumb">
								<li class="breadcrumb-item"><a href="#"><i
										class="feather icon-home"></i></a></li>
								<li class="breadcrumb-item"><a href="#!">Main</a></li>
								<li class="breadcrumb-item"><a href="#!">Main</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-12 col-md-12">
					<div class="card chat-card">
						<div class="card-header">
							<h5>${qna_number }번글1:1문의</h5>
							<div class="card-header-right">
								<div class="btn-group card-option">
									<button type="button" class="btn dropdown-toggle"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">
										<i class="feather icon-more-horizontal"></i>
									</button>
									<ul
										class="list-unstyled card-option dropdown-menu dropdown-menu-right">
										<li class="dropdown-item full-card"><a href="#!"><span><i
													class="feather icon-maximize"></i> maximize</span><span
												style="display: none"><i
													class="feather icon-minimize"></i> Restore</span></a></li>
										<li class="dropdown-item minimize-card"><a href="#!"><span><i
													class="feather icon-minus"></i> collapse</span><span
												style="display: none"><i class="feather icon-plus"></i>
													expand</span></a></li>
										<li class="dropdown-item reload-card"><a href="#!"><i
												class="feather icon-refresh-cw"></i> reload</a></li>
										<li class="dropdown-item close-card"><a href="#!"><i
												class="feather icon-trash"></i> remove</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="card-body">
							<!--회원쪽  -->

							<c:forEach var="qna" items="${detail }">

								<c:if test="${qna.user_no>0}">
									<div class="row m-b-20 received-chat">
										<div class="col-auto p-r-0">
											<img src="/resources/img/manager.png" alt="user image"
												class="img-radius wid-40">
										</div>
										<div class="col">
											<div class="msg">
												<h5>${qna.qna_title }</h5>
												<p class="m-b-0">${qna.qna_content }</p>
											</div>
											<p class="text-muted m-b-0">
												<i class="fa fa-clock-o m-r-10"></i>${qna.regdate }
											</p>
										</div>
									</div>
								</c:if>

								<c:if test="${qna.manager_no>0}">
									<!--관리자쪽 -->
									<div class="row m-b-20 send-chat">
										<div class="col">
											<div class="msg">
												<h5 style="color: white;">${qna.qna_title }</h5>
												<p class="m-b-0">${qna.qna_content }</p>

											</div>
											<p class="text-muted m-b-0">
												<i class="fa fa-clock-o m-r-10"></i>${qna.regdate }
											</p>
										</div>
										<div class="col-auto p-l-0">
											<img src="/resources/img/manager.png" alt="user image"
												class="img-radius wid-40">
										</div>
									</div>
								</c:if>
							</c:forEach>


							<div class="form-group m-t-15">
								<form action="ManagerReplyInsert" method="post">

									<h5>답글 등록하기</h5>
									<input type="hidden" name="qna_no" value="${qna_number }"><br>

									<input type="text" name="qna_content" class="form-control"
										id="Project" placeholder="글 내용 입력">

									<div class="form-icon">
										<button class="btn btn-primary btn-icon" type="submit">
											<i class="feather icon-message-circle"></i>
										</button>
									</div>
								</form>
							</div>



						</div>
					</div>

				</div>
			</div>

		</div>
	</div>

</body>
<jsp:include page="../managerModule/footer.jsp"></jsp:include><hr>
</html>
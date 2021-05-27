<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<jsp:include page="../managerModule/head.jsp"></jsp:include><hr>
<body class="">

	<jsp:include page="../managerModule/header.jsp"></jsp:include><hr>

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
				<div class="col-sm-12">
					<div class="card">
						<div class="card-header">
							<h5>공지사항 리스트</h5>
						</div>
						<div class="card-body">

							<div class="tab-content" id="myTabContent">
								<div class="tab-pane fade show active" id="home" role="tabpanel"
									aria-labelledby="home-tab">
									<div class="col-xl-12">
										<div class="card">

											<div class="card-body table-border-style">
												<div class="table-responsive">

													<table class="table table-striped"
														style="text-align: center;">
														<thead>
															<tr>
																<th>공지사항번호</th>
																<th>제목</th>
																<th>날짜</th>
																<th>관리자번호</th>
															</tr>
														</thead>
														<tbody>

															<c:forEach var="notice" items="${list }">
																<tr>
																	<th>${notice.notice_no }</th>
																	<%-- <th>${notice.notice_title }</th> --%>
																	<th><a
																		href="/notice/detail?notice_no=${notice.notice_no }">
																			${notice.notice_title } </a></th>

																	<th><fmt:formatDate pattern="yyyy-MM-dd"
																			value="${notice.notice_date }" />
																	</th>
																	<th>${notice.manager_no }</th>
																</tr>
															</c:forEach>



														</tbody>
													</table>
												
												</div>
											</div>
										</div>
									</div>
								</div>


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
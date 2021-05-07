<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

															<c:forEach var="notice" items="${listPage.list }">
																<tr>
																	<th>${notice.notice_no }</th>
																	<th><a href="noticeDetailAction.do?notice_no=${notice.notice_no }">${notice.notice_title }</th>
																	<th>${notice.notice_date }</th>
																	<th>${notice.manager_no }</th>
																</tr>
															</c:forEach>



														</tbody>
													</table>
													<nav aria-label="..." >
														<ul class="pagination">
															<c:if test="${listPage.startPage > 3 }">
																<li class="page-item"><a class="page-link"
																	href="noticeInfoAction.do?pageNum=${listPage.startPage -1 }">Previous</a></li>
															</c:if>

															<!-- 페이지목록 -->
															<c:forEach var="pageNo" begin="${listPage.startPage }"
																end="${listPage.endPage }">
																<c:if test="${listPage.requestPage == pageNo }">
																	<li class="page-item active"><span
																		class="page-link">${pageNo }<span
																			class="sr-only">(current)</span></span></li>
																</c:if>
																<c:if test="${listPage.requestPage != pageNo }">
																	<li class="page-item"><a class="page-link"
																		href="noticeInfoAction.do?pageNum=${pageNo }">${pageNo }</a></li>

																</c:if>
															</c:forEach>

															<!-- 이후 영역 -->
															<c:if
																test="${listPage.endPage < listPage.totalPageCount}">
																
																	<li class="page-item"><a class="page-link"
																	href="noticeInfoAction.do?pageNum=${listPage.endPage +1 }">Next</a></li>
															</c:if>
														</ul>
													</nav>

									
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
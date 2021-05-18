<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<jsp:include page="../managerModule/head.jsp"></jsp:include><hr>
	<jsp:include page="../managerModule/header.jsp"></jsp:include><hr>
<body class="">


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
							<h5>1:1 대화 리스트</h5>
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
																<td>글번호</td>
																<td>글제목</td>
																<td>글내용</td>
																<td>작성일자</td>

																<td>회원번호</td>

															</tr>
														</thead>
														<tbody>

															<c:forEach var="qna" items="${qnaPage.list }">
																<tr>
																	<th>${qna.qna_no }</th>
																	<th><a
																		href="QnaDetailAction.do?qna_no=${qna.qna_no }">${qna.qna_title }</a></th>
																	<th>${qna.qna_content }</th>
																	<th>${qna.regdate }</th>
																	<th>${qna.user_no }</th>
																</tr>

															</c:forEach>



														</tbody>
													</table>

													<nav aria-label="...">
														<ul class="pagination">
															<c:if test="${qnaPage.startPage > 3 }">
																<li class="page-item"><a class="page-link"
																	href="QnaInfoAction.do?pageNum=${qnaPage.startPage -1 }">Previous</a></li>
															</c:if>

															<!-- 페이지목록 -->
															<c:forEach var="pageNo" begin="${qnaPage.startPage }"
																end="${qnaPage.endPage }">
																<c:if test="${qnaPage.requestPage == pageNo }">
																	<li class="page-item active"><span
																		class="page-link">${pageNo }<span
																			class="sr-only">(current)</span></span></li>
																</c:if>
																<c:if test="${qnaPage.requestPage != pageNo }">
																	<li class="page-item"><a class="page-link"
																		href="QnaInfoAction.do?pageNum=${pageNo }">${pageNo }</a></li>

																</c:if>
															</c:forEach>

															<!-- 이후 영역 -->
															<c:if test="${qnaPage.endPage < qnaPage.totalPageCount}">

																<li class="page-item"><a class="page-link"
																	href="QnaInfoAction.do?pageNum=${qnaPage.endPage +1 }">Next</a></li>
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
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
																<th>스터디그룹 번호</th>
																<th>이름</th>
																<th>위치</th>
																<th>만든날짜</th>
															
																<th>대면/비대면</th>
																
															</tr>
														</thead>
														<tbody>

															<c:forEach var="st" items="${slist }">
																<tr>
																	<th>${st.studygroup_no }</th>
																	<th>${st.studygroup_name }</th>
																	<th>${st.studygroup_location }</th>
																	

																	<th><fmt:formatDate pattern="yyyy-MM-dd"
																			value="${st.made_date }" />
																	</th>
															
																	<th>${st.isface }</th>
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
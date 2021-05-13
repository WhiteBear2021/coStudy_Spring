<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
								<h5 class="m-b-10">사용자 관리</h5>
							</div>
							<ul class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html"><i
										class="feather icon-home"></i></a></li>
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
							<h5>전체 사용자 리스트</h5>
						</div>
						<div class="card-body">
							<div class="tab-content" id="myTabContent">
								<div class="tab-pane fade show active" id="home" role="tabpanel"
									aria-labelledby="home-tab">
									<div class="col-xl-12">
										<div class="card">

											<div class="card-body table-border-style">
												<div class="table-responsive">
													<table class="table"
														style="text-align: center;">
														<thead>
															<tr>
																<td>회원번호</td>
																<td>아이디</td>
																<td>성</td>
																<td>이름</td>
																<td>전화번호</td>
																<td>주소</td>
																<td>생년월일</td>
																<td>이메일</td>
																<td>등록일</td>
															</tr>
														</thead>
														<tbody>
															<c:forEach var="user" items="${list}">
																<tr>
																	<td><c:out value="${user.user_no }"/></td>
																	<td><c:out value="${user.user_id }"/></td>
																	<td><c:out value="${user.user_lastName }"/></td>
																	<td><c:out value="${user.user_firstName }"/></td>
																	<td><c:out value="${user.user_phoneNo }"/></td>
																	<td><c:out value="${user.user_address1 }"/></td>
																	<td><fmt:parseDate var="dt"
																			value="${user.user_birth }" pattern="yyyy-MM-dd " />
																		<fmt:formatDate value="${dt }" pattern="yyyy/MM/dd" /></td>
																	<td><c:out value="${user.user_email }"/></td>
																	<td><fmt:parseDate var="dt"
																			value="${user.user_register_date }"
																			pattern="yyyy-MM-dd " /> <fmt:formatDate
																			value="${dt }" pattern="yyyy/MM/dd" /></td>
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
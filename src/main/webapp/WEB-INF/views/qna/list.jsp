<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.js"></script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
<jsp:include page="../common/head.jsp"></jsp:include>


<jsp:include page="../common/header.jsp"></jsp:include>
<style type="text/css">
body, button, input {
	font-family: 'Montserrat', sans-serif;
	font-weight: 700;
	letter-spacing: 1.4px;
}

.background {
	display: flex;
	min-height: 100vh;
}

.container {
	flex: 0 1 700px;
	margin: auto;
	padding: 10px;
}

.screen {
	position: relative;
	background: #3e3e3e;
	border-radius: 15px;
}

.screen:after {
	content: '';
	display: block;
	position: absolute;
	top: 0;
	left: 20px;
	right: 20px;
	bottom: 0;
	border-radius: 15px;
	box-shadow: 0 20px 40px rgba(0, 0, 0, .4);
	z-index: -1;
}

.screen-header {
	display: flex;
	align-items: center;
	padding: 10px 20px;
	background: #4d4d4f;
	border-top-left-radius: 15px;
	border-top-right-radius: 15px;
}

.screen-header-left {
	margin-right: auto;
}

.screen-header-button {
	display: inline-block;
	width: 8px;
	height: 8px;
	margin-right: 3px;
	border-radius: 8px;
	background: white;
}

.screen-header-button.close {
	background: #ed1c6f;
}

.screen-header-button.maximize {
	background: #e8e925;
}

.screen-header-button.minimize {
	background: #74c54f;
}

.screen-header-right {
	display: flex;
}

.screen-header-ellipsis {
	width: 3px;
	height: 3px;
	margin-left: 2px;
	border-radius: 8px;
	background: #999;
}

.screen-body {
	display: flex;
}

.screen-body-item {
	width: 35%;
	padding: 50px;
}

.screen-body-item-2 {
	width: 65%;
	padding: 50px;
}

.screen-body-item.left {
	display: flex;
	flex-direction: column;
}

.app-title {
	display: flex;
	flex-direction: column;
	position: relative;
	color: #ea1d6f;
	font-size: 26px;
}

.app-title:after {
	content: '';
	display: block;
	position: absolute;
	left: 0;
	bottom: -10px;
	width: 25px;
	height: 4px;
	background: #ea1d6f;
}

.app-contact {
	margin-top: auto;
	font-size: 8px;
	color: #888;
}

.app-form-group {
	margin-bottom: 15px;
}

.app-form-group.message {
	margin-top: 40px;
}

.app-form-group.buttons {
	margin-bottom: 0;
	text-align: right;
}

.app-form-control {
	width: 100%;
	padding: 10px 0;
	background: none;
	border: none;
	border-bottom: 1px solid #666;
	color: #ddd;
	font-size: 14px;
	text-transform: uppercase;
	outline: none;
	transition: border-color .2s;
}

.app-form-control::-moz-placeholder {
	color: #666;
}

.app-form-control:-ms-input-placeholder {
	color: #666;
}

.app-form-control::placeholder {
	color: #666;
}

.app-form-control:focus {
	border-bottom-color: #ddd;
}

.app-form-button {
	background: none;
	border: none;
	color: #ea1d6f;
	font-size: 21px;
	cursor: pointer;
	outline: none;
}

.app-form-button:hover {
	color: #b9134f;
}

.credits {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 20px;
	color: #ffa4bd;
	font-family: 'Roboto Condensed', sans-serif;
	font-size: 16px;
	font-weight: normal;
}

.credits-link {
	display: flex;
	align-items: center;
	color: #fff;
	font-weight: bold;
	text-decoration: none;
}

.dribbble {
	width: 20px;
	height: 20px;
	margin: 0 5px;
}

@media screen and (max-width: 520px) {
	.screen-body {
		flex-direction: column;
	}
	.screen-body-item.left {
		margin-bottom: 30px;
	}
	.app-title {
		flex-direction: row;
	}
	.app-title span {
		margin-right: 12px;
	}
	.app-title:after {
		display: none;
	}
}

@media screen and (max-width: 600px) {
	.screen-body {
		padding: 40px;
	}
	.screen-body-item {
		padding: 0;
	}
}
</style>
<style>
.modal-content {
	background-color: transparent !important;
	border: 0 !important;
}

@media screen and (min-width: 576px) {
	.modal-dialog {
		max-width: 800px !important;
	}
}
</style>
<body>

	<div class="container">
	<a href="#" class="primary-btn"
		data-toggle="modal" data-target="#myModal" style="float: right;margin-bottom: 30px;">NEW QnA</a>
		
		<br><br>
		
		<table class="table">
			<thead class="thead-dark">
				<tr style="text-align: center;">

					<th style="width: 15%;">글번호</th>
					<th style="width: 55%;">제목</th>
					<th style="width: 20%;">날짜</th>
					<th style="width: 10%;">확인여부</th>

				</tr>
			</thead>
			<tbody class="tb">
				<tr>
					<th scope="row">1</th>
					<td>글제목</td>
					<td>날짜</td>
					<td><i class="fa fa-close"></i></td>
				</tr>
				<tr>
					<th scope="row">1</th>
					<td>글제목</td>
					<td>날짜</td>
					<td><i class="fa fa-close"></i></td>
				</tr>

			</tbody>
		</table>


	</div>

	<br>
	<br>
<!-- 	<button type="button" class="btn btn-secondary btn-lg"
		data-toggle="modal" data-target="#myModal">1대1문의 등록
	</button> -->
 <!-- <a href="#" class="primary-btn"
		data-toggle="modal" data-target="#myModal">NEW QnA</a> -->
	<br>
	<br>
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">


				<div class="background">
					<div class="container">
						<div class="screen">
							<div class="screen-header">
								<div class="screen-header-left">
									<div class="screen-header-button maximize"></div>
									<div class="screen-header-button maximize"></div>
									<div class="screen-header-button minimize"></div>
								</div>
								<div class="screen-header-right">
									<div class="screen-header-ellipsis"></div>
									<div class="screen-header-ellipsis"></div>
									<div class="screen-header-ellipsis"></div>
								</div>
							</div>
							<div class="screen-body">
								<div class="screen-body-item left">
									<div class="app-title">
										<span>1:1</span> <span>문의하기</span>
									</div>

								</div>
								<div class="screen-body-item-2">
									<div class="app-form">
										<form id="commentForm" name="commentForm" method="post">
											<div class="app-form-group">
												<input class="app-form-control" placeholder="제목을 입력하세요"
													id="qna_title" name="qna_title">
											</div>
											<div class="app-form-group">
												<input class="app-form-control" placeholder="내용을 입력하세요"
													id="qna_content" name="qna_content">
											</div>

											<input type="hidden" name="user_no"
												value="${sessionScope.user.user_no }">


											<div class="app-form-group buttons">
												<a href='#' onClick="fn_comment('${result.code }')"
													class="app-form-button">등록</a>&nbsp;&nbsp;|&nbsp;&nbsp; <a
													href='#' class="app-form-button">취소</a>
											</div>


											<%-- 	<div class="app-form-group buttons">
                                          
                                            <button class="app-form-button" onClick="fn_comment('${result.code }')">등록</button>
                                            <button class="app-form-button">cancel</button>
                                        </div> --%>

										</form>


									</div>
								</div>
							</div>
						</div>

					</div>
				</div>


			</div>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include><hr>
</body>
<script src="/resources/js/jquery.js"></script>

<jsp:include page="../common/scri.jsp"></jsp:include>
<script>
	$(document).ready(function() {
		$('#action_menu_btn').click(function() {
			$('.action_menu').toggle();
		});

		$('.mo').click(function() {
			$('#modal').modal("show");
		});
	});
</script>
<script type="text/javascript">
	$('#myModal').on('shown.bs.modal', function() {
		$('#myInput').focus()
	})
</script>
<script type="text/javascript">
	function fn_comment(code) {

		$.ajax({
			type : 'POST',
			url : "<c:url value='/qna/user_insert'/>",
			data : $("#commentForm").serialize(),
			success : function(data) {
				if (data == "success") {
					getCommentList();

					$('.modal').modal("hide"); //모달창닫기 
				}
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}

		});
	}

	$(function() {

		getCommentList();

	});

	function getCommentList() {

		$
				.ajax({
					type : 'GET',
					url : "<c:url value='/qna/commentList'/>",
					dataType : "json",
					data : $("#commentForm").serialize(),
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					success : function(data) {

						var html = "";
						var cCnt = data.length;
						console.log(data);
						if (data.length > 0) {
							for (i = 0; i < data.length; i++) {

								html += '<tr style="text-align: center;">';
								html += '<th>' + data[i].qna_no + '</th>';
								html += '<td>' + data[i].qna_title + '</td>';
								html += '<td>' + data[i].regdate + '</td>';
								html += '<td><i class="fa fa-close"></i></td>';
								html += '</tr>';

							}

						} else {

							html += "<div>";
							html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
							html += "</table></div>";
							html += "</div>";

						}

						/* $("#cCnt").html(cCnt); */
						$(".tb").html(html);

					},
					error : function(request, status, error) {

					}

				});
	}
</script>
<script type="text/javascript">
	$('#myModal').on('shown.bs.modal', function() {
		$('#myInput').focus()
	})
</script>

</html>
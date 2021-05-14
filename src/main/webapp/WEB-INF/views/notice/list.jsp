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
								<h4 class="m-b-10">공지사항</h4>
							</div>
							<ul class="breadcrumb">
								<li class="breadcrumb-item"><a href="#"><i
										class="feather icon-home"></i></a></li>
								<li class="breadcrumb-item"><a href="#">Main</a></li>
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
																	<th><a class='move'
																		href="/notice/detail?notice_no=${notice.notice_no }">
																			${notice.notice_title } </a></th>

																	<th><fmt:formatDate pattern="yyyy-MM-dd"
																			value="${notice.notice_date }" /></th>
																	<th>${notice.manager_no }</th>
																</tr>
															</c:forEach>



														</tbody>
													</table>
													<nav aria-label="...">
														<ul class="pagination">
															<!--이전  -->
															<c:if test="${pageMaker.prev}">
																<li class="page-item"><a class="page-link"
																	href="${pageMaker.startPage -1}">Previous</a></li>
															</c:if>

															<!-- 페이지목록 -->
															<c:forEach var="num" begin="${pageMaker.startPage }"
																end="${pageMaker.endPage }">

																<li class="page-item ${pageMaker.cri.pageNum == num ? "active":""}">
																	<a class="page-link" href="${num }">${num }</a>
																</li>


															</c:forEach>

															<!-- 이후 영역 -->
															<c:if test="${pageMaker.next}">

																<li class="page-item"><a class="page-link"
																	href="${pageMaker.endPage +1 }">Next</a></li>
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

	<!--페이징 처리 부분 -->
	<form id='actionForm' action="/notice/list" method='get'>
		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
		<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

	</form>



	<div class="modal-frame" style="box-sizing: border-box;">
		<div class="modal">
			<div class="modal-inset">
				<div class="button close">
					<i class="fa fa-close"></i>
				</div>

				<div class="modal-body">
					<h4></h4>
					<p></p>
				</div>
			</div>
		</div>
	</div>
	<div class="modal-overlay" style="box-sizing: border-box;"></div>
</body>
<jsp:include page="../managerModule/footer.jsp"></jsp:include><hr>
<script type="text/javascript">
	$(function() {
		var success_no = '<c:out value="${success.success_no }"></c:out>';
		var page = '<c:out value="${success.page }"></c:out>';

		noticeInsertModal(success_no);

		history.replaceState({}, null, null);

		function noticeInsertModal(success_no) {
			if (success_no === '' || history.state) {
				return;
			}

			if (parseInt(success_no) > 0) {
				$modal = $('.modal-frame');
				$overlay = $('.modal-overlay');

				$modal
						.bind(
								'webkitAnimationEnd oanimationend msAnimationEnd animationend',
								function(e) {
									if ($modal.hasClass('state-leave')) {
										$modal.removeClass('state-leave');
									}
								});
				$overlay.addClass('state-show');
				$modal.removeClass('state-leave').addClass('state-appear');
			}

			if (page == 'insert') {
				$(".modal-body p").html(
						"공지사항 " + parseInt(success_no) + "번이 정상으로 등록되었습니다.")
				$(".modal-body h4").html("success")
			}

			if (page == 'update') {
				$(".modal-body p").html(
						"공지사항 " + parseInt(success_no) + "번이 정상으로 수정되었습니다.")
				$(".modal-body h4").html("success")
			}

			if (page == 'delete') {
				$(".modal-body p").html(
						"공지사항 " + parseInt(success_no) + "번이 정상으로 삭제되었습니다.")
				$(".modal-body h4").html("success")
			}

		}

		$('.close').on('click', function() {
			$overlay.removeClass('state-show');
			$modal.removeClass('state-appear').addClass('state-leave');
		});

		
		var actionForm = $("#actionForm");

		$(".page-item a").on("click", function(e) {
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
	
		/* $(".move").on("click",function(e) {
					e.preventDefault();
					actionForm.append("<input type='hidden' name='notice_no' value='"
									+ $(this).attr("href")
									+ "'>");
					actionForm.attr("action","/notice/detail");
					actionForm.submit();
				}); */
	})
	
</script>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/head.jsp"></jsp:include>

<jsp:include page="../common/header.jsp"></jsp:include>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<h3><a href="/studyGroup/insert">방 만들기</a></h3>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>스터디 이름</td>
			<td>작성날자</td>
			<td>카테고리</td>
			<td>지역</td>
			<td>현재인원</td>
			<td>최대인원</td>
		</tr>
		<c:forEach var="studyGroup" items="${list }">
			<tr>
				<td><a href="/studyGroup/detail?studygroup_no=${studyGroup.studygroup_no }">${studyGroup.studygroup_no }</a></td>
				<td>${studyGroup.studygroup_name }</td>
				<td>${studyGroup.made_date }</td>
				<td>${studyGroup.category_no }</td>
				<td>${studyGroup.studygroup_location }</td>
				<td>${studyGroup.current_user_number }</td>
				<td>${studyGroup.max_user_number }</td>	
				<td><img src="${studyGroup.img}" class="img"/></td>
				<td><img src="${studyGroup.thumbimg}" class="thumbimg"/></td>
							
			</tr>
		</c:forEach>
	</table>
	<!-- search -->
	<div class="form-group row justify-content-center">
	<div class="w100" style="padding-right:10px">
	<select class="form-control form-control-sm" name="searchType" id="searchType">

		<option value="category_no">카테고리</option>
		<option value="studygroup_info">내용</option>
		<option value="user_no">작성자</option>
		
	</select>
	</div>
	<div class="w300" style="padding-right:10px">

		<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">

	</div>
	<div>
		
		<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch"> 검색 </button>
		
	</div>
	</div>
	
	<!-- search(e) -->


		        <br>
	        
	        <br>
	       
	        <br>
	        
	        <br>
	       
	        <br>
	        
	        <br>
	        
	        <br>
	        
	        <br>
	        
	        <br>
	       
	        <br>
	</div>
<!-- 페이지 영역 -->
   
<!-- 이전 영역 -->
   
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
   

<form id='actionForm' action="/studyGroup/list" method='get'>
   <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
   <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
</form>
	
<jsp:include page="../common/footer.jsp"></jsp:include><hr>
</body>
<jsp:include page="../common/scri.jsp"></jsp:include><hr>
 <c:url var="listURL" value="/studyGroup/list"></c:url>
     <script type="text/javascript">
     $(function() {
      var success_no = '<c:out value="${success.success_no }"></c:out>';
      var page = '<c:out value="${success.page }"></c:out>';
      
      studygroupInsertModal(success_no);
      
      history.replaceState({}, null, null);
      
      function studygroupInsertModal(success_no) {
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
        
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/header.jsp"></jsp:include><hr>
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
				<td><a href="${studyGroup.studygroup_no }">${studyGroup.studygroup_no }</a></td>
				<td>${studyGroup.studygroup_name }</td>
				<td>${studyGroup.made_date }</td>
				<td>${studyGroup.category_no }</td>
				<td>${studyGroup.studygroup_location }</td>
				<td>${studyGroup.current_user_number }</td>
				<td>${studyGroup.max_user_number }</td>				
			</tr>
		</c:forEach>
	</table>
	
	<select class="form-control form-control-sm" name="searchType" id="searchType">

		<option value="">카테고리</option>
		<option value="">내용</option>
		<option value="">작성자</option>
		
	</select>
	
	<div>
		
		<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch"> 검색 </button>
		
	</div>
	


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
	
	<nav aria-label="..." >
	<ul class="pagination">
	<c:if test="${listPage.startPage > 5 }">
	<li class="page-item"><a class="page-link"
		 href="${listPage.startPage -1 }">[이전]</a></li>
	</c:if>
	
	<!-- 페이지 목록 -->
	<c:forEach var="pageNo" begin="${listPage.startPage }"
	 end="${listPage.endPage }">
		<c:if test="${listPage.requestPage == pageNo }">
		<li class="page-item active"><span
		class="page-link">${pageNo }<span
		class="sr-only">(current)</span></span></li>
		</c:if>
		<c:if test="${listPage.requestPage != pageNo }">
			<li class="page-item"><a class="page-link"
		 href="${pageNo }">${pageNo }</a></li>
		 </c:if>
	</c:forEach>

	<!-- 이후 영역 -->
	<c:if
	 test="${listPage.endPage < listPage.totalPageCount }">
	 <li class="page-item"><a class="page-link"
		 href="${listPage.endPage +1 }">[이후]</a></li>
	</c:if>
	</ul>
	</nav>
	
	
	
	
	
	
	
</body>
<jsp:include page="../common/footer.jsp"></jsp:include> 

	<script>
	
		$(document).on('click', '#btnSearch', function(e){
		e.preventDefault();
		var url = "${pageContext.request.contextPath}/studyGroup/getStudyGroupList";
		url = url + "?searchType=" +$('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		location.href = url;
		console.log(url);
		});	
	
	</script>
</html>
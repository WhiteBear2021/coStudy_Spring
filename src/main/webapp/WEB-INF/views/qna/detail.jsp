
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>${qna_number }</p>
	<a href="QnaInfoAction.do">글목록 돌아가기 </a>
	<h3>글 세부보기</h3>
	<div>
		<h3>댓글 목록</h3>





		<c:forEach var="qna" items="${qnalist }">



			<c:if test="${qna.user_no>0}">
				<table border="1" style="background-color: orange;">
					<tr>
						<td>글번호</td>
						<td>글제목</td>
						<td>글내용</td>
						<td>작성일자</td>
						<td>부모번호</td>
						<td>읽음여부</td>
						<td>깊이(레벨)</td>
						<td>회원번호</td>
						<td>관리자번호</td>
					</tr>
					<tr>
						<td>${qna.qna_no }</td>
						<td>${qna.qna_title }</td>
						<td>${qna.qna_content }</td>
						<td>${qna.regdate }</td>
						<td>${qna.parentNo }</td>
						<td>${qna.isread }</td>
						<td>${qna.levels }</td>
						<td>${qna.user_no }</td>
						<td>${qna.manager_no }</td>
					</tr>
				</table>
			</c:if>
			<!-- 			<br><br><br><br><br><br><br> -->
			<c:if test="${qna.manager_no>0}">
				<table border="1" style="background-color: gray;">
					<tr>
						<td>글번호</td>
						<td>글제목</td>
						<td>글내용</td>
						<td>작성일자</td>
						<td>부모번호</td>
						<td>읽음여부</td>
						<td>깊이(레벨)</td>
						<td>회원번호</td>
						<td>관리자번호</td>
					</tr>
					<tr>
						<td>${qna.qna_no }</td>
						<td>${qna.qna_title }</td>
						<td>${qna.qna_content }</td>
						<td>${qna.regdate }</td>
						<td>${qna.parentNo }</td>
						<td>${qna.isread }</td>
						<td>${qna.levels }</td>
						<td>${qna.user_no }</td>
						<td>${qna.manager_no }</td>
					</tr>
				</table>
			</c:if>

		</c:forEach>
	</div>

	<br>
	<h2>답글쓰기 - 관리자</h2>
	<form action="QnaInsertManagerReplyAction.do" method="post">
	
		<input type="hidden" name="qna_no" value="${qna_number }"><br>
		제목 : <input type="text" name="qna_title"><br>
		내용: <input type="text" name="qna_content"><br>
		<input type="submit" value="답글">
			
			
		
	</form>
	
 	<h2>답글쓰기 - 회원</h2>
	<form action="QnaInsertUserReplyAction.do" method="post">
	
		<input type="hidden" name="qna_no" value="${qna_number }"><br>
		제목 : <input type="text" name="qna_title"><br>
		내용: <input type="text" name="qna_content"><br>
		<input type="submit" value="답글">
			
			
		
	</form> 
	

</body>
</html>
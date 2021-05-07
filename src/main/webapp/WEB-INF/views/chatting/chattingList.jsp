<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅 리스트</title>
<link href="../css/chatting.css" rel="stylesheet" type="text/css"> 
</head>
<body>

	<section id="chattingList">
		<c:forEach var="list" items="${userList }" >
			<div>
				<a href="chattingRoom.do?roomNo=${list.user_no }">${list.user_lastName}${list.user_firstName}</a>
			</div>
		</c:forEach>
	</section>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/chatting/chattingForm.css">
</head>
<body>
	<div>
		<input type="text" id="sender" value="${sessionScope.member.m_id }" style="display: none;">
		
		
	</div>

	<div id="container">
		<main>
			<ul id="chat">
			</ul>
			<footer>
				<form>
					<input type="textarea" id="msg" placeholder="Message">
					<input type="hidden" id="roomNo" value="${room.roomNo}">
					<input type="hidden" id="myName" value="${room.myName}">
					<button type="submit">SEND</button>
				</form>
			</footer> 
		</main>
	</div>


	<script src="/resources/vendor/jquery/jquery.js"></script>
	<!-- websocket javascript -->
	<!-- <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script> -->
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	<script type="module" src="/resources/js/chattingClient.js"></script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <div>
        <input type="text" id="sender" value="${sessionScope.member.m_id }" style="display: none;">
        <input type="text" id="message">
    </div>
    <div>
        <button type="button" id="openBtn">Open</button>
        <button type="button" id="sendBtn">Send</button>
        <button type="button" id="closeBtn">Close</button>
    </div>
    <!-- Server responses get written here -->
    <div id="data"></div>
    
    
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                      
    <!-- websocket javascript -->
    <script type="text/javascript">
    
    
    //const sock = new SockJS('<c:url value="/echo"/>');
    const sock = new SockJS('http://localhost:8081/echo');
    
    sock.onopen = function() {
        console.log('open');
        $("#data").append("연결");
    };

    sock.onmessage = function(e) {
        console.log('message', e.data);
        let data = e.data;
        $("#data").append(data+"<br>");
        //sock.close();
    };

    sock.onclose = function() {
        console.log('close');
        $("#data").append("연결 끊김");
    };
    
    
    $(function(){
    	$("#sendBtn").click(function(){
    		sock.send($("#message").val());
    	});
    	
    	$("#closeBtn").click(function(){
    		sock.close();
    	});
    	
    	
    });
    
    
  </script>

</body>
</html>
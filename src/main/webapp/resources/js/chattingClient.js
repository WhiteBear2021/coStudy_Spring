const sock = new SockJS('/websocket');
//const sock = new SockJS('/echo');
const myName = $("#myName").val();
const roomNo = $("#roomNo").val();


	function onopen() {
		sock.send(JSON.stringify({"roomNo": roomNo, "userNo": myName, type:'ENTER'}));
	    //$("#chat").append('<li><strong class="login">'+myName+'님이 입장했습니다</strong><li>');
	    $("#chat").scrollTop($("#chat")[0].scrollHeight);
	};

	function onmessage(e) {
	    let data = JSON.parse(e.data);
	    console.log(data);
	    
	    let html;
	    if(data.user_no == myName){
	    	html = '<li class="me"><div class="entete"><h3>시간</h3><h2>'+data.user_no+'</h2></div><div class="triangle"></div><div class="message">'+ data.group_msg_log +'</div></li>';
	    } else{
	    	html = '<li class="you"><div class="entete"><h2>'+data.user_no+'</h2><h3>시간</h3></div><div class="triangle"></div><div class="message">'+ data.group_msg_log +'</div></li>';
	    }
	    
	    $("#chat").append(html);
	    $("#chat").scrollTop($("#chat")[0].scrollHeight);
	   
	};

	function onclose() {
	    //$("#chat").append('<li><strong class="login">'+myName+'님이 퇴장했습니다.</strong><li>');
	    sock.close();
	};
	
	function send(){
		 sock.send(JSON.stringify({roomNo :$("#roomNo").val(), type:'CHAT', userNo:$("#myName").val(), message: $("#msg").val()}));
	}
	
/*const socket = new SockJS('/chat');
const stompClient = Stomp.over(socket);
const header = { userId : "testId"};
stompClient.connect(header, function(frame){
	console.log('connected: '+frame);
	
	stompClient.subscribe('/topic/a', function(response){
		console.log(response);
		console.log(response.body);
		console.log("222");
	});
	console.log(stompClient.send("/app/users", {}, "asdfasdf")); 
	console.log("1111");
});*/

sock.onopen = onopen;
sock.onmessage = onmessage;
sock.onclose = onclose;

$(function(){
	$("form").submit(function (e) {
		  e.preventDefault();
		  socketService.send();
		  //stompClient.send("/app/users", {}, JSON.stringify({name : "name"}));
		  $("#msg").val("");
	});
});

    
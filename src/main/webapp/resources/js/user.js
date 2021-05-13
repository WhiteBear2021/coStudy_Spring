$(function(){
	console.log("user.js 시작!!")
	
	
	//ID 중복체크 하는 Ajax
	$("#checkId").on("click",function(){
		let user_id=$('#user_id').val();
		console.log(user_id);
		$.ajax({
			url:'checkId',
			type:'get',
			data:{user_id:user_id},//확인할 id값
			dataType:'text',
			success:function(data,status,xhr){
				console.log(data);//내생각에는 responseEntity로 보낼 것이기 때문에 그 값
				console.log(status);
				console.log(xhr);
				alert(data);
			}
		});//end ajax
	})//end click event of checkId
	
});
/**
 * group page main에서 파일보관함 누르면 ajax로 보여주게 한다.
 */

$(function(){
	//for(let i=0;i<data.length;i++){
		
		let html ="";
		html+='<div class="panel panel-white post panel-shadow">';
		html+='<div class="post-heading">';
		html+='<div class="pull-left image">';
		html+=	'<img src="../img/user.png" class="img-circle avatar" alt="user profile image"></div>';
		html+='<div class="pull-left meta">';
		html+=	'<div class="title h5">파일올린사람: <b>user_1</b>';
		html+=	'</div></div></div>';
		html+='<div class="post-description">';
		html+=	'<p>${board.page_board_content }</p></div></div>';
		
		$('#change').append(html);
//	}
	
	let html2 ="";
	html+='<form action="insert" method="post">';
	html+='<div id="write">';
	html+='<input type="hidden" name="studygroup_no" value="${studygroup_no}">';
	html+='<input id="page_board_content" type="text"';
	html+='name="page_board_content" style="width: 600px; height: 70px;">';
	html+='<button id="button" type="submit"';
	html+='style="width: 70px; height: 70px;">작성</button>';
	html+='</div></form>';
	
	$('#insert').append(html2);
	
});





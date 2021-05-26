import {mainPageService} from './modules.js';

$(function(){
	init();
	
});

function init(){
	const category = ["", "IT", "외국어", "취업", "자격증", "전공", "수험생"];
	mainPageService.getNew((result)=>{
		console.log(result);
		
		for(let i = 0; i < result.length; i++){
		
			let html = "";
			html += '<div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6">';
			html += '	<div class="product__item">';
			html += '		<div class="product__item__pic set-bg">';
			html += ' 			<img src='+result[i].thumbimg+' alt=""  style="width: 262px; height: 262px">';
			html += '    		<span class="label">New</span>';
			html += '		</div>';
			html += ' 		<div class="product__item__text">';
			html += ' 			<h6>'+result[i].studygroup_name+'</h6>';
			html += '  			<a href="#" class="add-cart">See more</a>';
			html += ' 			<h5>'+category[result[i].category_no]+'</h5>';
			html += '		</div></div></div>';
			
			$("#newGroup").append(html);
		}
	});

	mainPageService.getHot((result)=>{
		console.log(result);
		for(let i = 0; i < result.length; i++){
			let html = "";
			html += '<div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6">';
			html += '	<div class="product__item sale">';
			html += '		<div class="product__item__pic set-bg">';
			html += ' 			<img src='+result[i].thumbimg+' alt=""  style="width: 262px; height: 262px">';
			html += '    		<span class="label">hot</span>';
			html += '		</div>';
			html += ' 		<div class="product__item__text">';
			html += ' 			<h6>'+result[i].studygroup_name+'</h6>';
			html += '  			<a href="#" class="add-cart">See more</a>';
			html += ' 			<h5>'+category[result[i].category_no]+'</h5>';
			html += '		</div></div></div>';
			
			$("#hotGroup").append(html);
		}
	});
	
	if($('#user_no').val() !== ""){
		
		mainPageService.getRecom((result)=>{
			console.log(result);
			for(let i = 0; i < result.length; i++){
			
				let html = "";
				html += '<div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6">';
				html += '	<div class="product__item sale">';
				html += '		<div class="product__item__pic set-bg">';
				html += ' 			<img src='+result[i].thumbimg+' alt=""  style="width: 262px; height: 262px">';
				html += '    		<span class="label">recomend</span>';
				html += '		</div>';
				html += ' 		<div class="product__item__text">';
				html += ' 			<h6>'+result[i].studygroup_name+'</h6>';
				html += '  			<a href="#" class="add-cart">See more</a>';
				html += ' 			<h5>'+category[result[i].category_no]+'</h5>';
				html += '		</div></div></div>';
				
				$("#recomGroup").append(html);
			}
		});
	}//end if
		
}//end init()



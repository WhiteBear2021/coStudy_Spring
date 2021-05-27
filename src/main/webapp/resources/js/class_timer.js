import {timerService} from './modules.js';

const clockTarget = $('#clock');

$(function(){
	init();

    //모달
    $('#openModalBtn').click(()=>{
    	$('#modalBox').modal('show');
    });

    $('#closeModalBtn').click(()=>{//취소
    	$('#modalBox').modal('hide');
     });
    
    
    let class_times = [];
    let break_times = [];
    $('#setting').click(()=>{//확인
    	
    	const period_time = $('#period_time').val() * 60;
    	const break_time = $('#break_time').val() * 60;
    	const lesson_num = $('#lesson_num').val();
    	const extra_break = $('#extra_break_time').val();
    	
    	let html = `<table>`;
    	for(let i = 1; i <= lesson_num; i++){
    		class_times.push(period_time);
    		
    		html += `<tr><th>${i}교시</th><th id="class_${i}">${timerService.output(period_time)}</th></tr>`;
    		if( i < lesson_num){
        			if(i === Math.floor(lesson_num/2 + 0.5)){
        				if(extra_break == '유'){
        					break_times.push(3600);
        					html += `<tr><th>중간 쉬는시간</th><th id="break_${i}">01:00:00</th></tr>`;
        				} else{
        					html += `<tr><th>쉬는시간</th><th id="break_${i}">${timerService.output(break_time)}</th></tr>`;
        					break_times.push(break_time);
        				}
            		} else{
            			html += `<tr><th>쉬는시간</th><th id="break_${i}">${timerService.output(break_time)}</th></tr>`;
            			break_times.push(break_time);
            		}
    		}
    	}
    	
    	html += `</table>`;
    	$('#setting_form').empty();
		$('#setting_form').append(html);
		$("#start").prop("disabled", false);
    	$('#modalBox').modal('hide');
     });

    
    $('#start').click(()=>{
    	$("#start").prop("disabled", true);
    	$("#openModalBtn").prop("disabled", true);
    	const inerval = setInterval(()=>{
    		for(let i = 0; i <class_times.length; i++ ){
    			if(class_times[i] !== 0){
    				$('#class_'+(i+1)).text(timerService.output(--class_times[i]));
    				break;
    			}else if(break_times[i] !== 0){
    				$('#break_'+(i+1)).text(timerService.output(--break_times[i]));
    				break;
    			}
    		}
    		if(class_times[class_times.length-1] === 0){
    			$('#setting_form').append("공부끝!! 오늘도 수고하셨습니다");
    			console.log(clearInterval(inerval));
    		}
    	}, 1);
    });
    	
    
    $('#class_timer').click(()=>{
    	location.href='/groupPage/timer';
    });


});//end ready


function clock() {
    const date = new Date();
    const month = date.getMonth();
    const clockDate = date.getDate();
    const day = date.getDay();
    const week = ['일', '월', '화', '수', '목', '금', '토'];
    const hours = date.getHours();
    const minutes = date.getMinutes();
    const seconds = date.getSeconds();

    clockTarget.text(`${month+1}월 ${clockDate}일 ${week[day]}요일` +
    `${hours < 10 ? `0${hours}` : hours}:${minutes < 10 ? `0${minutes }`  : minutes }:${seconds < 10 ? `0${seconds }`  : seconds }`);
  
}


function init(){
    clock();
	setInterval(clock, 1000);
	$("#start").prop("disabled", true);
	
	const ctx = document.getElementById('myChart').getContext('2d');
	let data = [];
	let label = [];
	$.ajax({
		type : 'post',
		url : '/groupPage/getTimer',
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		success : function(result, status, xhr) {
			if(result != null){
				console.log(result);
				for(let i = 0; i < result.length; i++ ){
						data.push(result[i].time);
						label.push(result[i].timer_date);
				}
			}
			
		},
		error : function(xhr, status, er) {
			console.log(er);
			alert(er);
		}//end error
	});
	
	
	var myChart = new Chart(ctx, {
	    type: 'line',
	    data: {
	        labels:label,
	        datasets: [{
	        	label:'시간',
	            data: data, 
	            backgroundColor: 'rgba(54, 162, 235, 0.2)',
	            borderColor: 'rgba(54, 162, 235, 1)',
	            borderWidth: 1,
	        }]
	    },
	    options: {
	    	title: {
	            display: true,
	            text: '누적 공부 시간'
	        },
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero:true
	                }
	            }]
	        }
	    }
	});
	
}

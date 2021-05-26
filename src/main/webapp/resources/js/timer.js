import {timerService} from './modules.js';

$(function(){
	init();
	let inerval;
	let time = 0;
	let isrunning = false;
    $('#timer_bnt_start').click(()=>{
        if(isrunning){//중지
        	isrunning = false;
        	$('#timer_bnt_start').val("시작");
            clearInterval(inerval);
        }else{//시작
        	isrunning = true;
        	$('#timer_bnt_start').val("중지");
            inerval =  setInterval(() => {
                    time++;
                    $('#time_output').text(timerService.output(time));
            },1000)
        }
    });
    
    $('#timer_bnt_save').click(()=>{
    	clearInterval(inerval);
    	const param = {
    			time: $("#time_output").text(),
    			user_no: $("#user_no").val()
    	};
    	timerService.add(param,function(result){
    		alert("공부 시간 저장" + result);
    		$("#timer_bnt_save").prop("disabled", true);
    		$("#timer_bnt_start").prop("disabled", true);
    	});
    });
    
});//end ready

function init(){
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



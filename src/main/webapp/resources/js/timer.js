import {timerService} from './modules.js';

$(function(){
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






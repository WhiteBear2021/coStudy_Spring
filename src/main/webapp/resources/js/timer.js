import {timerService} from './modules.js';

let isrunning = false;


$(function(){
	let inerval;
	let time = 0;
	let isrunning = false;
    $('#timer_bnt_start').click(function(){
        if(isrunning){//중지
        	isrunning = false;
        	clearInterval(inerval);
            $(this).val("시작");
        }else{//시작
        	isrunning = true;
            $(this).val("중지");
            inerval =  setInterval(() => {
                    time++;
                    $('#time_output').text(timerService.output(time));
            },1000)
        }
    });
    
    $('#timer_bnt_save').click(function(){
    	
    	const param = {
    			time: $("#time_output").text(),
    			user_no: "1"
    	};
    	
    	timerService.add(param,function(result){
    		
    		alert("공부 시간 저장" + result);
    		$("#timer_bnt_save").prop("disabled", true);
    		$("#timer_bnt_start").prop("disabled", true);
    	});
    
    });
    
    
    
    //모달
    
    $('#openModalBtn').click(function(){
    	$('#modalBox').modal('show');
    });

    $('#closeModalBtn').click(function(){//취소
    	$('#modalBox').modal('hide');
     });
    
    $('#setting').click(function(){//확인
    	
    	const period_time = timerService.output($('#period_time').val() * 60);
    	const break_time = $('#break_time').val();
    	const lesson_num = $('#lesson_num').val();
    	const extra_break_time = $('#extra_break_time').val();
    	
    	let html = `<table>`;
    	
    	for(let i = 1; i <= lesson_num; i++){
    		html += `<tr>`;
    		html += `<th>${i}교시</th><th>${period_time}</th>`;
    
    		html += `</tr>`;
    	}
    	html += `</table>`;
		$('#setting_form').append(html);
    	
    	
    	$('#modalBox').modal('hide');
     });
    
    
    $('#modalBox').on('show.bs.modal', function (e) {//열릴 때
    	
    });
    
	$('#modalBox').on('hide.bs.modal', function (e) {//닫힐 때 
	
	});


});





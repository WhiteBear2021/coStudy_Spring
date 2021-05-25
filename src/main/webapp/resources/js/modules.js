const timerService = (()=>{

	function add(param, callback, error) {
		/*const token = $("meta[name='_csrf']").attr("th:content");
		const header = $("meta[name='_csrf_header']").attr("th:content");*/
		
		$.ajax({
			type : 'post',
			url : '/groupPage/timer',
			data: JSON.stringify(param),
			contentType : "application/json;charset=utf-8",
			/*beforeSend: function(xhr){
		        xhr.setRequestHeader(header, token);
		    },*/
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				console.log(er);
				if (error) {
					error(er);
				}
			}//end error
		});//end ajax
	}//and add
	
	function output(time){
		const hour =  Math.floor(time / 3600);
		const min =  Math.floor((time / 60) % 60);
		const sec =  Math.floor(time % 60);

		const hours = (hour >= 10) ? hour : "0" + hour;
		const mins = (min >= 10) ? min : "0" + min;
		const secs = (sec >= 10) ? sec : "0" + sec;
	    return hours + ":" + mins + ":" + secs;
	    
	}
	

	return {
		add : add,
		output: output,
	};

})();

const mainPageService = (()=>{

	function getNew(callback, error) {
		
		$.ajax({
			type : 'post',
			url : '/getNew',
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			success : function(result, status, xhr) {
				callback(result);
			},
			error : function(xhr, status, er) {
				console.log(er);
				if (error) {
					error(er);
				}
			}//end error
		});
	}
	
	function getHot(callback, error) {
		
		$.ajax({
			type : 'post',
			url : '/getHot',
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			success : function(result, status, xhr) {
				callback(result);
			},
			error : function(xhr, status, er) {
				console.log(er);
				if (error) {
					error(er);
				}
			}//end error
		});
	}
	
	function getRecom(callback, error) {
		
		$.ajax({
			type : 'post',
			url : '/getRecom',
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			success : function(result, status, xhr) {
				callback(result);
			},
			error : function(xhr, status, er) {
				console.log(er);
				if (error) {
					error(er);
				}
			}//end error
		});
	}

	return {
		getNew : getNew,
		getHot : getHot,
		getRecom: getRecom
	};

})();

export {timerService, mainPageService};
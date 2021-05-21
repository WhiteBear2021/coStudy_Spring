const timerService = (()=>{

	function add(param, callback, error) {
		const token = $("meta[name='_csrf']").attr("th:content");
		const header = $("meta[name='_csrf_header']").attr("th:content");

		const timer = {
				time: "test",
				user_no: "1"
		};
		
		$.ajax({
			type : 'post',
			url : '/groupPage/timer/',
			data: JSON.stringify(timer),
			contentType : "application/json; charset=utf-8",
			beforeSend: function(xhr){
		        xhr.setRequestHeader(header, token);
		    },
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}//end error
		});//end ajax
	}//and add

	return {
		add : add
	};

})();



export {timerService};
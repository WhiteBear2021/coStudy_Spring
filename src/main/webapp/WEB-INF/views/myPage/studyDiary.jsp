<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<jsp:include page="../common/header.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/myPage/myPage.css">
<link rel="stylesheet"
	href="/resources/vendor/bootstrap-icons/font/bootstrap-icons.css">
<title>Insert title here</title>

</head>
<body>

	<section class="container col-lg-12">
		<div class="row">
			<div class="col-lg-3 bg-secondary m-5 text-center">
				<nav id="side_left" class="my-auto">
					<ul class="list-unstyled ">
						<li class="p-1"><a href="/myPage/studyDiaryList">공부일기</span>&nbsp;&nbsp;<i
								class="bi bi-journal-check fs-1"></i></a></li>
						<li class="p-1"><a href="/myPage/scheduleList">일정관리&nbsp;&nbsp;
								<i class="bi bi-calendar-month fs-1"></i>
						</a></li>
						<li class="p-1"><a href="#">1:1 채팅목록&nbsp;&nbsp;<i
								class="bi bi-chat-square-quote fs-1"></i></a></li>
						<li class="p-1"><a href="/myPage/joinGroupList">참가 그룹
								목록&nbsp;&nbsp;<i class="bi bi-chat-quote fs-1"></i>
						</a></li>
						<li class="p-1"><a href="/myPage/categoryUpdate">관심 분야
								수정&nbsp;&nbsp;<i class="bi bi-pencil-fill fs-1"></i>
						</a></li>
						<li class="p-1"><a href="/myPage/userUpdate">회원 정보
								수정&nbsp;&nbsp;<i class="bi bi-tools fs-1"></i>
						</a></li>
						<li class="p-1"><a href="/myPage/applyQuitUserCheck">회원
								탈퇴 신청&nbsp;&nbsp;<i class="bi bi-person-x fs-1"></i>
						</a></li>
					</ul>
				</nav>
			</div>
			<div class="col-8" id="contents">
				<h3>Study Diary 글쓰기</h3>
				<hr style="width: 800px;" class="text-primary">
				<div class="row">
					<div class="form-group">
						<form action="studyDiary" method="post">
							<input type="hidden" name="user_no"
								class="form-control mt-4 mb-2"
								value="${sessionScope.user.user_no}"> <label> 제목
								: <input type="text" name="studyNote_title" style="width: 300%;"
								placeholder="제목" required="required">
							</label><br>
							<br> <label> 키워드 : <input type="text"
								name="studyNote_keyword" style="width: 300%;"
								placeholder="키워드를 입력해주세요." required="required">
							</label><br>
							<br> <label> 글내용 : <textarea class="form-control"
									rows="10" cols="100" name="studyNote_content"
									placeholder="내용을 입력해주세요" required required="required"></textarea>
							</label><br>
							<br> <label> 파일 : 
								<div class="uploadDiv">
									<input type="file" name="studyNote_file" multiple>
								</div>

								<div class="uploadResult">
									<!--업로드 시킬 첨부 파일 목록들 보여줄 div 태그  -->
									<ul>

									</ul>
								</div>

								<button id="uploadBtn">Upload</button>
							</label><br>
							<br>
							<div class="text-start">
								<button type="submit" class="btn btn-primary">글작성</button>
							</div>
						</form>
					</div>
				</div>


			</div>
		</div>
	</section>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		//그림파일 업로드 후 그림 파일 선택하면 큰 그림 나오도록 a링크 이용함
		function showImage(fileCallPath){
			//alert(fileCallPath);
			$(".bigPictureWrapper").css("display","flex").show();
			
			$(".bigPicture").html("<img src='/files/display?fileName="+encodeURI(fileCallPath)+"'>").animate({width:'100%',height:'100%'},1000);
		}
	
		$(function(){
			// 원본 사진 보여주는 클릭 이벤트 함수
			$(".bigPictureWrapper").on("click",function(e){
				$(".bigPicture").animate({width:'0%',height:'0%'},1000);
				setTimeout(function(){
					$(this).hide();
				},1000);
			});
			
			
			//업로드 시키는 첨부 파일 목록들 보여주기위해 만들어 주는 함수
			var uploadResult=$(".uploadResult ul");
			//첨부 파일을 선택하면 ul태그안에 보여주기 위해서 변수로 미리 지정해놓았다
			
			function showUploadedFile(uploadResultArr){
				var str="";
				
				$(uploadResultArr).each(function(i,obj){
					
					if(!obj.image){
						var fileCallPath=encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
						console.log(fileCallPath);
						str+="<li><a href='/files/download?fileName="+fileCallPath+"'><img src='/resources/img/attach.png'>"+obj.fileName+"</a></li>"
					}else{
						//str+="<li>"+obj.fileName+"</li>";
						var originPath=obj.uploadPath+"\\"+obj.uuid+"_"+obj.fileName;
						originPath=originPath.replace(new RegExp(/\\/g),"/");
						var fileCallPath=encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
						// 파일이름 등이 문제 될 수가 있어서 URI 호출에 적합한 문자열로 인코딩 처리하기위해서 encodeURIComponent()이용
						str+="<li><a href=\"javascript:showImage(\'"+originPath+"\')\"><img src='/files/display?fileName="+fileCallPath+"'>"+obj.fileName+"</a></li>";
					}
				});
				
				uploadResult.append(str); //ul태그에 리스트를 li태그를 추가시킴 
			}
		
			//이미지 파일 체크를 위해 만들어 준 함수
			var regex=new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize=5242880; //5MB
			
			function checkExtension(fileName,fileSize){
				if(fileSize>=maxSize){
					alert("파일 사이즈 초과");
					return false; //file size 초과하면 종료
				}
				
				if(regex.test(fileName)){
					alert("해당종류의 파일은 업로드할 수 없습니다.");
					return false;
				}
				return true;
			}
			 
			var cloneObj=$(".uploadDiv").clone(); 
			//div block 복제 (처음 비어있는 상태 복제해놓고 업로드 시킨후에 다시 비어있는 상태로 만들기 위해)
			
			var cloneObj=$(".uploadDiv").clone(); 
			//div block 복제 (처음 비어있는 상태 복제해놓고 업로드 시킨후에 다시 비어있는 상태로 만들기 위해)

			
			$("#uploadBtn").on("click",function(e){
				e.preventDefault();
				var formData=new FormData(); //1.FormData()객체 생성
				var inputFile=$("input[name='studyNote_file']");
				var files=inputFile[0].files;
				
				console.log(files);
				
				
				for(var i=0;i<files.length;i++){
					if(!checkExtension(files[i].name,files[i].size)){
						return false;
					}
					
					//add filedata to formdata	
					formData.append("studyNote_file",files[i])
				}
				
				$.ajax({
					url:'/files/uploadAjax',
					processData:false,
					contentType:false,
					data:formData,
					type:"POST",
					dataType:'json',
					success:function(result){
						alert("Uploaded");
						console.log(result);
						//성공시 리스트 파일을 보여주는 함수 호출
						showUploadedFile(result);
/* 						//success 한 뒤 file input 하는 부분 초기화 시키기
						$(".uploadDiv").html(cloneObj.html()); */
					}
				});//ajax 끝
			});//uploadBtn click event End
		})
	</script>
</body>
</html>
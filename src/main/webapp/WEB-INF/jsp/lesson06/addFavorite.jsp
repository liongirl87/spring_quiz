<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 추가</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<%-- AJAX를 사용하려면 jquery 원본 필요 --%>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>

<!-- 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

</head>
<body>
	<div class="container">
		<header>
			<h1>즐겨 찾기 추가하기</h1>
		</header>
		<section>
			<div>
				<div>제목</div>
				<div>
					<input type="text" id="name" class="form-control">
				</div>
				<div>주소</div>
				<div class="d-flex">
					<input type="text" id="url" class="form-control">
					<button type="button" class="btn btn-info ml-2 col-1" id="urlCheckBtn">중복확인</button>
				</div>
				<small id="urlStatusArea"></small>	<!-- .d-none 숨김 -->
			</div>
			<input type="button" id="addBtn" class="btn btn-success col-12 mt-2" value="추가">
		</section>
	</div>
<script>
	$(document).ready(function(){
		// 중복확인 버튼 클릭
		$("#urlCheckBtn").on('click', function(){
			// 하위태그 초기화
			$("#urlStatusArea").empty();
			
			let url = $("#url").val().trim();
			if (url=="") {
				alert("검사할 url을 입력하세요");
				return;
			}
			
			// validation : 주소가 중복되었는지 CHECK
			$.ajax({
			//request	가능하면 post방식으로 get방식은 길이제한이 있다
				type:"get"
				,url:"/lesson06/quiz01/is_duplication"
				,data:{"url":url}
			
			//response
				,success:function(data){
					if (data.isDuplication){
						$("#urlStatusArea").append('<span class="text-danger">중복된 url입니다</span>');
					} else {
						// 중복아님 => 사용가능
						$("#urlStatusArea").append('<span class="text-danger">저장가능한 url입니다</span>');
					}
					
					
/* 					if (data.isDuplication == false){
						$("#urlStatusArea").append('<span class="text-danger">저장가능한 url입니다</span>')
					} */
				}
				,error:function(request, status, error) {	//서버에도 못갔거나 서버에서 에러가 났을때
					alert("중복확인에 실패했습니다. 관리자에게 문의해주세요")
				}

				
			});
			
			
		});
		
		
		
		
		
		$("#addBtn").on("click",function(){
			let name = $("#name").val().trim();
			
			if (name == "") {
				alert("제목을 입력하세요");
				return;
			}
			let url = $("#url").val().trim();
			
			if (!url) {
				alert("주소를 입력하세요");
				return;
			}
			// http도 아니고 https도 아닐 때 잘못된 주소
			if(url.startsWith("http://") == false && !url.startsWith("https://")) {
				alert("http/https를 입력하세요");
				return;		
			}	

			console.log(name);
			console.log(url);
			
			$.ajax({
				// request (type, url, data는 무조건 소문자!!!)
				type:"POST"
				,url:"/lesson06/quiz01/add_favorite" // 화면으로 보낼 수 없다!
				,data:{"name":name, "url":url}
			
				// response
				,success:function(data) {	// Jquery ajax 함수가 json string을 object로 파싱해준다
					if (data.code == 1) {
						location.href="/lesson06/quiz01/result_view";
					} else {	//로직상의 문제
						alert(data.errorMessage);
					}
				}
				,error:function(request, status, error){	// 아애 에러가 생긴경우
					alert("요청에 실패했습니다. 관리자에게 문의해주세요.");
			
				}
			
			});
		});
		
	});

</script>
</body>
</html>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<%-- AJAX를 사용하려면 jquery 원본 필요 --%>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>

<!-- 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<%-- datepicker --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<link rel="stylesheet" href="/css/booking/booking.css" type="text/css">
</head>
<body>
	<div id="wrap" class="container">
		<header class="d-flex justify-content-center">
			<!-- headerlogo 호출 -->
			<jsp:include page="bookingHeaderLogo.jsp" />
		</header>
		<!-- nav 호출 -->
		<jsp:include page="bookingNav.jsp" />
		<div class="d-flex justify-content-center">
			<h1>예약하기</h1>
		</div>
		<section class="content1 d-flex justify-content-center ">
			<div class="col-6 nav-back-color">
				<div class="form-grop">
					<label for="name"><b>이름</b></label>
					<input type="text" id="name" name="name" class="form-control">
				</div>
				<div class="form-grop">
					<label for="date"><b>예약일수</b></label>
					<input type="text" id="date" class="form-control">
				</div>
				<div class="form-grop">
					<label for="day"><b>숙박일수</b></label>
					<input type="text" id="day" class="form-control">
				</div>
				<div class="form-grop">
					<label for="headcount"><b>숙박인원</b></label>
					<input type="text" id="headcount" class="form-control">
				</div>
				<div class="form-grop">
					<label for="phoneNumber"><b>전화번호</b></label>
					<input type="text" id="phoneNumber" class="form-control">
				</div>
				<div>
					<button type="button" class="btn btn-warning col-12 mt-2" id="reservationBtn" >예약하기</button>
				</div>
			</div>
		</section>
		<jsp:include page="bookingFooter.jsp" />
	</div>
		<script>
		// ready 함수: DOM tree가 모두 구성된 후 불려지는 함수
		$(document).ready(function() {
			/*'input[name=date]'  */
			
			$('#date').datepicker({
				dateFormat : "yy-mm-dd", // 표시 포멧 
				minDate:0, // 오늘 이후부터 선택가능
				changeMonth : true, // 월 셀렉트 박스 	
				changeYear : true, // 년 셀렉트 박스 
			});
 			
			// 예약하기 버튼
			$("#reservationBtn").on("click", function(){
				
				let name = $('input[name=name]').val().trim();
				let date = $('#date').val().trim();
				let day = $('#day').val().trim();
				let headcount = $('#headcount').val().trim();
				let phoneNumber = $('#phoneNumber').val().trim();
				
				if (name =="") {
					alert("이름을 입력하세요");
					return;
				}
				if (!date) {
					alert("날짜를 선택하세요");
					return;
				}
				if (!day) {
					alert("숙박일을 입력하세요");
					return;
				}
				if (isNaN(day)){ //숫자가 아닌 값 들어오면 true
					alert("숙박일수는 숫자만 입력 가능합니다");
					return;
				}				
				if (!headcount) {
					alert("숙박인원을 입력하세요");
					return;
				}
				if (isNaN(headcount)){ //숫자가 아닌 값 들어오면 true
					alert("숙박일원은 숫자만 입력 가능합니다");
					return;
				}
				if (!phoneNumber) {
					alert("전화번호를 입력하세요");
					return;
				}
				
				$.ajax({
					
				// request
					type:"post"
					,url:"/booking/add_booking"
					,data:{'name':name, 'date':date,'day':day,'headcount':headcount, 'phoneNumber':phoneNumber}
					
					// response
					,success:function(data){
						if(data.result){
							alert("예약에 성공하였습니다");
							location.href = "/booking/booking_list_view";
						} else {
							alert("예약에 실패하였습니다");
						}
					}
					,error:function(request, status, error) {
						alert("실패하였습니다. 관리자에게 문의하세요")
					}
				});
			
			});

		});
	</script>
</body>
</html>
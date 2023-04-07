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
		<div>
			<div>
				<img id="bannerImage" src="/img/test06_banner1.jpg" class="w-100">
			</div>
		</div>
		<section class="d-flex content1">
			<div class="brown-box col-4 content1">
				<div class="d-flex align-items-center justify-content-center mt-4">
					<span class="display-4 text-white">실시간<br>예약하기</span>
				</div>
			</div>
			<div class="light-brown-box col-4">
				<div>
				<h3 class="text-white">예약확인</h3>
				</div>
				<div class="col-10">
					<div class="form-grop">
						<label>이름:</label>
						<input type="text" class="form-control" id="name">
					</div>
					<div class="form-grop">
						전화번호:
						<input type="text" class="form-control" id="phoneNumber">
					</div>
				</div>
				<div class="d-flex justify-content-end mt-3">
				<button type="button" class="btn btn-success" id="searchBtn">조회하기</button>
				</div>
			
			</div>
			<div class="brown-box col-4">
					<div class="d-flex justify-content-center align-items-center h-100">
						<h2 class="text-white">예약문의:<br>010-<br>0000-0000</h2>
					</div>
			</div>
		</section>
		<jsp:include page="bookingFooter.jsp" />
	</div>
	<script>
		
		$(document).ready(function(){
			$('#searchBtn').on('click', function(){
				
				//alert("경고");
				let name = $("#name").val().trim();
				let phoneNumber = $("#phoneNumber").val().trim();
				
				if(!name) {
					alert("이름을 입력하세요.")
					return;
				}
				if(!phoneNumber) {
					alert("전화번호를 입력하세요.")
					return;
				}
				
				// AJAX요청
				$.ajax({
					type:"GET"
					,url:"/booking/search_booking"
					,data:{"name":name, "phoneNumber":phoneNumber}
					
					,success:function(data){
						if (data.code ==1) {
							//data.booking.name
							alert("이름:" + data.booking.name
									+"\n날짜:" +data.booking.date.slice(0, 10)
									+"\n일수:" +data.booking.day
									+"\n인원:" +data.booking.headcount
									+"\n상태:" +data.booking.state);
						} else {
							alert("예약 내역이 없습니다.");
						}
					}
					,error:function(request, status, error) {
						alert("예약 내역을 조회하는데 실패했습니다.");
					}
				});
			});
			
			// 배너 순회
			let bannerList = ["/img/test06_banner1.jpg", "/img/test06_banner2.jpg", "/img/test06_banner3.jpg", "/img/test06_banner4.jpg"];
			let currentIndex = 1;
			
			// setInterval(함수, 밀리세컨초);
			setInterval(function() {
				$("#bannerImage").attr("src", bannerList[currentIndex])
				currentIndex++;
				//4   0 1 2 3	4->0
				if(currentIndex == bannerList.length) {
					currentIndex = 0;
				}
				console.log(currentIndex);
			}, 1000);
			
		});
		
	
	</script>

</body>
</html>
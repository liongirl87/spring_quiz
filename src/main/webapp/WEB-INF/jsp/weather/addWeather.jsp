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
<link rel="stylesheet" href="/css/lesson05/weatherstyle.css" type="text/css">    

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<%-- datepicker를 위해 slim 버전이 아닌 jquery를 import한다. --%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
	
<%-- datepicker --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body>
	<div class="container con1">
		<div class="d-flex">
			<jsp:include page="weatherNav.jsp" />
			<section>
				
				<div>
				<h2>날씨입력</h2>
				</div>

				<form method="post" action="/weather/add_weather">
					<div class="d-flex align-items-center justify-content-between">
						<div class="input-group">
							<label for="">날짜</label>
							<input type="text" id="date" name="date" class="form-control">

						</div>
						<div class="input-group">
							<div class="input-label">날씨</div>
								<select id="weather" name="weather" class="form-control">
									<option>맑음</option>
									<option>구름조금</option>
									<option>흐림</option>
									<option>비</option>
								</select>
						</div>
						<div class="input-group">
							<label for="microDust">미세먼지</label>
							<select id="microDust" name="microDust" class="form-control">
								<option value="좋음">좋음</option>
								<option value="보통">보통</option>
								<option value="나쁨">나쁨</option>
							</select>
						</div>
					</div>
					<div class="d-flex align-items-center mt-5">
						<div class="d-flex">
							<div class="input-group">
							<label for="temperatures">기온</label>
								<input type="text" class="form-control" name="temperatures">
								<div class="input-group-append">
									<span class="input-group-text">℃</span>
								</div>
							</div>
						</div>
						<div>
							<div class="input-group">
							<label for="precipitation">강수량</label>
								<input type="text" id="precipitation" name="precipitation" class="form-control">
								<div class="input-group-append">
									<span class="input-group-text">mm</span>
								</div>
								</div>
						</div>
						<div>
							<div class="input-group">
								<label for="windSpeed">풍속</label>
								<input type="text" id="windSpeed" name="windSpeed" class="form-control">
								<div class="input-group-append">
									<span class="input-group-text">km/h</span>
								</div>		
							</div>
						</div>
					
					</div>
					<div class="d-flex justify-content-end mt-3">
						<div>
							<input type="submit" class="btn btn-primary" value="제출">
						</div>
					</div>
				</form>
			</section>
		</div>
		<footer class="d-flex">
			<jsp:include page="weatherFooter.jsp" />
		</footer>
	</div>


	<script>
		// ready 함수: DOM tree가 모두 구성된 후 불려지는 함수
		$(document).ready(function() {
			/*'input[name=date]'  */
			$('#date').datepicker({
				changeMonth : true, // 월 셀렉트 박스 	
				changeYear : true, // 년 셀렉트 박스 
				dateFormat : "yy-mm-dd", // 표시 포멧 
			});
		});
	</script>
</body>
</html>
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
<link rel="stylesheet" href="/css/lesson05/weatherstyle.css" type="text/css">    

<!-- j쿼리가 맨 위에 있어야한다 -->
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<!-- bootstrap CDN link -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<!-- datepicker-->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body>
	<div class="container con1">
		<div class="d-flex">
			<jsp:include page="weatherNav.jsp" />
			<section class="col-10">
				<h2>과거날씨</h2>
				<table class="table text-center">
					<thead>
						<tr>
							<th>날짜</th>
							<th>날씨</th>
							<th>기온</th>
							<th>강수량</th>
							<th>미세먼지</th>
							<th>풍속</th>
						</tr>
					</thead>
						<c:forEach items="${weathers}" var="weather">
						<tr>
							<td>
							<fmt:formatDate value="${weather.date}" pattern="yyyy년 M월 d일"/>
							</td>
							<td>
							<c:choose>
								<c:when test="${weather.weather eq '비'}">
								<img src="/img/rainy.jpg" alt="비">
								</c:when>
								<c:when test="${weather.weather eq '흐림'}">
								<img src="/img/cloudy.jpg" alt="비">
								</c:when>
								<c:when test="${weather.weather eq '맑음'}">
								<img src="/img/sunny.jpg" alt="맑음">
								</c:when>
								<c:when test="${weather.weather eq '구름조금'}">
								<img src="/img/partlyCloudy.jpg" alt="구름조금">
								</c:when>
								<c:otherwise>
									${weather.weather}
									<!-- 혹시 조건이 추가될경우를 생각해서 오류가 안나게 글자로 출력되게 작업해준다 -->
								</c:otherwise>
							</c:choose>
							${weather.weather}</td>
							<td>${weather.temperatures}C</td>
							<td>${weather.precipitation}mm</td>
							<td>${weather.microDust}</td>
							<td>${weather.windSpeed}km/h</td>
						</tr>
						</c:forEach>
					<tbody>
					</tbody>
				</table>
				<input type="text" id="datePick">
			</section>
		</div>
		<footer class="d-flex">
			<jsp:include page="weatherFooter.jsp" />
		</footer>
	</div>
	        <script>
            $(document).ready(function() {
                $('#datePick').datepicker(); // 날짜를 선택할 수 있는 창이 띄워진다
					/*'input[name=]'  */
                $('#datepickerOption').datepicker({
                    dateFormat:"yy-mm-dd"   // 2023-02-09
                    , changeMonth:true     // 월을 선택(셀렉트)
                    , changeYear:true      // 년을 선택(셀렉트)
                    , showAnim:"clip"       // 애니메이션 효과: slide, fadeIn, clip...
                });

                $('#datepickerEvent').datepicker({
                    dateFormat:"yy-mm-dd"
                    , beforeShow:function() {
                        alert("데이트피커가 열리기 전에 호출");
                    }
                    , onSelect:function(dateText) {
                        // 날짜가 선택되는 순간 호출되는 함수
                        alert("선택된 날짜:" + dateText);
                    }
                    , onClose:function(dateText) {
                        // 달력 창이 닫히기 직전에 호출되는 함수
                        // 1) 날짜가 선택됐을 때
                        // 2) 여백을 클릭해서 닫을 때
                        alert("데이트피커가 닫혔다.");
                    }
                });
            });
        </script>
	

</body>
</html>
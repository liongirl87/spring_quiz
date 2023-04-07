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
		<div class="d-flex justify-content-center my-3">
			<h2>예약 목록 보기</h2>
		</div>
		<section class="d-flex justify-content-center">
			<div class="col-12">	
				<table class="table text-center">
					<thead>
						<tr>
							<th>이름</th>
							<th>예약날자</th>
							<th>숙박일수</th>
							<th>숙박인원</th>
							<th>전화번호</th>
							<th>예약상태</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${booking}" var="booking1">
						<tr>
							<td>${booking1.name}</td>
							<td>
							<fmt:formatDate value="${booking1.date}" pattern="yyyy년 M월 dd일" />
							</td>
							<td>${booking1.day}</td>
							<td>${booking1.headcount}</td>
							<td>${booking1.phoneNumber}</td>
							<td>
							<%-- <span class="text-info">${booking1.state}</span> --%>
							<c:choose>
								<c:when test="${booking1.state eq '대기중'}">
									<span class="text-info">${booking1.state}</span>
								</c:when>
								<c:when test="${booking1.state eq '확정'}">
									<span class="text-success">${booking1.state}</span>
								</c:when>
								<c:when test="${booking1.state eq '취소'}">
									<span class="text-danger">${booking1.state}</span>
								</c:when>
								<c:otherwise>
								${booking1.state}
								</c:otherwise>
							</c:choose>
							</td>
							<td>
							<button type="button" class="btn btn-danger delBtn" data-booking-id = "${booking1.id}">삭제</button>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				
				</table>
			</div>
		</section>
		<jsp:include page="bookingFooter.jsp" />
	</div>
	<script>
		$(document).ready(function(){
			$(".delBtn").on("click", function(){
				let bookingId = $(this).data('booking-id');
				
				$.ajax({
					type:"delete"	// POST계열, 브라우저로 직접 치고 못들어감
					,url:"/booking/del_booking"
					,data:{"bookingId": bookingId}
					
					//response
					,success:function(data){
						if(data.code == 1) {
							alert("삭제 되었습니다.");
							location.reload();
						} else {
							alert("삭제 실패했습니다. 관리자에게 문의해주세요");
						}
					}
					,error:function(request, status, error) {
						alert("실패");
					}
				});
			});
			
			
		});
	
	</script>
	
</body>
</html>
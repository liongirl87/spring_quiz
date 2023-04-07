<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<%-- AJAX를 사용하려면 jquery 원본 필요 --%>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>

<!-- 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/css/lesson05/storestyle.css" type="text/css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrap" width=600 >
		<div>
			<div class="tlogo bg-info d-flex">
				<div class="ml-3 mt-3">
				<h1 class="text-white">배탈의 민족</h1>
				</div>
			</div>
			<div>
				<div class="display-4">우리동네가게</div>
			</div>
			
			<c:forEach items="${review}" var="review1" varStatus="status">
				<div class="box mt-2">
					<div class="ml-2 mt-2 mb-2">
					
						<div class="d-flex">
						<span><b>${review1.userName}</b></span>
						
							<span>
							<c:set var="point" value="${review1.point}" />
							<c:forEach begin="1" end="5">
								<c:choose>
									<c:when test="${point > 0.5 }">
										<img src="/img/star_fill.png" alt="fullstar" width=20>
										<c:set var="point" value="${point -1}" />
									</c:when>
									<c:when test="${point == 0.5 }">
										<img src="/img/star_half.png" alt="halfstar" width=20>
										<c:set var="point" value="${point -0.5}" />
									</c:when>
									<c:when test="${point < 0.5 }">
										<img src="/img/star_empty.png" alt="emptystar" width=20>
									</c:when>
								</c:choose>
							</c:forEach>
			
							</span>
						</div>
						<span class="text-secondary d-block my-2"">
						<fmt:formatDate value="${review1.createdAt}" pattern="yyyy년 M월 d일" />
						</span>
						<span>${review1.review}</span><br>
						<span class="menu-box rounded p-1">${review1.menu}</span>
					</div>
				</div>
			</c:forEach>
			
		</div>
		<hr>
		<footer>
			<adress>
				<h5>(주)우와한 형제</h5>
				고객센터: 1500-1500
			</adress>
		</footer>
	</div>
</body>
</html>
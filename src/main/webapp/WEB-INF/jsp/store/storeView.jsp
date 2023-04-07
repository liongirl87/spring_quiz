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

<link rel="stylesheet" href="/css/lesson05/storestyle.css" type="text/css">
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
			
			<c:forEach items="${store}" var="store1" varStatus="status">
				<div class="box mt-2">
					<a href="/lesson05/view_review?id=${store1.id}">
					<div class="ml-2 mt-2 mb-2">
					
						<span><h4><b>${store1.name}</b></h4></span>
						<span>전화 번호 : ${store1.phoneNumber}</span><br>
						<span>주소 : ${store1.address}</span>
					</div>
					</a>
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
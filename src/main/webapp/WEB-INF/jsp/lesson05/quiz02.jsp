<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz02</title>
</head>
<body>
	<h2>1.JSTL forEach</h2>

	<div class="container">
		<h2>HOT 5</h2>
		<table class="table text-center">
			<thead>
				<tr>
					<th>순위</th>
					<th>제목</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${music}" var="musics" varStatus="status">
			<tr>
				<th>${status.count}</th>
				<td>${musics}</td>
			</tr>
			</c:forEach>
			</tbody>	
		</table>	
	</div>
	
	<br><br>
	<div class="container">
	<h2>멤버쉽</h2>
	<table class="table text-center">
		<thead>
			<tr>
				<th>이름</th>
				<th>전화번호</th>
				<th>등급</th>
				<th>포인트</th>
			</tr>
		</thead>
<!-- 		등급이 VIP인경우 글씨를 빨간색으로, 등급이 GOLD인경우 노란색으로 표시하세요. -->
		<tbody>
			<c:forEach items="${members}" var="member">
			<tr>
				<td>${member.name}</td>
				<td>${member.phoneNumber}</td>
				<td>	<!-- td안쪽으로 돌리는게 좋다 밖으로 돌리면 조건이 없을시 td가 사라질 수 있음 -->
				<c:choose>
					<c:when test="${member.grade eq \"VIP\"}"> <!--\"VIP \"  -->
						<span class="text-danger">${member.grade}</span>
					</c:when>
					<c:when test="${member.grade eq 'GOLD'}">
						<span class="text-warning">${member.grade}</span>
					</c:when>
					<c:otherwise>
						${member.grade}
					</c:otherwise>
				</c:choose>
				</td>
				<!-- 포인트가 5000점 이상이면 포인트를 파란색으로 표시하세요. -->
				<td>
				<c:if test="${member.point >= 5000}">
					<span class="text-primary">${member.point}P</span>
				</c:if>
				<c:if test="${member.point < 5000}">
					${member.point}P
				</c:if>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	
	
	

</body>
</html>
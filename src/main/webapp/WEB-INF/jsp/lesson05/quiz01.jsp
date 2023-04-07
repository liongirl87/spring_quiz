<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<title>quiz01</title>
</head>
<body>
	<c:set var="num1" value="36" />
	<c:set var="num2">3</c:set>
	
	<h1>1. JSTL core 변수</h1>
	<h3>첫번째 숫자: <c:out value="${num1}" /></h3>
	<h3>두번째 숫자: <c:out value="${num2}" /></h3>
	
	<h1>2. JSTL core 연산</h1>
	<h3>더하기: <c:out value="${num1 + num2}" /></h3>
	<h3>곱하기: <c:out value="${num1 * num2}" /></h3>
	<h3>빼기: <c:out value="${num1 - num2}" /></h3>
	<h3>나누기: <c:out value="${num1 / num2}" /></h3>
	
	<h1>3. JSTL core out</h1>
	<c:out value="<title>core out</title>" escapeXml="true"/><br>
	
<!-- 	1번문제에서 사용한 두 변수의 평균이 10 이상이면 평균 값을
	 <h1> 태그로 출력하고, 10 미만이면 <h3> 태그로 출력하세요. -->
	 
	 <h1>3. JSTL core if</h1>
	 <c:if test="${(num1 + num2)/2 >= 10}">
	 	<h1>${(num1 + num2)/2}</h1>
	 </c:if>
	 	 <c:if test="${(num1 + num2)/2 < 10}">
	 	<h3>${(num1 + num2)/2}</h3>
	 </c:if>
	 
	 <h1>3. core if</h1>
	 <c:if test="${ num1 * num2 > 100 }">
	 	<c:out value="<script>alert('너무 큰 수입니다')</script>" escapeXml="false" />
	 </c:if>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과 출력</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<%-- AJAX를 사용하려면 jquery 원본 필요 --%>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>

<!-- 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

</head>
<body>
	<div class="container">
		<div>
			<h1>즐겨찾기 목록</h1>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>주소</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${favorite}" var="favorite1" varStatus="status">	
				<tr>
					<td>${status.count}</td>
					<td>${favorite1.name}</td>
					<td>${favorite1.url}</td>
					<td>
					<%-- <button type="button" name ="delBtn" class="del-btn btn btn-danger" value="${favorite1.id}">삭제</button> --%> 
					<button type="button" name ="delBtn" class="del-btn btn btn-danger" data-favorite-id ="${favorite1.id}">삭제</button> 
					
					
					</td>
				</tr>
				</c:forEach>
			</tbody>
		
		</table>
	
	</div>
	<script>
		$(document).ready(function(){
			// (1) $(this) <-$(".del-btn") 와 같음 추가로 딱 누른 그 단하나를 가져옴
			/*
			$(".del-btn").on("click", function(e){
				// 1) Jquery 문법 
				// let id = $(this).val();
				// e에서 얻어낼수 있는 정보 지금 클릭된것의 정보를 담고있다
				// 2) 순수한 자바 문법
				let id = e.target.value
			});
			*/
			// (2) data 활용
			// data-이름 : 태그에 값을 심어 놓는다 *대문자 불가* (카멜케이스 인식못함 '-'을 써서 연결한다) 장점: 여러개 만들어서 활용 가능하다 
			// 스크립트: $(this).data('이름');
			$(".del-btn").on("click", function(e){
				let id = $(this).data('favorite-id');
				
				$.ajax({
					//request
					
					type:"post"
					,url:"/lesson06/quiz01/del_favorite"
					,data:{"favoriteId":favoriteId}
				
					//response
					,success:function(data)	{
						if (data.code == 1) {
							location.reload();
							//동작이 안될경우 location.reload(true); true를 넣어준다 새로고침 ->스크롤 정보까지 유지(더 머물러 있는것처럼 자연스러움)
						} else {
							alert(data.errorMessage);
						}
					}
					,error:function(request, status, error) {
						alert("삭제하는데 실패했습니다. 관리자에게 문의해주세요");
					}
				});
			});
			
			
			$("td").on("click", "button[name=delBtn]", function(){
				var favoriteId = $(this).val();
				// alert(favoriteId);
				$.ajax({
					//request
					type:"get"
					,url:"/lesson06/quiz01/del_favorite"
					,data:{"favoriteId":favoriteId}
				
					//response
					,success:function(data) {
						if (data.delFavorite) {
							location.href ="/lesson06/quiz01/result_view";
						}
					}
					,error:function(request, status, error) {
						alert("실패")
					}
				});
			});
		});
	
	</script>

</body>
</html>
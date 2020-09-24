<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- 
	//Err often came from (1)lib(@build.gradle) (2)ref.(@index.jsp)
	//soln1. (clean&build) (disconnect&connect) (gradle>refrash) again again...
	//	cf. maven's way << put <dependancy> but, I use gradle
	//	different Auto build system (maven, gradle)
	//soln2. No korean? (bcz of, UTF etc..)	
 -->
<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
	<sec:authorize access="hasRole('ROLE_USER')">
		<div>
			<div class="size-group" role="group" aria-label="...">
				<button type="button" class="btn btn-default" value="M">M</button>
				<button type="button" class="btn btn-default" value="L">L</button>
				<button type="button" class="btn btn-default" value="XL">XL</button>
			</div><br>
			
			<div class="quantity-group" role="group" aria-label="...">
				<button type="button" class="btn btn-default">-</button>
				<input type="text" class="form-control" placeholder="1판">
				<button type="button" class="btn btn-default">+</button>
			</div><br>
			
			<div class="group" role="group" aria-label="...">
				<input type="text" class="form-control" placeholder="1">
			</div>	
		</div>
		<div class="col-md-1">
			<a class="btn btn-default" href="/user/Stg3_1_SetOrder" role="button" id="btn_stg3">치즈피자주문</a>
		</div>
		<br><br>
		<div class="col-md-1">
			<form action="/user/SetPizza" method="post" id="frm_SetPizza">
				<input type="hidden" name="bId"	value="(미구현)${SetPizza.StgNo}">
				<button id="btn_stg2_topping" type="button" class="btn btn-default">토핑추가</button>
			</form>
		</div>
		<br><br>
	</sec:authorize>
	<br>
	<table border="5" bordercolor="blue" cellspacing="4" cellpadding="7">
		<tr>
			<th>(미구현)</th>
			<th>임시table출력확인용</th>
			<th>Ajax사용 추천</th>
			<th>내용은 설정하는 것들 다 받을 수 있도록</th>
		</tr>
		<tr>
			<td>a</td>
			<td>b</td>
			<td>c</td>
			<td>d</td>
		</tr>
	</table>

<br>

    <a href="/logout">로그아웃</a><br><br>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>


<script>
	$(document).on
	('click', '#btn_stg3', function () {
		alert("ORDER");
		$('#frm_SetPizza').submit();
		}
	);
	
	$(document).on
	('click', '#btn_stg2_topping', function () {
		alert("PUT TOPPING");
		$('#frm_SetPizza').submit();
		}
	);
</script>

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
				<a class="btn btn-primary btn-lg btn-block"  href="/user/Stg3_1_1_SetAddress" role="button" id="btn_stg3">배송지</a>	
			</div>
		</div>
		<br>
	</sec:authorize>

	<form action="/user/SetPizza" method="post" id="frm_SetPizza">
		<input type="hidden" name="bId"	value="${SetPizza.StgNo}">
		<table>
			<tr>
				<th>Company1</th>
				<th>Contact2</th>
				<th>Country3</th>
			</tr>
			<tr>
				<td>Company</td>
				<td>Contact</td>
				<td>Country</td>
			</tr>
		</table>
	</form>



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

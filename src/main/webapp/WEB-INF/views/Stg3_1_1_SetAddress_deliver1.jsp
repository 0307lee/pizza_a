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
<h3>배송</h3><hr>
	<sec:authorize access="hasRole('ROLE_USER')">
		<form action="/user/Stg3_1_SetOrder" method="post" id="frm_SetPizza_deliver1_lastAddress">
			<c:forEach var="LastOrderInfo" items="${list_OrderVO}">
				<div>
					<div class="size-group" role="group" aria-label="...">
						<a class="btn btn-primary btn-lg btn-block"  href="/user/Stg3_1_SetOrder" role="button" id="btn_stg3_keepLastOrder" >지난 배송지였던  ${LastOrderInfo.orderAddress}) 그대로 활용</a>
						<input type="hidden" name="orderZipcode" value="${LastOrderInfo.orderAddress}">
						<input type="hidden" name="orderZipcode" value="${LastOrderInfo.orderZipcode}">	
					</div>
					
				</div><br>
				
			</c:forEach>
			
		</form>
		<c:forEach var="Address" items="${list_AddressList}">
		<form action="/user/Process_Stg3_1_1_SetAddress_deliver1" method="post" id="frm_SetPizza_deliver1_AnotherAddress">
			<div class="table-responsive">
				<table  class="table table-bordered">
					<tr>
						<th>Chk.</th>
						<th>주소 </th>
						<th>우편번호</th>
						<th>당담 매장명</th>
					</tr>
					
					<tr>
						<td><label><input class="selectAddress"
						 				type='radio' name='DeliverAddress' value='1'></label></td>
						<td>${Address.uAddress1}</td>
						<td>${Address.uZipcode1}</td>
						<td>${Address.storeId1}</td>
					</tr>
					<tr>
						<td><label><input class="selectAddress"
						 				type='radio' name='DeliverAddress' value='2'></label></td>
						<td>${Address.uAddress2}</td>
						<td>${Address.uZipcode2}</td>
						<td>${Address.storeId2}</td>
					</tr>
					<tr>
						<td><label><input class="selectAddress"
						 				type='radio' name='DeliverAddress' value='3'></label></td>
						<td>${Address.uAddress3}</td>
						<td>${Address.uZipcode3}</td>
						<td>${Address.storeId3}</td>
					</tr>
					
				</table>
			</div>
		</form>
		</c:forEach>
		
		<div class="col-md-1">
				<a class="btn btn-warn"  role="button" id="Add_Address">주소지 추가등록 (미구현)</a>
		</div><br><br>
			
	</sec:authorize>

    <a href="/logout">로그아웃</a><br><br>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>


<script>
	$(document).on
	('click', '#btn_stg3_keepLastOrder', function () {
		$('#frm_SetPizza_deliver1_lastAddress').submit();
		}
	);


	//호출1
	$(document).on
	('click', '#Add_Address', function () {
		alert("미구현.");
		//$('#frm_Stg3_1_1_AddAddress').submit();
	});
</script>

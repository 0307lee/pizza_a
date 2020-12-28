<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!-- 
	//Err often came from (1)lib(@build.gradle) (2)ref.(@index.jsp)
	//soln1. (clean&build) (disconnect&connect) (gradle>refrash) again again...
	//	cf. maven's way << put <dependancy> but, I use gradle
	//	different Auto build system (maven, gradle)
	//soln2. No korean? (bcz of, UTF etc..)	
 -->
<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
<h3>배송</h3>
<hr>

<sec:authorize access="hasRole('ROLE_USER')">
	<div class="size-group" role="group" aria-label="...">
	
		<form action="/user/Process_Stg3_1_1_SetBasicAddress_deliver1_LastAddress" method="post" id="frm_Process_Stg3_1_1_SetBasicAddress_deliver1_LastAddress">
			<button type="button" class="btn btn-primary btn-lg btn-block" id="btn_stg3_keepLastOrder">기본 배송지 [${list_OrderVO_B.orderAddress}]를 그대로 활용</button>
			<input type="hidden" name="storeId" 	 value="${list_OrderVO_B.storeId}">
			<input type="hidden" name="orderZipcode" value="${list_OrderVO_B.orderZipcode}">
			<input type="hidden" name="orderAddress" value="${list_OrderVO_B.orderAddress}">
		
			<input type="hidden" name="orderId" 	   value="${list_OrderVO_P.orderId}">
			<input type="hidden" name="orderItemSize"  value="${list_OrderVO_P.orderItemSize}">
			<input type="hidden" name="orderItemPrice" value="${list_OrderVO_P.orderItemPrice}">

							
			<h2 style="text-align: center">OR</h2>
			<h4 style="text-align: center">"밑의 주소 중 하나를 클릭"</h4>
			<br>
		</form>	
	</div>

	<c:forEach var="AddressList" items="${list_AddressList}">
		<form action="/user/Process_Stg3_1_1_SetAddress_deliver1_AnotherAddress" method="post" id="frm_Process_Stg3_1_1_SetAddress_deliver1_AnotherAddress">
			<div class="table-responsive">
				<table class="table table-bordered">
					<tr>
						<th>Chk.</th>
						<th>주소</th>
						<th>우편번호</th>
						<th>당담 매장명</th>
					</tr>

					<tr class="Address">
						<td><input class="selectAddress" type='radio'
								name='DeliverAddress' value='DeliverAddress1'></td>
						<td>${AddressList.uAddress1}</td>
						<td>${AddressList.uZipcode1}</td>
						<td>${AddressList.uStoreName1}</td>
						
					</tr>
				</table>
			</div>
			<input type="hidden" name="storeId" 	 value="${AddressList.uStoreId1}">
			<input type="hidden" name="orderZipcode" value="${AddressList.uZipcode1}">
			<input type="hidden" name="orderAddress" value="${AddressList.uAddress1}">
			<input type="hidden" name="orderId" 	   value="${list_OrderVO_P.orderId}">
			<input type="hidden" name="orderItemSize"  value="${list_OrderVO_P.orderItemSize}">
			<input type="hidden" name="orderItemPrice" value="${list_OrderVO_P.orderItemPrice}">
			
		</form>
	</c:forEach>

	<div class="col-md-1">
		<a class="btn btn-warn" role="button" id="Add_Address">주소지 추가등록
			(미구현)</a>
	</div>
	<br>
	<br>

</sec:authorize>

<a href="/logout">로그아웃</a>
<br>
<br>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>


<script>
	$( '.address' ).each(function( index ) {
		let addVal = $.trim( $(this).find('td:eq(1)').text() );
		if (addVal == "") {
			$(this).remove();
		}
	});

	//호출1
	$(document).on
	('click', '#btn_stg3_keepLastOrder', function () {
		$('#frm_Process_Stg3_1_1_SetBasicAddress_deliver1_LastAddress').submit();
	});

	//호출2
	$(document).on
	('click', '.selectAddress', function () {
		alert($(this).val());
		$('#frm_Process_Stg3_1_1_SetAddress_deliver1_AnotherAddress').submit();
	});
</script>

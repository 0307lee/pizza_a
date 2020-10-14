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
	
	//.col-xs-12 .col-sm-6 .col-md-8
 -->
<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
<sec:authorize access="hasRole('ROLE_USER')">
	<c:forEach var="LastOrderInfo" items="${list_OrderVO}">
		<div>
			<div role="group" aria-label="..." id="delivery">
				<button class="col-xs-12 col-md-8" type="button">
					<label><input type='radio' name='orderDeliver' value='1'>배달주문</label>
				</button>
			</div>
				
			<div role="group" aria-label="..." id="delivery">
				<button class="col-xs-12 col-md-8" type="button">
					<label><input type='radio' name='orderDeliver' value='0'>매장방문</label>
				</button>
			</div>			
					
			<button type="button" class="btn btn-primary btn-lg btn-block"
			   href="/user/Stg3_1_1_SetAddress/${user.username}" role="button" id="btn_stg3_1_1">배송지 (임시표기: ${user.username})</button>

			<button type="button" class="btn btn-primary btn-lg btn-block" value="order_request">요청사항</button>
			<button type="button" class="btn btn-primary btn-lg btn-block" value="order_payment">결재수단</button>
			<button type="button" class="btn btn-primary btn-lg btn-block" value="order_receipt">현금영수증</button>
			<button type="button" class="btn btn-primary btn-lg btn-block" value="order_required_time">예상시간</button>
			<button type="button" class="btn btn-default btn-lg btn-block" value="order_list_price">최종금액</button>
			<button type="button" class="btn btn-primary btn-lg btn-block" value="order_commend">주문하기</button>
				
		</div><br>
	
	</c:forEach>
	
</sec:authorize>

<form action="/user/SetPizza" method="post" id="frm_SetPizza">
	<input type="hidden" name="bId"	value="${SetPizza.StgNo}">
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

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
	
	//.col-xs-12 .col-sm-6 .col-md-8
 -->
<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
<sec:authentication property="principal" var="principal" />
<sec:authorize access="hasRole('ROLE_USER')">
	<div class="choose-group" role="group" aria-label="..." id="delivery">
		<button class="btn btn-success btn-lg btn-block" type="button">
			<label><input class="choose-group" type='radio'	id="orderDeliver1" name='orderDeliver' value='1'>배달</label>
		</button>
		
		<button class="btn btn-success btn-lg btn-block" type="button">
			<label><input class="choose-group" type='radio' id="orderDeliver0" name='orderDeliver' value='0'>방문</label>
		</button>

	</div><br><br><br><br><hr>
	
	<p>(구현필요) items="${list_OrderVO}" 에서 넘어오는 값이 없고, id="orderDeliver1"을 누르면 바로 Stg3_1_1.jsp로 넘어가도록</p>
	
	<p>(구현필요) items="${list_OrderVO}" 에서 넘어오는 값이 없고, id="orderDeliver0"을 누르면 여기에서 storeName을 골라선택할 수 있도록</p>
	
	<c:forEach var="LastOrderInfo" items="${list_OrderVO}">
		<div id="stg3_1_SetPizza_basic" style="display: none;"
			class="col-sm-6 col-md-5 col-lg-12">
			<a href="/user/Stg3_1_2_SetAddress_deliver0/${principal.username}"
				class="btn btn-primary btn-lg btn-block" style="display: none;"
				role="button" id="btn_stg3_1_1_visitStore">방문 하실 매장은 ${LastOrderInfo.storeName} 입니다.</a> 
			<a
				href="/user/Stg3_1_1_SetAddress_deliver1/${principal.username}"
				class="btn btn-primary btn-lg btn-block" style="display: none;"
				role="button" id="btn_stg3_1_1_orderDeliver">지난번 배송지는 [${LastOrderInfo.orderAddress} ] 였어요. 여기로 재배송할게요~! (변경하려면 클릭!)</a>


			<button type="button" class="btn btn-primary btn-lg btn-block" value="order_request">요청사항은 ${LastOrderInfo.orderRequest}입니다.</button>
			<button type="button" class="btn btn-primary btn-lg btn-block" value="order_payment">(구현필요) 결재수단</button>
			<button type="button" class="btn btn-primary btn-lg btn-block" value="order_receipt">(구현필요)현금영수증</button>
			<button type="button" class="btn btn-primary btn-lg btn-block" value="order_required_time">(구현필요) 예상시간</button>
			<button type="button" class="btn btn-default btn-lg btn-block" value="order_list_price">(구현필요) 최종금액</button>
			<button type="button" class="btn btn-primary btn-lg btn-block" value="order_commend">(구현필요) 주문하기</button>

		</div>
		<br>

	</c:forEach>

</sec:authorize>


<hr>
<a href="/logout">로그아웃</a>
<br>
<br>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>


<script>
	$(document).on('click', '#orderDeliver1', function() {
		$('#btn_stg3_1_1_orderDeliver').css('display', 'inline-block');
		$('#btn_stg3_1_1_visitStore').css('display', 'none');
	});

	$(document).on('click', '#orderDeliver0', function() {
		$('#btn_stg3_1_1_orderDeliver').css('display', 'none');
		$('#btn_stg3_1_1_visitStore').css('display', 'inline-block');
	});

	$(document).on('click', '.choose-group', function() {
		$('#stg3_1_SetPizza_basic').css('display', 'inline-block');
	});

	$(document).ready(function($) {
		var checkload = true;
		$("#submit-btn").click(function() {
			checkload = false;
		});
		$(window).on("beforeunload", function() {
			if (checkload == true)
				return "레알 나감????????????";
		});

	});
</script>

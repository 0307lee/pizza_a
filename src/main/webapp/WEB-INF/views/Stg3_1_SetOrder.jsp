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


	<div class="choose-groupdiv" role="group" aria-label="..." id="delivery">
		<button class="btn btn-success btn-lg btn-block" type="button">
			<label><input class="choose-group" type='radio'	id="orderDeliver1" name='orderDeliver' value='1'>배달</label>
		</button>
		
		<button class="btn btn-success btn-lg btn-block" type="button">
			<label><input class="choose-group" type='radio' id="orderDeliver0" name='orderDeliver' value='0'>방문</label>
		</button>

	</div><br><br><br><br><hr>
	
	
	<div id="stg3_1_SetPizza_basic" style="display: none;"	class="col-sm-6 col-md-5 col-lg-12">
		<a href="/user/Stg3_1_2_SetAddress_deliver0/${principal.username}"
			class="btn btn-primary btn-lg btn-block" style="display: none;"
			role="button" id="btn_stg3_1_1_visitStore">방문 하실 매장은 ${list_OrderVO.storeName} 입니다.</a>
			 
		<a href="/user/Stg3_1_1_SetAddress_deliver1/${principal.username}"
			class="btn btn-primary btn-lg btn-block" style="display: none;"
			role="button" id="btn_stg3_1_1_orderDeliver">기본 배송지인 [${list_OrderVO.orderAddress} ] 로 배송할게요~! (변경하려면 클릭!)</a><br><br>

<!--
	배송설정은 다른페이지넘어가서 설정하는 구조
	배송외 설정은 당페이지에서 설정하는 구조
 -->
		<form action="/user/Process_Stg3_1_SetOrder" method="post" id="frm_SetOrder">
			<li type="button" class="btn btn-primary btn-lg btn-block" id="request_btn_nofunction">요청사항은 
					<select name="orderRequest" id="order_request">
						<option value="orderRequest1"> ${list_OrderVO.orderRequest}</option>
						<option value="orderRequest2">빠삭!</option>
						<option value="orderRequest3">양많이!</option>
						<option value="orderRequest4">빨리!</option>
						<option value="orderRequest5">비대면</option>
						<option value="orderRequest6" id="request_etc">기타 </option>
					</select>
					<input type ="text" id="request_etc_contents" style="display: none;width:100px">
					입니다
			</li>

			<li type="button" class="btn btn-primary btn-lg btn-block" id="payment_btn_nofunction">결재수단은 
					<select name="order_payment" id="order_payment">
						<option value="orderPayment1">만나서결재</option>
						<option value="orderPayment2" disalbed >(구현중)신용(체크)카드</option>
						<option value="orderPayment3">계좌이체</option>
						<option value="orderPayment3">무통장입금</option>
						<option value="orderPayment4">카카오페이</option>
						<option value="orderPayment5">네이버페이</option>
					</select>
					입니다
			</li>

			<li type="button" class="btn btn-primary btn-lg btn-block" id="payment_btn_nofunction">현금영수증 : 
				<input type ="text" name="username" style="width:50px"><input type ="text" name="username" style="width:80px"><input type ="text" name="username" style="width:80px">  
			</li>
			<button type="button" class="btn btn-primary btn-lg btn-block" value="order_required_time">(구현중) 예상시간(자동계산되서 산출: 피자만드는시간+(대기자수*피자만드는시간)+배달시간(거리로)+a)</button>
			<button type="button" class="btn btn-default btn-lg btn-block" value="order_point" >(구현예정) 포인트사용 </button>
			<button type="button" class="btn btn-default btn-lg btn-block" value="order_coupon">(구현예정) 쿠폰사용 </button>
			<button type="button" class="btn btn-primary btn-lg btn-block" value="order_list_price">(구현필요) 최종금액: </button>
			<button type="button" class="btn btn-primary btn-lg btn-block" value="order_Start">
				<input type="submit" value="주문하기"></button>
		</form>
	</div>
	<br>

	<a href="/user/Stg3_1_1_SetAddress_deliver1/${principal.username}" class="btn" style="display: none;" role="button" id="btn_stg3_1_1_orderDeliver_direct"></a>
	
	<a href="/user/Stg3_1_2_SetAddress_deliver0/${principal.username}" class="btn" style="display: none;" role="button" id="btn_stg3_1_2_visitStore_direct"></a>
				
</sec:authorize>
<hr>

<a href="/logout">로그아웃</a>
<br>
<!-- 
<p>(구현_Jquery활용) items="${list_OrderVO}" 에서 넘어오는 값이 없고, id="orderDeliver1"을 누르면 바로 Stg3_1_1.jsp로 넘어가도록</p>
	
<p>(구현필요) items="${list_OrderVO}" 에서 넘어오는 값이 없고, id="orderDeliver0"을 누르면 여기에서 storeName을 골라선택할 수 있도록</p>
-->
<br>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>


<script>
	let flag_orderchk = ${flag_orderchk};


	$(document).on('click', '.choose-group', function() {
		$('#stg3_1_SetPizza_basic').css('display', 'inline-block');
	});
	
	$(document).on('click', '#orderDeliver1', function() {
		if (flag_orderchk ==true){
			$('#btn_stg3_1_1_orderDeliver').css('display', 'inline-block');
			$('#btn_stg3_1_1_visitStore').css('display', 'none');
		}else{
			var href =  $('#btn_stg3_1_1_orderDeliver_direct').attr('href');
			window.location.href = href;
			}
	});

	$(document).on('click', '#orderDeliver0', function() {
		if (flag_orderchk ==true){
			$('#btn_stg3_1_1_orderDeliver').css('display', 'none');
			$('#btn_stg3_1_1_visitStore').css('display', 'inline-block');
		}else{
			var href =  $('#btn_stg3_1_2_visitStore_direct').attr('href');
			window.location.href = href;
			}
	});

	$(document).on('click', '#order_request', function() {
		val etc_chk= alert($('#order_request').val());
		//if (etc_chk)=()
		$('#request_etc_contents').css('display', 'inline-block');
	});
	
	$(document).ready(function($) {
		//alert(flag_orderchk);
		});
	
</script>

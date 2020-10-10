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
	<form action="/user/process_Stg2_1_SetPizza_basic" method="post" id="frm_SetPizza">
		<c:forEach var="LastOrderInfo" items="${list_OrderVO}">
			<sec:authorize access="hasRole('ROLE_USER')">
				<div>
					<div class="size-group" role="group" aria-label="..." id=btn_size>
						<!-- <button type="button" onclick="show_pizza_size_M()">M</button>
						<button type="button" onclick="show_pizza_size_L()">L</button>
						<button type="button" onclick="show_pizza_size_XL()">XL</button> -->
						<button type="button" class="show-pizza-size">M</button>
						<button type="button" class="show-pizza-size">L</button>
						<button type="button" class="show-pizza-size">XL</button>
					</div><br>
					
					<div class="quantity-group" role="group" aria-label="...">
						<button type="button" class="btn btn-default mp-btn" id="minus1">-</button>
						<input disabled type="text" class="form-control" value="1" id="ea">
						<button type="button" class="btn btn-default mp-btn" id="plus1">+</button>
					</div>
						
					<br>
					<div class="slidecontainer">
							<p>1판당 가격 (배송비 미포함): <span id="price"></span></p>
							<input type="range" min="8000" max="100000" value="20000" step="1000" class="slider" id="priceRange">
					</div>
				</div>
				<br><br>
			</sec:authorize>
			
			<br>
		    <a href="/logout">로그아웃</a><br><br>
		    <h6>(구현중)임시table출력확인용</h6>
			<table border="5" bordercolor="blue" cellspacing="4" cellpadding="7" display="on">
				<tr>
					<th>피자 SIZE</th>
					<th>피자 가격</th>
					<th>피자 갯수</th>
				</tr>
				
				<tr>
					<td id = "show_pizza_size"> ${LastOrderInfo.orderitemsSize}</td>
					<td id = "show_pizza_price">${LastOrderInfo.orderitemsPrice}</td>
					<td id = "show_pizza_EA">${LastOrderInfo.orderitemsQuantity}</td>
				</tr>
				
			</table>
			
			<div class="col-md-1">
				<a class="btn btn-default"  role="button" id="btn_stg3">치즈피자주문</a>
			</div>
			
			<div class="col-md-1">
				<button id="btn_stg2_topping" type="button" class="btn btn-default">(미구현)토핑추가</button>
			</div>
			
		</c:forEach>
		
	</form>		
	
<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>


<script>

	//피자크기전송
	$(document).on('click', '.show-pizza-size', function () {
		$('#show_pizza_size').text($(this).text());
	});

	//피자갯수-1
	$(document).on
	('click', '#minus1', function () {
		$('#ea').val(parseInt($('#ea').val())-1);
	});
	
	//피자갯수+1
	$(document).on
	('click', '#plus1', function () {
		$('#ea').val(parseInt($('#ea').val())+1);
	});

	//피자갯수 전송
	$(document).on('click', '.mp-btn', function(){
		$('#show_pizza_EA').text($('#ea').val());
	});
/* 
	//피자갯수 0방지 
	$("#ea").on("propertychange change keyup paste input",, function() {
	    var currentVal = $(this).val();
	    if(currentVal == oldVal) {
	        return;
	    }
	 
	    oldVal = currentVal;
	    alert("changed!");
	});
*/
	 
	//price슬라이더
	var price_slider = document.getElementById("priceRange");
	var price = document.getElementById("price");
	price.innerHTML = price_slider.value;
	price_slider.oninput = function() {
		price.innerHTML = this.value;
		$("#show_pizza_price").text(this.val());
	}

	//////////////////////////
	//호출1
	$(document).on
	('click', '#btn_stg3', function () {
		var size=$('#show_pizza_size').text();
		alert("ORDER size: " + size);
		$('#frm_SetPizza').submit();
	});

	//호출2
	$(document).on
	('click', '#btn_stg2_topping', function () {
		alert("PUT TOPPING");
		$('#frm_SetPizza').submit();
	});


</script>

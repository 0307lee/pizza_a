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
	<c:forEach var="LastOrderInfo" items="${list_OrderVO}">
		<sec:authorize access="hasRole('ROLE_USER')">
			<div>
				<div class="size-group" role="group" aria-label="..." id=btn_size>
					<button onclick="show_pizza_size_M()">M</button>
					<button onclick="show_pizza_size_L()">L</button>
					<button onclick="show_pizza_size_XL()">XL</button>
				</div><br>
				
				<div class="quantity-group" role="group" aria-label="...">
					<button type="button" class="btn btn-default" id="minus1">-</button>
					<input type="text" class="form-control" placeholder="1" value="1" id="EA">
					<button type="button" class="btn btn-default" id="plus1">+</button>
				</div><br>
				
				<div class="group" role="group" aria-label="...">
					<input type="text" class="form-control" placeholder="1">
				</div>	
			</div>
				<div class="slidecontainer">
						<p>1판당 가격 (배송비 포함): <span id="price"></span></p>
						<input type="range" min="8000" max="100000" value="20000" step="1000" class="slider" id="priceRange">
				</div>
				<div class="col-md-1">
					<a class="btn btn-default"  role="button" id="btn_stg3">치즈피자주문</a>
				</div>
			<br><br>
			<div class="col-md-1">
				<form action="/user/SetPizza" method="post" id="frm_SetPizza">
					<input type="hidden" name="bId"	value="${SetPizza.StgNo}">
					<button id="btn_stg2_topping" type="button" class="btn btn-default">(미구현)토핑추가</button>
				</form>
			</div>
			<br><br>
		</sec:authorize>
		<br>
	    <a href="/logout">로그아웃</a><br><br>
		<table border="5" bordercolor="blue" cellspacing="4" cellpadding="7" display="on">
			<tr>
				<th>(구현중)임시table출력확인용</th>
				<th>피자 SIZE</th>
				<th>피자 갯수</th>
				<th>피자 가격</th>
			</tr>
			<tr>
				<td>a</td>
				<td id = "show_pizza_size"> "${LastOrderInfo.orderitemsSize}"</td>
				<td id = "price">"${LastOrderInfo.orderitemsListprice}"</td>
				<td id = "EA">"${LastOrderInfo.orderitemsQuantity}"</td>
			</tr>
		</table>
	</c:forEach>
<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>


<script>
	function show_pizza_size_M() {
		document.getElementById("show_pizza_size").innerHTML="M";}
	function show_pizza_size_L() {
		document.getElementById("show_pizza_size").innerHTML="L";}		
	function show_pizza_size_XL() {
		document.getElementById("show_pizza_size").innerHTML="XL";}
	
	$(document).on
	('click', '#minus1', function () {
		//alert("minus1");
		$('#EA').val($('#EA').val()-1);
	    //console.log($('#EA').val());
		}
	);

	$(document).on
	('click', '#plus1', function () {
		$('#EA').val($('#EA').val()+1);
		//it is funny
		}
	);
	
	var price_slider = document.getElementById("priceRange");
	var price = document.getElementById("price");
	price.innerHTML = price_slider.value;
	price_slider.oninput = function() {
		price.innerHTML = this.value;
	}

	$(document).on
	('click', '#btn_stg3', function () {
		var size=$('#show_pizza_size').text();
		alert("ORDER size: " + size);
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

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
<sec:authentication property="principal" var="principal"/>
	    <div class="row Well">
	        	<!-- NOT WORKING -->	        	
		       	<sec:authorize access="hasRole('ROLE_MASTER')">
					<a href="/Master/M"><h4>PIZZA TIME(Master)</h4></a>
					<a href="/logout">로그아웃</a><br><br>
		       	</sec:authorize>
		       	<sec:authorize access="hasRole('ROLE_USER')">
					<a href="/user/Stg2_1_SetPizza_basic/${username}">
					<img scr="file://C:/Users/l3-evening/Documents/workspace-spring-tool-suite-4-4.7.0.RELEASE/pizza_a/db_pizza_a/pizza_main_link.gif" alt="file://C:/Users/l3-evening/Documents/workspace-spring-tool-suite-4-4.7.0.RELEASE/pizza_a/db_pizza_a/pizza_main_link.gif" style="width:128px;height:128px" />
						<img scr="https://media.giphy.com/media/4ayiIWaq2VULC/giphy.gif" alt="file://C:/Users/l3-evening/Documents/workspace-spring-tool-suite-4-4.7.0.RELEASE/pizza_a/db_pizza_a/pizza_main_link.gif" style="width:128px;height:128px" />
						<!-- <h4>PIZZA TIME(ROLE_USER)</h4> -->
					</a><br>				
				
					<a href="/user/info">${username} 님</a><p> 재방문을 환영합니다.</p>					
					<a href="/user/info">${list_OrderVO_B.storeName}</a>에서 ${list_OrderVO_B.orderAddress}로 <a id="deliver_CHK" value=""></a>주문받겠습니다! <br><br><br>
					<a href="/logout">로그아웃</a><br><br>
				</sec:authorize>
	        	<sec:authorize access="isAnonymous()">
	        		<a href="/Stg1_MAIN_NoID">
	        			<img scr="https://media.giphy.com/media/4ayiIWaq2VULC/giphy.gif" alt="PIZZA TIME" style="width:128px;height:128px" />
	        			<!-- <h4>PIZZA TIME(NO_USER)</h4>-->
	        		</a>
	        	</sec:authorize>
	    </div>
	    <div > <span style="display: inline-block;">Master면 마스터화면을, 유저면 주문화면을, 아무나는 회원가입또는로그인창을 호출</span></div>
<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
<script> 
$(document).ready(function($) {
	
	var Delivercheck= '${list_OrderVO_B.orderDeliver}';
	if (Delivercheck ==true){
		//alert(${list_OrderVO_B.orderDeliver});
		$('#stg3_1_SetPizza_basic').val(배송);
	}else{
		//alert(${list_OrderVO_B.orderDeliver});
		$('#stg3_1_SetPizza_basic').val(방문포장);
		}
});
</script>

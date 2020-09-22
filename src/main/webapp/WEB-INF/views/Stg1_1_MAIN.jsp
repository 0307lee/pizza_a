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
					<h4>PIZZA TIME(Master)</h4>
		       	</sec:authorize>
		       	<sec:authorize access="hasRole('ROLE_USER')">
					<a href="/Stg2_1_SetPizza_basic"><h4>PIZZA TIME(ROLE_USER)</h4></a>
				</sec:authorize>
	        	<sec:authorize access="isAnonymous()">
	        		<a href="/Stg1_MAIN_NoID"><h4>PIZZA TIME(NO_ROLE_USER)</h4></a>
	        	</sec:authorize>
	    </div>
<a href="/logout">로그아웃</a><br><br>
<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>

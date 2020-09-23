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
			<div class="btn-group" role="group" aria-label="...">
				<button type="button" class="btn btn-default">M</button>
				<button type="button" class="btn btn-default">L</button>
				<button type="button" class="btn btn-default">XL</button>
			</div><br>
			<div class="group" role="group" aria-label="...">
				<button type="button" class="btn btn-default">-</button>
				<input type="text" class="form-control" placeholder="1">
				<button type="button" class="btn btn-default">+</button>
			</div>		
		</div>
	</sec:authorize>
	

    <a href="/logout">로그아웃</a><br><br>
<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>

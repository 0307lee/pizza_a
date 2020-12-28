<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
<sec:authentication property="principal" var="principal" />
<sec:authorize access="hasRole('ROLE_USER')">

<h1>Order Started! Wait Plz!</h1>
<h2>Stg4_1_AfterOrder.jsp</h2>
</sec:authorize>


<hr>
<a href="/logout">로그아웃</a>
<br>

<br>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>


<script>
	
	
</script>

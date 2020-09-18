<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
    <h1>My PAGE</h1>
	<hr>
	<div>
		<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal" var="principal"/>
			<h2>${principal}</h2>
		</sec:authorize>
		<a href="/">Back To HOME</a>
	</div>
	
<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
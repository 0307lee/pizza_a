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
		<h4>PIZZA TIME</h4>
        <div class="Login col-md-3">
        	<sec:authorize access="isAnonymous()">
				<a href="/Stg1_LOGIN">로그인</a>
				<a href="/Stg1_BEFORE_REGISTER_ID">회원가입</a><br><br><br><br>
				<a href="/Stg1_FORGET_ID_PW">아이디 비밀번호 까먹음</a>
			</sec:authorize>
        </div>
    </div>
    <a href="/logout">로그아웃</a><br><br>
<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>

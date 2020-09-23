<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

	<h1>로그인_bootstrap</h1>
		<form action ="/loginPro" method= "post"><!-- goto security -->
			<input type ="hidden" name ="${_csrf.parameterName}" value="${_csrf.token}">
			<input type ="text" name="username" placeholder="id 입력해주세요"><br><br>
			<input type ="password" name="password" placeholder="password 입력해주세요"><br><br>
			<input id ="remember_me" name="remember-me" type="checkbox" checked/>아이디 비밀번호 기억하기 (100일간)<br><br>
			<button type="submit">로그인</button><br><br>
		</form>
<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>

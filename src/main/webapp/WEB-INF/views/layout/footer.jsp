<!--footer.JSP
	Include tag		:	Body, div_container -->
	
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

	<div class="row ENDING">
		<hr>
        <div class="logo col-md-4">
        	<span class="glyphicon glyphicon-usd" aria-hidden="true"></span>
        	<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
        	<span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>
        	<img alt="pizza" src="https://img.icons8.com/pastel-glyph/64/000000/pizza--v2.png" width="20" height="20"/>
        </div>
        <div class="site info col-md-4">고객님의 중요정보는 암호화되어 안전히 관리됩니다.<br>(자동저장하지않으면 자동로그아웃됩니다.)</div>
        <div class="site map col-md-4">홈, 관리자, 등록, 고객용 페이지 접근 등
			<div class="dropdown">
				<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
					(미구현)
					<span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
					<li role="presentation"><a role="menuitem" tabindex="-1" href="#">홈</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1" href="#">고객</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1" href="#">관리자</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1" href="#">등록</a></li>
				</ul>
			</div>
        </div>
    </div>
</div>
</body>
</html>
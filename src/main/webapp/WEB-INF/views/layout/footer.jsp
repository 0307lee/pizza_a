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
        </div>
        <div class="site info col-md-4">www.머시기.com (No Domain)</div>
        <div class="site map col-md-4">홈, 관리자, 등록, 고객용  등
			<div class="dropdown">
				<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
					(미구현)사이트맵
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
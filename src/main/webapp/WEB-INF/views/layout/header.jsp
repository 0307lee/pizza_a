<!--header.JSP
	Include Library:	Bootstrap, CSS_own, Jquery, Bootstrap.jsp 
	Include tag		:	Body, div_container -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- CSS는 static에다가-->
<link rel="stylesheet" href="/css/board.css">
<!-- Jquerry 1.x 부트스트랩 자바스크립트사용하기위해서-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 드랍사용하기위해서-->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LEE(!)</title> <!-- need to change. Flow the filename Or declare -->
</head>
<body>
	<div class="container">
		<div class="row Title">
	        <div class="TITLE col-xs-12">
	        	<nav class="navbar navbar-default">
					<div class="container-fluid">
						<div class="navbar-header">
							<a class="navbar-brand" href="/">
								<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
							</a>
						</div>
					</div>
					<p class="text-warning" >Lee HTML_from 200714 to 200910</p>
				</nav>
	        </div>
	    </div>
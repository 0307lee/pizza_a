<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
  
<style>
	table {text-align: center;}
</style>
 
	<h1>Update Post PAGE</h1>
	<hr>
	<h2>게시글 수정하기</h2>
	<form action="/user/post_write_process" method="post" id="frm-write">
		<c:forEach var="board" items="${list_BoardVO}">
			<input type="hidden" name="bId" value="${board.bId}">
			<input type="hidden" name="bWriter" value="${board.bWriter}">
			<input type="hidden" name="uId" value="${board.uId}">
	    	<table width="600" border="1" bordercolor="yellow" bgcolor="orange">
		        <tr heignt="40">
	                <td align="center">글번호</td>
	                <td>${board.bId}</td>
	            </tr>
	            
	            <tr>
	                <td align="center">작성자</td>
	                <td>${board.bWriter}</td>
	            </tr>
	            <tr>
	                <td align="center" >제목</td>
	                <td>
		                <input type="text" name="bTitle"size="60" value="${board.bTitle}">
		            </td>
	            </tr>
	            
	            <tr>
	                <td align="center" >글 내용</td>
	                <td style="width:80%">
		                <input type="text" name="bContent"size="60" value="${board.bContent}">
	                </td>
	            </tr>
			</table>
			
			<div class="col-md-4" id="update">
				<%-- <a href="/user/post/update/process/${board.bId}">수정하기</a> --%>
				<button id="btn-write">수정</button>
			</div>
			
			<div class="col-md-4" id="home">
				<a href="/">게시판으로</a>
			</div>
		</c:forEach>
	</form>
		
<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>

<script>
	$(document).on('click', '#btn-write', function () {
		$('#frm-write').submit();
	});
	//docu내의 btn을 클릭하면
	//	form(=frm-write)가 실행된다
</script>











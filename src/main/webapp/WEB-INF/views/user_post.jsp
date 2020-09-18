<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
  
<style>
	table {text-align: center;}
</style>
 
	<h1>Reading Post PAGE</h1>
	<hr>
	<h2>게시글 읽기</h2>
	<c:forEach var="board" items="${list_BoardVO}">
    	<table width="600" border="1" bordercolor="gray" bgcolor="grey">
	        <tr heignt="40">
                <td align="center">글번호</td>
                <td>${board.bId}</td>
            </tr>
            <tr>
                <td align="center">조회수</td>
                <td>${board.bViews}</td>
            </tr>
            <tr>
                <td align="center">작성자</td>
                <td>${board.bWriter}</td>
            </tr>
            <tr>
                <td align="center" >제목</td>
                <td>${board.bTitle}</td>
            </tr>
            <tr>
                <td align="center" >글 내용</td>
                <td>
					${board.bContent}
                </td>
            </tr>
		</table><hr>
		<div class="col-md-4" id="home">
			<a href="/">게시판으로</a>
		</div>
		
		<sec:authentication var="secUser" property="principal" />
			"${secUser.username}" 가 여기를 들어왔고
			"${board.uId}" 가 이 글을 썻고<br>
		<sec:authorize access="${secUser.username==board.uId}">
       		<div class="col-md-4" id="update">
				<a href="/user/post/update/${board.bId}">(권한 제한 필요)수정하기1</a>
			</div>
			
			
			<form action="/user/post_delete" method="post" id="frm_delete">
				<input type="hidden" name="bId"	value="${board.bId}">
				<div class="col-md-4" id="delete">
					<button id="btn_delete">삭제</button>
				</div>
			</form>
      	</sec:authorize>
       	
       	<!-- First GOTO index HeadLine contents-->
       	<sec:authorize access="hasAnyRole('MASTER', 'DEVELOPER')">
			<td>
				<a href="/user/post/update/${board.bId}">(권한 제한 필요)수정하기2</a>
			</td>
       	</sec:authorize>
	</c:forEach>
			
<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>


<script>
	$(document).on
	('click', '#btn_delete', function () {
		alert("delete");
		$('#frm_delete').submit();
		}
	);
	//docu내의 btn을 클릭하면
	//	form(=frm-write)가 실행된다
</script>



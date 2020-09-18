<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

<style>
	div {text-align: center;}
</style>
   
    <h1>Writing PAGE</h1>
	<hr>

	    <h2>게시글 쓰기</h2>
	     <form action="/user/post_write_process" method="post">
	        <table width="600" border="1" bordercolor="gray" bgcolor="grey">
	        	<tr heignt="40">

	        	<sec:authentication var="secUser" property="principal" />
					<td>
						<input type="text"  name="uId" value="${secUser.username}">
					</td>
					<td >[수정엄금1]"<<"안보이게(type="hidden"") 할수도 있지만 일단 둔다. 접속ID</td>
		        </tr>		
				
	            <tr heignt="40">
	            	<td align="center" width="150">작성자</td>
	                <td width="450">
	                	<input type="text" name="bWriter" size="60">
	                </td>
	            </tr>
	            <tr heignt="40">
	                <td align="center" width="150">제목</td>
	                <td width="450">
	                	<input type="text" name="bTitle"size="60">
	                </td>
	            </tr>
	            <tr heignt="40">
	                <td align="center" width="150">글 내용</td>
	                <td width="450">
	                	<textarea rows="10" cols="50" name="bContent" placeholder="   내용 입력"></textarea>
	                </td>
	            </tr>
	            <tr heignt="40">
	                <td align="center" colspan="2">
	                <input type="reset" value="다시 입력"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	                <input type="submit" value="글쓰기">&nbsp;&nbsp;
	                </td>
	            </tr>
	        </table>
	        
	    </form>
<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "javax.swing.JOptionPane"%>
<%@ include file="Test19_MySQLdriverLoading.jsp"%>
<%-- 
============================================================================================================
해당 PAGE는 항상 단독 사용이 아닌, 다른 .JSP 파일에서 불러와지기 때문에 <html>~~~<head> ~~<body> 등의 선언이 불필요 (cf.AJAX 또한 동일)

============================================================================================================
아작스 호출 기능의 코드 예시
$.ajax({
				type: "POST",
				url: "http://localhost:8080/JSPLook/Try12_AJAX_CHK_ID.jsp",
				data: {L_ID: id_1}, ///{키:값} 형식으로  값을 url에는 키로 던질것이다.
				dataType: "json", ///type에 여러가지 갸눙 html 또는 json xml 등
				success: function (data) {
					//var result = $.trim(data); ///코드 길어지면 보기시렁
					if (data == 'true') {
					} else if (data == 'false') {
						alert('다른 아이디 쓰세요');
					}
				},
				error: function (er) {
					console.log(er);
					alert('연결과 저장에 실패했습니다.');
				}
			});
============================================================================================================
아작스 호출 내용 Console에서 확인하는 방법은
 Web > F12 > Network > XHR > ($AJAX 실행)& 클릭 > Response 에서 확인 
 
============================================================================================================
(미적용)
다중 출력, 특정형식 출력을 원할 시에는 jackson이라는 lib?, class? 활용
============================================================================================================

 --%>
<%
	request.setCharacterEncoding("utf-8");
 
	String id_chk= request.getParameter("U_ID");//AJAX 들어오는 내용 (VIP)
			
	
	try{	
		String sql =" SELECT *  FROM	login01 " + where_id;
		pstmt = conn.prepareStatement(sql);
		rs =pstmt.executeQuery();
		String msg = "OK";
		while(rs.next()){
			msg="alredy_exist";
		}
		out.print(msg); //$AJAX가 되돌려주는 내용 (VIP)
	}catch(SQLException ex){
		  System.out.println("Message String = "+ ex.getMessage()); 
	}finally{
		if(rs!=null)
			rs.close();
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();
	}
%>
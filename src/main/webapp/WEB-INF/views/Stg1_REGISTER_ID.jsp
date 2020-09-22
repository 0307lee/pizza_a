<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

	<h1>회원가입</h1>
	<div>
		<form action="/Stg1_REGISTER_ID"method="post">
			<input type ="hidden" name = "${_csrf.parameterName}" value="${_csrf.token}"><br>
			
			<input type ="text" name="username" placeholder="id 입력"  id ="id_in"><br><br>
			<span id="existing_id" style="display:none;">아이디가 겹칩니다.</span>
			<span id="only_eng" style="display:none;">특수문자는 안되요.</span><br><br>
			<input type ="password" name="password" placeholder="password 입력" class="pw" id="pw_in" ><br><br>
			<input type ="password" name="password2" placeholder="password CHECK" class="pw" id="pw_in2" ><br><br>
			<span id="same_pw" style="display:none;">비밀번호가 일치합니다.</span><br>
			<span id="dif_pw" style="display:none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span><br>
			
			<button type="submit">가입하기</button>
		</form>
	</div>
	<a href="/logout">로그아웃</a><br><br>
<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>



<script>
/* =========================================================================================================
	아작스 호출 내용 Console에서 확인하는 방법은
	 Chrome > F12 > Network > XHR > ($AJAX 실행)& 클릭 > Response 에서 확인  */

	 //id 기존재여부확인
	 $("#id_in").focusout(function(){
    	/* 
    	var pattern_num = /[0-9]/;	// 숫자 

    	var pattern_eng = /[a-zA-Z]/;	// 문자 

    	var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자

		var id_in= $("#id_in").val();
		//console.log(id_in);
		if((pattern_num.test(id_in)) && !(pattern_eng.test(id_in))
				 && !(pattern_spc.test(id_in)) && !(pattern_kor.test(id_in))){
			$("#only_eng").css('display','inline-block');
			}
		 */
		$.ajax({
			type: "POST",
			url: "http://localhost:8080/Stag1_CHK_ID_AJAX",
			contentType: "application/json; charset=utf-8;",
			dataType: "json", ///type에 여러가지 갸눙 html 또는 json xml 등
			data: JSON.stringify({username: id_in}), ///{키:값} 형식으로  값을 url에는 키로 던질것이다.
			//userVO의 username과 같은 이름에 변수가 자동으로 들어간다.
			//stringify 써줘야한다.
			success: function (response) {
				if (response == null){
					console.log(response);
					$("#existing_id").css('display','none');}
				else{
					console.log(response);
					$("#existing_id").css('display','inline-block');
					}
			},
			error: function (xhr, ajaxOptions, thrownError) {
		        alert(xhr.status);
		        alert(thrownError);
		        alert(xhr.responseText);
			}
		});
	});

	//pw일치여부 확인 
	$(".pw").focusout(function(){
		var pwd1= $("#pw_in").val();
		var pwd2= $("#pw_in2").val();
		console.log(pwd1.length+"  "+pwd1+"  "+pwd2);
		if(pwd1!=""&&pwd2!=""){
			if(pwd1==pwd2){
				$("#same_pw").css('display','inline-block');
				$("#dif_pw").css('display','none');
			}else{
				$("#same_pw").css('display','none');
				$("#dif_pw").css('display','inline-block');
			}
	 	}
	});
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<jsp:include page="/WEB-INF/views/common/header.jsp" />
	
	
	<%if(("noSuchMember").equals(request.getParameter("error"))){%>
		<script>
	
			alert('존재하지 않는 회원입니다');
			location.href='<%= request.getRequestURI() %>';
			
		</script> 
	<%} %>
	
	<%if(("wrongPassword").equals(request.getParameter("error"))){%>
		<script>
	
			alert('비밀번호가 잘못되었습니다');
			location.href='<%= request.getRequestURI() %>';
			
		</script> 
	<%} %>


	<main id="login">
		
		<div class="inner">
		
			<!-- 언어선택 버튼 -->
			<div>
				<a href="/gatherlive/member/login.do?lang=en">
						<spring:message code="message.language.en"/>
				</a>&nbsp;&nbsp;
				<a href="/gatherlive/member/login.do?lang=ko">
						<spring:message code="message.language.ko"/>
				</a>
			</div>
		
		
			<div class="flexbox">

				<div class="img_c"></div>
				
				
				<form name="login" action="../member/login.do" method="post">
					
					<div class="input">
						<div class="email">
<!-- 							<p class="B">E-mail</p> -->
							<p class="B"><spring:message code="message.login.mail"/></p>
							<input type="text" name="mail" size="25">
						</div>
						<div class="pw">
<!-- 							<p class="B">PW</p> -->
							<p class="B"><spring:message code="message.login.password"/></p>
							<input type="password" name="password" size="25">
						</div>
					</div>
						
<!-- 					<button id="btn_login" type="submit">로그인</button> -->
					<button id="btn_login" type="submit"><spring:message code="message.login.login"/></button>
<!-- 					<a id="toJoin" href="../join/email.do">아직 회원이 아니신가요?</a> -->
					<a id="toJoin" href="../join/email.do"><spring:message code="message.login.join"/></a>
					
				</form>
				
			</div>
		
		
		</div>

		<a id="btn_toTop" href="#">
			<img src="/gatherlive/resources/img/ico_btn_toTop.svg">
		</a>

	</main>












	<script src="/gatherlive/resources/js/gnav.js"></script>
	
	<script>


		let img_login = new Image();
		img_login.src = "/gatherlive/resources/img/img_login-tmp.svg";
		img_login.style.width = "100%";

		let img_c = document.querySelector("#login .img_c");

		img_c.appendChild(img_login);




/* 		let btn_login = document.getElementById('btn_login');
		let email = document.getElementsByName('email');
		let pw = document.getElementsByName('pw');

		
		let email_test = 'admin';
		let pw_test = '1234';

		$('#btn_login').on('click', function() {
				if(email[0].value != email_test) {
					alert('존재하지 않는 아이디입니다');
					email[0].value = '';
					pw[0].value = '';
				} else if(email[0].value == email_test && pw[0].value != pw_test) {
					alert('비밀번호가 일치하지 않습니다');
					email[0].value = '';
					pw[0].value = '';
				} else {
					document.write('로그인 되었습니다!');
				}
				
				//$(location).attr('href', '05_join_3.html');
				return true;
					
			}); */

		
		
		$(()=> {
			
			// gnav current 클래스 지정
			$('#gnav .nav_login').addClass('current');


		});



	</script>





<jsp:include page="/WEB-INF/views/common/footer.jsp" />

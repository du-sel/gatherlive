<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/common/header.jsp" />




	<main id="join_1" class="join">
		
		<div class="inner">
		
		
		
			<div class="img_c"></div>
			

			<h1>회원가입</h1>
			
			<div class="bar_join">
				<div id="bar"></div>
				<div id="step-1" class="step current"><span>이메일 인증</span></div>
				<div id="step-2" class="step"><span>기본 정보 입력</span></div>
				<div id="step-3" class="step"><span>프로필 만들기</span></div>
				<div id="step-4" class="step"><span>회원가입 완료</span></div>
			</div>
			
			
			<p class="subTitle">로그인에 사용할 이메일 계정을 인증해주세요.</p>

			<form name="join1" action="../join/email.do" method="post">
				<input type="hidden" name="cmd" value="join2">

				<div id="email_c">
					<p>E-mail</p>
					<input type="text" name="mail" size="25">
				</div>

				<button id="btn_join_emailCheck" type="submit">인증 메일 받기</button>

			</form>
		
		
		
		</div>

		<a id="btn_toTop" href="#">
			<img src="/gatherlive/resources/img/ico_btn_toTop.svg">
		</a>

	</main>














	<script src="/gatherlive/resources/js/gnav.js"></script>

	<script>


		//이미지
		let img_join_1 = new Image();
		img_join_1.src = "/gatherlive/resources/img/img_join_1.svg";
		img_join_1.style.width = "100%";

		let img_c;

		img_c = document.querySelector("main .img_c");
		img_c.appendChild(img_join_1);




		//메일주소 유효성검사
		let container = document.getElementById('email_c');
		let email = document.getElementsByName('mail');
		

		

		
		$(()=> {

			
			let val_div = document.createElement('div');
			$(val_div).css({'font-size':'1.2rem', 'font-family':'NanumSquareRound','margin':'1rem 0', 'height':'1.2rem', 'color':'#ff4a60' });
			
			container.appendChild(val_div);
	
			
			function validate_email(){
				let value = email[0].value;
				let regExp = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
				
				if(value == "") {
					val_div.innerHTML = "";
				}
				else if(!regExp.test(value)){
					val_div.innerHTML = "이메일 형식이 올바르지 않습니다."
					return false;
				}
				val_div.innerHTML = "";
				return true;
			}
			
			$(email).on('input', validate_email);
			
			
			
			
			
			
			

			// gnav current 클래스 지정
			$('#gnav .nav_join').addClass('current');
			


		
		});

		

	</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp" />

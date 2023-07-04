<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/common/header.jsp" />




<script>

	// 진행바
	$(()=> {
		$('#bar_fill').css('width', '66%');
	});

	const barFill = function() {

		$(()=> {
			$('#bar_fill').animate( {
				width: '96%'
			}, 500, 'swing' );
		});

	}



</script>




	<main id="join_4" class="join" onload="barFill()">
		
		<div class="inner">
		

		
		
		<h1>가입을 환영합니다!</h1>


		<div class="bar_join">
			<div id="bar"></div>
			<div id="bar_fill"></div>
			<div id="step-1" class="step pass"><span>이메일 인증</span></div>
			<div id="step-2" class="step pass"><span>기본 정보 입력</span></div>
			<div id="step-3" class="step pass"><span>프로필 만들기</span></div>
			<div id="step-4" class="step current"><span>회원가입 완료</span></div>
		</div>

		<h3>이제부터...</h3>
		<ul id="tip">
			<li>모집글을 작성할 수 있어요!</li>
			<li>다른 회원들의 프로필을 조회할 수 있어요!</li>
			<li>다른 회원들의 모집글과 프로필을 관심글로 등록할 수 있어요!</li>
			<li>게더톡을 이용할 수 있어요!</li>
		</ul>



		<button id="btn_join_toLogin" type="button" onclick="location.href='/gatherlive/code/04_login.jsp'">로그인하러 가기</button>


		
		
		
		</div>


		<a id="btn_toTop" href="#">
			<img src="/gatherlive/resources/img/ico_btn_toTop.svg">
		</a>

	</main>

















	<script src="/gatherlive/resources/js/gnav.js"></script>

	<script>

		$(()=> {
			
			// gnav current 클래스 지정
			$('#gnav .nav_join').addClass('current');


		});


	</script>





<jsp:include page="/WEB-INF/views/common/footer.jsp" />

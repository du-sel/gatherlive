<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/common/header.jsp" />



<script>

	// 회원탈퇴 확인 alert
	const delChk = function() {
		
		if(confirm("정말로 탈퇴하시겠습니까?")) {
			
			location.href = '../my/deleteAccount.do';
			
		}
		
		
	}



</script>




	<main id="my_account" class="my">
		
		<div class="inner">
		
		
			
			<div id="header">
				<h1 class="h1"><a href="../my/main.do">마이 페이지</a></h1>
				<h3>계정 관리</h3>
			</div>


			<div class="flex_c">
				
				<jsp:include page="/WEB-INF/views/common/my_lnav.jsp"></jsp:include>

			
				<div id="infoBox">
	
					<div id="email">
						<h4>E-mail</h4>
						<p>${ACCOUNT.mail }</p>
					</div>
	
					<div id="pw">
						<a href="/gatherlive/my/updatePassword.do" id="btn_chgPw" class="btn">비밀번호 변경</a>
					</div>
				
					
					<div id="del">
						<button type="button" id="btn_delAccount" class="btn" onclick="delChk()">회원 탈퇴</button>
					</div>
					

	
				</div>
			
			</div>
		
		</div>

		
		<a id="talk">
			<img src="/gatherlive/resources/img/img_ico_talk.png">
		</a>

		<a id="btn_toTop" href="#">
			<img src="/gatherlive/resources/img/ico_btn_toTop.svg">
		</a>


	</main>












	<script src="/gatherlive/resources/js/gnav.js"></script>
	
	
	<script>
	
		$(()=> {
			
			// gnav current 클래스 지정
			$('#gnav .nav_mypage').addClass('current');
		
			// lnav current 클래스 지정
			$('#lnav .my_account').addClass('current');
		
	
		});

	
	</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />



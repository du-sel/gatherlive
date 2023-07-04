<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/common/header.jsp" />



	<c:if test="${param.error == 'wrongPW' }">
		<script>
	
			alert('기존 비밀번호가 일치하지 않습니다');
			location.href='<%= request.getRequestURI() %>';	
			

		</script> 
	</c:if>
	
	<c:if test="${param.msg == 'ok' }">
		<script>
	
			alert('성공적으로 변경되었습니다!');
			console.log(request.getRequestURI());
			location.href='<%= request.getRequestURI() %>';	
			

		</script> 
	</c:if>



	<main id="my_chgPw" class="my">
		
		<div class="inner">
		
		
			
			<div id="header">
				<h1 class="h1"><a href="../my/main.do">마이 페이지</a></h1>
				<h3>계정 관리</h3>
			</div>


			<div class="flex_c">
				
				<jsp:include page="/WEB-INF/views/common/my_lnav.jsp"></jsp:include>

			
				<form name="chgPw" action="../my/updatePassword.do" onsubmit="chk(); return false;" method="post">
				
					<h2>비밀번호 변경</h2>
	
					<div id="divBox">
						
						<div class="div old">
							<h5 class="title">기존 비밀번호</h5>
							<input type="password" name="password_old" size="25" placeholder="기존 비밀번호를 입력하세요">
						</div>
						
						<div class="div new">
							<h5 class="title">신규 비밀번호</h5>
							<p class="desc">영문자, 숫자, 특수문자를 결합하여 8자~20자 사이로 지정해주세요.</p>
							<input type="password" name="password" size="25" placeholder="신규 비밀번호를 입력하세요">
						</div>
						
						<div class="div newCheck">
							<h5 class="title">신규 비밀번호 확인</h5>
							<input type="password" name="password_chk" size="25" placeholder="신규 비밀번호를 확인하세요">
						</div>
					</div>
	
					<div id="btn_c">
						<button id="btn_chgPw">변경하기</button>
					</div>
	
				</form>
			
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
		
		//비밀번호 유효성검사
		let pw_c = document.querySelector('.div.new');
		let pw = document.getElementsByName('password');
		let val_pw = document.createElement('div');
		$(val_pw).css({'font-size':'1.2rem', 'font-family':'NanumSquareRound','margin':'1rem 0', 'color':'#ff4a60' });
	
		pw_c.appendChild(val_pw);
	
		let value_pw;
		
		const validate_pw = function(){
	
			value_pw = pw[0].value;
			let regExp = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*\W).{8,20}$/;
			let repeat = /(\w)\1\1\1/;
			
			if(value_pw == "") {
				val_pw.innerHTML = "";
				return false;
			}
			else if(!regExp.test(value_pw)){
				val_pw.innerHTML = "비밀번호 형식이 올바르지 않습니다.";
				return false;
			}
			if(repeat.test(value_pw)) {
				val_pw.innerHTML = "비밀번호에 같은 문자를 4번 이상 사용하실 수 없습니다.";
				return false;
			}
			val_pw.innerHTML = "";
			return true;
		};
	
		
		
		$(()=> {	
			$(pw).on('input', validate_pw);
		});
	
	
	
	
		//비밀번호 확인 일치검사
		let pc_c = document.querySelector('.div.newCheck');
		let pc = document.getElementsByName('password_chk');
		let val_pc = document.createElement('div');
		$(val_pc).css({'font-size':'1.2rem', 'font-family':'NanumSquareRound','margin':'1rem 0', 'color':'#ff4a60' });
	
		pc_c.appendChild(val_pc);
	
		let value_pc;
		
		const validate_pc = function(){
			value_pc = pc[0].value;
			
			if(value_pc == "") {
				val_pc.innerHTML = "";
				return false;
			}
			else if(value_pc != value_pw){
				val_pc.innerHTML = "비밀번호가 일치하지 않습니다.";
				return false;
			}
			if(value_pc == value_pw) {
				$(val_pc).css({'color':'#3e4b99'});
				val_pc.innerHTML = "확인 완료!";
				return true;
			}
			val_pw.innerHTML = "";
			return false;
		};
	
		$(pc).on('input', validate_pc);
		
		
		
		
		
		
		
		//필수항목 미입력시 진행 불가
		const chk = function() {
			$(()=> {
				
				console.log("chk 실행");
				if($('.div.old input').val().length == 0) {
					alert("기존 비밀번호를 입력해주세요.");
					$('.div.old input').focus();
					return false;
				} else if($('.div.new input').val().length == 0){ 
					alert("신규 비밀번호를 입력해주세요.");
					$('.div.new input').focus();
					return false;
				} else if(!validate_pw()){
					alert("신규 비밀번호가 올바르지 않습니다.");
					$('.div.new input').focus();
					return false;
				} else if(!validate_pc()){
					alert("신규 비밀번호를 확인해주세요.");
					$('.div.newCheck input').focus();
					return false;
				} else if($('.div.newCheck input').val().length == 0){ 
					alert("신규 비밀번호를 확인해주세요.");
					$('.div.newCheck input').focus();
					return false;
				} 
				

				let frm = document.getElementsByName("chgPw");
				frm[0].submit();
				
					
			});

		}
		
		
	
		
		$(()=> {
			
			// gnav current 클래스 지정
			$('#gnav .nav_mypage').addClass('current');
			
			// lnav current 클래스 지정
			$('#lnav .my_account').addClass('current');
		
	
		});


		
	
	
	</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp" />



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/common/header.jsp" />


<script>

	// 진행바

	const barFill = function() {

		$('#bar_fill').animate( {
			width: '33%'
		}, 500, 'swing' );

	}
	
	
	//disabled 해제 
	const enable = function() {
		let frm = document.getElementsByName("join2");
		
		let dis = document.querySelectorAll("input:disabled");
		
		for(let d of dis) {
			d.disabled = false;
		}
		
		frm[0].submit();
		
	}
	
	
	
	


	
	
	


</script>



	<main id="join_2" class="join" onload="barFill()">
		
		<div class="inner">
		
		
			
			<div class="img_c"></div>

			
			<h1>회원가입</h1>
			<p class="subTitle">인증되었습니다! 이제 회원가입에 필요한 정보를 입력해주세요!</p>

			<div class="bar_join">
				<div id="bar"></div>
				<div id="bar_fill"></div>
				<div id="step-1" class="step pass"><span>이메일 인증</span></div>
				<div id="step-2" class="step current"><span>기본 정보 입력</span></div>
				<div id="step-3" class="step"><span>프로필 만들기</span></div>
				<div id="step-4" class="step"><span>회원가입 완료</span></div>
			</div>


			
			<form name="join2" action="../join/account.do" onsubmit="chk(); return false;" method="post">
				<input type="hidden" name="cmd" value="join3">

				<div class="input email">
					<p class="must">E-mail</p>
					<input type="text" name="email_v" value="${MAIL }" size="25" disabled>
				</div>

				<div class="input pw" id="pw">
					<p class="must">비밀번호</p>
					<p class="desc">영문자, 숫자, 특수문자를 결합하여 8자~20자 사이로 지정해주세요.</p>
					<input type="password" name="password" size="25" placeholder="비밀번호를 입력하세요">
				</div>

				<div class="input pwCheck" id="pwCheck">
					<p class="must">비밀번호 확인</p>
					<input type="password" name="pwCheck" size="25" placeholder="비밀번호를 확인하세요">
				</div>
				
				<div class="input name" id="username">
					<p class="must">이름</p>
					<p class="desc">비밀번호 분실 시 본인확인을 위해 사용됩니다. 정확한 이름을 사용해주세요.</p>
					<input type="text" name="user_name" size="25" placeholder="이름을 입력하세요">
				</div>
					
					
				<div class="input" id="gender">
					<p class="must">성별</p>
					<select name="gender">
						<option value="선택 안 함">선택 안 함 </option>
						<option value="여">여자</option>
						<option value="남">남자</option>
					</select>
				</div>
				
				
				
				<div class="input">
					<p>생년월일</p>
					<p class="desc">입력 시 프로필에 나이가 공개됩니다</p>
					<div class="sel birth">
						<input type="date" name="birth" style="width: 20rem;">
					</div>
				</div>
				


				<div class="input tel">
					<p>연락처</p>
					<p class="desc">'-' 없이 입력해주세요</p>
					<input type="text" name="cell" size="25" placeholder="연락처를 입력하세요">
				</div>
				
				<div class="flexbox">
					<button id="btn_join_toNext" type="submit">다음 단계로</button>
					<!--  -->
				</div>

			</form>
		
		
		
		</div>

		<a id="btn_toTop" href="#">
			<img src="/gatherlive/resources/img/ico_btn_toTop.svg">
		</a>

	</main>












	<script src="/gatherlive/resources/js/gnav.js"></script>
	
	<script>

		let img_join_1 = new Image();
		img_join_1.src = "/gatherlive/resources/img/img_join_1.svg";
		img_join_1.style.width = "100%";

		let img_c;

		
		img_c = document.querySelector("main .img_c");
		img_c.appendChild(img_join_1);
		


		
		$(()=> {
			

			// gnav current 클래스 지정
			$('#gnav .nav_join').addClass('current');

		});



		
			//비밀번호 유효성검사
			let pw_c = document.querySelector('.input.pw');
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
			let pc_c = document.querySelector('.input.pwCheck');
			let pc = document.getElementsByName('pwCheck');
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
			





			//연락처 숫자만 입력 가능
			let tel = document.getElementsByName('cell');

			$(tel).on('input', function() {
				$(this).val($(this).val().replace(/[^0-9]/g,''));
			});


		
		
		
		
		
		
		//필수항목 미입력시 진행 불가
		const chk = function() {
			$(()=> {
				
				if(!validate_pw()){
					alert("비밀번호가 올바르지 않습니다.");
					$('#pw input').focus();
					return false;
				} else if(!validate_pc()){
					alert("비밀번호를 확인해주세요.");
					$('#pwCheck input').focus();
					return false;
				}
				else if($('#pw input').val().length == 0){ 
					alert("비밀번호를 입력해주세요.");
					$('#pw input').focus();
					return false;
				} 
				else if($('#pwCheck input').val().length == 0){ 
					alert("비밀번호를 확인해주세요.");
					$('#pwCheck input').focus();
					return false;
				} 
				else if($('#username input').val() == '' || $('#username input').val() == null){ 
					alert("이름을 입력해주세요.");
					$('#username input').focus();
					return false;
				} 
				

				let frm = document.getElementsByName("join2");
				frm[0].submit();
				
					
			});

		}
		



	</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />



<%@page import="com.seoul.gatherlive.biz.profile.*"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/common/header.jsp" />



<script>


	
	
	let dataInst = <%=(JSONArray)application.getAttribute("JSONINST") %>
	let dataLoca = <%=(JSONArray)application.getAttribute("JSONLOCA") %>


	
	
	
	// 악기 소분류
	const getSecondInst = function(g1, number) {
		
		let num = Number(number.substr(14));
		console.log('num');
		console.log(num);
		let secondInst = document.querySelectorAll('.my_inst .select.instrument');
		
		secondInst[num-1].options.length = 0;
		secondInst[num-1].add(new Option("-- 선택 안 함 --", ""));
		
		for(let i = 0; i<dataInst.length; i++) {
			let g1InData = dataInst[i].g1;
			let nameInData = dataInst[i].name;
			
			if(g1 == g1InData) {
				for(let j = 0; j<nameInData.length; j++) {
					let name = nameInData[j];
					secondInst[num-1].add(new Option(name, name));
				}
			}
		}	
	}
	
	

	
	
	
	// 지역 중분류
	const getSecondLoca = function(g1, number) {
		
		let num = Number(number.substr(12));
		console.log('num');
		console.log(num);
		
		let secondLoca = document.querySelectorAll('.my_loca .g2');
		
		secondLoca[num-1].options.length = 0;
		secondLoca[num-1].add(new Option("-- 선택 안 함 --", ""));
		
		for(let i = 0; i<dataLoca.length; i++) {
			let g1InData = dataLoca[i].g1;
			
			let g2ListInData = dataLoca[i].g2List;
			
			if(g1 == g1InData) {
				secondLoca[num-1].add(new Option("전체", "전체"));
				for(let j = 0; j<g2ListInData.length; j++) {
					let g2InData = g2ListInData[j].g2;
					if(g2InData == "전체") continue;
					secondLoca[num-1].add(new Option(g2InData, g2InData));
				}
			}
		}

	}
	
	
	
	
	const getThirdLoca = function(g2, number) {
		
		$(()=> {
			let num = Number(number.substr(12));
			console.log(num);
			
			let secId = "#my_loca"+num;
			console.log(secId);
			
			let g1Save = $(secId).find('.g1 option:selected').val();
			console.log(g1Save);
			
			
			let ThirdLoca = document.querySelectorAll('.my_loca .g3');
			
			
			ThirdLoca[num-1].options.length = 0;
			
			
			// 앞에거가 전체이면 disable
			if(g2 == "전체") {
				ThirdLoca[num-1].add(new Option("--", ""));
				ThirdLoca[num-1].disabled = true;
				return;
			}
			
			
			ThirdLoca[num-1].disabled = false;
			ThirdLoca[num-1].add(new Option("-- 선택 안 함 --", ""));
			
			for(let i = 0; i<dataLoca.length; i++) {
				let g1InData = dataLoca[i].g1;
				
				let g2ListInData = dataLoca[i].g2List;
				
				if(g1Save == g1InData) {
					
					for(let j = 0; j<g2ListInData.length; j++) {
						let g2InData = g2ListInData[j].g2;
						
						if(g2 == g2InData) {				
							let g3InData = g2ListInData[j].g3;
							
							// null 밖에 없을 경우 disable
							if(g3InData[0] == 'null') {
								ThirdLoca[num-1].options.length = 0;
								ThirdLoca[num-1].add(new Option("--", ""));
								ThirdLoca[num-1].disabled = true;
								return;
							}
							
							ThirdLoca[num-1].disabled = false;
							ThirdLoca[num-1].options.length = 0;
							ThirdLoca[num-1].add(new Option("전체", "전체"));
							for(let k = 0; k<g3InData.length; k++) {
								let g3 = g3InData[k];
								if(g3 == "전체") continue;
								ThirdLoca[num-1].add(new Option(g3, g3));
							}
						}
						
					}
				}
			}
		
		});
		
		
	}
	
	
	
	
	

	
	
</script>


	<c:if test="${param.msg == 'ok' }">
		<script>
	
			alert('성공적으로 변경되었습니다!');
			location.href='<%= request.getRequestURI() %>';	
			

		</script> 
	</c:if>



	<main id="my_prfl" class="my">
		
		<div class="inner">
		
		
			<div id="header">
				<h1 class="h1"><a href="../my/main.do">마이 페이지</a></h1>
				<h3>프로필 관리</h3>
			</div>

			<div class="flex_c">
				
				<jsp:include page="/WEB-INF/views/common/my_lnav.jsp"></jsp:include>

			
				<div id="form_c">
					
					<form name="frm_account" action="../my/prfl/account.do" method="post">
	
						<h2 class="secTitle">기본 정보</h2>
						<section id="accnt" class="sec">
						
							
							<div id="my_prflPic" class="sec_edit">
								<div class="img_c">
									<img alt="프로필 사진">
								</div>
								<input type="file" accept="image/*" name="prflPic" class="edit" style="width: 20rem;">
							</div>
							
							
							<div id="my_username" class="sec_edit">
								<h4>이름</h4>
								<div class="before">
									<p>${MYPROFILE.MEMBER.user_name }</p>
									<div class="icoBox">
										<img src="/gatherlive/resources/img/ico_edit.svg" class="ico_edit" alt="이름 수정"><br>
									</div>
								</div>
								<div class="edit">
									<input type="text" name="username" size="25" value="${MYPROFILE.MEMBER.user_name }">
									<p class="desc">비밀번호 분실 시 본인확인을 위해 사용됩니다. 정확한 이름을 사용해주세요.</p>
								</div>
							</div>
							
	
	
							<div id="my_birth" class="sec_edit">
								<h4>생년월일</h4>
								<div class="before">
									<p>${MYPROFILE.MEMBER.birth }</p>
									<div class="icoBox">
										<img src="/gatherlive/resources/img/ico_edit.svg" class="ico_edit" alt="생년월일 수정"><br>
									</div>
								</div>
								<input type="date" name="birth" class="edit" style="width: 20rem;" value="${MYPROFILE.MEMBER.birth }">
							</div>
							
							<div id="my_gender" class="sec_edit">
								<h4>성별</h4>
								<div class="before">
									<p>${MYPROFILE.MEMBER.gender }</p>
									<div class="icoBox">
										<img src="/gatherlive/resources/img/ico_edit.svg" class="ico_edit" alt="성별 수정"><br>
									</div>
								</div>
								<select name="gender" class="sel edit" data-value="${MYPROFILE.MEMBER.gender }">
									<option value="" selected disabled>-- </option>
									<option value="선택 안 함">선택 안 함 </option>
									<option value="여">여자</option>
									<option value="남">남자</option>
								</select>
							</div>
							
							<div id="my_cell" class="sec_edit">
								<h4>연락처</h4>
								<div class="before">
									<p>${MYPROFILE.MEMBER.cell }</p>
									<div class="icoBox">
										<img src="/gatherlive/resources/img/ico_edit.svg" class="ico_edit" alt="연락처 수정"><br>
									</div>
								</div>
								<input type="text" name="cell" class="edit" size="25" value="${MYPROFILE.MEMBER.cell }">
							</div>
							
							<div id="my_open" class="sec_edit">
								<h4>프로필 검색</h4> 
								<c:if test="${MYPROFILE.MEMBER.open == 0 }">
									<div class="before">
										<p>비허용</p>
										<div class="icoBox">
											<img src="/gatherlive/resources/img/ico_edit.svg" class="ico_edit" alt="이름 수정"><br>
										</div>
									</div>
								</c:if>
								<c:if test="${MYPROFILE.MEMBER.open == 1 }">
									<div class="before">
										<p>허용</p>
										<div class="icoBox">
											<img src="/gatherlive/resources/img/ico_edit.svg" class="ico_edit" alt="검색 허용여부 수정"><br>
										</div>
									</div>
								</c:if>
								<div class="radio open edit" data-value="${MYPROFILE.MEMBER.open}">
									<label>
										<input type="radio" name="open" value="1">
										허용
									</label>
									<label>
										<input type="radio" name="open" value="0">
										비허용
									</label>
								</div>
							</div>
	
						</section>
						
						<div class="btn_edit_c">
							<div class="flexbox">
								<button id="btn_edit_account" class="btn_edit" type="button">수정하기</button>
								<p class="desc">'수정하기' 버튼을 누르셔야 해당 영역의 수정사항이 반영됩니다.</p>
							</div>
						</div>
					</form>	
							
							
							
					<form name="frm_loca" action="../my/prfl/location.do" method="post">	
						
						<h2 class="secTitle">지역</h2> 
						<section id="sec_loca" class="sec">
					
							<c:forEach items="${MYPROFILE.LOCALIST }" var="loca" varStatus="status">
								<div class="my_loca" id="my_loca${status.count }">							
									<div class="text">
										<p>
											${loca.g1 }
											<input type="hidden" name="location_g1_${status.count }" class="g1" value="${loca.g1 }">
											${loca.g2 }
											<input type="hidden" name="location_g2_${status.count }" class="g2" value="${loca.g2 }">
											<c:if test='${!(loca.g2 == "전체" || loca.g3 == "null")}'>
												${loca.g3 }
											</c:if>
											<input type="hidden" name="location_g3_${status.count }" class="g3" value="${loca.g3 }">
										</p>
									</div>
									
									<div class="del">
										<img src="/gatherlive/resources/img/ico_del.svg" alt="지역 삭제">
									</div>
								</div>
							</c:forEach>
							
							<div id="new_loca">
								<select name="location_g1_1" class='g1' onchange="getSecondLoca(this.options[selectedIndex].value, this.name)">
									<option value="">-- 선택 안 함 --</option>
									<% ArrayList<String> finalLoca = (ArrayList)application.getAttribute("FINALLOCA");
									for(String key : finalLoca) { %>
									<option value="<%=key %>"><%=key %></option>
									<% } %>
								</select>
								<select name="location_g2_1" class='g2' onchange="getThirdLoca(this.options[selectedIndex].value, this.name)">
									<option value="">-- 선택 안 함 --</option>
								</select>
								<select name="location_g3_1" class='g3'>
									<option value="">-- 선택 안 함 --</option>
								</select>
								
								
								
								<div class="del">
									<img src="/gatherlive/resources/img/ico_del.svg" alt="지역 삭제">
								</div>
							</div>
								
							
							<div class="plus_c">
								<button type="button" id="btn_plus_loca" class="plus">
									<p class="EB">+ 지역 추가하기</p>
								</button>
							</div>
							
						</section>
						
						<div class="btn_edit_c">
							<div class="flexbox">
								<button id="btn_edit_loca" class="btn_edit" type="button">수정하기</button>
								<p class="desc">'수정하기' 버튼을 누르셔야 해당 영역의 수정사항이 반영됩니다.</p>
							</div>
						</div>
					</form>
	
	
	
	
	
	
					<form name="frm_inst" action="../my/prfl/instrument.do" method="post">
						<h2 class="secTitle">악기</h2>
						<section id="sec_inst" class="sec">
							
							<c:forEach items="${MYPROFILE.INSTLIST }" var="inst" varStatus="status">
								<div class="my_inst" id="my_inst${status.count }">
									<div class="nameBox">
										<h3>${inst.inst_name }</h3>
										<input type="hidden" class="select instrument" name="instrument${status.count }" value="${inst.inst_name }">
										<div class="del">
											<img src="/gatherlive/resources/img/ico_del.svg" alt="지역 삭제">
										</div>
									</div>
									<div class="my_inst_level sec_edit">
										<p class="title">실력</p>
										<div class="before">
											<p>${inst.inst_level }</p>
											<%-- <div class="radio level">
												<input type="hidden" name="level${status.count }" value="${inst.inst_level }">
											</div> --%>
											<div class="icoBox">
												<img src="/gatherlive/resources/img/ico_edit.svg" class="ico_edit" alt="실력 수정"><br>
											</div>
										</div>
										<div class="radio level edit idx${status.count }" data-value="${inst.inst_level}">
											<label>
												<input type="radio" name="level${status.count }" value="하">
												하
											</label>
											<label>
												<input type="radio" name="level${status.count }" value="중">
												중
											</label>
											<label>
												<input type="radio" name="level${status.count }" value="상">
												상
											</label>
										</div>
									</div>
									<div class="my_inst_time sec_edit">
										<p class="title">연주한 기간</p>
										<div class="before">
											<p>${inst.inst_month }</p>
											<div class="icoBox">
												<img src="/gatherlive/resources/img/ico_edit.svg" class="ico_edit" alt="기간 수정"><br>
											</div>
										</div>
										<div class="radio time edit idx${status.count }" data-value="${inst.inst_timeValue}">
											<label>
												<input type="radio" name="time${status.count }" value="0">
												3개월 미만
											</label>
											<label>
												<input type="radio" name="time${status.count }" value="3">
												3개월~6개월
											</label>
											<label>
												<input type="radio" name="time${status.count }" value="6">
												6개월~1년
											</label>
											<label>
												<input type="radio" name="time${status.count }" value="12">
												1년~3년
											</label>
											<label>
												<input type="radio" name="time${status.count }" value="36">
												3년 이상
											</label>
											<p class="desc">기간은 가입일자를 기준으로 자동수정됩니다</p>
										</div>
									</div>
								</div>
							</c:forEach>
							
							
							
							<div id="new_inst">
							
								<div class="del">
									<img src="/gatherlive/resources/img/ico_del.svg" alt="악기 삭제">
								</div>
								
								<div class="input">
									<h5 class="question">어떤 악기를 연주하시나요?</h5>
									<select name="instrument_g1_1" class="instrument_g1" onload="getFirstInst(this.name)" onchange="getSecondInst(this.options[selectedIndex].value, this.name)">
										<option value="">-- 선택 안 함 --</option>
										<% ArrayList<String> finalInst = (ArrayList)application.getAttribute("FINALINST");
										for(String key : finalInst) { 
											if(key.equals("그 외")) continue;%>
										<option value="<%=key %>"><%=key %></option>
										<% } %>
										<option value="그 외">그 외</option>
									</select>
									
									<select name="instrument1" class="select instrument">
										<option value="">-- 선택 안 함 --</option>
									</select>
								</div>
								
								
								<div class="input">
									<h5 class="question">실력은 어느 정도인가요?</h5>
									<div class="radio level">
										<label>
											<input type="radio" name="level1" value="하">
											하
										</label>
										<label>
											<input type="radio" name="level1" value="중">
											중
										</label>
										<label>
											<input type="radio" name="level1" value="상">
											상
										</label>
									</div>
								</div>
								
								
								
								<div class="input">
									<h5 class="question">이 악기를 연주한 기간은 어느 정도인가요?</h5>
									<div class="radio time">
										<label>
											<input type="radio" name="time1" value="0">
											3개월 미만
										</label>
										<label>
											<input type="radio" name="time1" value="3">
											3개월~6개월
										</label>
										<label>
											<input type="radio" name="time1" value="6">
											6개월~1년
										</label>
										<label>
											<input type="radio" name="time1" value="12">
											1년~3년
										</label>
										<label>
											<input type="radio" name="time1" value="36">
											3년 이상
										</label>
									</div>
								</div>
			
								
							
							
							</div>
							
							
							
							<div class="plus_c">
								<button type="button" id="btn_plus_inst" class="plus">
									<p class="EB">+ 악기 추가하기</p>
								</button>
							</div>
						</section>	
						
						
						<div class="btn_edit_c">
							<div class="flexbox">
								<button id="btn_edit_inst" class="btn_edit" type="button">수정하기</button>
								<p class="desc">'수정하기' 버튼을 누르셔야 해당 영역의 수정사항이 반영됩니다.</p>
							</div>					
						</div>
					</form>
					
					
					
					
						
					<form name="frm_pref" action="../my/prfl/pref.do" method="post">		
						<h2 class="secTitle">추가 정보</h2>
						<section class="sec">
							<ul id="pref">
								
								<li id="my_pref_genre" class="sec_edit">
									<h4>좋아하는 음악 장르</h4>
									<div class="before">
										<p>${ACCOUNT.pref_genre }</p>
										<div class="icoBox">
											<img src="/gatherlive/resources/img/ico_edit.svg" class="ico_edit" alt="장르 수정"><br>
										</div>
									</div>
									<input type="text" name="pref_genre" class="edit" value="${ACCOUNT.pref_genre }" size="50">
								</li>
	
								<li id="my_pref_musician" class="sec_edit">
									<h4>좋아하는 뮤지션</h4>
									<div class="before">
										<p>${ACCOUNT.pref_musician }</p>
										<div class="icoBox">
											<img src="/gatherlive/resources/img/ico_edit.svg" class="ico_edit" alt="뮤지션 수정"><br>
										</div>
									</div>
									<input type="text" name="pref_musician" class="edit" value="${ACCOUNT.pref_musician }" size="50">
								</li>
	
								<li id="my_pref_music" class="sec_edit">
									<h4>좋아하는 곡</h4>
									<div class="before">
										<p>${ACCOUNT.pref_music }</p>
										<div class="icoBox">
											<img src="/gatherlive/resources/img/ico_edit.svg" class="ico_edit" alt="곡 수정"><br>
										</div>
									</div>
									<input type="text" name="pref_music" class="edit" value="${ACCOUNT.pref_music }" size="50">
								</li>
	
								<li id="my_pref_day" class="sec_edit">
									<h4>합주 시 선호하는 요일</h4>
									<div class="before">
										<p>${ACCOUNT.pref_day }</p>
										<div class="icoBox">
											<img src="/gatherlive/resources/img/ico_edit.svg" class="ico_edit" alt="요일 수정"><br>
										</div>
									</div>
									<input type="text" name="pref_day" class="edit" value="${ACCOUNT.pref_day }" size="50">
								</li>
	
								<li id="my_pref_time" class="sec_edit">
									<h4>합주 시 선호하는 시간대</h4>
									<div class="before">
										<p>${ACCOUNT.pref_time }</p>
										<div class="icoBox">
											<img src="/gatherlive/resources/img/ico_edit.svg" class="ico_edit" alt="시간대 수정"><br>
										</div>
									</div>
									<input type="text" name="pref_time" class="edit" value="${ACCOUNT.pref_time }" size="50">
								</li>
	
								<li id="my_hope" class="sec_edit">
									<h4>합주 멤버들에게 바라는 점</h4>
									<div class="before">
										<p>${ACCOUNT.hope }</p>
										<div class="icoBox">
											<img src="/gatherlive/resources/img/ico_edit.svg" class="ico_edit" alt="바라는점 수정"><br>
										</div>
									</div>
									<textarea name="hope" class="edit" style="width: 100%" rows="3">${ACCOUNT.hope }</textarea>
								</li>
	
								<li id="my_introduce" class="sec_edit">
									<h4>소개글</h4>
									<div class="before">
										<p>${ACCOUNT.introduce }</p>
										<div class="icoBox">
											<img src="/gatherlive/resources/img/ico_edit.svg" class="ico_edit" alt="소개글 수정"><br>
										</div>
									</div>
									<textarea name="introduce" class="edit" style="width: 100%" rows="7">${ACCOUNT.introduce }</textarea>
								</li>
							</ul>
						</section>
					
						
						<div class="btn_edit_c">
							<div class="flexbox">
								<button id="btn_edit_pref" class="btn_edit" type="button">수정하기</button>
								<p class="desc">'수정하기' 버튼을 누르셔야 해당 영역의 수정사항이 반영됩니다.</p>
							</div>
						</div>
		
					</form>
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
	
		
		//악기, 지역 관리용 배열
		let arrInst = [];
		let arrLoca = [];
	
		let idxInst = 1;
		let idxLoca = 1;
		
		
		window.addEventListener('load', function() {
			// 기존 악기 arr에 추가
			let lthInst = '${fn:length(MYPROFILE.INSTLIST)}';
			for(let i = 1; i<=lthInst; i++) {
				let idInst = "my_inst"+i;
				let tmpInst = document.getElementById(idInst);
				arrInst.push(tmpInst);
			}
		
			// 기존 지역 arr에 추가 
			let lthLoca = '${fn:length(MYPROFILE.LOCALIST)}';
			for(let i = 1; i<=lthLoca; i++) {
				let idLoca = "my_loca"+i;
				let tmpLoca = document.getElementById(idLoca);
				arrLoca.push(tmpLoca);
			}

		});
		
		
		
		

		$(()=> {
			
			
			// account 제출 버튼
			$(".btn_edit").on("click", function() {
				
				let frm = $(this).parent().parent().parent();
				
				// select 처리
				if(frm.find('.edit').hasClass('sel')) {
					let val = frm.find('.sel.edit').attr('data-value');
					console.log(val);
					frm.find('.sel.edit option[value="'+val+'"]').attr('selected', 'selected');
				}
				// radio 처리
				if(frm.find('.edit').hasClass('radio')) {
					let ed = frm.find('.edit');
					console.log(ed);
					if(ed.hasClass('time')) {
						for(let i = 0; i<ed.length; i++) {				
							let val = frm.find('.radio.time.edit').eq(i).attr('data-value');
							console.log('val');
							console.log(val);
							frm.find('.edit').find(':radio[value="'+val+'"]').eq(i).attr('checked', true);
						}
					}
					if(ed.hasClass('level')) {
						for(let i = 0; i<ed.length; i++) {				
							let val = frm.find('.radio.level.edit').eq(i).attr('data-value');
							console.log('val');
							console.log(val);
							frm.find('.edit').find(':radio[value="'+val+'"]').eq(i).attr('checked', true);
						}
					}
					if(ed.hasClass('open')) {			
						let val = frm.find('.radio.open.edit').attr('data-value');
						frm.find('.edit').find(':radio[value="'+val+'"]').attr('checked', true);
					}
				}
				// 지역 인덱스 넘겨주기
				if($(this).is('#btn_edit_loca')) {
					let hidden = document.createElement('div');
					let text = "<input type='hidden' name='idxLoca' value='"+arrLoca.length+"'>"
					hidden.innerHTML = text;
					
					$(frm).append(hidden);
				}
				// 악기 인덱스 넘겨주기
				if($(this).is('#btn_edit_inst')) {
					let hidden = document.createElement('div');
					let text = "<input type='hidden' name='idxInst' value='"+arrInst.length+"'>"
					hidden.innerHTML = text;
					
					$(frm).append(hidden);
				}
				
				frm.submit();

			});
			
			
			
			
			
			
			
			
			
			// 마우스 오버 수정버튼 표시
			const appear = function() {
				let sec = $(this);
				$(this).find(".ico_edit").css('display','block').on('click', function() {
					// 클릭 시 수정 input 표시
					sec.find('.before').css('display','none');
					
					// select 처리
					if(sec.find('.edit').hasClass('sel')) {
						let val = sec.find('.edit').attr('data-value');
						sec.find('.edit option[value="'+val+'"]').attr('selected', 'selected');
					}
					// radio 처리
					if(sec.find('.edit').hasClass('radio')) {
						let val = sec.find('.edit').attr('data-value');
						sec.find('.edit').find(':radio[value="'+val+'"]').attr('checked', true);
					}
					
					sec.find('.edit').css('display','block');
				});
			
			};
			

			// 수정 버튼 활성화
			$(".sec_edit").on("mouseover", appear);
			
			
			$(".sec_edit").on("mouseout", function() {
				$(this).find(".ico_edit").css('display','none');
			});
			
			
			
			
			
			// 악기 삭제버튼 활성화
			$('.my_inst').on('mouseover', function() {
				$(this).find('.del').css('display','block').off().on('click', function() {
					if(confirm('악기를 삭제하시겠습니까?')) {
						let element = this.parentElement.parentElement;
						console.log("element");
						console.log(element);
						let removeIdx = arrInst.indexOf(element);
						console.log(removeIdx+'번 인덱스 삭제');
						arrInst.splice(removeIdx, 1);
						element.remove();

						for(let i of arrInst) {
							console.log("바뀐배열 요소: i");
							console.log(i);
							let newIdx = arrInst.indexOf(i)+1;
							console.log('newIdx: '+newIdx);
							i.id = "my_inst"+newIdx;
							$(i).find('.instrument_g1').attr('name','instrument_g1_'+newIdx);
							$(i).find('.select.instrument').attr('name','instrument'+newIdx);
							$(i).find('.radio.level input').attr('name','level'+newIdx);
							$(i).find('.radio.time input').attr('name','time'+newIdx);
						}
					} 
				});
			});
				
			$('.my_inst').on('mouseout', function() {
				$(this).find('.del').css('display','none');
			});			
			
			
			
			
			// 지역 삭제버튼 활성화
			$('.my_loca').on('mouseover', function() {
				$(this).find('.del').css({'display':'flex'}).off().on('click', function() {
					if(confirm('지역을 삭제하시겠습니까?')) {
						let element = this.parentElement;
						let removeIdx = arrLoca.indexOf(element);
						arrLoca.splice(removeIdx, 1);
						element.remove();

						for(let i of arrLoca) {
							let newIdx = arrLoca.indexOf(i)+1;
							i.id = "my_loca"+newIdx;
							$(i).find('.g1').attr('name','location_g1_'+newIdx);
							$(i).find('.g2').attr('name','location_g2_'+newIdx);
							$(i).find('.g3').attr('name','location_g3_'+newIdx);
						}

					} 
				});
			});
				
			$('.my_loca').on('mouseout', function() {
				$(this).find('.del').css('display','none');
			});			
			
			
			
			
			
			// gnav current 클래스 지정
			$('#gnav .nav_mypage').addClass('current');
		
			// lnav current 클래스 지정
			$('#lnav .my_prfl').addClass('current');
			
			
			
		});




		
		
		//지역 추가하기
		let loca_form = document.getElementById('new_loca');
		let btn_loca = document.getElementById('btn_plus_loca');
		let btn_c = btn_loca.parentElement;
		let sec_loca = document.getElementById('sec_loca');

		
		btn_loca.addEventListener("click", function() {
			idxLoca = arrLoca.length;
			idxLoca++;
			let newLoca = document.createElement('div');
			let textLoca = loca_form.innerHTML;
			newLoca.innerHTML = textLoca;
			newLoca.id = "my_loca"+idxLoca;
			newLoca.className = "my_loca";
			newLoca.style.marginTop = "2rem";

			$(()=> {
				
				// name 값 바꿔주기
				$(newLoca).find('select.g1').attr('name','location_g1_'+idxLoca);
				$(newLoca).find('select.g2').attr('name','location_g2_'+idxLoca);
				$(newLoca).find('select.g3').attr('name','location_g3_'+idxLoca);
				
				//삭제버튼 활성화
				$(newLoca).on('mouseover', function() {
					$(this).find('.del').css('display','block');
				});
				$(newLoca).on('mouseout', function() {
					$(this).find('.del').css('display','none');
				});
				
				
				
				//삭제
				$(newLoca).find('.del').on('click', function() {
					let removeIdx = arrLoca.indexOf(newLoca);
					arrLoca.splice(removeIdx, 1);
					$(this).parent().remove();
					console.log(removeIdx+'번 인덱스 삭제 완료');

					for(let i of arrLoca) {
						let newIdx = arrLoca.indexOf(i)+1;
						i.id = "my_loca"+newIdx;
						$(i).find('.g1').attr('name','location_g1_'+newIdx);
						$(i).find('.g2').attr('name','location_g2_'+newIdx);
						$(i).find('.g3').attr('name','location_g3_'+newIdx);
					}
				})

			sec_loca.insertBefore(newLoca, btn_c);
			arrLoca.push(newLoca);
			
			});
		})

		
		
		
		
		
		//악기 추가하기
		let inst_form = document.getElementById('new_inst');
		let btn_inst = document.getElementById('btn_plus_inst');
		let btn_c_inst = btn_inst.parentElement;
		let sec_inst = document.getElementById('sec_inst');


		btn_inst.addEventListener("click", function() {
			idxInst = arrInst.length;
			idxInst++;
			let newInst = document.createElement('div');
			let textInst = inst_form.innerHTML;
			newInst.innerHTML = textInst;
			newInst.id = "my_inst"+idxInst;
			newInst.className = "my_inst new";
			newInst.style.marginBottom = "2rem";


			$(()=> {

				//name 값 바꿔주기
				$(newInst).find('.instrument_g1').attr('name','instrument_g1_'+idxInst);
				$(newInst).find('.select.instrument').attr('name','instrument'+idxInst);
				$(newInst).find('.radio.level input').attr('name','level'+idxInst);
				$(newInst).find('.radio.time input').attr('name','time'+idxInst);
				
				
				//삭제버튼 활성화
				$(newInst).on('mouseover', function() {
					$(this).find('.del').css('display','block');
				});
				$(newInst).on('mouseout', function() {
					$(this).find('.del').css('display','none');
				});				


				//삭제
				$(newInst).find('.del').on('click', function() {
					let removeIdx = arrInst.indexOf(newInst);
					arrInst.splice(removeIdx, 1);
					$(this).parent().remove();
					console.log(removeIdx+'번 인덱스 삭제 완료');

					for(let i of arrInst) {
						let newIdx = arrInst.indexOf(i)+1;
						console.log(newIdx);
						i.id = "my_inst"+newIdx;
						console.log(i.id);
						$(i).find('.instrument_g1').attr('name','instrument_g1_'+newIdx);
						$(i).find('.select.instrument').attr('name','instrument'+newIdx);
						$(i).find('.radio.level input').attr('name','level'+newIdx);
						$(i).find('.radio.time input').attr('name','time'+newIdx);
					}
				})
			});
			
			sec_inst.insertBefore(newInst, btn_c_inst);
			arrInst.push(newInst);

		})




		
		
	/* 

		$(()=> {

			
			//필수항목 미입력시 진행 불가
			$('#btn_join_toNext').on('click', function() {

				for(let inst of arrInst) {

					//악기선택
					let select = $(inst).find('#instrument');
					console.log("value = "+$(select).val());
					if($(select).val() == '') {
						select.focus();
						alert('악기를 선택해주세요');
				 		return false;
					}

					//실력 선택
					let level_v = [];
					$(inst).find('input:checkbox[name="checkbox_name"]').each(function() {
						if(this.checked){//checked 처리된 항목의 값
							level_v.push(this.value);
						}
					});
					if(level_v.length == 0) {
						
					}

					//기간 선택


				}



				for(let loca of arrLoca) {
					
					//지역 그룹1 선택
					let select = $(loca).find('#location_g1');
					console.log("value = "+$(select).val());
					if($(select).val() == '') {
						select.focus();
						alert('지역을 선택해주세요');
				 		return false;
					}
				}


				//검색허용 선택 


				
				
				$(location).attr('href', '05_join_4.jsp');
				return true;
			});
			
			
			
		});
		

	 */

	</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp" />


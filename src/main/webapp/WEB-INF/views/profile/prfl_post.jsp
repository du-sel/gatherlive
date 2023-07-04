<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/common/header.jsp" />


<script>

	const backToList = function(pageNo) {
		
		
		
		let frm = document.createElement('form');

		frm.innerHTML = '<c:forEach items="${FILTER }" var="flt">'
							+'<input type="hidden" name="${flt.key }" value="${flt.value }">'
							+'</c:forEach>';
		frm.action = '../prfl/list.do';
		
		let hidden = document.createElement('div');
		hidden.innerHTML = '<input type="hidden" name="pageNo" value="'+pageNo+'">';
		
		frm.appendChild(hidden);
		document.body.appendChild(frm);
		
		frm.submit();
		
		
	}


</script>



	<main id="prfl_post">
		
		<div class="inner">

			
			<div id="pagetop">
				<a id="backToList" onclick="backToList(${PNO })">《 목록으로 돌아가기</a>
<%-- 				<a id="backToList" href="../prfl/list.do?pageNo=${PNO }">《 목록으로 돌아가기</a> --%>
				
				
				<form class="search_c" action="">
					<input type="text" class="search" name="" value="" placeholder="프로필 내 검색">
					<button id="btn_search">
						<img src="/gatherlive/resources/img/ico_srch_pink.svg" alt="프로필 검색">
					</button>
				</form>
			</div>



			<div id="prfl_c">
				<div id="prfl">
					
					<section id="titlebox">
						<div class="img_c">
							<img alt="프로필 사진">
						</div>
	
						<h2>${PROFILE.MEMBER.user_name }</h2>
					</section>
				
					<section id="info">
						<ul>
		
							<li><h4>나이</h4> <p>${PROFILE.AGE }</p></li>
							<li><h4>성별</h4> <p>${PROFILE.MEMBER.gender }</p></li>
							<li><h4>연락처</h4> <p>${PROFILE.MEMBER.cell }</p></li>
							<li id="my_loca">
								<h4>지역</h4> 
								<div>
									<c:forEach items="${PROFILE.LOCALIST }" var="loca" varStatus="status">
										<p>${loca.g1 }
										${loca.g2 }
										<c:if test='${!(loca.g2 == "전체" || loca.g3 == "null")}'>
											${loca.g3 }
										</c:if></p>
									</c:forEach>
								</div>
							</li>
						</ul>
					</section>
					
					<div class="border_c">
						<div class="border"></div>
					</div>
					
					<section id="sec_inst">
								
						<c:forEach items="${PROFILE.INSTLIST }" var="inst" varStatus="status">
							<div class="inst">
								<h5>악기 ${status.count }</h5>
								<ul>
									<li><h3>${inst.inst_name }</h3></li>
									<li><span>실력</span>${inst.inst_level }</li>
									<li><span>기간</span>${inst.inst_month }</li>
								</ul>
							</div>
						</c:forEach>
					
					</section>
				
				
					<div class="border_c">
						<div class="border"></div>
					</div>
	
	

					<section id="pref">
						<ul>
							
							<li id="my_pref_genre" class="sec_edit">
								<h4>좋아하는 음악 장르</h4>
								<p>${PROFILE.MEMBER.pref_genre }</p>	
							</li>

							<li id="my_pref_musician" class="sec_edit">
								<h4>좋아하는 뮤지션</h4>
								<p>${PROFILE.MEMBER.pref_musician }</p>
							</li>

							<li id="my_pref_music" class="sec_edit">
								<h4>좋아하는 곡</h4>
								<p>${PROFILE.MEMBER.pref_music }</p>
							</li>

							<li id="my_pref_day" class="sec_edit">
								<h4>합주 시 선호하는 요일</h4>
								<p>${PROFILE.MEMBER.pref_day }</p>
							</li>

							<li id="my_pref_time" class="sec_edit">
								<h4>합주 시 선호하는 시간대</h4>
								<p>${PROFILE.MEMBER.pref_time }</p>
							</li>

							<li id="my_hope" class="sec_edit">
								<h4>합주 멤버들에게 바라는 점</h4>
								<p>${PROFILE.MEMBER.hope }</p>
							</li>

							<li id="my_introduce" class="sec_edit">
								<h4>소개글</h4>
								<p>${PROFILE.MEMBER.introduce }</p>
							</li>
						</ul>
					</section>
				
	
	
	
			
					<div class="border_c">
						<div class="border"></div>
					</div>
	
			
					<div class="btn_c">
						<button type="button" id="btn_toTalk">톡으로 대화하기</button>
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









	<script>
	
		$(()=> {
			
			// gnav current 클래스 지정
			$('#gnav .nav_prfl').addClass('current');
		
	
		});

	
	</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />


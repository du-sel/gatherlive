<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.seoul.gatherlive.biz.profile.*"%>
<%@page import="java.util.HashMap"%>
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
		
		//let num = Number(number.substr(14));
		let num = 1;
		let secondInst = document.querySelectorAll('.select.instrument');
		console.log(secondInst);
		
		
		secondInst[num-1].options.length = 0;
		secondInst[num-1].add(new Option("-- 선택 안 함 --", ""));
		
		for(let i = 0; i<dataInst.length; i++) {
			let g1InData = dataInst[i].g1;
			let nameInData = dataInst[i].name;
			
			if(g1 == g1InData) {
				secondInst[num-1].add(new Option("전체", "전체"));
				for(let j = 0; j<nameInData.length; j++) {
					let name = nameInData[j];
					secondInst[num-1].add(new Option(name, name));
				}
			}
		}	
	}
	
	

	
	
	
	// 지역 중분류
	const getSecondLoca = function(g1, number) {
		
		//let num = Number(number.substr(12));
		let num = 1;
		
		let secondLoca = document.querySelectorAll('.sel.location .g2');
		
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
		
		console.log('실행');
		
		$(()=> {
			//let num = Number(number.substr(12));
			let num = 1;
			
			let secId = "#loca"+num;
			let g1Save = $(secId).find('#location_g1 option:selected').val();
			
			
			let ThirdLoca = document.querySelectorAll('.sel.location .g3');
			
			
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
		

	
	
	// 프로필 좋아요
	const likePrfl = function(id, event) {
		
		event.preventDefault();
		let ico = event.target;
		
		$(()=> {
			
			if(ico.classList.contains('off')) {
				$(ico).removeClass('off').addClass('on');
				$(ico).find('.ico_off').css('display', 'none');
				$(ico).find('.ico_on').css('display', 'block');
				//location.href='../prfl/like.do?id='+id+'&act=on';
				
			} else {
				$(ico).removeClass('on').addClass('off');
				$(ico).find('.ico_on').css('display', 'none');
				$(ico).find('.ico_off').css('display', 'block');
				//location.href='../prfl/like.do?id='+id+'&act=off';				
			}
			
			
			
		});
		
	}	
	
	
	
	// 필터값 있는 경우 onload 로 값 넣어줌 
	window.addEventListener('load', function() {
		
				//getSecondLoca('${FILTER.LOCA_G1}', 'location_g1_1');
				//getThirdLoca('${FILTER.LOCA_G2}', 'location_g2_1');
		
		 $(()=> {
			
			if('${FILTER.loca_g1}'.length > 0) {				
						
				//$('#loca1').find('.g1').find("option[value='${FILTER.LOCA_G1}']").attr('selected', 'selected');
				//$('#loca1').find('.g2').find("option[value='${FILTER.LOCA_G2}']").attr('selected', 'selected');
				
				$('#loca1').find('.g1').val('${FILTER.loca_g1}').trigger('change');
				$('#loca1').find('.g2').val('${FILTER.loca_g2}').trigger('change');
				
				setTimeout(function() {
					$('#loca1').find('.g3').val('${FILTER.loca_g3}').trigger('change');
				}, 500);
				
			}
			
			if('${FILTER.inst_g1}'.length > 0) {				
				$('#inst1').find('.instrument_g1').val('${FILTER.inst_g1}').trigger('change');
				
				//getSecondInst('${FILTER.INST_G1}', 'instrument_g1_1');
				$('#inst1').find('.instrument').val('${FILTER.instrument}').trigger('change');
				
			}
		}); 
	});
	
	
	
	
	// 페이징
	const getPage = function(pageNo, e) {
		
		e.preventDefault();
		
		let pNo = document.createElement('div');
		pNo.innerHTML = '<input type="hidden" name="pageNo" value="'+pageNo+'">';
		
		let frm = document.getElementById('form');
		frm.appendChild(pNo);
		
		frm.submit();
		
	}
	
	
	// 프로필 상세조회
	const getPost = function(pageNo, id) {
		
		let postFrm = document.createElement('form');
		let listFrm = document.getElementById('form');
		postFrm.innerHTML = '<c:forEach items="${FILTER }" var="flt">'
			+'<input type="hidden" name="${flt.key }" value="${flt.value }">'
			+'</c:forEach>';
		postFrm.action = '../prfl/post.do';
		
		let hidden = document.createElement('div');
		hidden.innerHTML = '<input type="hidden" name="pageNo" value="'+pageNo+'">'
							+'<input type="hidden" name="id" value="'+id+'">';
		
		postFrm.appendChild(hidden);
		document.body.appendChild(postFrm);
		
		postFrm.submit();
		
	}
	

	
	
	
</script>



	<main id="prfl_list">
		
		<div class="inner">

			
			<form class="search_c" action="">
				<input type="text" class="search" name="" value="" placeholder="프로필 내 검색">
				<button id="btn_search">
					<img src="/gatherlive/resources/img/ico_srch_pink.svg" alt="프로필 검색">
				</button>
			</form>


			<header id="header">
				<div class="desc">
					<h1>프로필로 찾기</h1>
					<h2>프로필로 찾아보세요.</h2>
				</div>
					
				<div class="img_c">
					
				</div>
			</header>

			<div id="flt_c">
				<div id="flt">
					<div id="flt_sum">
						<h4>필터링 추가하기</h4>
						<h5>(지역, 악기, 실력)</h5>
					</div>
					<form id="form" name="flt" action="../prfl/list.do">
						<input type="hidden" name="filterChk" value="true">

						<p class="crit bold">지역</p>
						<div class="input sel location" id="loca1">
							<select name="loca_g1" id="location_g1" class='g1' onchange="getSecondLoca(this.options[selectedIndex].value, this.name)">
								<option value="">-- 선택 안 함 --</option>
								<% ArrayList<String> finalLoca = (ArrayList)application.getAttribute("FINALLOCA");
								for(String key : finalLoca) { %>
								<option value="<%=key %>"><%=key %></option>
								<% } %>
							</select>
							<select name="loca_g2" id="location_g2" class='g2' onchange="getThirdLoca(this.options[selectedIndex].value, this.name)">
								<option value="">-- 선택 안 함 --</option>
							</select>
							<select name="loca_g3" id="location_g3" class='g3'>
								<option value="">-- 선택 안 함 --</option>
							</select>
						</div>
						

						<p class="crit bold">악기</p>
						<div class="input" id="inst1">
							<select name="inst_g1" id="instrument_g1" class="instrument_g1" onload="getFirstInst(this.name)" onchange="getSecondInst(this.options[selectedIndex].value, this.name)">
								<option value="">-- 선택 안 함 --</option>
								<% ArrayList<String> finalInst = (ArrayList)application.getAttribute("FINALINST");
								for(String key : finalInst) { 
									if(key.equals("그 외")) continue;%>
								<option value="<%=key %>"><%=key %></option>
								<% } %>
								<option value="그 외">그 외</option>
							</select>
							
							<select name="instrument" id="instrument" class="select instrument">
								<option value="">-- 선택 안 함 --</option>
							</select>
						</div>


						<p class="crit bold">실력</p>
						<div class="input">
							<label>하
								<input type="checkbox" name="level" value="low">
							</label>
							<label>중
								<input type="checkbox" name="level" value="middle">
							</label>
							<label>상
								<input type="checkbox" name="level" value="high">
							</label>
						</div>
						
						
						
						<div id="btn_frm_c">
							<button type="submit">적용</button>
							<button type="reset">취소</button>
						</div>

					</form>
				</div>
			</div>



			<div id="listtop">
				<h5>${ACCOUNT.user_name } 님을 기다리는 뮤지션 ${PRFLPAGING.total }명</h5>
			</div>




			<ol id="list">
			
				<c:forEach var="prfl" items="${PRFLPAGING.content }" varStatus="status">
					<li class="post">
						<a onclick="getPost(${PRFLPAGING.currentPage }, ${prfl.MEMBER.member_id})">
							<div class="img_c">
								<img alt="사진">
							</div>
							
							<div class="user_name">
								<h3>${prfl.MEMBER.user_name }</h3>
								<div class="ico_like off" onclick="likePrfl(${prfl.MEMBER.member_id}, event); return false;">
									<img src="../resources/img/ico_like_blank.svg" alt="관심프로필" class="ico_off">
									<img src="../resources/img/ico_like_full.svg" alt="관심프로필" class="ico_on">
								</div>
							</div>
							<div class="genderAndAge">
								<div class="gender">
									<h5>${prfl.MEMBER.gender }</h5>
								</div>
								<div class="age">
									<h5>${prfl.AGE }</h5>
								</div>
							</div>
							
							<!-- 악기목록 -->
							<div class="inst_c">
								<c:forEach var="inst" items="${prfl.INSTLIST }">
									<div class="inst">
										<h4 class="inst_name">${inst.inst_name }</h4>
										<p>${inst.inst_level }</p>
										<p class="slash">/</p>
										<p> ${inst.inst_month }</p>
									</div>
								</c:forEach>
							</div>
							
							<!-- 지역목록 -->
							<div class="loca_c">
								<c:forEach var="loca" items="${prfl.LOCALIST }" end="1">
									<div class="loca">
										<span>${loca.g1 }</span>
										<span>${loca.g2 }</span>
										<span>${loca.g3 }</span>
									</div>
								</c:forEach>
								<c:if test="${fn:length(prfl.LOCALIST) > 2 }">
									<div class="loca">외</div>
								</c:if>
							</div>
							
						</a>
					</li>
				</c:forEach>
				
				<!-- flex 자리 남을 시 빈칸 추가 -->
				<c:if test="${fn:length(PRFLPAGING.content)%3 != 0 }">
					<li class="post" id="blankBox"></li>
					<li class="post" id="blankBox"></li>
				</c:if>

			</ol>


			<ul id="paging">
				<li>
					<a onclick="getPage(1, event)" class="ico_paging">
						<img src="../resources/img/ico_toStartPage.svg" alt="첫 페이지로 이동">
					</a>
				</li>
				<c:if test="${PRFLPAGING.startPage > 5 }">
					<li>
						<a onclick="getPage(${PRFLPAGING.startPage-5 }, event)" class="ico_paging">
							<img src="../resources/img/ico_toPrevPage.svg" alt="이전 페이지로 이동">
						</a>
					</li>
				</c:if>
				
				<c:forEach var="pNo" begin="${PRFLPAGING.startPage }" end="${PRFLPAGING.endPage }">
					<li>
						<a onclick="getPage(${pNo }, event)" id="page${pNo }">${pNo }</a>
					</li>
				</c:forEach>
			
				<c:if test="${PRFLPAGING.endPage < PRFLPAGING.totalPages }">
					<li>
						<a onclick="getPage(${PRFLPAGING.startPage+5 }, event)" class="ico_paging">
							<img src="../resources/img/ico_toNextPage.svg" alt="다음 페이지로 이동">
						</a>
					</li>
				</c:if>
				<li>
					<a onclick="getPage(${PRFLPAGING.totalPages }, event)" class="ico_paging">
						<img src="../resources/img/ico_toEndPage.svg" alt="마지막 페이지로 이동">
					</a>
<%-- 				<a href="../prfl/list.do?pageNo=${PRFLPAGING.totalPages }&filterChk=${FILTER }" class="ico_paging">
						<img src="../resources/img/ico_toEndPage.svg" alt="마지막 페이지로 이동">
					</a> --%>
				</li>
			</ul>
			
		</div>

		<a id="talk">
			<img src="/gatherlive/resources/img/img_ico_talk.png">
		</a>

		<a id="btn_toTop" href="#">
			<img src="/gatherlive/resources/img/ico_btn_toTop.svg">
		</a>
			
	</main>














	<script src="/gatherlive/resources/js/gnav.js"></script>
	<script src="/gatherlive/resources/js/list-hover.js"></script>


	<script>

	
		//이미지 로딩 
		let img_rcrt = new Image();
		img_rcrt.src = "/gatherlive/resources/img/img_main_prfl.svg";
		img_rcrt.style.width = "100%";
	
		let img_c = document.querySelector("#header .img_c");
	
		img_c.appendChild(img_rcrt);
	
		
	
	
	

		$(()=> {

				
			// gnav current 클래스 지정
			$('#gnav .nav_prfl').addClass('current');
		
		
			//필터링 슬라이드
			$('#flt #form').hide();

			$('#flt_sum').on('click', function(e) {
				$('#flt #form').slideToggle('fast');
			});

			
			// 페이징 current 부여
			let pageID = '#page'+'${PRFLPAGING.currentPage}';
			$(pageID).addClass('current');

		});



	</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />


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
		
		let num = Number(number.substr(8));

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
		

	


	
	
</script>



    <main id="rcrt_write">
		
		<div class="inner">

			
			<div id="pagetop">
				<a id="backToList" href="01_rcrt_list.html">《 목록으로 돌아가기</a>
                <h2>새 모집글 작성하기</h2>
			</div>


			<form name="frm_rcrt" action="../rcrt/write.do" method="post">
				<div id="posttop">
						<div id="duration_c">
	                        <select name="duration">
	                            <option value="short">단기</option>
	                            <option value="long">장기</option>
	                        </select>
	                    </div>
						<div id="title_c">
	                        <input type="text" name="title" placeholder="제목을 입력하세요">
	                    </div>
				</div>
	
			

				<div id="postbox">
					<section id="posttext">
						<section class="sec">
	                        <p class="list">합주 기간</p>
	                        <p class="desc">ex- 5월 한달동안 / 6개월 / 1년 / 흘러가는대로 ...</p>
	                        <input type="text" name="specDuration">
	                    </section>
	
						<section class="sec">
	                        <p class="list">이미 모집된 악기</p>
	                        <input type="text" name="already">
	                    </section>
	
						<section class="sec">
							<div id="inst1" class="inst">
		                        <div class="inst_name">
									<p class="must">어떤 악기를 모집하고 있나요?</p>
									<select name="inst_g1_1" class="instrument_g1" onload="getFirstInst(this.name)" onchange="getSecondInst(this.options[selectedIndex].value, this.name)">
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
		
		
								<div class="level">
									<p>실력 <span class="desc">(중복 선택 가능)</span></p>
									<div class="checkbox">
										<label>
											하
											<input type="checkbox" name="level1" class="level" value="하">
										</label>
										<label>
											중
											<input type="checkbox" name="level1" class="level" value="중">
										</label>
										<label>
											상
											<input type="checkbox" name="level1" class="level" value="상">
										</label>
									</div>
								</div>
								
								
								<div class="del">
									<img src="/gatherlive/resources/img/ico_del.svg" alt="악기 삭제">
								</div>
								
							</div>
	                    
		                    <div class="sec plus_c">
								<button type="button" id="btn_plus_inst" class="plus">
									<p class="EB">+ 악기 추가하기</p>
								</button>
							</div>
	                    </section>
	                    
	                    
						<section class="sec">
	                        <p class="list must">그 외의 악기도 지원 가능한가요?</p>
	                        <div class="radio">
		                        <label>
									가능
									<input type="radio" name="otherinst" value="가능">
								</label>                 		
		                        <label>
									불가능
									<input type="radio" name="otherinst" value="불가능">
								</label>     
							</div>            		
	                    </section>
	
						<section class="sec">
	                        <p class="list must">지역</p>
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
	                    </section>
	
						<section class="sec">
	                        <p class="list">요일/시간대/날짜</p>
	                        <p class="desc">ex- 매일 저녁 6시마다 / 주말 오후마다 / 월수금 8시마다</p>
	                        <input type="text" name="pref_datetime">
	                    </section>
	
	                    <section class="sec">
	                        <p class="list">기타 사항</p>
	                        <p class="desc">기타 안내 사항이나 원하는 점을 자유롭게 입력해주세요</p>
	                        <p class="desc">ex- 원하는 곡 / 장르 / 나이 / 성별 / 그 외</p>
	                        <textarea name="free" rows="12"></textarea>
	                    </section>
					</section>
	
					
					
					<div class="btn_c">
						<button type="button" id="btn_write">작성 완료하기</button>
					</div>
					
				</div>
			</form>







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
			$('#gnav .nav_rcrt').addClass('current');
		
	
		});

		
		
		//악기, 지역 관리용 배열
		let arrInst = [];
		let arrLoca = [];

		let idxInst = 1;
		let idxLoca = 1;

		let form = document.querySelector("form");


		//악기 추가하기
		let inst1 = document.getElementById('inst1');
		let btn_inst = document.getElementById('btn_plus_inst');
		let btn_c = btn_inst.parentElement;
		let div_inst = btn_inst.parentElement.parentElement;
		arrInst.push(inst1);

		btn_inst.addEventListener("click", function() {
			idxInst = arrInst.length;
			idxInst++;
			let newInst = document.createElement('div');
			let textInst = inst1.innerHTML;
			newInst.innerHTML = textInst;
			newInst.id = "inst"+idxInst;
			newInst.className = "inst";
			newInst.style.marginTop = "2rem";


			$(()=> {

				//name 값 바꿔주기
				$(newInst).find('.instrument_g1').attr('name','inst_g1_'+idxInst);
				$(newInst).find('select.instrument').attr('name','instrument'+idxInst);
				$(newInst).find('input.level').attr('name','level'+idxInst);
				
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

					for(let i of arrInst) {
						let newIdx = arrInst.indexOf(i)+1;
						i.id = "inst"+newIdx;
						$(i).find('.instrument_g1').attr('name','inst_g1_'+newIdx);
						$(i).find('select.instrument').attr('name','instrument'+newIdx);
						$(i).find('input.level').attr('name','level'+newIdx);
					}
				})
			});
			
			div_inst.insertBefore(newInst, btn_c);
			arrInst.push(newInst);

		})
		
		
		
		let btn_write = document.getElementById("btn_write");
		
		btn_write.addEventListener('click', function() {
			
			let hidden = document.createElement('div');
			let text = "<input type='hidden' name='idxInst' value='"+arrInst.length+"'>"
			hidden.innerHTML = text;
			
			form.appendChild(hidden);
			form.submit();
				
			
		});
		
		
		
		
		
	
	</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="DTO.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/common/header.jsp" />





<script>

	// 진행바
	
	$(()=> {
		$('#bar_fill').css('width', '33%');
	});

	const barFill = function() {
		$(()=> {
			$('#bar_fill').animate( {
				width: '63%'
			}, 500, 'swing' );
		});
	}
	
	
	
	
	let dataInst = <%=(JSONArray)application.getAttribute("JSONINST") %>
	let dataLoca = <%=(JSONArray)application.getAttribute("JSONLOCA") %>


	
	
	
	// 악기 대분류 
	const getFirstInst = function(number) {
		
		
		let num = Number(number.substr(14));
		let firstInst = document.querySelectorAll('.select.instrument_g1');
		
		firstInst[num-1].options.length = 0;
		firstInst[num-1].add(new Option("-- 선택 안 함 --", ""));
		
		for(let i = 0; i<dataInst.length; i++) {
			let g1InData = dataInst[i].g1;
			
			firstInst[num-1].add(new Option(g1InData, g1InData));

		}	
		
	}
	
	
	
	
	
	
	// 악기 소분류
	const getSecondInst = function(g1, number) {
		
		let num = Number(number.substr(14));
		let secondInst = document.querySelectorAll('.select.instrument');
		
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
		
		$(()=> {
			let num = Number(number.substr(12));
			
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
	
	
	
	
	// 이미지 형식, 크기 제한
	let regex = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 1048576; //1MB
	
	function fileCheck(fileName, fileSize){

		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
			  
		if(!regex.test(fileName)){
			alert("jpg 또는 png 파일만 업로드 가능합니다.");
			return false;
		}
		
		return true;		
		
	}


</script>



	<main id="join_3" class="join" onload="barFill()">
		
		<div class="inner">
		
		
		
			<div class="img_c"></div>

			
			<h1>프로필 만들기</h1>
			<p class="subTitle">환영합니다! 이제 연주자 프로필을 생성하고 합주를 즐겨보세요!</p>

			<div class="bar_join">
				<div id="bar"></div>
				<div id="bar_fill"></div>
				<div id="step-1" class="step pass"><span>이메일 인증</span></div>
				<div id="step-2" class="step pass"><span>기본 정보 입력</span></div>
				<div id="step-3" class="step current"><span>프로필 만들기</span></div>
				<div id="step-4" class="step"><span>회원가입 완료</span></div>
			</div>
		
		
			<form name="join3" id="join3" action="../join/insert.do" method="post">
				<!-- <input type="hidden" name="cmd" value="join4"> -->

				<section id="inst1" class="inst">

					<h2>악기</h2>

					<div class="input">
						<p class="must">어떤 악기를 연주하시나요?</p>
						<select name="instrument_g1_1" id="instrument_g1" class="instrument_g1" onload="getFirstInst(this.name)" onchange="getSecondInst(this.options[selectedIndex].value, this.name)">
							<option value="">-- 선택 안 함 --</option>
							<% ArrayList<String> finalInst = (ArrayList)application.getAttribute("FINALINST");
							for(String key : finalInst) { 
								if(key.equals("그 외")) continue;%>
							<option value="<%=key %>"><%=key %></option>
							<% } %>
							<option value="그 외">그 외</option>
						</select>
						
						<select name="instrument1" id="instrument" class="select instrument">
							<option value="">-- 선택 안 함 --</option>
						</select>
					</div>
					
					
					<div class="input">
						<p class="must">실력은 어느 정도인가요?</p>
						<p class="desc">기준에 정답은 없으며 본인이 생각하는대로 선택해주시면 됩니다</p>
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
						<p class="must">이 악기를 연주한 기간은 어느 정도인가요?</p>
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

					<div class="del">
						<img src="/gatherlive/resources/img/ico_del.svg" alt="악기 삭제">
					</div>

				</section>
				
				<div class="plus_c">
					<button type="button" id="btn_plus_inst" class="plus">
						<p class="EB">+ 악기 추가하기</p>
					</button>
				</div>
				


				<section id="loca1" class="loca">

					<div class="input">
						<h2>지역</h2>

						<p class="must">합주에 참여 가능한 지역은 어디인가요?</p>
						<div class="sel location">
							<select name="location_g1_1" id="location_g1" class='g1' onchange="getSecondLoca(this.options[selectedIndex].value, this.name)">
								<option value="">-- 선택 안 함 --</option>
								<% ArrayList<String> finalLoca = (ArrayList)application.getAttribute("FINALLOCA");
								for(String key : finalLoca) { %>
								<option value="<%=key %>"><%=key %></option>
								<% } %>
							</select>
							<select name="location_g2_1" id="location_g2" class='g2' onchange="getThirdLoca(this.options[selectedIndex].value, this.name)">
								<option value="">-- 선택 안 함 --</option>
							</select>
							<select name="location_g3_1" class='g3'>
								<option value="">-- 선택 안 함 --</option>
							</select>
						</div>
						
					</div>

					<div class="del">
						<img src="/gatherlive/resources/img/ico_del.svg" alt="지역 삭제">
					</div>
				</section>

				<div class="plus_c">
					<button type="button" id="btn_plus_loca" class="plus">
						<p class="EB">+ 지역 추가하기</p>
					</button>
				</div>


				
				<section id="spec">

					<div class="input">
						<p>프로필 사진</p>
						<input type="file" accept="image/*" name="prflPic" style="width: 20rem;">
					</div>
					
					
			
					<div class="input open">
						<p class="must">프로필 검색허용</p>
						<p class="desc"><span>- 허용</span>: 다른 사용자들이 "프로필로 찾기" 목록에서 나의 프로필을 검색 및 조회할 수 있습니다</p>
						<p class="desc"><span>- 비허용</span>: "프로필로 찾기" 목록에서 나의 프로필이 검색되지 않습니다.<br>
						단, 모집글을 직접 작성하거나 게더톡 채팅에 참여하는 경우 상대방이 나의 정보를 확인할 수 있습니다</p>
						<div class="radio open">
							<label>
								<input type="radio" name="open" value="1">
								검색 허용
							</label>
							<label>
								<input type="radio" name="open" value="0">
								검색 비허용
							</label>
						</div>
					</div>


					<div id="slideup">
					
						<p id="slideup_p">내 프로필을 조회하는 사람들을 위해 자세한 소개를 추가해보세요! (선택)</p>


						<div class="input">
							<p>좋아하는 음악 장르</p>
							<p class="desc">ex - 락 /  인디 / 팝 / ...</p>
							<input type="text" name="pref_genre" size="50">
						</div>

						
						<div class="input">
							<p>좋아하는 뮤지션</p>
							<input type="text" name="pref_musician" size="50">
						</div>

						
						<div class="input">
							<p>좋아하는 곡</p>
							<input type="text" name="pref_music" size="50">
						</div>

						
						<div class="input">
							<p>합주 시 선호하는 요일</p>
							<input type="text" name="pref_day" size="50">
						</div>
						

						<div class="input">
							<p>합주 시 선호하는 시간대</p>
							<p class="desc">ex - 밤~새벽 /  19시 이후 / ...</p>
							<input type="text" name="pref_time" size="50">
						</div>

						

						<div class="input">
							<p>합주 멤버들에게 바라는 점</p>
							<p class="desc"></p>
							
							<textarea name="hope" style="width: 100%" rows="3" ></textarea>
						</div>
						
						
						<div class="input">
							<p>소개글</p>
							<p class="desc">회원님을 자유롭게 소개해보세요!</p>
							
							<textarea name="introduce" style="width: 100%" rows="7" ></textarea>
						</div>
					</div>
					
				</section>
					
					
				<div class="flexbox">
					<button id="btn_join_toNext" type="button">회원가입 완료</button>
				</div>

			</form>
			
		
		
		</div>


		<a id="btn_toTop" href="#">
			<img src="/gatherlive/resources/img/ico_btn_toTop.svg">
		</a>

	</main>

















	<script src="/gatherlive/resources/js/gnav.js"></script>

	<script>


		//이미지 로딩
		let img_join_3 = new Image();
		img_join_3.src = "/gatherlive/resources/img/img_join_3.svg";
		img_join_3.style.width = "100%";

		let img_c;

		
		img_c = document.querySelector("#main .img_c");
		img_c.appendChild(img_join_3);






		//악기, 지역 관리용 배열
		let arrInst = [];
		let arrLoca = [];

		let idxInst = 1;
		let idxLoca = 1;

		let form = document.querySelector("form");


		//악기 추가하기
		let inst1 = document.getElementById('inst1');
		let btn_inst = document.getElementById('btn_plus_inst');
		let div_inst = btn_inst.parentElement;
		arrInst.push(inst1);

		btn_inst.addEventListener("click", function() {
			idxInst = arrInst.length;
			idxInst++;
			let newInst = document.createElement('section');
			let textInst = inst1.innerHTML;
			newInst.innerHTML = textInst;
			newInst.id = "inst"+idxInst;
			newInst.className = "inst";
			newInst.style.marginTop = "2rem";


			$(()=> {


				
				//name 값 바꿔주기
				$(newInst).find('#instrument_g1').attr('name','instrument_g1_'+idxInst);
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
						i.id = "inst"+newIdx;
						console.log(i.id);
						$(i).find('#instrument_g1').attr('name','instrument_g1_'+newIdx);
						$(i).find('.select.instrument').attr('name','instrument'+newIdx);
						$(i).find('.radio.level input').attr('name','level'+newIdx);
						$(i).find('.radio.time input').attr('name','time'+newIdx);
					}
				})
			});
			
			form.insertBefore(newInst, div_inst);
			arrInst.push(newInst);

		})




		//지역 추가하기
		let loca1 = document.getElementById('loca1');
		let btn_loca = document.getElementById('btn_plus_loca');
		let div_loca = btn_loca.parentElement;
		arrLoca.push(loca1);

		btn_loca.addEventListener("click", function() {
			idxLoca = arrLoca.length;
			idxLoca++;
			let newLoca = document.createElement('section');
			let textLoca = loca1.innerHTML;
			newLoca.innerHTML = textLoca;
			newLoca.id = "loca"+idxLoca;
			newLoca.className = "loca";
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
						i.id = "loca"+newIdx;
						$(i).find('select.g1').attr('name','location_g1_'+newIdx);
						$(i).find('select.g2').attr('name','location_g2_'+newIdx);
						$(i).find('select.g3').attr('name','location_g3_'+newIdx);
					}
				})
			});

			form.insertBefore(newLoca, div_loca);
			arrLoca.push(newLoca);
		})



		



		$(()=> {
			
			
			
			// gnav current 클래스 지정
			$('#gnav .nav_join').addClass('current');


			//검색허용 슬라이드업다운
			$('#slideup').hide();

			let open = document.getElementsByName('open');
			$(open[0]).on('click', function() {
				$('#slideup').slideDown('400');
			});

			$(open[1]).on('click', function() {
				$('#slideup').slideUp('fast');
			});

			

		

			//진행바
			$('#bar_fill').css('width', '33%');

			$(window).on('load', function() {

				$('#bar_fill').animate( {
					width: '63%'
				}, 500, 'swing' );
			});
			
			
			
			
			// 프로필사진 업로드 onchange
			/* $("input[name='prflPic']").on("change", function() {
				let formData = new FormData();
				let fileList = this.files;
				let pic = fileList[0];
				
				// 파일 크기 및 형식 검사 
				if(!fileCheck(pic.name, pic.size)){
					return false;
				}
				
				//alert("통과");
				formData.append("prflPic", pic);
				
				$.ajax({
					url: '../admin/uploadAjaxAction.do',
			    	processData : false,
			    	contentType : false,
			    	data : formData,
			    	type : 'POST',
			    	dataType : 'json'
				});	 
			});*/
			
			
			
			
			
			
			//필수항목 미입력시 진행 불가
			$('#btn_join_toNext').on('click', function() {

				for(let inst of arrInst) {

					//악기선택
					let select = $(inst).find('#instrument');
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
					if($(select).val() == '') {
						select.focus();
						alert('지역을 선택해주세요');
				 		return false;
					}
					
					//지역 그룹2 선택
					let select2 = $(loca).find('#location_g2');
					if($(select2).val() == '') {
						select2.focus();
						alert('지역을 선택해주세요');
				 		return false;
					}
					
				}


				//검색허용 선택 
				
				

				//console.log("idxInst: "+idxInst);
				//let link = '/join/insert.do?idxInst='+idxInst+'&idxLoca='+idxLoca;
				//console.log("link: "+link);
				
				//$(location).attr('href', link);
				//return true;
				
				
				let hidden = document.createElement('div');
				let text = "<input type='hidden' name='idxInst' value='"+arrInst.length+"'><input type='hidden' name='idxLoca' value='"+arrLoca.length+"'>"
				hidden.innerHTML = text;
				
				form.appendChild(hidden);
				form.submit();
				
				
			});
			
			
			
		});
		


	</script>





<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/common/header.jsp" />


	<main id="rcrt_list">
		
		<div class="inner">

			
			<form class="search_c">
				<input type="text" class="search" name="" value="" placeholder="모집글 내 검색">
				<button id="btn_search">
					<img src="/gatherlive/resources/img/ico_srch_pink.svg" alt="프로필 검색">
				</button>
			</form>


			<header id="header">
				<div class="desc">
					<h1>모집글로 찾기</h1>
					<h2>모집글로 찾아보세요.</h2>
				</div>
					
				<div class="img_c"></div>
			</header>

			<div id="flt_c">
				<div id="flt">
					<div id="flt_sum">
						<h4>필터링 추가하기</h4>
						<h5>(기간, 악기, 지역)</h5>
					</div>

					<form id="form">
						
						<p class="crit EB">기간</p>
						<div class="input">
							<label>단기
								<input type="checkbox" name="duration" value="short">
							</label>
							<label>장기
								<input type="checkbox" name="duration" value="long">
							</label>
						</div>
					
					
						<p class="crit EB">악기</p>
						<div class="input">
							<select name="instrument">
								<option>보컬</option>
								<option>기타</option>
								<option>베이스</option>
								<option>피아노</option>
								<option>드럼</option>
							</select>
						</div>
					
					
						<p class="crit EB">지역</p>
						<div class="input">
							<select name="location_g1">
								<option>서울시</option>
								<option>경기도</option>
							</select>
							<select name="location_g2">
								<option>강남구</option>
								<option>강동구</option>
							</select>
						</div>

					</form>
				</div>
			</div>



			<div id="listtop">
				<h5>김회원 님을 기다리는 글 123개 (최신순)</h5>
				
				<a id="btn_newPost" href="01_rcrt_write.jsp"><p class="EB">새 모집글 작성하기</p></a>
			</div>




			<ol id="list">
				<li class="post"><a href="01_rcrt_post.jsp">RECRUIT POST</a></li>
				<li class="post"><a href="01_rcrt_post.jsp">RECRUIT POST</a></li>
				<li class="post"><a href="01_rcrt_post.jsp">RECRUIT POST</a></li>
				<li class="post"><a href="01_rcrt_post.jsp">RECRUIT POST</a></li>
				<li class="post"><a href="01_rcrt_post.jsp">RECRUIT POST</a></li>
				<li class="post"><a href="01_rcrt_post.jsp">RECRUIT POST</a></li>
				<li class="post"><a href="01_rcrt_post.jsp">RECRUIT POST</a></li>
				<li class="post"><a href="01_rcrt_post.jsp">RECRUIT POST</a></li>
				<li class="post"><a href="01_rcrt_post.jsp">RECRUIT POST</a></li>
				<li class="post"><a href="01_rcrt_post.jsp">RECRUIT POST</a></li>
				<li class="post"><a href="01_rcrt_post.jsp">RECRUIT POST</a></li>
				<li class="post"><a href="01_rcrt_post.jsp">RECRUIT POST</a></li>
			</ol>


			<ol id="paging">
				<a>《</a>
				<a>〈</a>
				<li><a>1</a></li>
				<li><a>2</a></li>
				<li><a>3</a></li>
				<li><a>4</a></li>
				<a>〉</a>
				<a>》</a>
			</ol>
			
		</div>
			

		<a id="talk">
			<img src="/gatherlive/resources/img/img_ico_talk.png">
		</a>

		<a id="btn_toTop" href="#">
			<img src="/gatherlive/resources/img/ico_btn_toTop.svg">
		</a>



	</main>












	<script src="/gatherlive/resources/js/list-hover.js"></script>


	<script>

		//이미지 로딩 
		let img_rcrt = new Image();
		img_rcrt.src = "/gatherlive/resources/img/img_main_rcrt.svg";
		img_rcrt.style.width = "100%";

		let img_c = document.querySelector("#header .img_c");

		img_c.appendChild(img_rcrt);

		
		
		
		$(()=> {
			
			// gnav current 클래스 지정
			$('#gnav .nav_rcrt').addClass('current');
		



			//필터링 슬라이드
			$('#flt #form').hide();

			$('#flt_sum').on('click', function(e) {
				$('#flt #form').slideToggle('fast');
			});


		});



	</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

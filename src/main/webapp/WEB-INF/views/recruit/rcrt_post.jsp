<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/common/header.jsp" />


	<main id="rcrt_post">
		
		<div class="inner">

			
			<div id="pagetop">
				<a id="backToList" href="01_rcrt_list.jsp">《 목록으로 돌아가기</a>
				
				
				<form class="search_c">
					<input type="text" class="search" name="" value="" placeholder="모집글 내 검색">
					<button id="btn_search">
						<img src="/gatherlive/resources/img/ico_srch_pink.svg" alt="프로필 검색">
					</button>
				</form>
			</div>


			<div id="posttop">
				<div id="title_c">
					<div id="ico_duration">단기</div>
					<h2>모집글 제목입니다</h2>
					<p>2023-04-14&nbsp;&nbsp;&nbsp;17:13:33</p>
				</div>
					
				<div class="btn_c">
					<button type="button" id="btn_edit">수정</button>
					<button type="button" id="btn_del">삭제</button>
				</div>
			</div>
	
			

			<div id="posttext">

				<ul>
					<li>지원우대 악기</li>
					<li>다른 악기 지원 가능 여부</li>
					<li>이미 모집된 악기</li>
					<li>기간</li>
					<li>요일/시간대/날짜</li>
					<li>지역</li>
				</ul>
				
				
				
				<p>
					자유 내용 줄글<br>
					기타 안내 사항 및 조건을 자유롭게 입력<br>
					곡 / 장르<br>
					나이<br>
					성별<br>
					그 외<br>
					...
				</p>
				
				
				<div class="btn_c">
					<button type="button" id="btn_toTalk">톡으로 문의하기</button>
				</div>
				
			</div>


			<div id="postauthor">

				<div class="text_c">
					<h4 class="title">작성자 정보</h4>
					
					<ul>
						<li>이름</li>
						<li>지역</li>
						<li>악기(실력)</li>
						<li>성별</li>
						<li>나이</li>
						<li>한마디</li>
					</ul>
				</div>
				
				<div class="img_c">
					<img alt="작성자 프로필 사진">
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
			$('#gnav .nav_rcrt').addClass('current');
		
	
		});

	
	</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/common/header.jsp" />



	<main id="my_like" class="my">
		
		<div class="inner">

			
			<div id="header">
				<h1 class="h1"><a href="../my/main.do">마이 페이지</a></h1>
				<h3>관심글</h3>
			</div>


			<div class="flex_c">

				<jsp:include page="/WEB-INF/views/common/my_lnav.jsp"></jsp:include>
	
	
				<section id="like_c">
					<section id="like_rcrt">
					
						<h2>관심 모집글</h2>
			
						<ul class="list">
							<li class="post"><a href="01_rcrt_post.jsp">LIKED POST</a></li>
							<li class="post"><a href="01_rcrt_post.jsp">LIKED POST</a></li>
							<li class="post"><a href="01_rcrt_post.jsp">LIKED POST</a></li>
							<li class="post"><a href="01_rcrt_post.jsp">LIKED POST</a></li>
							<li class="post"><a href="01_rcrt_post.jsp">LIKED POST</a></li>
							<li class="post"><a href="01_rcrt_post.jsp">LIKED POST</a></li>
						</ul>
						
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
		
					</section>
		
					<div id="border_c"></div>
		
					<section id="like_prfl">
		
						<h2>관심 프로필</h2>
			
						<ul class="list">
							<li class="post"><a href="#">LIKED POST</a></li>
							<li class="post"><a href="#">LIKED POST</a></li>
							<li class="post"><a href="#">LIKED POST</a></li>
							<li class="post"><a href="#">LIKED POST</a></li>
							<li class="post"><a href="#">LIKED POST</a></li>
							<li class="post"><a href="#">LIKED POST</a></li>
						</ul>
						
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
		
					</section>
				</section>
				
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
	<script src="/gatherlive/resources/js/list-hover.js"></script>
	
	<script>
	
		$(()=> {
			
			// gnav current 클래스 지정
			$('#gnav .nav_mypage').addClass('current');
			
			// lnav current 클래스 지정
			$('#lnav .my_like').addClass('current');
		
	
		});

	
	</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />

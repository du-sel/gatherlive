<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>


<jsp:include page="/WEB-INF/views/common/header.jsp" />




	<main id="error_default" class="error">
		
		<div class="inner">


			<h2>페이지를 찾을 수 없습니다</h2>

			<%-- <h5>${exception }</h5> --%>
			<h5>${exception.message }</h5>

		</div>


		<a id="talk">
			<img src="/gatherlive/resources/img/img_ico_talk.png">
		</a>

		<a id="btn_toTop" href="#">
			<img src="/gatherlive/resources/img/ico_btn_toTop.svg">
		</a>

	</main>









	<script src="/gatherlive/resources/js/gnav.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

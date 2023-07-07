<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="icon" href="/gatherlive/resources/img/ico_favi-32.png">
<title>게더라이브 - Gather Live</title>

<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">

<link rel="stylesheet" href="/gatherlive/resources/css/css_base2.css" media="all">
<link rel="stylesheet" href="/gatherlive/resources/css/css_layout2.css?after" media="all">

<script type="text/javascript" src="/gatherlive/resources/js/jquery-3.6.4.js"></script>

</head>
<body>

	<nav id="gnav">
		<div class="inner">

			<div id="gnav_flexbox">
				<h1 id="logo_gnav"><a href="/gatherlive/">
					<img id="logo_big" src="/gatherlive/resources/img/0000 Logo-yellow_56.svg" alt="Gather Live">
					<img id="logo_small" src="/gatherlive/resources/img/0000 Logo-small-48.svg" alt="Gather Live">
				</a></h1>
				
				
				<ul id="menu_left">
					<li><a href="/gatherlive/code/01_rcrt_list.jsp" data-hover="모집글로 찾기" class="nav_rcrt"><h4>모집글로 찾기</h4></a></li>
					<li><a href="/gatherlive/prfl/list.do" data-hover="프로필로 찾기" class="nav_prfl"><h4>프로필로 찾기</h4></a></li>
				</ul>
			</div>
				
			
			
			<c:if test="${ ACCOUNT == null }">
				<ul id="menu_right">
					<li><a href="/gatherlive/member/login.do" data-hover="로그인" class="nav_login"><h5>로그인</h5></a></li>
					<li><a href="/gatherlive/join/email.do" data-hover="회원가입" class="nav_join"><h5>회원가입</h5></a></li>
				</ul>
			</c:if>
			
			<c:if test="${ ACCOUNT != null }">
				<ul id="menu_right">
					<li><a href="/gatherlive/member/logout.do" data-hover="로그아웃" class="nav_logout"><h5>로그아웃</h5></a></li>
					<li><a href="/gatherlive/my/main.do" data-hover="마이페이지" class="nav_mypage"><h5>마이페이지</h5></a></li>
				</ul>
			</c:if>

			<div id="menu_ico">
				<img src="/gatherlive/resources/img/ico_menuM.svg" style="width: 100%;">
			</div>




			<!-- 아래는 모바일 화면용 -->
			<div id="menu_hide" class="off">
				<ul>
					<li><a href="/gatherlive/">HOME</a></li>
					<li><a href="/gatherlive/code/01_rcrt_list.jsp" class="nav_rcrt">모집글로 찾기</a></li>
					<li><a href="/gatherlive/prfl/list.do" class="nav_prfl">프로필로 찾기</a></li>
					<c:if test="${ ACCOUNT == null }">
						<li><a href="/gatherlive/member/login.do" class="nav_login">로그인</a></li>
						<li><a href="/gatherlive/join/email.do" class="nav_join">회원가입</a></li>
					</c:if>
					<c:if test="${ ACCOUNT != null }">
						<li><a href="/gatherlive/member/logout.do" class="nav_logout">로그아웃</a></li>
 						<li><a href="/gatherlive/my/main.do" class="nav_mypage">마이페이지</a></li>
					</c:if>
				</ul>
			</div>
		</div>	
	</nav>
	
	
	
	<c:if test="${param.error == 'needLogin' }">
		<script>
	
			if(confirm('로그인이 필요한 메뉴입니다')) {
				location.href='/gatherlive/code/04_login.jsp';	
			} else {			
				location.href='<%= request.getRequestURI() %>';	
			}

		</script> 
	</c:if>
	
	
	
	
	<script>
	
		
		$(()=> {
			$(menu_ico).on('click', function() {
				
				if($(menu_hide).hasClass('off')) {
					$(menu_hide).slideDown('fast');
					$(menu_hide).removeClass('off');
				} else {
					$(menu_hide).slideUp('fast');
					$(menu_hide).addClass('off');
				}
				
				//$(menu_hide).slideToggle("fast");
			});
		});
	
	
	</script>


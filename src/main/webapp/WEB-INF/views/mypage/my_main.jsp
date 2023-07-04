<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/common/header.jsp" />




	<main id="my_main" class="my">
		
		<div class="inner">


			<div id="header_c">
				<h1 id="header">마이 페이지</h1>
			</div>


			<div id="my_prfl_c">
				<div id="my_prfl">
					
					<div class="flexbox">
						<div class="img_c">
							<img alt="프로필 사진">
						</div>
		
						<h2>${MYPROFILE.MEMBER.user_name }</h2>
					</div>
					
					<div id="text">
		
						<ul id="info">
							<li><h4>나이</h4>
								<c:if test="${MYPROFILE.AGE == null }"><p>비공개</p></c:if>
								<c:if test="${MYPROFILE.AGE != null }"><p>${MYPROFILE.AGE }</p></c:if>
							</li>
							<li><h4>성별</h4> <p>${MYPROFILE.MEMBER.gender }</p></li>
							<li><h4>연락처</h4>
								<c:if test="${MYPROFILE.MEMBER.cell == null }"><p>비공개</p></c:if>
								<c:if test="${MYPROFILE.MEMBER.cell != null }"><p>${MYPROFILE.MEMBER.cell }</p></c:if>
							</li>
							<li id="my_open"><h4>프로필 검색</h4> 
								<c:if test="${MYPROFILE.MEMBER.open == 0 }"><p>비허용</p></c:if>
								<c:if test="${MYPROFILE.MEMBER.open == 1 }"><p>허용</p></c:if>
							</li>
							<li id="my_loca">
								<h4>지역</h4> 
								<div>
									<c:forEach items="${MYPROFILE.LOCALIST }" var="loca" varStatus="status">
										<p>${loca.g1 }
										${loca.g2 }
										<c:if test='${!(loca.g2 == "전체" || loca.g3 == "null")}'>
											${loca.g3 }
										</c:if></p>
									</c:forEach>
								</div>
							</li>
						</ul>
						
						
						<c:forEach items="${MYPROFILE.INSTLIST }" var="inst" varStatus="status">
							<div class="my_inst">
								<h5>악기 ${status.count }</h5>
								<ul>
									<li><h3>${inst.inst_name }</h3></li>
									<li><span>실력</span>${inst.inst_level }</li>
									<li><span>기간</span>${inst.inst_month }</li>
								</ul>
							</div>
						</c:forEach>
					
					</div>	
		
				</div>

			</div>



			<div id="border_c"></div>

			<ul id="menu_my">
				<li>
					<a href="/gatherlive/my/account.do">
						<div class="text_c">
							<h3 class="title">계정 관리</h3>
							<h5 class="desc">비밀번호 변경 / 회원 탈퇴</h5>
						</div>
					</a>
				</li>

				<li>
					<a href="/gatherlive/my/prfl.do">
						<div class="text_c">
							<h3 class="title">프로필 관리</h3>
							<h5 class="desc">프로필 정보 변경</h5>
						</div>
					</a>
				</li>

				<li>
					<a href="/gatherlive/code/03_my_like.jsp">
						<div class="text_c">
							<h3 class="title">관심글</h3>
							<h5 class="desc">관심글로 등록한 모집글 / 프로필</h5>
						</div>
					</a>
				</li>

				<li>
					<a href="/gatherlive/code/03_my_rcrt.jsp">
						<div class="text_c">
							<h3 class="title">내가 쓴 글 관리</h3>
							<h5 class="desc">내가 쓴 모집글</h5>
						</div>
					</a>
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
	
	<script>
	
		$(()=> {
			
			// gnav current 클래스 지정
			$('#gnav .nav_mypage').addClass('current');

			
	
		});

	
	</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />

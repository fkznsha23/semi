<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
	<%
		// 1. 세션에 저장된 로그인타입, 로그인아이디 조회하기
		String loginType = (String) session.getAttribute("loginType");
		String loginId = (String) session.getAttribute("loginId");
		String gymNo = (String) session.getAttribute("loginGymNo");
		
		// 2. 요청파라미터 조회하기
		String menu = request.getParameter("menu");
	%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

	<nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-3 " >
		<div class="container-fluid">
	    	<ul class="navbar-nav me-auto">
	        	<li class="nav-item me-3"><a class="nav-link " href="/semi/home.jsp" style="font-size: 20px;"><img src="/semi/resources/images/logo.png" width="80" height="30" alt="helf"/></a></li>
	        	
<%
	if(loginType != null){
%>	        	
				<li class="nav-item dropdown " style="margin-top: 3px;">
	          		<a class="nav-link dropdown-toggle <%="수업".equals(menu) ? "active" : "" %>" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            	수업
	          		</a>
	          		<ul class="dropdown-menu">
	            		<li><a class="dropdown-item" href="/semi/lesson/personalList.jsp">개인수업</a></li>
	            		<li><a class="dropdown-item" href="/semi/lesson/groupList.jsp">그룹수업</a></li>
	          		</ul>
	        	</li>
				<li class="nav-item dropdown" style="margin-top: 3px;">
	          		<a class="nav-link dropdown-toggle <%="이용권".equals(menu) ? "active" : "" %>" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            	이용권
	          		</a>
	          		<ul class="dropdown-menu">
	            		<li><a class="dropdown-item" href="/semi/membership/membershipList.jsp">이용권 조회</a></li>
	            		<!-- <li><a class="dropdown-item" href="/semi/membership/trainerList.jsp">강사 조회</a></li>  -->

<%
	if("manager".equals(loginType)){
%>
	            		<li><a class="dropdown-item" href="/semi/membership/membership-form.jsp">이용권 등록</a></li>
<%
	}
%>	            		
	          		</ul>
	        	</li>
	        	<li class="nav-item dropdown" style="margin-top: 3px;">
	          		<a class="nav-link dropdown-toggle <%="커뮤니티".equals(menu) ? "active" : "" %>" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            	커뮤니티
	          		</a>
	          		<ul class="dropdown-menu">
	            		<li><a class="dropdown-item " href="/semi/board/list.jsp">게시판</a></li>
	          		</ul>
	        	</li>

	        	<li class="nav-item dropdown" style="margin-top: 3px;">
	          		<a class="nav-link dropdown-toggle <%="마이페이지".equals(menu) ? "active" : "" %>" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            	마이페이지
	          		</a>
	          		<ul class="dropdown-menu">
	          			<li><a class="dropdown-item" href="/semi/user/detail.jsp">내 정보 조회</a></li>
<%
	if("user".equals(loginType)){
%>
	            		<li><a class="dropdown-item" href="/semi/lesson/AllUserMyLessonList.jsp">내 수업 조회</a></li>  
	            		<!-- <li><a class="dropdown-item" href="">내 스케줄 조회</a></li>  -->
	            		<li><a class="dropdown-item" href="/semi/my-membership/my-membership-list.jsp">내 이용권 조회</a></li>
<%
	}
%>
<%
	if("trainer".equals(loginType)){
%>
						<li><a class="dropdown-item" href="/semi/lesson/AllTrainerMyLessonList.jsp">내 수업 조회</a></li>
						<!-- <li><a class="dropdown-item" href="">출결조회</a></li>  -->
						<!-- <li><a class="dropdown-item" href="">출결등록</a></li>  -->
	          	</ul>
	       		</li>
	        	<li class="nav-item dropdown" style="margin-top: 3px;">
	          		<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            	회원관리
	          		</a>
	          		<ul class="dropdown-menu">
	            		<li><a class="dropdown-item" href="/semi/trainer/allUserList.jsp">전체 회원조회</a></li>
	            		<li><a class="dropdown-item" href="/semi/trainer/allMyUserList.jsp">나의 회원조회 </a></li>
<%
	}
%>
	          		</ul>
	        		</li>

<%
		if("manager".equals(loginType)){
%>

	        	<li class="nav-item dropdown" style="margin-top: 3px;">
	          		<a class="nav-link dropdown-toggle <%="관리자페이지".equals(menu) ? "active" : "" %>" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            	관리자 페이지
	          		</a>
	          		<ul class="dropdown-menu">
	            		<li><a class="dropdown-item" href="/semi/gym/list.jsp">헬스장 조회</a></li>
	            		<li><a class="dropdown-item" href="/semi/board/reportList.jsp">신고내역</a></li>
	            		<!-- <li><a class="dropdown-item" href="">수업조회</a></li> -->
	            		<!-- <li><a class="dropdown-item" href="">예약조회</a></li>  -->
	            		<li><a class="dropdown-item" href="/semi/manager/all-list.jsp">회원&강사조회</a></li>
	          		</ul>
	        	</li>
	<%
	}
	%>
	      	</ul>
	<%
		if (loginType != null) {
	%>
			<span class="navbar-text me-5">
				<strong class="text-white bolder"><%=loginId%>[<%=loginType%>]</strong>님 환영합니다.
			</span>
	<%	
		}
	}
	%>
	<%
		if(loginType == null){
	%>
	      	<ul class="navbar-nav"  >
	         	<li class="nav-item" style="margin-top: 3px;"><a class="nav-link <%="로그인".equals(menu) ? "active" : "" %>" href="/semi/loginform.jsp">로그인</a></li>
				<li class="nav-item dropdown" style="margin-top: 3px;">
	          		<a class="nav-link dropdown-toggle <%="회원가입".equals(menu) ? "active" : "" %>" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            	회원가입
	          		</a>
	          		<ul class="dropdown-menu">
	            		<li><a class="dropdown-item" href="/semi/user/form.jsp">회원</a></li>
	            		<li><a class="dropdown-item" href="/semi/trainer/form.jsp">강사</a></li>
	            		<li><a class="dropdown-item" href="/semi/manager/form.jsp">관리자</a></li>
	          		</ul>
	<%
		}else {
	%>
	        	</li>
	         	<li class="nav-item"><a class="btn btn-link text-white "href="/semi/logout.jsp"><i class="bi bi-box-arrow-right"></i></a>
	         	</li>
	<%
	}
	%>
	      	</ul>
	   	</div>
	</nav>
	
	
	
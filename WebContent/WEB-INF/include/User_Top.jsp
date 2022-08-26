<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String userId=(String) session.getAttribute("userId");
	String type=(String) request.getAttribute("type");
	if(type==null || type.trim()==""){
		type= (String) request.getParameter("type");
	}
 %>
<!-- Start Atribute Navigation -->
<div class="container">
	<div class="attr-nav">
		<ul>
			<li class="login">
				<%
					if (type==null || type.trim().equals("")) {
						out.print("<a href ='LoginService.d4b'>로그인</a>");
					} else {
						out.print("<a href ='LogoutService.d4b'>로그아웃</a>");
					}
				%>
			</li>
			<li class="join">
				<%
					if (type == null || type.trim() == "") {
						out.print("<a href='../view/JoinPage.jsp'>회원가입</a>");
					} 
				%>							
			</li>
			<li class='mypage'>
				<%
					if (type.equals("U01")) {
						out.print("<a href='GetGenericUserMypageMainService.d4b?type=" + type + "'>마이페이지</a>");
					} else if (type.equals("U02")) {
						out.print("<a href='GetREAMypageService.d4b?type=" + type + "'>마이페이지</a>");
					}else if(type.equals("A00")){
						out.print("");
					}
				%>
			</li>
			<li class="side-menu">
				<%
					if (type.equals("A00")) {
						out.print("<a href='#'><i class='fa fa-bars'></i></a>");
					}
				%>
		</ul>
	</div>
	<!-- End Atribute Navigation -->

	<!-- Start Header Navigation -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggler" data-toggle="collapse"
			data-target="#navbar-menu"></button>

		<a class="navbar-brand" href="GetUserMainPageService.d4b?type=<%=type%>" > <img
			src="<%=request.getContextPath() %>/images/logo2.png" class="logo logo-display m-top-10" alt="">
			<img src="<%=request.getContextPath() %>/images/logo.jpg" class="logo logo-scrolled" alt="">
		</a>
	</div>
</div>

<!-- End Header Navigation -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%	
String adminId = (String) session.getAttribute("userId");
String path = request.getContextPath();
%>	
	<!-- Start Atribute Navigation -->
	<div class="container">
		<div class="attr-nav">
			<ul>
				<li class="login">
				<%
				if(adminId != null){
					out.print("<a href ='LogoutService.d4b'>로그아웃</a>");
				}else{
					out.print("<a href ='getLogin.d4b'>로그인</a>");
				}
				%>
				</li>		
				<li class="join"><a href="<%=request.getContextPath() %>/view/JoinPage.jsp">회원가입</a></li>
				<li class="side-menu">
				<%
					String id = null;
					id = (String)session.getAttribute("adminId");
					
					if(id != null){
						if(id.equals("admin")){
							out.print("<a href='#'><i class='fa fa-bars'></i></a>");
						}
					}
				%>
			</ul>
		</div>
		<!-- End Atribute Navigation -->

		<!-- Start Header Navigation -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggler" data-toggle="collapse"
				data-target="#navbar-menu"></button>
			<a class="navbar-brand" href="Main.jsp?type=null"> <img src="images/logo2.png" class="logo logo-display m-top-10" alt="">
				<img src="images/logo.jpg" class="logo logo-scrolled" alt="">
			</a>
		</div>
	</div>

	<!-- End Header Navigation -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String userId = (String) session.getAttribute("userId");
	System.out.println("관리자 아이디: " + userId);

%>
	<!-- Start Atribute Navigation -->
	<div class="container">
		<div class="attr-nav">
			<ul>
				<li class="login">
				<%
				if(userId != null){
					out.print("<a href ='LogoutService.d4b'>로그아웃</a>");
				}else {
					out.print("<a href ='Login_form.jsp'>로그인</a>");
				}	
				%>
				</li>		
					<li class="nav-item dropdown no-arrow">
				<a class="nav-link dropdown-toggle" href="#" id="userDropdown" 
					role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
					<span class="mr-2 d-none d-lg-inline text-gray-600 middle" style="position: relative; top: -8px;">관리자</span> 
					<img class="img-profile rounded-circle" src="./images/admin.jpg" style="height: 40px; position: relative; top: -10px;">
				</a> 
				<!-- Dropdown - User Information -->
					<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
						<a class="dropdown-item" href="#"> <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
						</a> 
						<a class="dropdown-item" href="#"> <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> Settings
						</a> 
						<a class="dropdown-item" href="#"> <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> Activity Log
						</a>
					</div>
				</li>
				<li class="side-menu">
				<%
					String id = null;
					id = (String)session.getAttribute("userid");
					
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

			<a class="navbar-brand" href="./Main.jsp"> <img src="./images/logo1.png" class="logo logo-display m-top-10" alt="">
				<img src="./images/logo.jpg" class="logo logo-scrolled" alt="">
			</a>
		</div>
	</div>

	<!-- End Header Navigation -->

<%@page import="kr.or.bit.dto.GenericUser"%>
<%@page import="kr.or.bit.dto.UserCode"%>
<%@page import="kr.or.bit.dto.REAIntroBoard"%>
<%@page import="kr.or.bit.dto.REAImage"%>
<%@page import="kr.or.bit.dto.REAUser"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.bit.dto.Review"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	REAUser reaUser = (REAUser) request.getAttribute("reaUser");
	REAImage reaImg = (REAImage) request.getAttribute("reaImg");
	REAIntroBoard reaIntro = (REAIntroBoard) request.getAttribute("reaIntro");
	String userId = (String) session.getAttribute("userId");
	String reaId = reaUser.getReaId();
	String type = (String) request.getAttribute("type");
	if(type==null){
		type=request.getParameter("type");
	}
%>
<c:set var="reaUserData" value="<%=reaUser %>"/>
<c:set var="reaImgData" value="<%=reaImg %>"/>
<c:set var="reaIntroData" value="<%=reaIntro %>" />

<!DOCTYPE html>
<html class="no-js" lang="en">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<head>
	<meta charset="UTF-8">
	<title>공인중개사 소개 페이지</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- CSS style -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>	
	<!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	
	<jsp:include page="../../css/css.jsp" />
	
	<style type="text/css">
		a {
		    color: #797979;
		}
		
		a:hover {
		    color: #212529;
		}
		
		h2 {
			font-family: 'Jua', sans-serif;
			text-align: center;
		}
		
		h1, h3 {
		font-family: 'Jua', sans-serif;
		text-align: center;
		}
		
		.clearfix:after {
			content: '';
			display: block;
			clear: both;
			float: none;
		}
	</style>
</head>
<body data-spy="scroll" data-target=".navbar-collapse">
	
	<div class="culmn">
		<!--Home page style-->

		<nav class="navbar navbar-light navbar-expand-lg navbar-fixed ivory no-background bootsnav">
		<!-- Top jsp -->
			<%
			if(type.equals("U01")){%>
			<jsp:include page='../include/GenericUser_Top.jsp' />
			<%}else if(type.equals("U02")){%>			
			<jsp:include page='../include/REAUser_Top.jsp' />
			<%}%>
			

		<!-- Side jsp -->
			<jsp:include page="../include/Side.jsp" />
		</nav>
		<!-- Container -->
		<section id="join" class="about roomy-100">
			<div class="container">
				<div class="about_content">
					<div class="row">
						<!-- Left -->
						<div class="col-md-3" style="border: 1px solid rgb(211, 211, 211); padding-top: 15px; padding-bottom: 15px; height: 600px; width: 200px; position: fixed;">
							<div class="signup-form">
								<div class="form-group" style="text-align : center">
									<img id="preview" src="reaimg/${reaImgData.reaImgSaveName}" style="width:200px" alt="Profile">
								</div>
							</div>
							<div style="margin-top: 10px; margin-bottom: 10px;">
								<hr>
							</div>
							<div>
								<b>${reaUserData.officeName}</b><br>
								대표 공인중개사: <br>
								<b>${reaUserData.reaName}</b><br>
								${reaUserData.officeHp}
							</div>
							<div style="margin-top: 10px; margin-bottom: 10px;">
								<hr>
							</div>
							<div>
								사업장 주소: <br>
								${reaUserData.officeAddr} ${reaUserData.officeDetailAddr}<br><br>
								사업자 등록번호: <br>
								${reaUserData.regNum}
							</div>
						</div>
						<!-- Left End -->
						
						<!-- Right -->
						<div class="col-md-9" style="margin-left: 240px;">
							<div style="margin-left: 80px;">
								<!-- 첫 소개 글머리 -->
									<section>
										<div style="margin-bottom: 32px;">
											<div>
												<div>
													<h4>
														안녕하세요. ${reaUserData.officeName}에 오신 것을 환영합니다.
													</h4>
												</div>
												<div style="margin-top: 8px;">
													${reaIntroData.subject }
												</div>
												<div style="margin-top: 8px;">
													${reaIntroData.content }
												</div>
											</div>
										</div>
									</section>
								
								<!-- 두 번째 소개 -->
									<section>
										<div>
											${reaUserData.officeName} ${reaUserData.officeHp}
										</div>
									</section>
									<div style="margin-top: 20px; margin-bottom: 20px;">
										<hr>
									</div>
						
									<div style="margin-top: 20px; margin-bottom: 20px;">
									</div>
								<div>
									<jsp:include page="./../include/ReviewList.jsp" />
								</div>
								<!-- Right End -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- scroll up-->
		<div class="scrollup">
			<a href="#"><i class="fa fa-chevron-up"></i></a>
		</div>
		<!-- End off scroll up -->
		<jsp:include page="../include/Bottom.jsp" />
	</div>
	
	<!-- JS includes -->
	<jsp:include page="../../js/js.jsp" />

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<title>Drop 4our bit</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<jsp:include page="../css/css.jsp"></jsp:include>
<style>
.home {
	background: url(./images/home.jpg) no-repeat bottom center !important;
	background-size: cover;
	position: relative;
}

.input-group {
	height: 45px;
}

.about_bottom_content {
	padding-left: 80px;
	padding-right: 80px;
}
</style>
</head>

<body data-spy="scroll" data-target=".navbar-collapse">
	<!-- Preloader -->
	<div id="loading">
		<div id="loading-center">
			<div id="loading-center-absolute">
				<div class="object" id="object_one"></div>
				<div class="object" id="object_two"></div>
				<div class="object" id="object_three"></div>
				<div class="object" id="object_four"></div>
			</div>
		</div>
	</div>
	<!--End off Preloader -->
	<div class="culmn">

		<!-- Top jsp -->
		<nav
			class="navbar navbar-light navbar-expand-lg  navbar-fixed white no-background bootsnav">
			<jsp:include page="include/Top.jsp"></jsp:include>
			<!-- Start Side Menu -->
			<jsp:include page="include/Side.jsp"></jsp:include>
			<!-- End Side Menu -->

		</nav>
		<!--Home Sections-->
	<jsp:include page="include/Home.jsp"></jsp:include>	
	<br>
	<br>
	<div class="contain-fluid">
	<div class="row">
	<div class="col-md-6">
		<jsp:include page="./chart/Chart_0.jsp"></jsp:include>	
		
		<br>
		<br>
		<jsp:include page="./chart/barChart.jsp"></jsp:include>				
	</div>
	<div class="col-md-6">
		<jsp:include page="./chart/Chart_1.jsp"></jsp:include>	
		<br>
		<br>
		혜리파트	
	</div>		
	</div>
	</div>
		<!-- scroll up-->
		<div class="scrollup">
			<a href="#"><i class="fa fa-chevron-up"></i></a>
		</div>
		<!-- End off scroll up -->
		<jsp:include page="include/Bottom.jsp"></jsp:include>
	</div>

	<!-- JS includes -->	
	<jsp:include page="../js/js.jsp"></jsp:include>
</body>

</html>
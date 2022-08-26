<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<title>Drop 4our bit</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="../../css/css.jsp"></jsp:include>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<style type="text/css">
.input-group {
	height: 50px;
}

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
.carousel-inner img {
  width: 100%; /* Set width to 100% */
  margin: auto;
}

@media (max-width: 600px) {
  .carousel-caption {
    display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
  }
}
.carousel-control.right, .carousel-control.left {
	background-image: none;
	color: #fff;
}

.carousel-indicators li {
	border-color: #ff;
}

.carousel-indicators li.active {
	background-color: #fff;
}

</style>
</head>
<body data-spy="scroll" data-target=".navbar-collapse">

	<div class="culmn">
		<!--Home page style-->

		<!-- Top jsp -->
		<nav class="navbar navbar-light navbar-expand-lg  navbar-fixed ivory no-background bootsnav">
			<jsp:include page="../include/User_Top.jsp"></jsp:include>
			<!-- Side jsp -->
			<jsp:include page="../include/Side.jsp"></jsp:include>
		</nav>
		<!--Join Sections-->
		<section id="id" class="about roomy-100">
			<div class="container-fluid">
				<div class="about_content">
				<br>
				<h3 style="font-family: 'Jua', sans-serif; text-align: center;">마이페이지</h3>
				<br>
				<br>
				<br>
				<div class="row">
						<div class="col-md-12">
							<jsp:include page="../include/Mypage.jsp"></jsp:include>
						</div>
					</div>
				</div>
			</div>

			<!--End off container -->
		</section>


		<!-- scroll up-->
		<div class="scrollup">
			<a href="#"><i class="fa fa-chevron-up"></i></a>
		</div>
		<!-- End off scroll up -->
		<jsp:include page="../include/Bottom.jsp"></jsp:include>
	</div>

	<!-- JS includes -->
	<jsp:include page="../../js/js.jsp"></jsp:include>

</body>
</html>
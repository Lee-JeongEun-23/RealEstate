<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap"
	rel="stylesheet">
<head>
<meta charset="utf-8">
<title>Drop 4our bit</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<jsp:include page="../css/css.jsp"></jsp:include>

<style type="text/css">
.input-group {
	height: 50px;
}

h2, h5, p {
	font-family: 'Jua', sans-serif;
	text-align: center;
}

.form{
border : 3px double black;
padding : 10px;
}
</style>
</head>

<body data-spy="scroll" data-target=".navbar-collapse">
	<div class="culmn">
		<!--Home page style-->
		<!-- Top jsp -->
		<nav
			class="navbar navbar-light navbar-expand-lg  navbar-fixed ivory no-background bootsnav">
			<jsp:include page="../WEB-INF/include/Top.jsp"></jsp:include>

			<!-- Side jsp -->
			<jsp:include page="../WEB-INF/include/Side.jsp"></jsp:include>
		</nav>
		<!--Login Sections-->
		<section id="id" class="about roomy-100">
			<div>
				<div class="container">
					<div class="about_content">
						<div class="row">
							<div class="col-md-3"></div>
							<div class="col-md-6">
								<div class="signup-form">

									<br> <br> <br> <br> <br>
									<h2>회원가입</h2>
									<br>
									<div class="form-group">
										<h5>
											맞집 회원은 개인회원과 공인중개사회원으로 구분되어지며,<br>회원가입시 맞집 서비스를 이용하실 수
											있습니다.<br>
											<br>
											<span>※ 개인회원과 공인중개사회원은 서로 전환되지 않습니다.</span>
										</h5>
										<br>


									</div>


								</div>
							</div>
						</div>
<br> <br> <br>
						<div class="row">
							<div class="col-md-6">
								<div class="form">														
								<br>
									<h5><i class="fas fa-user"></i> 개인회원</h5>
									<br><p>맞집의 다양한 정보와 서비스를 모두 이용하실 수 있습니다.</p><br>
									<button type="submit" class="btn btn-primary btn-block btn-lg"  onclick="location.href='JoinCheckGeneric.jsp'">Join</button>
								</div>

							</div>
							<div class="col-md-6">
								<div class="form">							
								<br>
									<h5><i class="fas fa-home"></i> 공인중개사회원</h5>
									<br><p>맞집의 중개사 지원을 위한 서비스를 모두 이용하실 수 있습니다.</p><br>
									<button type="submit" class="btn btn-primary btn-block btn-lg"  onclick="location.href='JoinCheckREA.jsp'">Join</button>
								</div>
							</div>

						</div>
					</div>
					<!--End off row-->
				</div>
				<!--End off container -->
			</div>
		</section>


		<!-- scroll up-->
		<jsp:include page="../WEB-INF/include/ScrollUp.jsp"></jsp:include>
		<!-- End off scroll up -->
		<jsp:include page="../WEB-INF/include/Bottom.jsp"></jsp:include>
	</div>

	<!-- JS includes -->
	<jsp:include page="../js/js.jsp"></jsp:include>


</body>

</html>
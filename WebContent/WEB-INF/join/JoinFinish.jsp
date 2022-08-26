<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<head>
<meta charset="utf-8">
<title>Drop 4our bit</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="../../css/css.jsp"></jsp:include>

<style type="text/css">
.input-group {
	height: 50px;
}

h2{
font-family: 'Jua', sans-serif;
text-align: center;
}
</style>
</head>

<body data-spy="scroll" data-target=".navbar-collapse">

	<div class="culmn">
		<!--Home page style-->

		<!-- Top jsp -->
		<nav class="navbar navbar-light navbar-expand-lg  navbar-fixed ivory no-background bootsnav">
			<jsp:include page="../include/Top.jsp"></jsp:include>

			<!-- Side jsp -->
			<jsp:include page="../include/Side.jsp"></jsp:include>
		</nav>
		<!--Join Sections-->
		<section id="id" class="about roomy-100">
			<div class="container">
				<div class="about_content">
					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-6">
							<div class="signup-form">

									<br> <br> <br> <br> <br>
									<h2 style="font-size: 150px;">✔</h2>
									<br>
									<br>
									<h2>회원가입이 <span style="color : #ff3300;">완료</span> 되었습니다.</h2>
									<br>
									<br>
									<h2 style="font-size: 18px;">맞집 회원이 되신 것을 환영합니다.<br> 알차고 실속있는 서비스만 제공하겠습니다.</h2>
									<hr>
									<br>
								<div class="form-group">
								<div class="row">
								<div class="col-sm-6">
						            <button type="submit" class="btn btn-primary btn-block btn-lg" onclick="location.href='LoginPageService.d4b'">Log in</button>
						        </div>
						        <div class="col-sm-6">
						        	 <button type="submit" class="btn btn-primary btn-block btn-lg" onclick="location.href='Main.jsp'">Main</button>
						        </div>	
						        </div> 
						        </div>
									
									<br>
									<br>
									<br> <br> 
							</div>
						</div>
					</div>
				</div>
				<!--End off row-->
			</div>
			<!--End off container -->
		</section>


		<!-- scroll up-->

		<jsp:include page="../include/ScrollUp.jsp"></jsp:include>
		<!-- End off scroll up -->
		<jsp:include page="../include/Bottom.jsp"></jsp:include>
	</div>

	<!-- JS includes -->
	<jsp:include page="../../js/js.jsp"></jsp:include>


</body>
</html>
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
        <!-- Top jsp -->
		<nav class="navbar navbar-light navbar-expand-lg  navbar-fixed ivory no-background bootsnav">
			<jsp:include page="../include/REAUser_Top.jsp"></jsp:include>
			<!-- Side jsp -->
			<jsp:include page="../include/Side.jsp"></jsp:include>
		</nav>
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
									<h2>계약이 <span style="color : #ff3300;">완료</span> 되었습니다.</h2>
									<br>
									<br>
							<h2 style="font-size: 18px;">
								마이페이지에서<br>완료 계약 리스트를 확인할 수 있습니다.
							</h2>
							<hr>
							 <br> <br>
								<div class="row">
								<div class="col-sm-4"></div>						           
						        <div class="col-sm-4">
						        	 <button type="submit" class="btn btn-primary btn-block btn-lg" onclick="location.href='GetREAMypageService.d4b?type=U02'">마이페이지</button>
						        </div>
						        <div class="col-sm-4"></div>
						        </div> 		
							<br> <br>
						</div>
					</div>
				</div>
			</div>
		  </div>
		  </section>

       <div class="scrollup">
            <a href="#"><i class="fa fa-chevron-up"></i></a>
        </div>
        <jsp:include page="./../include/Bottom.jsp"></jsp:include>
    </div>

    <jsp:include page="../../js/js.jsp"></jsp:include>


</body>

</html>
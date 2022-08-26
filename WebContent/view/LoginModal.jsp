<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<title>Drop 4our bit</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=668464eb0d779bb6eecda046a974a34b"></script>
<jsp:include page="../../css/css.jsp"></jsp:include>
<style type="text/css">
.main_featured .head_title {
	width: 70%;
	margin: 0 auto;
}

h2, h4, h6, h3 {
	font-family: 'Jua', sans-serif;
}

.btnJoin {
	color: #fff;
	background-color: #ff6863;
	border: 2px solid;
	border-color: #ff6863;
	padding: 1rem 3rem;
}

.btnJoin:hover {
	background-color: #eee;
	border-color: #eee;
	border: 2px solid #eee;
	color: #ff6863;
}

.modal-wrapper {
	width: 100%;
	height: 100%;
	position: fixed;
	background: rgb(242, 242, 242, 0.5);
	top: 0;
	left: 0;
	visibility: hidden;
	Z-index: 1;
}

.modal-wrapper.open {
	opacity: 1;
	visibility: visible;
}

.modal {
	width: 400px;
	height: 600px;
	display: block;
	position: relative;
	top: 40%;
	left: 38%;
	background: #fff;
	opacity: 0;
	transition: all 0.5s ease-in-out;
}

.modal-wrapper.open .modal {
	margin-top: -200px;
	opacity: 1;
}

.btn-close {
	font-size: 28px;
	display: block;
	float: right;
	color: #fff;
}

.content {
	padding: 10%;
}

.head {
	width: 100%;
	height: 50px;
	padding: 10px;
	overflow: hidden;
	background: #ff6863;
}
</style>
</head>

<body data-spy="scroll" data-target=".navbar-collapse">
	<div class="houseDetail">
		<div class="page-wrapper">
			<a class="btn trigger" href="#">Real Estate Agent</a>
		</div>
	</div>
	<!-- End off featured slider -->

	<!-- Modal -->
	<div class="modal-wrapper">
		<div class="modal">
			<div class="head">
				<a class="btn-close trigger" href="#"> <i class="fa fa-times"
					aria-hidden="true"></i>
				</a>
			</div>
			<div class="content">
			  <form action="LoginService.d4b" method="post" name="loginForm">
				<div class="information">
					<h3 style="text-align: center;">로그인</h3>
					<br>
					<div class="form-group">
						<label>아이디 </label> 
						<input class="form-control" type="text" name="id" id="id" placeholder="ID" style="width: 320px" required="required">
						<label>비밀번호 </label> 
						<input class="form-control" type="password" name="pwd" id="pwd" required="required" placeholder="PASSWORD" style="width: 320px">
					</div>
					<br>
					<div class="form-group">
						<button type="submit" class="btn btn-primary btn-block btn-lg">Click</button>
						<br>
						<hr>
					</div>
					<br> <span>계정이 없으신가요?</span> <br>
					<br>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">

								<button type="submit" class="btnJoin" onclick="location.href='../JoinCheckGeneric.jsp'">
									<i class="fas fa-user"></i> 일반
								</button>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<button type="submit" class="btnJoin"
									style="padding-left: 20px; padding-right: 20px;" onclick="location.href='../JoinCheckREA.jsp'">
									<i class="fas fa-home"></i> 공인중개인
								</button>
							</div>
						</div>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
	<!-- JS includes -->
	<jsp:include page="../../js/js.jsp"></jsp:include>
	<script>

$( document ).ready(function() {
     $('.trigger').click(function(){
    	 $('.modal-wrapper').toggleClass('open');
         $('.page-wrapper').toggleClass('blur-it');
          return false;
     });
     $('[data-toggle="tooltip"]').tooltip(); 
   });
</script>
</body>
</html>
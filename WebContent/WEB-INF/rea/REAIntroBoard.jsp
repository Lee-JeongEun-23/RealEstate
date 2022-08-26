<%@page import="kr.or.bit.dto.REAIntroBoard"%>
<%@page import="kr.or.bit.dto.REAImage"%>
<%@page import="kr.or.bit.dto.REAUser"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.bit.dto.Review"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String reaId = (String) session.getAttribute("userId");
	// System.out.println("REAIntro.jsp");
	// System.out.println("reaUser: " + reaUser);
	// System.out.println("reaIntro: " + reaIntro);
%>

<!DOCTYPE html>
<html class="no-js" lang="en">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap"
	rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>공인중개사 소개 페이지</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>



<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

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

		<nav
			class="navbar navbar-light navbar-expand-lg navbar-fixed ivory no-background bootsnav">
			<!-- Top jsp -->
			<jsp:include page="../include/REAUser_Top.jsp" />

			<!-- Side jsp -->
			<jsp:include page="../include/Side.jsp" />
		</nav>
		<!-- Container -->
		<section id="join" class="about roomy-100">
			<div class="container">
				<form id="introForm" role="form" action="InsertREAIntroService.d4b?reaUserId=<%=reaId %>" method="post">
					<br style="clear: both">
					<h3 style="margin-bottom: 25px;">공인중개사 소개글</h3>
					<div class="form-group">
						<input type="text" class="form-control" id="subject" name="subject" placeholder="제목을 입력해주세요" required
						style="width:100%;">
					</div>
					<div class="form-group">
						<textarea class="form-control" id="summernote" name="content" maxlength="140" rows="7"></textarea>
					</div>
					<button type="submit" id="submit" name="submit"
						class="btn btn-primary pull-right">작성 완료</button>
				</form>
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
	<script type="text/javascript">
	$(function(){
		$('#summernote').summernote({
			placeholder: '소개글을 작성해주세요.',
	        tabsize: 2,
	        height: 400,
			fontNames : [ '맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
			fontNamesIgnoreCheck : [ '맑은고딕' ],
			focus: true
		});
	})
	</script>

</body>
</html>
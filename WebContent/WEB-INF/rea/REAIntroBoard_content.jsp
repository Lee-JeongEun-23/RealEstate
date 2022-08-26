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
	REAIntroBoard introBoard = (REAIntroBoard) request.getAttribute("introBoard");
%>
<c:set var="boardData" value="<%=introBoard%>" />
<!DOCTYPE html>
<html class="no-js" lang="en">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap"
	rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>공인중개사 소개 페이지</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>

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
 @import url(http://fonts.googleapis.com/css?family=Roboto:400italic,400);
   * {
    font-family: "Roboto", Helvetica, sans-serif;
    font-size: 12px;
    letter-spacing: 0.5px;
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
				<form id="introForm" role="form"
					action="UpdateREAIntroService.d4b"
					method="post">
					<br style="clear: both">
					<h3 style="margin-bottom: 25px;">공인중개사 소개글 수정</h3>
					<div class="form-group">
						<input type="text" class="form-control" id="subject"
							name="subject" required style="width: 100%;"
							value="${boardData.subject}">
					</div>
					<div class="form-group">
						<textarea class="form-control" id="summernote" name="content"
							placeholder="내용을 입력해주세요" maxlength="140" rows="7">${boardData.content}</textarea>
					</div>
					<div>
						<div class="row">
							<div class="col-sm-3"></div>
							<div class="col-sm-3">
								<button type="submit" id="edit_btn" name="edit_btn"
									class="btn btn-primary btn-block btn-lg">수정 완료</button>
							</div>
							<div class="col-sm-3">
								<button type="button" id="delete_btn" name="delete_btn"
									class="btn btn-primary btn-block btn-lg" onclick="location.href='DeleteREAIntroService.d4b'">삭제</button>
							</div>
							<div class="col-sm-3"></div>
						</div>
					</div>
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
	$(document).ready(function() {
		$('#summernote').summernote({
			lang : 'ko-KR',
			placeholder: '소개글을 작성해주세요.',
	        tabsize: 2,
	        height: 400,
	        defaultFontName: 'Comic Sans MS'

	      });
	});
	</script>

</body>
</html>
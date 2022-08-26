<%@page import="kr.or.bit.dto.Sale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<%
	Sale sale2=(Sale)request.getAttribute("sale2");
	String aptNum=(String)request.getAttribute("aptNum");	
%>
<c:set var="saleData" value="<%=sale2%>"></c:set>
<html class="no-js" lang="en">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap"
	rel="stylesheet">

<head>
<meta charset="utf-8">
<title>Drop 4our bit</title>
<meta name="description" content="">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://rawgit.com/enyo/dropzone/master/dist/dropzone.js">
	
</script>
<link rel="stylesheet"
	href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">
<link rel="stylesheet"
	href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">

<jsp:include page="../../css/css.jsp"></jsp:include>
<style>
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
		<nav
			class="navbar navbar-light navbar-expand-lg  navbar-fixed ivory no-background bootsnav">
			<jsp:include page="./../include/REAUser_Top.jsp"></jsp:include>

			<!-- Side jsp -->
			<jsp:include page="./../include/Side.jsp"></jsp:include>
		</nav>
		<!--Login Sections-->

		<section id="join" class="about roomy-100">
			<div class="container" id="imgUpload">
				<div class="about_content">
					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-6">
							<div class="signup-form">
								<br> <br> <br>
								<h2 style="text-align: center">매물 사진 등록</h2>
								<br>
								<hr>
								<br>
							</div>
						</div>
					</div>
					<div>
						<form id="myForm">
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<img id="preview1" src="images/picture.png" alt="Profile" style="width: 400px; height: 250px;">
										<br> <br>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
											type="file" name="filename1" id="getfile1"
											onchange="imageURL1()"><br>
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<img id="preview2" src="images/picture.png" alt="Profile" style="width: 400px; height: 250px;">
										<br> <br>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
											type="file" name="filename2" id="getfile2"
											onchange="imageURL2()"><br>
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<img id="preview3" src="images/picture.png" alt="Profile" style="width: 400px; height: 250px;">
										<br> <br>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
											type="file" name="filename3" id="getfile3"
											onchange="imageURL3()"><br>
									</div>
								</div>
							</div>
							<br><br>
						<div class="row">
								<div class="col-sm-5"></div>
								<div class="col-sm-2">
									<button type="button" class="btn btn-primary btn-block btn-lg"
										id="submitBtn" style="padding-left: 32px;">사진 등록 완료</button>
								</div>
								<div class="col-sm-5"></div>
							</div>
							</form>
					<br> <br>
					</div>
					<br> <br>

				</div>
			</div>

	</section>
	</div>

	<!-- scroll up-->
	<jsp:include page="./../include/ScrollUp.jsp"></jsp:include>
	<!-- End off scroll up -->
	<jsp:include page="./../include/Bottom.jsp"></jsp:include>
	</div>

	<!-- JS includes -->
	<jsp:include page="../../js/js.jsp"></jsp:include>
	<script>
	
	function imageURL1 () { 
		var file1 = document.querySelector('#getfile1');
		var fileList = file1.files ;
	    
	    // 읽기
	    var reader = new FileReader();
	    reader.readAsDataURL(fileList [0]);

	    //로드 한 후
	    reader.onload = function  () {
	        document.querySelector('#preview1').src = reader.result ;
	    }; 
	}; 
	function imageURL2 () { 
		var file2 = document.querySelector('#getfile2');
		var fileList = file2.files ;
	    var reader = new FileReader();
	    reader.readAsDataURL(fileList [0]);
	    reader.onload = function  () {
	        document.querySelector('#preview2').src = reader.result ;
	    }; 
	}; 
	function imageURL3 () { 
		var file3 = document.querySelector('#getfile3');
		var fileList = file3.files ;
	    var reader = new FileReader();
	    reader.readAsDataURL(fileList [0]);
	    reader.onload = function  () {
	        document.querySelector('#preview3').src = reader.result ;
	    }; 
	}; 
	
	$(function(){
		$("#submitBtn").click(function(event){
			if( $("#getfile1").val()=="" || $("#getfile2").val()=="" || $("#getfile3").val()==""){
				alert("매물 사진을 등록해주세요");
				e.preventdefault();
			} else {
				var form = $("#myForm")[0];
			 	var formData = new FormData(form);
			 	var aptNum=<%=aptNum%>;
			 	
			 	$.ajax({
			 		url : 'InsertSaleImgService.d4b?aptNum='+aptNum,
			 		enctype : "multipart/form-data",
			 		type : 'post',
			 		data : formData,
			 		dataType:'html',
			 		contentType : false,
			 		processData : false,
			 		success:function(data){
			 			//console.log(data);
			 			$("#imgUpload").empty();
			 			$("#imgUpload").append(data);
			 		}
			 	});
			}
			
			
		});
			
		
		
		
		
		});
	
		 	
	</script>

</body>

</html>
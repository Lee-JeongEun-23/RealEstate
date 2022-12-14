<%@page import="kr.or.bit.dto.GenericUser"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">
	<meta charset="utf-8">
	<title>Drop 4our bit</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	
	<style type="text/css">
		.btn-group-sm:hover {
			background-color: #eee;
			border-color: #eee;
			border: 0.5px solid #eee;
			color: #ff6863;
		}
		
		.btn-group-sm {
			color: #fff;
			background-color: #ff6863;
			border-color: #ff6863;
			border: 2px solid #eee;
			padding: 0.5rem 1rem;
		}
		
		.input-group {
			height: 50px;
		}
		
		h2 {
			font-family: 'Jua', sans-serif;
			text-align: center;
		}
		
		select {
			color: #fff;
			background-color: #ff6863;
			border: 2px solid;
			border-color: #ff6863;
			padding: 0.8rem 2rem;
			margin-bottom: 1rem;
		}
		
		select {
			position: relative;
			display: inline-block;
		}
		
		option {
			display: none;
			position: absolute;
			background-color: #f9f9f9;
			min-width: 160px;
			box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
			z-index: 1;
		}
		
		option {
			color: black;
			padding: 12px 16px;
			text-decoration: none;
			display: block;
		}
		
		option:hover {
			background-color: #f1f1f1
		}
		
		select:hover option {
			display: block;
		}
		
		select:hover select {
			background-color: #eee;
			border-color: #eee;
			border: 2px solid #eee;
			color: #ff6863;
		}
		
		thead th {
			text-aglin: center;
		}
	</style>

<%
	List<GenericUser> generic = (ArrayList<GenericUser>) request.getAttribute("GenericUserList");
	// ???????????? ?????? ??? ?????? ??????(????????????)
	
%>

	<script>
		$(function() {
			
			$('#search').change(function() {
				
				if ($('#search option:selected').val() == "GenericUser") { // ???????????? ??????
					$.ajax({
							url : 'SelectGenericUser', // kr.or.bit.ajax
							type : 'post',
							data : {
		                        "GenericUser" : $("#search option:selected").val()
							},
							dataType : 'json',
							success : function(data) {
								$("#thead").empty(); // thead ???????????? ??????
								$("#tbody").empty(); // tbody ???????????? ??????

								var guthead = "";
									guthead += "<tr>";
									guthead += "<th>?????????</th>";
									guthead += "<th>??????</th>";
									guthead += "<th>????????????</th>";
									guthead += "<th>????????????</th>";
									guthead += "<th>??????</th>";
									guthead += "</tr>";

									$('#thead').append(guthead);

								$.each(data, function(index, element) {
									var gutbody = "";
										gutbody += "<tr>";
										gutbody += "<td><a href='GetGenericUserService.d4b?genericUserId=" + element.userId + "'>" + element.userId + "</a></td>";
										gutbody += "<td>" + element.userName + "</td>";
										gutbody += "<td>" + element.frontResNum + "</td>";
										gutbody += "<td>" + element.userPhoneNum + "</td>";
										gutbody += "<td>" + element.userAddr + "</td>";
										gutbody += "</tr>";
										
										$('#tbody').append(gutbody);
								});
							}
						});
				} else if ($("#search option:selected").val() == "REAUser") { // ????????????????????? ??????
					
					$.ajax({
							url : 'SelectREAUser', // kr.or.bit.ajax
							type : 'post',
							data : {
								"REAUser" : $("#search option:selected").val()
							},
							dataType : 'json',
							success : function(data) {
								$("#thead").empty(); // thead ???????????? ??????
								$("#tbody").empty(); // tbody ???????????? ??????

								var ruthead = "";
									ruthead += "<tr>";
									ruthead += "<th>?????????</th>";
									ruthead += "<th>???????????????</th>";
									ruthead += "<th>?????????????????????</th>";
									ruthead += "<th>?????????????????????</th>";
									ruthead += "<th>???????????????</th>";
									ruthead += "</tr>";

									$('#thead').append(ruthead);

								$.each(data, function(index, element) {
									var rutbody = "";
									rutbody += "<tr>";
									rutbody += "<td><a href='GetREAUserService.d4b?REAUserId=" + element.reaId + "'>" + element.reaId + "</a></td>";
									rutbody += "<td>" + element.officeName + "</td>";
									rutbody += "<td>" + element.regNum + "</td>";
									rutbody += "<td>" + element.officeHp + "</td>";
									rutbody += "<td>" + element.officeAddr + "</td>";
									rutbody += "</tr>";
									
									$('#tbody').append(rutbody);
								});
							}
					});
				}
			});
		});
	</script>
<c:set var="generic" value="<%=generic%>"></c:set>

<section id="id" class="about roomy-100" style="padding-top: 30px;">
	<div class="container">
		<div class="about_content">
			<div class="container-fluid">
				<p class="h5 mb-2 text-gray-800">?????? ??????</p>
				<br>
				<div class="row">
					<div class="col-md-4">
						<select id="search">
							<option id="gu" value="GenericUser" selected>????????????</option>
							<option id="ru" value="REAUser">?????????????????????</option>
							<!-- ??????????????? ?????? ?????? -->
							<!-- <option id="gu" value="BlackGenericUser">???????????????-????????????</option>
							<option id="ru" value="BlackREAUser">???????????????-?????????????????????</option> -->
						</select>
					</div>
				</div>
				<br>
				<!-- ????????? -->
				<div class="card-header py-3">
					<h5 class="m-0 font-weight-bold text-primary">?????? ??????</h5>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<form action="SelectGenericUserService.d4b" method="post">
							<table class="table table-bordered" id="dataTable"
								style="text-align: center; margin: auto; width: 100%;">
								<thead id="thead">
									<tr>
										<th>?????????</th>
										<th>??????</th>
										<th>????????????</th>
										<th>????????????</th>
										<th>??????</th>
									</tr>
								</thead>
								<tbody id="tbody">
									<c:set var="genericUser" value="${requestScope.GenericUserList}" />
									<c:forEach var="genericuser" items="${genericUser}" varStatus="status">
										<tr class="userInfo">
											<td><a href="GetGenericUserService.d4b?genericUserId=${genericuser.userId}">${genericuser.userId}</a></td>
											<td>${genericuser.userName}</td>
											<td>${genericuser.frontResNum}</td>
											<td>${genericuser.userPhoneNum}</td>
											<td>${genericuser.userAddr}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--End off container -->

</section>
<!-- The Modal -->
<!-- scroll up-->
<jsp:include page="./ScrollUp.jsp"></jsp:include>



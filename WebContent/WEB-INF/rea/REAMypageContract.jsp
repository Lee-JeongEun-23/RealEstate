<%@page import="kr.or.bit.dao.ContractDao"%>
<%@page import="kr.or.bit.dao.SaleDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.bit.dto.Sale"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.bit.dto.REAImage"%>
<%@page import="kr.or.bit.dto.REAUser"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<head>
<meta charset="utf-8">
<title>Drop 4our bit</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="../../css/css.jsp"></jsp:include>
<%
	REAUser reaUser = (REAUser) request.getAttribute("reaUser");
	REAImage reaImg = (REAImage) request.getAttribute("reaImg");
	String reaId = (String) session.getAttribute("userId");
	ContractDao conDao = new ContractDao();
	List<Sale> sList = new ArrayList<Sale>();
	sList = conDao.getSaleContractList(reaId); //reaId로 리스트 불러오기
	System.out.println(sList);
	
	String type= request.getParameter("type");
	if(type==null){
		type= (String) request.getAttribute("type");
	}
%>
<c:set var="reaUserData" value="<%=reaUser%>"></c:set>
<c:set var="reaImgData" value="<%=reaImg%>"></c:set>
<c:set var="list" value="<%=sList%>"></c:set>							
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

input {
	text-align: center;
}

.btn-group:hover {
	background-color: #eee;
	border-color: #eee;
	border: 0.5px solid #eee;
	color: #ff6863;
}

.btn-group {
	color: #fff;
	background-color: #ff6863;
	border-color: #ff6863;
	border: 2px solid #eee;
	padding: 0.5rem 1rem;
}

.btn-group-sm:hover {
	background-color: #eee;
	border-color: #eee;
	border: 0.5px solid #eee;
	color: #ff6863;
}
#con_btn:hover {
	background-color: #eee;
	border-color: #eee;
	border: 0.5px solid #eee;
	color: black;
	font-weight: bold;
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
</style>
</head>

<body data-spy="scroll" data-target=".navbar-collapse">
	<div class="culmn">
		<!--Home page style-->

		<!-- Top jsp -->
		<nav
			class="navbar navbar-light navbar-expand-lg  navbar-fixed ivory no-background bootsnav">
			<jsp:include page="../include/REAUser_Top.jsp"></jsp:include>
			<!-- Side jsp -->
			<jsp:include page="../include/Side.jsp"></jsp:include>
		</nav>
		<!--Join Sections-->
		<section id="id" class="about roomy-100">
			<form action="GetSaleAddPageService.d4b" method="post">
				<div class="container">
					<div class="about_content">
						<h2>My Page</h2>
						<br> <br>
						<div class="row">
							<div class="col-md-6" style="text-align: center">
								<img id="preview" src="reaimg/${reaImgData.reaImgSaveName}"
									style="width: 200px" alt="Profile"> <br> <br> <input
									type="text" class="form-control" name="User_Id" id="User_Id"
									required="required" value="${reaUserData.reaName}" readonly>
								<br>
							</div>
							<div class="col-md-6">
								<label>사업자 등록번호 &nbsp;&nbsp;&nbsp;&nbsp;</label> <input
									type="text" class="form-control" name="User_Id" id="User_Id"
									required="required" value="${reaUserData.regNum}"
									readonly="readonly"> <label>사무소
									이름&nbsp;&nbsp;&nbsp;&nbsp;</label> <input type="text"
									class="form-control" name="User_Id" id="User_Id"
									required="required" value="${reaUserData.officeName}" readonly>
								<label>연락처&nbsp;&nbsp;&nbsp;&nbsp;</label> <input type="text"
									class="form-control" name="User_Id" id="User_Id"
									required="required" value="${reaUserData.officeHp}" readonly>
								<label>사무소 주소 &nbsp;&nbsp;&nbsp;&nbsp;</label> <input
									type="text" class="form-control" name="User_Id" id="User_Id"
									required="required"
									value="${reaUserData.officeAddr} ${reaUserData.officeDetailAddr}"
									readonly> <br>
							</div>
						</div>
						<hr>
			                  <div class="row">
			                     <div class="col-md-12">
			                        <button type="button" class="btn-group" onclick="location.href='GetREAMypageService.d4b?type=<%=type%>'">매물 관리</button>
			                        &nbsp;
			                        <button type="button" class="btn-group" onclick="location.href='CheckIntroBoardService.d4b'">소개글 관리</button>
			                        &nbsp;
			                        <button type="button" class="btn-group" onclick="location.href='GetREAScheduleListByIdService.d4b?userId=${reaUserData.reaId}'">일정 관리</button>
			                        &nbsp;
			                        <button type="button" class="btn-group" onclick="location.href='GetREAMypageEditService.d4b'">정보 수정</button>
			                        <input type="hidden" value="<%=reaId %>" id="reaId">
			                        <br> <br>
			                        <div id="saleList">
			                           <div class="card-header py-3">
			                              <h6 class="m-0 font-weight-bold text-primary">계약 관리</h6>
			                           </div>
			                           <div class="card-body">
			                              <div class="table-responsive">
			                                 <table class="table table-bordered" width="100%" cellspacing="0">
			                                    <thead>
			                                       <tr>
			                                          <th>면적</th>
			                                          <th>유형</th>
			                                          <th>주소</th>
			                                          <th>아파트이름</th>
			                                          <th>동</th>
			                                          <th>호수</th>
			                                          <th>매매가</th>
			                                       </tr>
			                                    </thead>
			                                    <tbody id="tbody">
													<c:forEach var="list1" items="${list}" varStatus="status">			                                    
					                                    <tr>
						                                    <td>${list1.aptSize}</td>
						                                    <td>${list1.type}</td>
						                                    <td>${list1.addr}</td>
						                                    <td>${list1.aptName}</td>		
						                                    <td>${list1.aptDong}</td>
						                                    <td>${list1.aptHo}</td>
						                                    <td>${list1.price}</td>				                                                       		                                      
		                			                    </tr>   
                			                    </c:forEach>           		                                      
			                                    </tbody>
			                                 </table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
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
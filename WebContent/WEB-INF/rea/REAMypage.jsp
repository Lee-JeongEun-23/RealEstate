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
<script type="text/javascript">
var cPage=1;



$(function () {
	 
	
	let isEnd = false;
	$(window).scroll(function () {
		var type=$("#type").val();
		
	  	 if ($(document).height() <= $(window).scrollTop() + $(window).height() + 100) {
	  		fetchList();
	   	 }
	});
	
	 var fetchList = function(){
        if(isEnd == true){
            return;
        }
        let startNo = $("#aptNum").last().val();
        console.log(startNo);
	        $.ajax({
	            url: 'InfiniteScroll',
	            type: 'get',
	            dataType: 'json',
	            data: {
	                "type": $("#type").val(),
	                "cPage": cPage
	            },
	            success: function (data) {
	            	 let length = data.length;
	            	 console.log(cPage);
	                 if( length < 5 ){
	                     isEnd = true;
	                 } 
	                
	     
	               	 $.each(data, function (index, element) {
	                    var list = "";
	                    list += "<tr>";
	                    list += "<td>" + element.aptSize + "</td>";
	                    list += "<td>" + element.type + "</td>";
	                    list += "<td>" + element.addr + "</td>";
	                    list += "<td>" + element.aptName + "</td>";
	                    list += "<td>" + element.aptDong + "</td>";
	                    list += "<td>" + element.aptHo + "</td>";
	                    list += "<td>" + element.price + "</td>";
	                    list += "<td>" + element.isContract + "</td>";
	                    list += "<td><button type='button' class='btn-group-sm' id='edit_btn' onclick=" + "location.href='GetSaleEditPageService.d4b?aptNum=" + element.aptNum + "'>??????</button></td>";
	                    list += "<td><button type='button' class='btn-group-sm' id='delete_btn' onclick=" + "location.href='SaleDeleteService.d4b?aptNum="+element.aptNum+"' > ??????</button ></td > ";
	                    //list += "<td>" + "<button type='button' class='btn-group-sm' id='delete_btn' onclick=" location.href = 'deleteInfo.d4b?empNo="+element.empNo+"' > ??????</button > " + "</td > ";
	                   if(element.isContract == "???"){
	                    list += "<td><button type='button' class='btn-group-sm' id='contract_btn' onclick=" + "location.href='GetContractService.d4b?userId=" +$('#reaId').val()+ "&aptNum=" + element.aptNum +"'>??????</button></td>";
	                   }else{
	                	   list += "<td><button type='button' class='btn-group-sm' id='con_btn' disabled='disabled'>??????</button></td>";   
	                   }
	                    list += "</tr>";
	
	                    $('#tbody').append(list);
		                }) //each
		                cPage++;
		            },//success
		            error: function () {
						console.log("????????? ???????????? ??????");
					}
		        })//ajax
		    } //fetchList
	 fetchList();
});

</script>
<jsp:include page="../../css/css.jsp"></jsp:include>
<%
	REAUser reaUser = (REAUser) request.getAttribute("reaUser");
	REAImage reaImg = (REAImage) request.getAttribute("reaImg");
	String userId = (String) session.getAttribute("userId");
	SaleDao dao = new SaleDao();
	List<Sale> saleList = new ArrayList<Sale>();
	saleList = dao.getSaleList(userId); //reaId??? ????????? ????????????
	
	String type= request.getParameter("type");
	if(type==null){
		type= (String) request.getAttribute("type");
	}
	

%>
<c:set var="reaUserData" value="<%=reaUser%>"></c:set>
<c:set var="reaImgData" value="<%=reaImg%>"></c:set>
							
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
								<label>????????? ???????????? &nbsp;&nbsp;&nbsp;&nbsp;</label> <input
									type="text" class="form-control" name="User_Id" id="User_Id"
									required="required" value="${reaUserData.regNum}"
									readonly="readonly"> <label>?????????
									??????&nbsp;&nbsp;&nbsp;&nbsp;</label> <input type="text"
									class="form-control" name="User_Id" id="User_Id"
									required="required" value="${reaUserData.officeName}" readonly>
								<label>?????????&nbsp;&nbsp;&nbsp;&nbsp;</label> <input type="text"
									class="form-control" name="User_Id" id="User_Id"
									required="required" value="${reaUserData.officeHp}" readonly>
								<label>????????? ?????? &nbsp;&nbsp;&nbsp;&nbsp;</label> <input
									type="text" class="form-control" name="User_Id" id="User_Id"
									required="required"
									value="${reaUserData.officeAddr} ${reaUserData.officeDetailAddr}"
									readonly> <br>
							</div>
						</div>
						<hr>
			                  <div class="row">
			                     <div class="col-md-12">
			                        <input type="submit" class="btn-group" value="?????? ??????">
			                        &nbsp;
			                        <button type="button" class="btn-group" onclick="location.href='SelectContractListService.d4b?userId=${reaUserData.reaId}'">?????? ??????</button>
			                        &nbsp;
			                        <button type="button" class="btn-group" onclick="location.href='CheckIntroBoardService.d4b'">????????? ??????</button>
			                        &nbsp;
			                        <button type="button" class="btn-group" onclick="location.href='GetREAScheduleListByIdService.d4b?userId=${reaUserData.reaId}'">?????? ??????</button>
			                        &nbsp;
			                        <button type="button" class="btn-group" onclick="location.href='GetREAMypageEditService.d4b'">?????? ??????</button>
			                        <input type="hidden" value="<%=userId %>" id="reaId">
			                        <br> <br>
			                        <div id="saleList">
			                           <div class="card-header py-3">
			                              <h6 class="m-0 font-weight-bold text-primary">?????? ??????</h6>
			                           </div>
			                           <div class="card-body">
			                              <div class="table-responsive">
			                                 <table class="table table-bordered" width="100%" cellspacing="0">
			                                    <thead>
			                                       <tr>
			                                          <th>??????</th>
			                                          <th>??????</th>
			                                          <th>??????</th>
			                                          <th>???????????????</th>
			                                          <th>???</th>
			                                          <th>??????</th>
			                                          <th>?????????</th>
			                                          <th>????????????</th>
			                                          <th>??????</th>
			                                          <th>??????</th>
			                                          <th>??????</th>
			                                       </tr>
			                                    </thead>
			                                    <tbody id="tbody">	
			                                    		                                      
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
	<script>
		$(function() {
			//var size = $("#size").val();

			//var aptNum= $("#delete_btn").val();
			$("#delete_btn")
					.click(
							function(event) {
								var aptNum = event.target.value;
								console.log(aptNum);
								$.ajax({
											url : $(),
											type : 'post',
											dataType : 'json',
											success : function(data) { //data??? object!
												$("#tbody").empty();
												$
														.each(
																data,
																function(key,
																		value) {
																	var table = "";
																	table += "<tr>";
																	table += "<td>"
																			+ value.aptSize
																			+ "</td>";
																	table += "<td>"
																			+ value.type
																			+ "</td>";
																	table += "<td>"
																			+ value.addr
																			+ "</td>";
																	table += "<td>"
																			+ value.aptName
																			+ "</td>";
																	table += "<td>"
																			+ value.aptDong
																			+ "</td>";
																	table += "<td>"
																			+ value.aptHo
																			+ "</td>";
																	table += "<td>"
																			+ value.price
																			+ "</td>";
																	table += "<td>"
																			+ value.isContract
																			+ "</td>";
																	table += "<td>"
																			+ "<button type='button' class='btn-group-sm' id='edit_btn' onclick="
																			+ "GetSaleEditPageService.d4b?aptNum="
																			+ value.aptNum
																			+ "'>??????</button>"
																			+ "</td>";
																	table += "<td>"
																			+ "<button type='button' class='btn-group-sm' id='delete_btn'>??????</button>"
																			+ "</td>";
																	table += "</tr>";
																	$('#tbody')
																			.append(
																					table);
																});
											}
										});
							});
		});
	</script>

</body>
</html>
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
	                    list += "<td><button type='button' class='btn-group-sm' id='edit_btn' onclick=" + "location.href='GetSaleEditPageService.d4b?aptNum=" + element.aptNum + "'>수정</button></td>";
	                    list += "<td><button type='button' class='btn-group-sm' id='delete_btn' onclick=" + "location.href='SaleDeleteService.d4b?aptNum="+element.aptNum+"' > 삭제</button ></td > ";
	                    //list += "<td>" + "<button type='button' class='btn-group-sm' id='delete_btn' onclick=" location.href = 'deleteInfo.d4b?empNo="+element.empNo+"' > 삭제</button > " + "</td > ";
	                   if(element.isContract == "무"){
	                    list += "<td><button type='button' class='btn-group-sm' id='contract_btn' onclick=" + "location.href='GetContractService.d4b?userId=" +$('#reaId').val()+ "&aptNum=" + element.aptNum +"'>계약</button></td>";
	                   }else{
	                	   list += "<td><button type='button' class='btn-group-sm' id='con_btn' disabled='disabled'>계약</button></td>";   
	                   }
	                    list += "</tr>";
	
	                    $('#tbody').append(list);
		                }) //each
		                cPage++;
		            },//success
		            error: function () {
						console.log("데이터 받아오기 실패");
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
	saleList = dao.getSaleList(userId); //reaId로 리스트 불러오기
	
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
			                        <input type="submit" class="btn-group" value="매물 등록">
			                        &nbsp;
			                        <button type="button" class="btn-group" onclick="location.href='SelectContractListService.d4b?userId=${reaUserData.reaId}'">계약 관리</button>
			                        &nbsp;
			                        <button type="button" class="btn-group" onclick="location.href='CheckIntroBoardService.d4b'">소개글 관리</button>
			                        &nbsp;
			                        <button type="button" class="btn-group" onclick="location.href='GetREAScheduleListByIdService.d4b?userId=${reaUserData.reaId}'">일정 관리</button>
			                        &nbsp;
			                        <button type="button" class="btn-group" onclick="location.href='GetREAMypageEditService.d4b'">정보 수정</button>
			                        <input type="hidden" value="<%=userId %>" id="reaId">
			                        <br> <br>
			                        <div id="saleList">
			                           <div class="card-header py-3">
			                              <h6 class="m-0 font-weight-bold text-primary">매물 관리</h6>
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
			                                          <th>계약여부</th>
			                                          <th>수정</th>
			                                          <th>삭제</th>
			                                          <th>계약</th>
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
											success : function(data) { //data는 object!
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
																			+ "'>수정</button>"
																			+ "</td>";
																	table += "<td>"
																			+ "<button type='button' class='btn-group-sm' id='delete_btn'>삭제</button>"
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
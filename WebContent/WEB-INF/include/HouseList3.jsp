<%@page import="kr.or.bit.utils.ThePager"%>
<%@page import="kr.or.bit.dto.SaleImage"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.bit.dto.Sale"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0d0c0a21e3bf46994d7f7a41d9cc729f&libraries=services"></script>
   <script type="text/javascript">
	        $(function () {
	            $(window).scroll(function () {
	                if ($(window).scrollTop() == $(document).height() - $(window).height()) {
	                    $.ajax({
	                        url: 'InfiniteScroll',
	                        type: 'post',
	                        data: {
	                            "search": $("#search").val()
	                        },
	                        dataType: 'json',
	                        success: function (data) {
	                            $("#tbody").empty();
	    
	                            $.each(data, function (index, element) {
	    
 	                                console.log(element);
	    
// 	                                var dNametable = "";
// 	                                dNametable += "<tr>";
// 	                                dNametable += "<td>" + element.eName + "</td>";
// 	                                dNametable += "<td>" + element.empNo + "</td>";
// 	                                dNametable += "<td>" + element.job + "</td>";
// 	                                dNametable += "<td>" + element.sal + "</td>";
// 	                                dNametable += "<td>" + element.dName + "</td>";
// 	                                dNametable += "<td>" + "<button type='button' class='btn-group-sm' id='edit_btn' onclick=" + "location.href = 'editForm.d4b?empNo="+element.empNo+"' > ??????</button > " + "</td > ";
// 	                                dNametable += "<td>" + "<button type='button' class='btn-group-sm' id='delete_btn' onclick=" + "
// 	                                location.href = 'deleteInfo.d4b?empNo="+element.empNo+"' > ??????</button > " + "</td > ";
// 	                                dNametable += "</tr>";
	    
// 	                                $('#tbody').append(dNametable);
	                            })
	                        }
	                    })
	                }
	            });
	            
	            $('.slick-items').slick({
	                autoplay : true,
	                dots : true,
	                speed : 300 /* ???????????? ??????????????? ????????? ?????? */,
	                infinite : true,
	                autoplaySpeed : 3000 /* ???????????? ?????? ???????????? ?????? ????????? ??? */,
	                arrows : true,
	                slidesToShow : 1,
	                slidesToScroll : 1,
	                fade : false
	             });
	            
	            
	            var arrValue = $("input[name='addr']").length;
	            var array = new Array(arrValue);
	            
	            for(var i=0; i< array.length; i++){                          
	            	array[i] = $("input[name='addr']")[i].value;
	            }
	     
	        	
	        	
	        	var mapContainer = document.getElementById('map'), // ????????? ????????? div  
	    		mapOption = {
	    	   	center: new kakao.maps.LatLng(37.497571, 127.049994), // ????????? ????????????
	    	   	level: 2 // ????????? ?????? ??????  
	    	};

	    	var map = new kakao.maps.Map(mapContainer, mapOption); // ????????? ???????????????
	    	//??????-?????? ?????? ????????? ???????????????
	    	var geocoder = new kakao.maps.services.Geocoder();
	    	
	    	
	    	
	    	
	    	for (var i = 0; i < array.length; i++){
	    		geocoder.addressSearch(array[i], function(result, status) {

	    	        // ??????????????? ????????? ??????????????? 
	    	         if (status === kakao.maps.services.Status.OK) {

	    	            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	    	            // ??????????????? ?????? ????????? ????????? ???????????????
	    	            var marker = new kakao.maps.Marker({
	    	                map: map,
	    	                position: coords,
	    	            });

	    	           marker.setMap(map);
	    	           
	    	           var content = "<div> hi </div>";
	    	           var customOverlay = new daum.maps.CustomOverlay(
	    	        		{
	    	        			position : coords,
	    	        			content : content
	    	        		});
	    	           customOverlay.setMap(map);
	    	           map.setCenter(coords);
	    	        } 
	    	    }); 
	    		
	    	}

	        });
</script>
<%
	//String genericUserId = (String) session.getAttribute("userId");
	//String reaId = (String) session.getAttribute("reaId");
	String userId = (String) session.getAttribute("userId");
	String search= (String) request.getAttribute("search");
	
	String type= request.getParameter("type");
	if(type==null || type.trim()==""){
		type= (String) request.getAttribute("type");
	}
	
	int pageCount = (int) request.getAttribute("pageCount");
	int count = (int) request.getAttribute("count");
	int pageSize = (int) request.getAttribute("pageSize");
	int cPage = (int) request.getAttribute("cPage");
	
// 	System.out.println("type: "+type);
// 	System.out.println("userId: "+userId);
// 	System.out.println("search: "+search);
// 	System.out.println("pageCount: " + pageCount);
// 	System.out.println("count: " + count);
// 	System.out.println("pageSize: " + pageSize);
// 	System.out.println("cPage: " + cPage);

%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=58b9f2ab38f9ccb70e8d94e99bcaab94&libraries=LIBRARY"></script>
<!-- services??? clusterer, drawing ??????????????? ???????????? -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=58b9f2ab38f9ccb70e8d94e99bcaab94&libraries=services,clusterer,drawing"></script>
<style type="text/css">
h5{
font-family: 'Jua', sans-serif;
}
a.btn :hover {
   color: #fff;
   background-color: #ff6863;
   border-color: #ff6863;
   border: 0.5px solid #eee;
}

a.btn  {
   color: #ff6863;
   background-color: #eee;
   border-color: #eee;
   border: 2px solid #eee;
   padding: 1rem 1rem;
}

.teamskillbar {
   position: relative;
   display: block;
   margin-bottom: 15px;
   width: 100%;
   background: #f2f2f2;
   height: 10px;
   -webkit-transition: 0.4s linear;
   transition: 0.4s linear;
   -webkit-transition-property: width, background-color;
   transition-property: width, background-color;
}

.teamskillbar h6 {
   position: absolute;
   top: -25px;
   left: 0;
}

.teamskillbar-bar {
   height: 10px;
   width: 0px;
   background: #ff6863;
   position: absolute;
   left: 0px;
   top: 0px;
}
.slick-items, .detail{
text-align: center;
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

<%
	Map<Sale, SaleImage> saleMap = (Map<Sale, SaleImage>)request.getAttribute("saleMap");
	
%>
<h6>300??? ????????? ??????</h6>
<input type="hidden" value="<%=search%>" id="search">
<p style="font-size: 13px">?????? ????????? ????????? ?????? ?????? ?????? ???????????? ????????????.</p>
<br>
<div class="row">
	<div class="col-lg-7" id="items">
		<c:set var="priceList" value="priceList"></c:set>
		<c:set var="stringPrice" value="stringPrice"></c:set>
		<c:set var="listLength" value="listLength"></c:set>
		<c:set var="listLength" value="listLength"></c:set>
		<c:set var="saleData" value=""></c:set>
		<c:forEach var="sale" items="<%=saleMap%>" varStatus="status">
		    <div class="row">
		        <div class="col-lg-1"></div>
		        <div class="col-lg-7">
		            <div class="slick-items">
		                <div>
		                    <img src="reaimg/${sale.value.saleImgSaveName1}" alt="????????????1" width="500" height="220">
		                </div>
		                <div>
		                    <img src="reaimg/${sale.value.saleImgSaveName2}" alt="????????????2" width="500" height="220">
		                </div>
		                <div>
		                    <img src="reaimg/${sale.value.saleImgSaveName3}" alt="????????????3" width="500" height="220">
		                </div>
		            </div>
		        </div>
		        <!-- ?????? -->
		        <div class="col-lg-4">
		            <div class="detail" style="text-align: center;">
		                <h5>${sale.key.aptName}</h5>
		                <input type="text" class="form-control" value="????????????   ${sale.key.aptSize}???">
		                <br>
		                <div class="skill_bar sm-m-top-50">
		                    <div class="teamskillbar clearfix m-top-20" data-percent="${79830 / sale.key.price * 100}%">
		                        <h6>?????? ?????? : ${sale.key.price}</h6>
		                        <div class="teamskillbar-bar"></div>
		                    </div>
		                    <!-- End Skill Bar -->
		                    <div class="teamskillbar clearfix m-top-50" data-percent="">
		                        <h6>${sale.key.etc}</h6>
		                        <div class="teamskillbar-bar"></div>
		                    </div>
		                    <input type="hidden" name="addr" value=" ${sale.key.addr}">
		                    
		                    <!-- End Skill Bar -->
		                </div>
		                <% if(userId != null && !userId.trim().equals("") ){ %>
		                	<a class="btn" href="GetSaleDataService.d4b?aptNum=${sale.key.aptNum}&type=<%=type%>">See the Details</a>
		                <%} else{%>
		                	<a class='btn trigger' href='#'>See the Details</a>
		                <%} %>
<%-- 		                <a class="btn trigger" href="GetSaleDataService.d4b?aptNum=${sale.key.aptNum}&type=<%=type%>">See the Details</a>
 --%>		            
 					</div>
		        </div>
		    </div>
		    <hr>
		</c:forEach>
		    <div>
		<%
			int pagersize=5;
			ThePager pager=new ThePager(count, cPage, pageSize, pagersize, "SelectAptListService.d4b?search="+search, type);
		%>
		<%=pager.toString() %>
	</div>
    </div>


    <!-- map -->
    <div class="col-lg-5">
        <div id="map" style="width: 100%; height: 100%;"></div>
    </div>
	</div>
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
					<h3 style="text-align: center;">?????????</h3>
					<br>
					<div class="form-group">
						<label>????????? </label> 
						<input class="form-control" type="text" name="id" id="id" placeholder="ID" style="width: 320px" required="required">
						<label>???????????? </label> 
						<input class="form-control" type="password" name="pwd" id="pwd" required="required" placeholder="PASSWORD" style="width: 320px">
					</div>
					<br>
					<div class="form-group">
						<button type="submit" class="btn btn-primary btn-block btn-lg">Click</button>
						<br>
						<hr>
					</div>
					<br> <span>????????? ????????????????</span> <br>
					<br>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">

								<button type="submit" class="btnJoin" onclick="location.href='JoinCheckGeneric.jsp'">
									<i class="fas fa-user"></i> ??????
								</button>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<button type="submit" class="btnJoin"
									style="padding-left: 20px; padding-right: 20px;" onclick="location.href='JoinCheckREA.jsp'">
									<i class="fas fa-home"></i> ???????????????
								</button>
							</div>
						</div>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
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

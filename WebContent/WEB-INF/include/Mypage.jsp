<%@page import="kr.or.bit.dto.SaleImage"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.bit.dto.BookMark"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.bit.dao.BookMarkDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   String genericUserId = (String) session.getAttribute("userId");
   SaleImage saleImg = (SaleImage) request.getAttribute("saleImg");
   String type = (String) request.getParameter("type");
   BookMarkDao dao = new BookMarkDao();
   List<BookMark> bmList = new ArrayList<BookMark>();
   bmList = dao.getBookMark(genericUserId); //reaId로 리스트 불러오기   
%>   
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<style>
a {
   color: gray;
}

a:hover, a:focus, a:active, a.active {
   color: #ff6863;
   outline: 0;
}

.list-group-item {
   color: gray;
}

.contain {
  position: relative;
  width: 100%;
  max-width: 400px;
}

.contain #text{
  position: absolute;
  top: 10%;
  left: 90%;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  padding: 12px 24px;
  border: none;
  cursor: pointer;
  border-radius: 5px;
  text-align: center;
}
.contain #text:hover {
  color: yellow;
}
/* Style the close button */
#text {
   color: black;
   font-size: 18px;
   font-weight: bold;
}
.card_top_border {
   height:4px;
   width: 100%;
   background-color: #ff6863;
}

.card-body {
   overflow: hidden;
   width : 100%;
}

.card-body ul {
   width: 55%;
   margin: 0 auto;
}

.card-body ul li {
   line-height: 3rem;
}

.card-body ul li i {
   margin-right: 10px;
}
h6{
font-family: 'Jua', sans-serif;
}
</style>
<script>


$(function() {
   getBookMark('24');         
});

function getBookMark(aptSize){
   $.ajax({
        url : 'BookMarkList',
        type : 'post',
        data : {"userId" : $("#myId").val()},
        dataType : 'json',
        success : function(data) {   
            $("#bmContent").empty();
            $.each(data, function(index, element) {
      
               if(element.aptSize==aptSize){
                  
               var content = "";
               content += "<div class='col-lg-4' id='bookmark'>";
               content += "<div class='card_top_border'></div>";
               content += "<div class='card'>";
               content += "<div class='contain'>";
               content += "<a href='GetSaleDataService.d4b?aptNum="+element.aptNum+"&type="+$("#type").val()+"'><img class='card-img-top img-fluid' src='reaimg/"+element.saleImgSaveName1+"' width='100%' height='220'></a>";         
               content += "<div id='text' style='display:inline'><button class='close' type='button' onclick="+"location.href='DeleteBookMarkService.d4b?userId=" +$('#myId').val()+ "&aptNum=" + element.aptNum +"'><i class='fa fa-trash' aria-hidden='true'style='padding:0;border: none;background: none; color:white;'></i></button></div>";       
               content += "</div>";
               content += "<div class='card-body'>";
               content += "<ul>";
               content += "<h6 style='text-align:center;'><b>"+element.aptName+"</b></h6>";
               content += "<li><i class='fa fa-check-circle text-primary'></i>"+element.type+"</li>";   
               content += "<li><i class='fa fa-check-circle text-primary'></i>"+element.price+"만 원</li>";
               content += "<input type='hidden' id='aptNum' value='"+element.aptNum+"'>";
               content += "<input type='hidden' id='aptSize' value='"+element.aptSize+"'>";
               content += "</ul>";
               content += "</div>";
               content += "</div>";
               content += "<br>";
               content += "</div>";  
               
               $('#bmContent').append(content);
               }
            });
        }
    });   
      
}

var close = document.getElementsByClassName("close");
   for (var i = 0; i < close.length; i++) {
        close[i].onclick = function() {
          var div = this.parentElement.parentElement.parentElement;
          div.style.display = "none";
        }
      }

function deleteBk(){

   var userId = $("#myId").val();
   var aptNum = $("#aptNum").val();
   var aptSize = $("#aptSize").val();

   $.ajax({
      url : 'DeleteBookMark?userId='+userId+'&aptNum='+aptNum+'&aptSize='+aptSize,
      type: 'post',
      dataType : 'html',
      success : function(data){
    	  console.log(data);
          if(data.trim()=="success"){
        	  $("#bmContent").empty();
        	  getBookMark(aptSize);
         } 
         
         /* $("#bookmark").empty();
         $("#bookmark").append(data); */
      	
      }
   
    });
   
   
}

</script>
<!-- Page Content -->
<div class="container-fluid">
   <div class="col-lg-12">
      <div class="row">
         <div class="col-lg-2">
            <div class="list-group">
               <a class="list-group-item"></a>
               <a href="#" class="list-group-item">북마크</a>
               <a href="GetGenericUserEditService.d4b?genericUserId=<%=genericUserId%>" class="list-group-item">정보수정</a>
            </div>
         </div>
         <div class="col-lg-1"></div>
         <div class="col-lg-9">
            <h3 style="font-family: 'Jua', sans-serif;">북마크</h3>
            <div class="row">
            <div class="col-sm-12">
            <input type="hidden" id="myId" value="<%=genericUserId%>">
            <input type="hidden" id="type" value="<%=type%>">
 
            <a href="#" onclick="getBookMark('24')">24평</a> &nbsp; | &nbsp; <a href="#" onclick="getBookMark('32')">32평</a>&nbsp; |
            &nbsp; <a href="#" onclick="getBookMark('42')">42평</a> &nbsp;

            <h6 style="float: right;"><img src="<%=request.getContextPath() %>/images/love.gif" style="width: 40px; height: 30px;"><%=genericUserId%> 님의 페이지입니다</h6>
            </div>
            </div>
            <hr>
            <div class="row" id="bmContent">
            <br>                           
         </div>
      </div>
   </div>
</div>
</div>
<!-- /.container -->
<script>
$(function(){
   <%--
   $("#deleteBtn").click(function(){
      location.href="DeleteBookMark?userId=<%=genericUserId%>+'&aptNum='+aptNum'
        onclick='location.href="'DeleteBookMark?userId="'+userId+"&aptNum="+element.aptNum+"''
       $.ajax({
            url : 'DeleteBookMark?userId='+<%=genericUserId%>+'&aptNum='+aptNum,
            type: 'post',
            dataType : 'html',
            success : function(data){
               $("#bookMarkBtn").empty();
               $("#bookMarkBtn").append(data);
               
               //console.log(data);
            }
         
          });
       --%>
});


</script>
<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
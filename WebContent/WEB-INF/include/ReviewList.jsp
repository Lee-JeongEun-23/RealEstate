<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.bit.dto.GenericUser"%>
<%@page import="kr.or.bit.dao.ReviewDao"%>
<%@page import="kr.or.bit.dto.REAImage"%>
<%@page import="kr.or.bit.dto.REAUser"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.bit.dto.Review"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
	<html class="no-js" lang="en">
	<meta charset="UTF-8">
	<title>중개사 후기 목록</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- CSS style -->
	<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>	
		<!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

	<jsp:include page="../../css/css.jsp" />
	
<%	
	REAUser reaUser = (REAUser) request.getAttribute("reaUser");
	String reaId = reaUser.getReaId();
	String genericUserId = (String) session.getAttribute("userId");
	System.out.println("ReviewList userId: " + genericUserId);
	System.out.println("ReviewList reaId: " + reaId);
	
	
	// Review review = new Review();
	// System.out.println("ReviewList review.toString: " + review.toString());
	// java.sql.Date reviewDate = (java.sql.Date) request.getAttribute("reviewDate");
	// String reviewContent = (String) request.getAttribute("reviewContent");
	// int reviewNum = (Integer) request.getAttribute("reviewNum");
	Date today = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy. MM. dd");
%>
<input type="hidden" id="getREAId" value="<%=reaId%>">
<input type="hidden" id="getUserId" value="<%=genericUserId%>">
<input type="hidden" id="getDate" value="<%=sdf.format(today) %>">

<section id="id" class="about">
	<div class="container">
		<div class="about_content">
			<div class="container-fluid">
				<div class="card-header py-3">
					<h5 class="m-0 font-weight-bold text-primary">계약자 생생후기</h5>
				</div>
				<div class="card-body">
					<div class="table-responsive">
					
					<div id="review_table">
						<form id="review_form" name="review_form" method="post">
							<table class="table table-bordered" id="reviewTable"
								style="text-align: center; margin: auto; width: 100%; border: none;">								
			                    <tr>
			                        <td style="padding: 0;">
			                        <div align="left" style="padding-left: 10px;">
		                        		날짜:&nbsp;<input type="text" id="reviewDate" name="reviewDate" value="<%=sdf.format(today) %>" 
			                        					readonly="readonly" style="display: inline; width: 50%; padding: 0;"></div>
			                       	<td style="padding: 0;">
			                       	<div align="right" style="padding-right: 10px;">
			                       		작성자:&nbsp;<input type="text" id="userId" name="userId" value="<%=genericUserId%>" 
			                       						readonly="readonly" style="; display: inline; width: 30%; padding: 0;">
			                       	</div></td>
			                    </tr>
			                    <tr>
			                    	<td colspan="4" align="left" id="contentTd">
			                    		<textarea id="reviewContent" name="reviewContent" class="ckeditor"
											rows="5" style="resize: none; width: 100%; border: 1px solid #d2d0d0;"></textarea>
									<div align="right">
			                    		<button type="submit" id="send" class="btn btn-primary btn-block btn-lg">작성 완료</button>
									</div></td>
			                    </tr>
		                   </table>
		                   </form>
						</div>
						</div>
						<div style="margin-top: 20px; margin-bottom: 20px;">
							<hr>
						</div>
						<!-- 후기글 뿌려지는 곳 -->
						<table style="width: 100%;" id="reviewList">
						<tbody id="reviewListTbody">
						</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
 
<jsp:include page="./ScrollUp.jsp"></jsp:include>

<script type="text/javascript">
var reaId = $("#getREAId").val();
var reviewNum = $("#reviewNum").val();
var reviewId = $("#reviewId").val();

	$(function() {
		getReviewList();
		insert_review();
	});
	 
	function insert_review(){
		$("#send").on("click", function(){
			var param = {
					userId : $('#getUserId').val(),
					reviewContent : $('#reviewContent').val(),
					reaId : $('#getREAId').val()
					};
			$.ajax({
				url: 'InsertReview', // kr.or.bit.ajax
				dataType: 'text',
				type: 'post',
				data: param,
				success: function(data) {
					console.log(data);
					if(data.trim() == "success"){
						$("#reviewContent").val("");
						$("#reviewListTbody").empty();
						getReviewList();
					}
				}
			})
			return false;
		})
	}
	
	

	function getReviewList(){ //리뷰 리스트 가져오기
		$.ajax({
			url:"GetReviewList?reaId="+reaId,
			dataType:"JSON",
			type:"POST",
			success: function(data){
				var review = "";
				$.each(data,function(index, element){
					review += "<tr>";
					review += "<td align='left' width='70%'>";
					review += "<span>" + element.reviewDate+ "</span></td>";
					review += "<td align='right'>";
					review += "작성자: <div id='reviewId'><span>"+element.userId+"</span></div></td>";
					review += "</tr>";
					review += "<tr>";
					review += "<td colspan='2' style='height: 100px;'>";
					review += "<textarea id='reveiwContent' name='reviewContent' rows='3' style='resize: none; width: 100%; border: 1px solid #d2d0d0;' readonly>";
					review += element.reviewContent+"</textarea>";
					review += "<input type='hidden' id='reviewNum' name='reviewNum' value='"+element.reviewNum+"'>";
					review += "<div class='row'>"
					review += "<div class='col-sm-6'>"
					review += "<button class='btn btn-primary btn-block btn-sm' onclick='delete_review()'>삭제";
					review += "<input type='hidden' id='reviewId_delete' value='"+element.userId+"'</button></div>";
					review += "<div class='col-sm-6'>"
					review += "<button class='btn btn-primary btn-block btn-sm' onclick='edit_reviewBtn()'>수정";
					review += "<input type='hidden' id='reviewId_edit' value='"+element.userId+"'</button></div>";
					review += "</div></div><hr></td></tr>";					
				});
				$("#reviewListTbody").append(review);
			}
	});
	}
	
	function delete_review(){
		var reviewId = $(event.target.children).val();
		//console.log(reviewId);
		//console.log($("#getUserId").val().trim())
		if(reviewId == $("#getUserId").val().trim()){
			$.ajax({
				url:'DeleteReview?reviewNum='+$("#reviewNum").val(),
				dataType: 'text',
				type: 'post',
				success:function(data){
					if(data.trim() == "success"){
						$("#reviewListTbody").empty();
						getReviewList();
					}
				}
			});
			return;
		}else {
			alert("권한이 없습니다.");
			return;
		}
	}
	function edit_reviewBtn(){
		var userId = $("#getUserId").val().trim();
		console.log(userId);
		var reviewId = $(event.target.children).val();
			//$("#reviewId").text().trim();
		console.log(reviewId);
		var reviewNum =  $("#reviewNum").val().trim();
		//console.log(reviewNum);
		if(reviewId == $("#getUserId").val().trim()){
			$("#reviewListTbody").hide();
			$("#review_table").empty();
			var table = "";
			table += "<form action='UpdateReviewService.d4b' method='post'>";
			table += "<table class=table table-bordered' id='reviewTable'";
			table += " style='text-align: center; margin: auto; width: 100%; border: none;'>";
			table += "<tr>";
			table += "<td style='padding: 0;'>";
			table += "<div align='left' style='padding-left: 10px;'>날짜:&nbsp;";
			table += "<input type='text' id='editDate' name='editDate' value='"+$("#getDate").val()+"'";
			table += " readonly='readonly' style='display: inline; width: 50%; padding: 0;'></div>";
			table += "<td style='padding: 0;'>";
			table += "<div align='right' style='padding-right: 10px;'>작성자:&nbsp;";
			table += "<input type='text' id='editId' name='editId' value='"+reviewId+"'";
			table += " readonly='readonly' style='display: inline; width: 30%; padding: 0;'>";
			table += "<input type='hidden' id='editNum' name='editNum' value='"+$("#reviewNum").val().trim()+"'>";
			table += "<input type='hidden' id='editREAId' name='editREAId' value='"+$("#getREAId").val()+"'>";
			table += "</div></td></tr>";
			table += "<tr>";
			table += "<td colspan='4' align='left' id='contentTd'>";
			table += "<textarea id='editContent' name='editContent' class='ckeditor' rows='5'";
			table += " style='resize: none; width: 100%; border: 1px solid #d2d0d0;'></textarea>";
			table += "<div align='right'>";
			table += "<input type='submit' id='edit_send' class='btn btn-primary btn-block btn-lg' onclick='alert_edit()' value='수정 완료'>";
			table += "</div></td></tr></table></form>";
			$("#review_table").append(table);
			
		}else {
			alert("권한이 없습니다.");
			return;
		}
	}
	

</script>

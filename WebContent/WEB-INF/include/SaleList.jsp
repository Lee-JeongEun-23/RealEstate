<%@page import="kr.or.bit.dao.SaleDao"%>
<%@page import="kr.or.bit.service.GetSaleDataService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.bit.dto.Sale"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String aptNum = request.getParameter("aptNum");
	List<Sale> saleList = new ArrayList<Sale>();
    String reaId = (String) request.getAttribute("reaUserId");
    int result = 0;
	saleList = (List) request.getAttribute("saleList");
	SaleDao dao = new SaleDao();
	result = dao.deleteSale(aptNum);
	saleList = dao.getSaleList(reaId);
	if(result > 0) {
		request.setAttribute("reaUserId", reaId);
		request.setAttribute("saleList", saleList);
	}
	String type=null;
	if(type==null || type.trim()==""){
		type= (String) request.getAttribute("type");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member List</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


</head>
<body>
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">매물 관리</h6>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0">
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
					</tr>
				</thead>
				<tbody>
				<c:forEach var="saleData" items="<%=saleList%>" varStatus="status">
					<input type="hidden" id="type" value=<%=type %>>
					<tr>
						<td>${saleData.aptSize}</td>
						<td>${saleData.type}</td>
						<td>${saleData.addr}</td>
						<td>${saleData.aptName}</td>
						<td>${saleData.aptDong}</td>
						<td>${saleData.aptHo}</td>
						<td>${saleData.price}</td>
						<td>${saleData.isContract}</td>
						<td><a href="SaleEdit.jsp?aptNum=${saleData.aptNum}">
								수정</a></td>
						<td><a href="SaleEdit.jsp?aptNum=${saleData.aptNum}">
								삭제</a></td>
					</tr>
					</c:forEach>
					</tbody>
			</table>
		</div>
	</div>
</body>
</html>
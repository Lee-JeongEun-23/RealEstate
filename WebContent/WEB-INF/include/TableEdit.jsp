
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member List</title>
</head>
<body>
<div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">지난 매물 관리</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
               <%
                    Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					
					try {

						String sql="select id, pwd, name, age, gender, email from koreamember";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
               %>
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>면적</th>
                      <th>유형</th>
                      <th>주소</th>
                      <th>매매가</th>
                      <th>보증금</th>
                      <th>향</th>
                      <th>매물 특징</th>
                      <th>재등록</th>
                      <th>삭제</th>
                    </tr>
                  </thead>
                  	<% while (rs.next()) { %>
                    <tr>
                      <td><%= rs.getString("id") %></td>
                      <td><%= rs.getString("pwd") %></td>
                      <td><%= rs.getString("name") %></td>
                      <td><%= rs.getString("age") %></td>
                      <td><%= rs.getString("gender") %></td>
                      <td><%= rs.getString("email") %></td>
                      <td><%= rs.getString("email") %></td>
                      <td><a href="MemberDetail.jsp?id=<%= rs.getString("id") %>">
                      		등록</a>
                      </td><td><a href="MemberDetail.jsp?id=<%= rs.getString("id") %>">
                      		삭제</a>
                      </td>
                    </tr>
                  </tbody>
                 	  <% } %>
                </table>
              <%
				} catch(Exception e) {
					e.getStackTrace();
				} finally {

				}
			  %>
              </div>
            </div>
</body>
</html>
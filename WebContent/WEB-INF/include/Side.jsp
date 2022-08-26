<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="side">
	<a href="#" class="close-side"><i class="fa fa-times"></i></a>
	<div class="widget">
		<h6 class="title">관리자 페이지</h6>
		<ul class="link">
           <li class="nav-item dropdown">
               <div class="dropdown-menu" aria-labelledby="pagesDropdown">
                   <a class="dropdown-item" href="DeptChart.jsp">부서 차트</a>
                   <a class="dropdown-item" href="SalChart.jsp">연봉 차트</a> <!-- 내가 선점 했음 여기 내자리 -->
               </div>
           </li>	
			<li><div><hr></div></li>           	
			<li><a href="SelectGenericUserService.d4b?type=A00"><span>&nbsp;회원 관리</span></a></li>
			<li><div><hr></div></li>
			<li><a href="getAdminMain.d4b?type=A00">메인 페이지</a></li>
		</ul>
	</div>
</div>
<%@page import="kr.or.bit.dto.Sale"%>
<%@page import="kr.or.bit.dto.REAUser"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="reaId" value="${sessionScope.userId}" />
<%
Map<REAUser, Sale> conMap = (Map<REAUser, Sale>)request.getAttribute("conMap");
%>
<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $("#jung1").datepicker({
      showOtherMonths: true,
      selectOtherMonths: true,
      dateFormat: 'yy-mm-dd' 
    });
    $("#jung2").datepicker({
      showOtherMonths: true,
      selectOtherMonths: true,
      dateFormat: 'yy-mm-dd' 
    });
    $("#jan").datepicker({
        showOtherMonths: true,
        selectOtherMonths: true,
        dateFormat: 'yy-mm-dd' 
      });
    $("#indo").datepicker({
        showOtherMonths: true,
        selectOtherMonths: true,
        dateFormat: 'yy-mm-dd' 
      }); 
    $("#kobu").datepicker({
        showOtherMonths: true,
        selectOtherMonths: true,
        dateFormat: 'yy-mm-dd' 
      }); 

  });

function Btn1(){
    var name1 = $("#username1").val();
	
	$.ajax({
        url : 'SelectContractUser',
        type : 'post',
        dataType : 'json',
        success : function(data) {	
        	$("#sellerInfo").empty();
        	
            $.each(data, function(index, element) {
            	if(name1 == element.userName){	            	
        		
            		var userData1 = "";
            		userData1 += "<tr><td rowspan='2' style='text-align: center;''>매도인<br><input type='text' style='width: 80px;' id='username1' value='"+element.userName+"'></td>";
            		userData1 += "<td>주 소(도로명)</td><td><input type='text' value='"+element.userAddr+' '+element.userDetailAddr+"'style='width: 460px;'><input type='button'  value='도로명 검색' ></td>";
            		userData1 += "<tr><td style='text-align: center;'>주민등록번호</td><td><input type='text' value='"+element.frontResNum+"' style='width: 80px;'> - <input type='text' value='"+element.backResNum+"' style='width: 80px;'>";
            		userData1 += "&nbsp;전화&nbsp;<input type='text' value='"+element.frontResNum+"' style='width: 160px'>";
            		userData1 += "&nbsp;성명&nbsp;<input type='text' value='"+element.userName+"'style='width: 119px'></td></tr>";
      		
            		$('#sellerInfo').append(userData1);
            	}
            });
		}
	});	
	
}
function Btn2(){
	var name2 = $("#username2").val();
	
	$.ajax({
        url : 'SelectContractUser',
        type : 'post',
        dataType : 'json',
        success : function(data) {	
        	$("#buyerInfo").empty();
        	
            $.each(data, function(index, element) {
            	if(name2 == element.userName){	            	
        		
            		var userData2 = "";
            		userData2 += "<tr><td rowspan='2' style='text-align: center;''>매도인<br><input type='text' style='width: 80px;' id='username1' value='"+element.userName+"'></td>";
            		userData2 += "<td>주 소(도로명)</td><td><input type='text' value='"+element.userAddr+' '+element.userDetailAddr+"'style='width: 460px;'><input type='button'  value='도로명 검색' ></td>";
            		userData2 += "<tr><td style='text-align: center;'>주민등록번호</td><td><input type='text' value='"+element.frontResNum+"' style='width: 80px;'> - <input type='text' value='"+element.backResNum+"' style='width: 80px;'>";
            		userData2 += "&nbsp;전화&nbsp;<input type='text' value='"+element.frontResNum+"' style='width: 160px'>";
            		userData2 += "&nbsp;성명&nbsp;<input type='text' value='"+element.userName+"'style='width: 119px'></td></tr>";
      		
            		$('#buyerInfo').append(userData2);
            	}
            });
		}
	});			  
}

function result(){
	var price = document.getElementById("price").value;
	document.getElementById("money").value = price * 0.1;	
	document.getElementById("money2").value = price * 0.4;
	document.getElementById("change").value = price * 0.5;
	document.getElementById("give").value = price * 0.009;
}



</script>
<style type="text/css">
.container {
	text-align: center;
	margin: 5% 5% 5% 5%;
	margin-left: 26%;
	margin-right: 26%;
}

.h1 {
	font-style: italic;
}

input[type="text"] {
	text-align: right;
}

.btn-primary {
	color: #fff;
	background-color: #ff6863;
	border: 2px solid; 
	border-color: #ff6863;
	padding: 5px 20px 5px 20px;
	margin-bottom: 1rem;
	font-size: 20px;
}

.btn {
	-webkit-transition: all 0.6s;
	transition: all 0.6s;
	text-transform: uppercase; 
	font-size: 30px; 
	border-radius: 0;
	border: 1px solid;
}

.btn-block {
	display: block;
}

```html #print-button{
  display : none;
}
</style>
</head>
<body>
	<div class="container">
	  <input type="hidden" id="reaId" value="${reaId}">
		<span style="font-size: 30px">아파트 계약서 작성</span>
		<div class="content" style="text-align: left;">
			<br>
			<br>
			<br>
			<c:forEach var="sale" items="<%=conMap%>" varStatus="status">
			<span style="font-size: 18px"> 매도인과 매수인 쌍방은 아래 표시 부동산에 관하여 다음 내용과 같이 계약을 체결한다.</span>
			<br>
			<br>
			<br>
			<span style="font-size: 18px;">소재지 &nbsp;&nbsp;&nbsp;</span> <input type="text" value="${sale.value.roadAddr}" placeholder="내용을 입력해주세요." style="width: 663px; height: 30px; font-family: 26px; text-align: left;">
			<br>
			<br>
			<span style="font-size: 18px;">계약 내용</span>
			<br>
			<h5>&nbsp;&nbsp;제 1조 위 부동산의 매매에 대하여 매도인과 매수인은 합의에 의하여 매매대금을 아래와 같이 지불하기로 한다.</h5>
			<table border="1" style="width: 100%; text-align: left; font-size: 14px;"  >
				<tr ><td style="text-align: center;">매매대금</td><td style="text-align: center; ">一金</td><td><input type="text" id ="price" value="${sale.value.price}" name="#" style="width: 250px" placeholder="10,000">원정 (\&nbsp;<input type="text" name="#" style="width: 150px" placeholder="100,000,000">)&nbsp;&nbsp;&nbsp;<button type="button" onclick="result();" style="font-size: 10px;">자동 계산</button>
				<tr ><td style="text-align: center; ">계약금</td><td style="text-align: center; ">一金</td><td><input type="text" id="money" style="width: 250px">원정은 계약시에 지불하고 영수함. 영수자(<input type="text" placeholder="자필서명" style="width: 70px">)(인)
				<tr ><td style="text-align: center; font-size: 12px">현 임대보증금</td><td style="text-align: center; ">一金</td><td><input type="text" name="#" style="width: 250px">원정은&nbsp;&nbsp;
						<select>
							<option>현 상태에서 매수인이 승계함.</option>
							<option>매도인이 잔금지급일까지 말소한다.</option>
							<option>특약사항에 별도 명시한다.</option>
							<option>매수인이 인수한다.</option>
							<option>매수인이 인수하지 아니한다.</option>
						</select>		
				<tr ><td rowspan="2" style="text-align: center; ">중도금</td><td style="text-align: center; ">一金</td><td><input type="text" id="money2" style="width: 250px">원정은 &nbsp;&nbsp;<input type="text" id="jung1" style="width: 100px; text-align: right;">일에 지불한다.</td>
				<tr ><td style="text-align: center; ">一金</td><td><input type="text" name="#" style="width: 250px">원정은 &nbsp;&nbsp;<input type="text" id="jung2" style="width: 100px; text-align: right;">일에 지불한다.</td>
				<tr ><td style="text-align: center; ">잔금</td><td style="text-align: center; ">一金</td><td><input type="text" id="change" style="width: 250px" placeholder="1억">원정은 &nbsp;&nbsp;<input type="text" id="jan" style="width: 100px; text-align: right;">일에 지불한다.</td>
			</table>
			</c:forEach>
			<br>
			<br>
			<span style="font-size: 14px">제 2조 [소유권이전 등] 매도인은 매매대금의 잔금 수령과 동시에 매수인에게 소유권이전 등기에 필요한 모든 서류를 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;교부하고 등기 절차에 협력하여야 하며, 위 부동산의 인도일은 <input type="text" id="indo" style="width: 100px; text-align: right;">로 한다.</span><br>
			<span style="font-size: 14px">제 3조 [제한물권 등의 소멸] 매도인은 위 부동산에 설정된 저당권, 지상권, 임차권 등 소유권의 행사를 제한하는 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;사유가 있거나, 제세공과금과 기타 부담금의 미납 등이 있을 때에는 잔금 수수일까지 그 권리의 하자 및 부담 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;등을 제거하여 완전한 소유권을 매수인에게 이전한다. 다만, 승계하기로 합의하는 권리 및 금액은 그러하지 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아니하다.</span><br>
			<span style="font-size: 14px">제 4조 [지방세 등] 위 부동산에 관하여 발생한 수익의 귀속과 제세 공과금 등의 부담은 위 부동산의 인도일을 기준으 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;로 하되, 지방세의 납부의무 및 납부책임은 지방세법의 규정에 의한다.</span><br>
			<span style="font-size: 14px">제 5조 [계약의 해제] 매수인이 매도인에게 중도금(중도금이 없을때에는 잔금)을 지불하기전 까지 매도인은 계약금의 배 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;액을 상환하고, 매수인은 계약금을 포기하고 본 계약을 해제할 수있다.</span><br>
			<span style="font-size: 14px">제 6조 [채무불이행과 손해배상의 예정] 매도인 또는 매수인은 본 계약상의 내용에 대하여 불이행이 있을 경우, 그 상대 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;방은 불이행 한자에 대하여 서면으로 최고하고 계약을 해제할 수 있다. 그리고 계약 당사자는 계약해제에 따른 손 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;해배상을 각각 상대방에게 청구할 수 있으며, 손해배상에 대하여 별도의 약정이 없는 한 계약금을 손해배상의 기 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;준으로 본다.</span><br>
			<span style="font-size: 14px">제 7조 [중개보수] 개업공인중개사는 매도인 또는 매수인의 본 계약 불이행에 대하여 책임을 지지 않는다. 또한 중개보수 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;는 본 계약 체결과 동시에 계약 당사자 쌍방이 각각 지불하며,  개업공인중개사의 고의나 과실없이 본 계약이 무 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;효, 취소 또는 해제 되어도 중개보수는 지급한다. 공동중개인 경우에 매도인과 매수인은 자신이 중개 의뢰한 개업 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공인중개사에게 각각 중개보수를 지급한다.</span><br>
			<span style="font-size: 14px">제 8조 [중개보수 외] 매도인 또는 매수인이 본 계약 이외의 업무를 의뢰한 경우,  이에 관한 보수는 중개보수와는 별도로  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;지급하며 그 금액은 합의에 의한다.</span><br>
			<span style="font-size: 14px">제 9조 [중개대상물확인설명서 교부 등] 개공인중개사는 중개대상물확인설명서를 작성하고 업무보증관계증서(공제증서  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;등) 사본을 첨부하여 거래당사자 쌍방에게 교부한다. (교부일자: <input type="text" id="kobu" style="width: 100px; text-align: right;">)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset"  value="계약조항 초기화"></span><br>
			<span style="font-size: 14px">중개보수는 <input type="text" id="give" style="width: 120px">원 으로 한다. (부가가치세 별도, 계약서인쇄 생략)</span><br>
			<span style="font-size: 14px"></span><br>
			<br>
			<br>
			<span style="font-size: 18px;">특약사항</span><br>
			<br>
			<textarea rows="6" cols="105" placeholder="내용을 입력해주세요" style="resize: none;"></textarea>
			<br>
			<br>
			<br>			
			<table border="1" style="width: 100%; text-align: left; font-size: 14px;" id="sellerInfo">
				<tr><td rowspan="2" style="text-align: center;">매도인<br><input type="text" style="width: 80px;" id="username1"><br><button type="button" onclick="Btn1();" style="font-size: 10px;">정보 불러오기</button></td><td>주 소(도로명)</td><td><input type="text" placeholder="도로명 주소를 모르는 경우 우측에 도로명 검색을 클릭하세요!" style="width: 460px;"><input type="button"  value="도로명 검색" ></td>
				<tr><td style="text-align: center; ">주민등록번호</td><td><input type="text" style="width: 80px;"> - <input type="text" style="width: 80px;">&nbsp;전화&nbsp;<input type="text" style="width: 160px"> &nbsp;성명&nbsp;<input type="text" style="width: 119px"></td></tr>	
			
			</table>
			<br>
			<table border="1" style="width: 100%; text-align: left; font-size: 14px;" id="buyerInfo">
				<tr><td rowspan="2" style="text-align: center;">매수인<br><input type="text" style="width: 80px;" id="username2"><br><button type="button" onclick="Btn2();" style="font-size: 10px;">정보 불러오기</button></td><td>주 소(도로명)</td><td><input type="text" placeholder="도로명 주소를 모르는 경우 우측에 도로명 검색을 클릭하세요!" style="width: 460px;"><input type="button"  value="도로명 검색" ></td>
				<tr><td style="text-align: center; ">주민등록번호</td><td><input type="text" style="width: 80px;"> - <input type="text" style="width: 80px;">&nbsp;전화&nbsp;<input type="text" style="width: 160px"> &nbsp;성명&nbsp;<input type="text" style="width: 119px"></td></tr>	
			
			</table>
			<br>
			<c:forEach var="reaU" items="<%=conMap%>" varStatus="status">
			<table border="1" style="width: 100%; text-align: left; font-size: 14px;" id="REAInfo">
				<tr><td rowspan="3" style="text-align: center; width: 84px;">개&nbsp;&nbsp;업<br>공인중개사</td><td style="width: 84px; font-size: 13px;">사무소 소재지</td><td colspan="3"><input type="text" value="${reaU.key.officeAddr}"style="width: 100%"></td></tr>
				<tr><td style="width: 84px; font-size: 13px">사무소 명칭</td><td colspan="1"><input type="text" value="${reaU.key.officeName}" style="width: 100%"></td><td style="width: 100px; text-align: center;">대표자 명</td><td  style="width: 100px; text-align: center;"><input type="text" value="${reaU.key.reaName}" style="width: 100%"></td></tr>
				<tr><td style="width: 84px; font-size: 13px">전화번호</td><td><input type="text" value="${reaU.key.officeHp}" style="width: 135px">&nbsp;등록번호&nbsp;<input type="text" value="${reaU.key.regNum}" style="width: 137px"></td><td>소속공인중개사</td><td>(<input type="text" style="width: 90px; text-align: center;" placeholder="자필서명">)</td></tr>
			</table>

			<br>
			<br>
			<br>
			<div style="text-align: center;">
				<button class="btn btn-primary btn-lg" style="width: 180px; height: 50px; font-size: 15px;" onclick="location.href='UpdateContractService.d4b?aptNum=${reaU.value.aptNum}'">계약 완료</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="btn btn-primary btn-lg" style="width: 180px; height: 50px; font-size: 15px;" id="print-button" onclick="location.href='javascript:window.print()'">인쇄</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="btn btn-primary btn-lg" style="width: 180px; height: 50px; font-size: 15px;">취소</button>

			</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>
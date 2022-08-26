<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String type=(String) request.getAttribute("type");
	if(type==null || type.trim()==""){
	type= (String) request.getParameter("type");
	}
	System.out.println("타타타타입" + type);
%>
<script>
$.noConflict();
/*
부트스트랩 사용으로 jquery UI(autocomplete)와 충돌나는 경우가 종 종 있을 때
$.noConflict();를 통해서 다른 버전의 jquery가  충돌 시 해결 그리고 
jQuery(document).ready(function( $ ) { 구문을 통해서 다시 $를 alias로 사용
 */
jQuery(document).ready(function( $ ) {
	var addrList = []; //주소 저장 리스트
	
	$.ajax({
        url : 'AddrList',
        type : 'post',
        dataType : 'json',
        success : function(data) { 
     	$.each(data, function(index, element) {
     		if(addrList.indexOf((element.addr.split(" ")[1] + " " + element.addr.split(" ")[2])) == -1 ) addrList.push(element.addr.split(" ")[1] + " " + element.addr.split(" ")[2]);
			//json으로 넘어온 주소를 split으로 잘라서 배열에 넣어 출력
     	});

     	$("#searchInput").autocomplete({ //오토 컴플릿트 시작
			source : addrList, // source 는 자동 완성 대상
			select : function(event, ui) { //아이템 선택시

			},
			focus : function(event, ui) { //포커스 가면
				return false;//한글 에러 잡기용도로 사용됨
			},
			minLength : 1,// 최소 글자수
			autoFocus : true, //첫번째 항목 자동 포커스 기본값 false
			classes : { //잘 모르겠음
				"ui-autocomplete" : "highlight"
			},
			delay : 100, //검색창에 글자 써지고 나서 autocomplete 창 뜰 때 까지 딜레이 시간(ms)
			//            disabled: true, //자동완성 기능 끄기
			position : {
				my : "right top",
				at : "right bottom"
			}, //잘 모르겠음
			close : function(event) { //자동완성창 닫아질때 호출
			}
		});     	
     	
        }
	});

	
	$("#submitbtn").click(function() {
		
		var address= $("#searchInput").val().trim();
		var addrSplit =[];
		addrSplit= address.split(" ");
		console.log(addrSplit[0]);
		//console.log(address[0]+address[1]+address[2]);	
// 		location.href="'SelectaptListService.d4b?address="+address[0]+address[1]+address[2];
		location.href='SelectAptListService.d4b?search=' + addrSplit[0] + " " + addrSplit[1] +'&type=<%=type%>';
	});
	
	});
</script>
<style type="text/css">
 .ui-autocomplete {
    max-height: 100px;
    overflow-y: auto;
    overflow-x: hidden;
    font-family: 'Noto Sans KR', sans-serif;
    background-color: rgba( 255, 255, 255, 0.5);
  }  
</style>
<section id="hello" class="home bg-mega">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="main_home">
					<div class="home_border">
						<div class="home_text">
							<h1 class="text-white">
								맞춤형 집 <br />구하는 기술
							</h1>
							<br>
						</div>

						<div class="input-group">
							<input class="form-control" id="searchInput" type="text"
								placeholder="동으로 검색">
							<div id="data">
							<button type="submit" id="submitbtn" style="height: 45px;" > <!-- onclick="location.href='SelectaptListService.d4b?search='" -->
								<i class="fa fa-search"></i>
							</button>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
</section>
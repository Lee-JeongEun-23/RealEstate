<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap"
	rel="stylesheet">

<head>
<meta charset="utf-8">
<title>Drop 4our bit</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0d0c0a21e3bf46994d7f7a41d9cc729f&libraries=services"></script>

<jsp:include page="../css/css.jsp"></jsp:include>

<style type="text/css">
h2 {
	font-family: 'Jua', sans-serif;
}

input {
	height: 40px;
}

form-control {
	height: 40px;
}

.genderbox {
	padding: 1px;
	border: 1px solid #cccccc;
	height: 40px;
}

#id_check, #tdEmail, #tdPw, #tdCh {
	font-size: 13px;
	font-family: 'Jua', sans-serif;
	color: #ff6863;
}

.form-group input[type="text"], input[type="email"], input[type="password"]
	{
	border: 1px solid #e5e5e5;
}
/* Center the avatar image inside this container */
.imgcontainer {
	text-align: center;
}
/* Avatar image */
img.avatar {
	border-radius: 50%;
}
</style>

<script>
$(function() {
// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
	$("#userId").blur(function() {
		// id = "id_reg" / name = "userId"
		var userId = $('#userId').val();
		var idReg = /^[a-zA-Z0-9]{4,12}$/;
		$.ajax({
			url : '../JoinIdCheck?userId='+ userId,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다.");
						$("#id_check").css("color", "#ff6863");
						$("#signUp").attr("disabled", true);
					} else {
						if(!idReg.test(userId)){
							// 0 : 아이디 길이 / 문자열 검사
							$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다.");
							$('#id_check').css('color', '#ff6863');
							$("#signUp").attr("disabled", true);
						} else if(userId == ""){
							$('#id_check').text('아이디를 입력해주세요.');
							$('#id_check').css('color', '#ff6863');
							$("#signUp").attr("disabled", true);				
						} else{
							$('#id_check').text('사용가능한 아이디입니다.');
							$('#id_check').css('color', '#669999');
							$("#signUp").attr("disabled", false);
						}
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
		
    let idReg = /^[a-z]{1}[a-z0-9]{2,15}$/; //3~16자리의 영문+숫자 조합의 id 정규표현식
    let passReg =/^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;//영문, 숫자 혼합하여 6~20자리 이내
    let emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;//email정규표현식
    let phoneReg = /^\d{3}-\d{3,4}-\d{4}$/;//휴대폰 정규표현식




    $('#userPwd').blur(function() {
    	console.log("유효성 체크");
        if (!passReg.test($('#userPwd').val())) {
            $('#pwd_check').text("3~16자리의 문자와 숫자 형태의 패스워드를 입력해주세요.");
            $("#pwd_check").css("color", "#ff6863");
            $("#signUp").attr("disabled", true);
        } else {
            $('#pwd_check').text("동일한 패스워드를 한 번 더 입력해주세요.");
            $("#pwd_check").css("color", "#669999");
            $('#pwdCheck').blur(function() {
                if ($('#userPwd').val() != $('#pwdCheck').val()) {
                    $('#pwd_pwd_check').text("암호가 일치하지 않습니다.");
                    $("#pwd_pwd_check").css("color", "#ff6863");
                	$("#signUp").attr("disabled", true);
                } else {
                    $('#pwd_pwd_check').text("암호가 일치합니다.");
                    $("#pwd_pwd_check").css("color", "#669999");
                    $("#signUp").attr("disabled", false);
                }
            });
        }
    });
    
    $('#userPhoneNum').blur(function(){
        if(!phoneReg.test($('#userPhoneNum').val())){ //정규표현식에 맞으면
        	$('#phone_check').text("핸드폰 번호 형식에 맞지 않습니다.");
        	$("#phone_check").css("color", "#ff6863");
            $("#signUp").attr("disabled", true);
        }else{
           $('#phone_check').text("");
           $("#signUp").attr("disabled", false);
        }
       
     });
    
});
</script>
</head>
<body data-spy="scroll" data-target=".navbar-collapse">
	<div class="culmn">
		<!--Home page style-->

		<!-- Top jsp -->
		<nav
			class="navbar navbar-light navbar-expand-lg  navbar-fixed ivory no-background bootsnav">
			<jsp:include page="../WEB-INF/include/Top.jsp"></jsp:include>

			<!-- Side jsp -->
			<jsp:include page="../WEB-INF/include/Side.jsp"></jsp:include>
		</nav>
		<!--Login Sections-->

		<section id="join" class="about roomy-100">
			<form action="<%=request.getContextPath() %>/InsertGenericUserService.d4b" method="post" name="loginForm">
				<div class="container">
					<div class="about_content">
						<div class="row">
							<div class="col-md-3"></div>
							<div class="col-md-6">
								<div class="signup-form">

									<br> <br> <br>
									<h2 style="text-align: center">개인회원 회원가입</h2>
									<br>
									<hr>

									<div class="form-group">
										<label>아이디 &nbsp;&nbsp;&nbsp;&nbsp;<span id="id_check"></span></label>
										<input type="text" class="form-control" name="userId"
											id="userId" required="required">
										<div id="userId_check"></div>
									</div>
									<div class="form-group">
										<label>비밀번호 &nbsp;&nbsp;&nbsp;&nbsp;<span id="tdPw"></span></label>
										<input type="password" class="form-control" name="userPwd"
											id="userPwd" required="required">
											<div id="pwd_check"></div>
									</div>
									<div class="form-group">
										<label>비밀번호 확인 &nbsp;&nbsp;&nbsp;&nbsp;<span id="tdCh"></span></label>
										<input type="password" class="form-control" name="pwdCheck"
											id="pwdCheck" required="required">
											<div id="pwd_pwd_check"></div>
									</div>
									<div class="form-group">
										<label>이름 &nbsp;&nbsp;&nbsp;&nbsp;<span id="tdId"></span></label>
										<input type="text" class="form-control" name="userName"
											id="userName" required="required">
									</div>
									<div class="form-group">
										<label>주민등록번호 &nbsp;&nbsp;&nbsp;&nbsp;<span id="tdId"></span></label>
										<div class="row">&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="text" class="form-control" name="frontResNum" id="frontResNum"
												required="required" style="width:41%;">&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;<input type="password"
												class="form-control" name="backResNum" id="backResNum"
												required="required" style="width:41%;">
										</div>
									</div>
									<div class="form-group">
										<label>휴대폰번호 &nbsp;&nbsp;&nbsp;&nbsp;<span id="tdCh"></span></label>
										<input type="text" class="form-control" name="userPhoneNum"
											id="userPhoneNum" required="required" placeholder="010-0000-0000">
											<div id="phone_check"></div>
									</div>
									<div class="form-group">
										<label>주소 &nbsp;&nbsp;&nbsp;&nbsp;<span id="tdCh"></span></label>
										<div class="row">&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" class="form-control" name="userAddr" id="userAddr"
											required="required" placeholder="주소" style="width:72%;"> &nbsp;&nbsp;
											<input type="button" onclick="searchAddr()" value="주소 검색"><br><br>
										</div>
										<input type="text" class="form-control" name="userDetailAddr" id="userDetailAddr"
											required="required" placeholder="상세주소" style="width:77%;"><br>
										<input type="hidden" id="userCode" name="userCode" value="U01">
										<div id="map"
											style="width: 300px; height: 300px; margin-top: 10px; margin-left:17%;display: none"></div>
									</div><br>
									
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6">
												<button type="submit" id="signUp"
													class="btn btn-primary btn-block btn-lg">Sign Up</button>
											</div>
											<div class="col-sm-6">
												<button type="submit"
													class="btn btn-primary btn-block btn-lg" onclick="location.href='../getMain.d4b'">Cancel</button>
											</div>
										</div>
									</div>
									<br> <br>
									<div class="text-center">
										이미 회원이신가요? <a href="../LoginPageService.d4b">Click here</a>
									</div>

									<br> <br> <br>
								</div>
							</div>
						</div>
					</div>
					<!--End off row-->
				</div>
				<!--End off container -->
			</form>
		</section>

		<!-- scroll up-->
		<div class="scrollup">
			<a href="#"><i class="fa fa-chevron-up"></i></a>
		</div>
		<!-- End off scroll up -->
		<jsp:include page="../WEB-INF/include/Bottom.jsp"></jsp:include>
	</div>

	<!-- JS includes -->
	<jsp:include page="../js/js.jsp"></jsp:include>

	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
			level : 5
		// 지도의 확대 레벨
		};

		//지도를 미리 생성
		var map = new daum.maps.Map(mapContainer, mapOption);
		//주소-좌표 변환 객체를 생성
		var geocoder = new daum.maps.services.Geocoder();
		//마커를 미리 생성
		var marker = new daum.maps.Marker({
			position : new daum.maps.LatLng(37.537187, 127.005476),
			map : map
		});

		function searchAddr() {
			new daum.Postcode({
				oncomplete : function(data) {
					var addr = data.address; // 최종 주소 변수

					// 주소 정보를 해당 필드에 넣는다.
					document.getElementById("userAddr").value = addr;
					// 주소로 상세 정보를 검색
					geocoder.addressSearch(data.address, function(results,
							status) {
						// 정상적으로 검색이 완료됐으면
						if (status === daum.maps.services.Status.OK) {

							var result = results[0]; //첫번째 결과의 값을 활용

							// 해당 주소에 대한 좌표를 받아서
							var coords = new daum.maps.LatLng(result.y,
									result.x);
							// 지도를 보여준다.
							mapContainer.style.display = "block";
							map.relayout();
							// 지도 중심을 변경한다.
							map.setCenter(coords);
							// 마커를 결과값으로 받은 위치로 옮긴다.
							marker.setPosition(coords)
						}
					});
				}
			}).open();
		}
	</script>
</body>

</html>
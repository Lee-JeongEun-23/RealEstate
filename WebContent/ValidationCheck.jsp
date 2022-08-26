<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<script>      
$(function() {
    let idReg = /^[a-z]{1}[a-z0-9]{2,15}$/; //3~16자리의 영문+숫자 조합의 id 정규표현식
    let passReg = /^[A-Za-z0-9]{3,16}$/; //3~16자리의 영문+숫자 조합의 비밀번호 정규표현식
    let emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;//email정규표현식
    let ssn1Reg = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))/; // 생년월일 정규식
    let ssn2Reg = /[1-4][0-9]{6}$/; // 뒷자리 정규식
    let phoneReg = /^\d{3}-\d{3,4}-\d{4}$/;//휴대폰 정규표현식
   let check=false;
      <!-- 아이디 입력 -->
    $('#id').keyup(function() {
        if(!idReg.test($('#id').val())){ //정규표현식에 맞으면
            $('#tdId').text("ID 형식에 맞지 않습니다.");
            check=false;
        } else {
            $('#tdId').text("");
            check=true;
        }
    });

      <!-- 비밀번호 입력 -->
      
    $('#pwd').keyup(function() { // 비밀번호 입력 유효성 검사
        if (!passReg.test($('pwd').val())) {
            $('#tdPw').text("3~16자리의 문자와 숫자 형태의 패스워드를 입력해주세요.");
            check=false;
        } else {
            $('#tdPw').text("동일한 패스워드를 한 번 더 입력해주세요.");
            $('#userPassCheck').keyup(function() { // 비밀번호 일치 유효성 검사
                if ($('#pwd').val() != $('#userPassCheck').val()) {
                    $('#tdCh').text("암호가 일치하지 않습니다.");
                    check=false;
                } else {
                    $('#tdCh').text("암호가 일치합니다.");
                    check=true;
                }
            });
        }
    });

    <!-- Email 입력 -->
    $('#email').keyup(function(){
        if(emailReg.test($('#email').val())){ //정규표현식에 맞으면
           $('#tdEmail').text("");
           check=true;
        }else{
           $('#tdEmail').text("email 형식에 맞지 않습니다.");
           check=false;
        }
     });
    
    <!--disable--->
    $('#signUp').click(function() {
        if(check){
           location.href="Join_finish.jsp";
        } else{
           alert("모든 항목을 완료해주세요.")
        }
   })

    
});
</script>
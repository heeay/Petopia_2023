<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <style>
        #register-form-wrap{
            margin-top: 80px;
        }
        .input-wrap{
            width: 460px;
            height: 50px;
            margin: auto;
            margin-bottom: 5px;
            position: relative;
        }
        .input-wrap>input{
            width: 100%;
            height: 100%;
            padding: 0px 10px 0px 35px;
            border: 2px solid #c7ca93;
            border-radius: 10px;
            box-sizing: border-box;
            font-size: 18px;
        }
        .input-wrap>input:focus{
            outline: none;
            border-color: #6b6e2e;
        }
        .input-icon{
            position: absolute;
            left: 4px;
	        top: 12px;
	        color: #aaaaaa;
        }
        .icon-size{
            font-size: 30px;
        }
        .input-wrap>input:focus + .input-icon{
            color: #6b6e2e;
        }
        .submit-wrap{
            width: 460px;
            height: 50px;
            margin: auto;
            margin-top: 10px;
        }
        .submit-wrap>button{
            width: 100%;
            height: 100%;
            border: 5px solid #C7CA93;
            border-radius: 12px;
            box-sizing: border-box;
            background-color: #DBDfA9;
            cursor: pointer;
        }
        .register-error-wrap{
            width: 450px;
            margin: auto;
            margin-bottom: 5px;
            color:#f53636;
            font-size: 13px;
            font-weight: bold;
            font-size: 12px;
        }
    </style>
    <script>
        /*$(document).ready(function(){
            $("#register-submit").click(function(){
                const email = document.getElementById("email");
                const nickname = document.getElementById("nickname");
                const pw = document.getElementById("pw");
                const pwCheck = document.getElementById("pw-check");
                const phone = document.getElementById("phone");

                const regExpEmail = new RegExp("([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\"\(\[\]!#-[^-~ \t]|(\\[\t -~]))+\")@([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\[[\t -Z^-~]*])");
                const regExpPw = /^[a-zA-Z0-9]+$/;
                const regExpPhone = /^\d{10,11}$/;

                document.getElementById("err-empty-email").style.display="none";
                document.getElementById("err-reg-email").style.display="none";
                document.getElementById("err-empty-nickname").style.display="none";
                document.getElementById("err-empty-pw").style.display="none";
                document.getElementById("err-reg-pw").style.display="none";
                document.getElementById("err-empty-pw-check").style.display="none";
                document.getElementById("err-pw-missmatch").style.display="none";
                document.getElementById("err-empty-phone").style.display="none";
                document.getElementById("err-reg-phone").style.display="none";
                
                let flag = true;
                if(phone.value==""){
                    phone.focus();
                    document.getElementById("err-empty-phone").style.display="block";
                    flag = false;
                }
                else if(!regExpPhone.test(phone.value)){
                    phone.focus();
                    document.getElementById("err-reg-phone").style.display="block";
                    flag = false;
                }

                if(pw.value==""){
                    pw.focus();
                    document.getElementById("err-empty-pw").style.display="block";
                    flag = false;
                }
                else if(!regExpPw.test(pw.value)){
                    pw.focus();
                    document.getElementById("err-reg-pw").style.display="block";
                    flag = false;
                }
                else if(pwCheck.value==""){
                    pwCheck.focus();
                    document.getElementById("err-empty-pw-check").style.display="block";
                    flag = false;
                }
                else if(pwCheck.value!=pw.value){
                    pwCheck.focus();
                    document.getElementById("err-pw-missmatch").style.display="block";
                    flag = false;
                }

                if(nickname.value==""){
                    nickname.focus();
                    document.getElementById("err-empty-nickname").style.display="block";
                    flag = false;
                }

                if(email.value==""){
                    email.focus();
                    document.getElementById("err-empty-email").style.display="block";
                    flag = false;
                }
                else if(!regExpEmail.test(email.value)){
                    email.focus();
                    document.getElementById("err-reg-email").style.display="block";
                    flag = false;
                }

                if(flag){
                    $("#register-form").submit();
                }
            });
        });
        function checkCaps(event){
            console.log(event);
            if(event.getModifierState("CapsLock")){
                document.getElementById("err-capslock").style.display="block";
            }
            else{
                document.getElementById("err-capslock").style.display="none";
            }
        }*/
    </script>
</head>
<body>
    <%@include file="../common/header-min.jsp" %>
    <section>
        <div id="register-form-wrap">
            <form id="register-form" action="<%=contextPath %>/register.prossess" method="post">
                <div class="input-wrap">
                    <input id="email" type="text" name="email" placeholder=" 이메일" autocomplete="off">
                    <div class="input-icon">
                        <span class="material-symbols-outlined icon-size">person</span>
                    </div>
                </div>
                <div class="input-wrap">
                    <input id="nickname" type="text" name="nickname" placeholder=" 닉네임" autocomplete="off">
                    <div class="input-icon">
                        <span class="material-symbols-outlined icon-size">person</span>
                    </div>
                </div>
                <div class="input-wrap">
                    <input id="pw" type="text" name="pw" placeholder=" 비밀번호" onkeyup="checkCaps(event);">
                    <div class="input-icon">
                        <span class="material-symbols-outlined icon-size">lock</span>
                    </div>
                </div>
                <div class="input-wrap">
                    <input id="pw-check" type="text" placeholder=" 비밀번호 확인" onkeyup="checkCaps(event);">
                    <div class="input-icon">
                        <span class="material-symbols-outlined icon-size">lock</span>
                    </div>
                </div>
                <div class="input-wrap">
                    <input id="phone" type="text" name="phone" placeholder=" 전화번호">
                    <div class="input-icon">
                        <span class="material-symbols-outlined icon-size">deskphone</span>
                    </div>
                </div>
                <div class="register-error-wrap" id="err-capslock" style="display: none;">
                    <!--CapsLock이 켜져 있습니다.-->
                </div>
                <div class="register-error-wrap" id="err-email" style="display: none;">
                    <!--이메일을 입력해 주세요.-->
                </div>
                <div class="register-error-wrap" id="err-nickname" style="display: none;">
                    <!--닉네임을 입력해 주세요.-->
                </div>
                <div class="register-error-wrap" id="err-pw" style="display: none;">
                    <!--비밀번호를 입력해 주세요.-->
                </div>
                <div class="register-error-wrap" id="err-phone" style="display: none;">
                    <!--전화번호를 입력해 주세요.-->
                </div>
                <div class="submit-wrap">
                    <button id="register-submit" type="button">회원가입</button>
                </div>
            </form>
        </div>
    <script>
        let emailFlag = false;
        let nicknameFlag = false;
        let pwFlag = false;
        let phoneFlag = false;
        $(document).ready(function(){
            $("#register-submit").click(function(){
                checkPhone();
                checkPw();
                checkNickname();
                checkEmail();

                console.log(emailFlag+","+nicknameFlag+","+pwFlag+","+phoneFlag);
                if(emailFlag && nicknameFlag && pwFlag && phoneFlag){
                    $("#register-form").submit();
                }
            })
            $("#email").focusout(function(){
                checkEmail();
            });
            $("#nickname").focusout(function(){
                checkNickname();
            });
            $("#pw").focusout(function(){
                checkPw();
            });
            $("#pw-check").focusout(function(){
                checkPw();
            });
            $("#phone").focusout(function(){
                checkPhone();
            });
        })

        function checkEmail(){
            const email = document.getElementById("email");
            const errEmail = document.getElementById("err-email");
            const regExpEmail = new RegExp("([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\"\(\[\]!#-[^-~ \t]|(\\[\t -~]))+\")@([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\[[\t -Z^-~]*])");
            if(email.value==""){
                errEmail.style.display="block";
                errEmail.innerText = "이메일을 입력해 주세요.";
                emailFlag = false;
            }
            else if(!regExpEmail.test(email.value)){
                errEmail.style.display="block";
                errEmail.innerText = "올바른 이메일이 아닙니다. 이메일을 확인해 주세요.";
                emailFlag = false;
            }
            else{
                $.ajax({
                    url : "emailCheck",
			        type : "get",
			        data : {email : email.value},
			        success : function(result){
                        console.log(result);
				        if(result == "N"){
                            errEmail.style.display="block";
                            errEmail.innerText = "사용할 수 없는 이메일입니다. 다른 이메일을 입력해 주세요.";
                            emailFlag = false;
				        }
				        else{
                            errEmail.style.display="none";
                            errEmail.innerText = "";
                            emailFlag = true;
				        }
			        },
			        error : function(e){
				        console.log(e);
			        }
		        });
            }
        }
        function checkNickname(){
            const nickname = document.getElementById("nickname");
            const errNickname = document.getElementById("err-nickname");
            if(nickname.value==""){
                errNickname.style.display="block";
                errNickname.innerText = "닉네임을 입력해 주세요.";
                nicknameFlag = false;
            }
            else{
                errNickname.style.display="none";
                errNickname.innerText = "";
                nicknameFlag = true;
            }
        }
        function checkPw(){
            const pw = document.getElementById("pw");
            const pwCheck = document.getElementById("pw-check");
            const errPw = document.getElementById("err-pw");
            const regExpPw = /^[a-zA-Z0-9]+$/;
            if(pw.value==""){
                errPw.style.display="block";
                errPw.innerText = "비밀번호를 입력해 주세요.";
                pwFlag = false;
            }
            else if(!regExpPw.test(pw.value)){
                errPw.style.display="block";
                errPw.innerText = "비밀번호는 영어와 숫자만 가능합니다.";
                pwFlag = false;
            }
            else if(pwCheck.value==""){
                errPw.style.display="block";
                errPw.innerText = "비밀번호 확인을 입력해 주세요.";
                pwFlag = false;
            }
            else if(pwCheck.value!=pw.value){
                errPw.style.display="block";
                errPw.innerText = "비밀번호 확인이 일치하지 않습니다.";
                pwFlag = false;
            }
            else{
                errPw.style.display="none";
                errPw.innerText = "";
                pwFlag = true;
            }
        }
        function checkPhone(){
            const phone = document.getElementById("phone");
            const errPhone = document.getElementById("err-phone");
            const regExpPhone = /^\d{10,11}$/;
            if(phone.value==""){
                errPhone.style.display="block";
                errPhone.innerText = "전화번호를 입력해 주세요.";
                phoneFlag = false;
            }
            else if(!regExpPhone.test(phone.value)){
                errPhone.style.display="block";
                errPhone.innerText = "올바른 전화번호가 아닙니다. 전화번호를 확인해 주세요.";
                phoneFlag = false;
            }
            else{
                errPhone.style.display="none";
                errPhone.innerText = "";
                phoneFlag = true;
            }
        }
        function checkCaps(event){
            const errCapslock = document.getElementById("err-capslock");
            if(event.getModifierState("CapsLock")){
                errCapslock.style.display="block";
                errCapslock.innerText = "CapsLock이 켜져 있습니다.";
            }
            else{
                errCapslock.style.display="none";
                errCapslock.innerText = "";
            }
        }
    </script>
    </section>
</body>
</html>
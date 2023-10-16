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
        .btn-wrap{
            width: 460px;
            height: 50px;
            margin: auto;
            margin-top: 20px;
            margin-bottom: 5px;
        }
        #email-auth-btn-wrap{
            margin-top: 0px;
            margin-bottom: 5px;
        }
        .btn-wrap>button{
            width: 100%;
            height: 100%;
            border: 5px solid #C7CA93;
            border-radius: 12px;
            box-sizing: border-box;
            background-color: #DBDfA9;
            font-size: 18px;
            font-weight: bold;
            color: #515242;
            cursor: pointer;
        }
        #auth-code{
            width: 80%;
        }
        #auth-code-btn{
            width: 18%;
            height: 100%;
            border: 5px solid #C7CA93;
            border-radius: 12px;
            box-sizing: border-box;
            background-color: #DBDfA9;
            font-size: 18px;
            font-weight: bold;
            color: #515242;
            cursor: pointer;
        }
        #email-auth-success{
            width: 460px;
            height: 50px;
            margin: auto;
            margin-bottom: 5px;
            border: 5px solid #C7CA93;
            border-radius: 12px;
            box-sizing: border-box;
            background-color: #DBDfA9;
            font-size: 18px;
            font-weight: bold;
            color: #515242;
            text-align: center;
            line-height: 40px;
        }
        .register-error-wrap{
            width: 450px;
            margin: auto;
            margin-bottom: 5px;
            color:#f53636;
            font-size: 13px;
            font-weight: bold;
        }
        #timer{
            width: 50px;
            height: 20px;
            font-size: 15px;
            color: rgb(97, 97, 97);
            position: absolute;
            z-index: 1;
            top: 50%;
            transform: translateY(-50%);
            text-align: right;
            right: 25%;
        }
    </style>
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
                <div class="register-error-wrap" id="err-email" style="display: none;">
                    <!--이메일을 입력해 주세요.-->
                </div>
                <div id="email-auth-btn-wrap" class="btn-wrap">
                    <button type="button" id="email-auth-btn">인증</button>
                </div>
                <div id="auth-code-wrap" class="input-wrap" style="display: none;">
                    <div class="input-icon">
                        <span class="material-symbols-outlined icon-size">key</span>
                    </div>
                    <input id="auth-code" type="text" maxlength="6" name="authCode" placeholder=" 인증코드" autocomplete="off">
                    <div id="timer">2 : 00</div>
                    <button type="button" id="auth-code-btn">인증</button>
                </div>
                <div id="email-auth-success" style="display: none;">
                    이메일 인증을 완료했습니다!
                </div>
                <div class="register-error-wrap" id="err-email-auth" style="display: none;">
                    <!--이메일인증을 진행해 주세요.-->
                </div>
                <div class="input-wrap">
                    <input id="nickname" type="text" name="nickname" placeholder=" 닉네임" autocomplete="off">
                    <div class="input-icon">
                        <span class="material-symbols-outlined icon-size">person</span>
                    </div>
                </div>
                <div class="register-error-wrap" id="err-nickname" style="display: none;">
                    <!--닉네임을 입력해 주세요.-->
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
                <div class="register-error-wrap" id="err-capslock" style="display: none;">
                    <!--CapsLock이 켜져 있습니다.-->
                </div>
                <div class="register-error-wrap" id="err-pw" style="display: none;">
                    <!--비밀번호를 입력해 주세요.-->
                </div>
                <div class="input-wrap">
                    <input id="phone" type="text" name="phone" placeholder=" 전화번호" maxlength="13">
                    <div class="input-icon">
                        <span class="material-symbols-outlined icon-size">deskphone</span>
                    </div>
                </div>
                <div class="register-error-wrap" id="err-phone" style="display: none;">
                    <!--전화번호를 입력해 주세요.-->
                </div>
                <div class="btn-wrap">
                    <button id="register-submit" type="button">회원가입</button>
                </div>
            </form>
        </div>
    <script>
        let emailFlag = false;
        let emailAuthFlag = false;
        let nicknameFlag = false;
        let pwFlag = false;
        let phoneFlag = false;
        let timerStart = false;
        let curTime = 120;
        $(document).ready(function(){
            $("#register-submit").click(function(){
                checkPhone();
                checkPw();
                checkNickname();
                checkEmail();
                checkAuthEmail();

                if(emailAuthFlag  && nicknameFlag && pwFlag && phoneFlag){
                    $("#register-form").submit();
                }
            })
            $("#email").focusout(function(){
                checkEmail();
            });
            $("#email").change(function(){
                emailAuthFlag = false;
                $("#email-auth-btn-wrap").css("display","block");
                $("#auth-code-wrap").css("display","none");
                $("#email-auth-success").css("display","none");
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
                let phoneNum = $(this).val().replace(/\-/g,"");
                let phone1 = phoneNum.substr(0,3);
                let phone2 = "";
                let phone3 = "";
                if(phone1 == "010"){
                    phone2 = phoneNum.substr(3,4);
                    phone3 = phoneNum.substr(7);
                    $(this).val(phone1+"-"+phone2+"-"+phone3);
                }
                else if(phone1 == "011"){
                    phone2 = phoneNum.substr(3,3);
                    phone3 = phoneNum.substr(6);
                    $(this).val(phone1+"-"+phone2+"-"+phone3);
                }
                checkPhone();
            });
        })

        function checkAuthEmail(){
            const errEmailAuth = document.getElementById("err-email-auth");
            if(emailFlag && !emailAuthFlag){
                errEmailAuth.style.display="block";
                errEmailAuth.innerText = "이메일인증을 진행해 주세요.";
            }
            else{
                errEmailAuth.style.display="none";
                errEmailAuth.innerText = "";
            }
        }
        function checkEmail(){
            const email = document.getElementById("email");
            const errEmail = document.getElementById("err-email");
            const regExpEmail = new RegExp("([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\"\(\[\]!#-[^-~ \t]|(\\[\t -~]))+\")@([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\[[\t -Z^-~]*])");
            if(email.value==""){
                errEmail.style.display="block";
                errEmail.innerText = "이메일을 입력해 주세요.";
                email.style.borderColor = "#f53636";
                emailFlag = false;
            }
            else if(!regExpEmail.test(email.value)){
                errEmail.style.display="block";
                errEmail.innerText = "올바른 이메일이 아닙니다. 이메일을 확인해 주세요.";
                email.style.borderColor = "#f53636";
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
                            email.style.borderColor = "#f53636";
                            emailFlag = false;
				        }
				        else{
                            errEmail.style.display="none";
                            errEmail.innerText = "";
                            email.style = "";
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
                nickname.style.borderColor = "#f53636";
                nicknameFlag = false;
            }
            else{
                $.ajax({
                    url : "nicknameCheck",
			        type : "get",
			        data : {nickname : nickname.value},
			        success : function(result){
                        console.log(result);
				        if(result == "N"){
                            errNickname.style.display="block";
                            errNickname.innerText = "사용할 수 없는 닉네임입니다. 다른 닉네임을 입력해 주세요.";
                            nickname.style.borderColor = "#f53636";
                            nicknameFlag = false;
				        }
				        else{
                            errNickname.style.display="none";
                            errNickname.innerText = "";
                            nickname.style = "";
                            nicknameFlag = true;
				        }
			        },
			        error : function(e){
				        console.log(e);
			        }
		        });
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
                pw.style.borderColor = "#f53636";
                pwCheck.style = "";
                pwFlag = false;
            }
            else if(!regExpPw.test(pw.value)){
                errPw.style.display="block";
                errPw.innerText = "비밀번호는 영어와 숫자만 가능합니다.";
                pw.style.borderColor = "#f53636";
                pwCheck.style = "";
                pwFlag = false;
            }
            else if(pwCheck.value==""){
                errPw.style.display="block";
                errPw.innerText = "비밀번호 확인을 입력해 주세요.";
                pw.style = "";
                pwCheck.style.borderColor = "#f53636";
                pwFlag = false;
            }
            else if(pwCheck.value!=pw.value){
                errPw.style.display="block";
                errPw.innerText = "비밀번호 확인이 일치하지 않습니다.";
                pw.style = "";
                pwCheck.style.borderColor = "#f53636";
                pwFlag = false;
            }
            else{
                errPw.style.display="none";
                errPw.innerText = "";
                pw.style = "";
                pwCheck.style = "";
                pwFlag = true;
            }
        }
        function checkPhone(){
            const phone = document.getElementById("phone");
            const errPhone = document.getElementById("err-phone");
            const regExpPhone = /\d{3}-\d{3,4}-\d{4}/;
            if(phone.value==""){
                errPhone.style.display="block";
                errPhone.innerText = "전화번호를 입력해 주세요.";
                phone.style.borderColor = "#f53636";
                phoneFlag = false;
            }
            else if(!regExpPhone.test(phone.value)){
                errPhone.style.display="block";
                errPhone.innerText = "올바른 전화번호가 아닙니다. 전화번호를 확인해 주세요.";
                phone.style.borderColor = "#f53636";
                phoneFlag = false;
            }
            else{
                errPhone.style.display="none";
                errPhone.innerText = "";
                phone.style = "";
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
    <script>
        $(document).ready(function(){
            $("#email-auth-btn").click(function(){
                checkEmail();
                if(emailFlag){
                    const email = document.getElementById("email");
                    $("#email-auth-btn-wrap").css("display","none");
                    $("#auth-code-wrap").css("display","block");
                    $("#err-email-auth").css("display","none").text("");
                    
                    $.ajax({
                        url : "requestAuthEmail",
                        type : "get",
                        data : {email : email.value},
                        success : function(result){
                            console.log(result);
                            if(result != "1"){
                                $("#email-auth-btn-wrap").css("display","block");
                                $("#auth-code-wrap").css("display","none");
                                $("#err-email-auth").css("display","block").text("코드 전송이 실패했습니다.");
                            } else {
                                startTimer();
                            }
                        },
                        error : function(e){
                            console.log(e);
                        }
                    });
                }
            });
            $("#auth-code-btn").click(function(){
                const email = document.getElementById("email");
                const authCode = document.getElementById("auth-code");
                $.ajax({
                    url : "checkAuthEmail",
                    type : "get",
                    data : {
                        email : email.value,
                        authCode : authCode.value
                    },
                    success : function(result){
                        console.log(result);
                        if(result == "200"){
                            $("#auth-code-wrap").css("display","none");
                            $("#email-auth-success").css("display","block");
                            emailAuthFlag = true;
                            $("#err-email-auth").css("display","none").text("");
                            endTimer();
                        }
                        else if(result == "404"){
                            $("#err-email-auth").css("display","block");
                            $("#err-email-auth").text("코드가 다릅니다. 코드를 확인해주세요.");
                        } else {
                            $("#email-auth-btn-wrap").css("display","block");
                            $("#auth-code-wrap").css("display","none");
                            $("#err-email-auth").css("display","block").text("이미 만료된 코드입니다.");
                            endTimer();
                        }
                    },
                    error : function(e){
                        console.log(e);
                    }
                });
            });
        })
        let timer;
        function startTimer(){
            curTime = 120;
            timerStart = true;
            timer = window.setInterval(function(){
                if(timerStart&&curTime>0){
                    curTime--;
                    let min = parseInt(curTime/60);
                    let sec = curTime%60;
                    if(sec<10){
                        sec = '0'+sec;
                    }
                    str = min+" : "+sec;
                    document.getElementById("timer").innerText = str;
                }
            }, 1000);
        }
        function endTimer(){
            clearInterval(timer);
            $("#auth-code").val("");
            curTime = 120;
            timerStart = false;
            $("#timer").text("2 : 00");
        }
    </script>
    </section>
</body>
</html>
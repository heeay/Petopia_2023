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
	        top: 8px;
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
        }
        .error-message{
            color:#f53636;
            font-size: 13px;
            font-weight: bold;
            font-size: 12px;
        }
    </style>
    <script>
        $(document).ready(function(){
            $("#register-submit").click(function(){
                const email = document.getElementById("email");
                const pw = document.getElementById("pw");
                const pwCheck = document.getElementById("pw-check");

                const regExpEmail = /^[a-zA-Z\d]$/;
                const regExpPw = /^[a-zA-Z\d]$/;

                document.getElementById("err-empty-email").style.display="none";
                document.getElementById("err-empty-pw").style.display="none";
                document.getElementById("err-empty-pw-check").style.display="none";
                document.getElementById("err-pw-missmatch").style.display="none";

                if(email.value==""){
                    email.focus();
                    document.getElementById("err-empty-email").style.display="block";
                    return;
                }
                if(pw.value==""){
                    pw.focus();
                    document.getElementById("err-empty-pw").style.display="block";
                    return;
                }
                if(pwCheck.value==""){
                    pwCheck.focus();
                    document.getElementById("err-empty-pw-check").style.display="block";
                    return;
                }
                if(pwCheck.value!=pw.value){
                    pwCheck.focus();
                    document.getElementById("err-pw-missmatch").style.display="block";
                    return;
                }

                $("#register-form").submit();
            });
        });
        function checkCaps(event){
            if(event.getModifierState("CapsLock")){
                document.getElementById("err-capslock").style.display="block";
            }
            else{
                document.getElementById("err-capslock").style.display="none";
            }
        }
    </script>
</head>
<body>
    <%@include file="../common/header-min.jsp" %>
    <section>
        <div id="register-form-wrap">
            <form id="register-form" action="test.do" method="get">
                <div class="input-wrap">
                    <input id="email" type="text" name="email" placeholder=" 이메일" autocomplete="off">
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
                    <div class="error-message">
                        CapsLock이 켜져 있습니다.
                    </div>
                </div>
                <div class="register-error-wrap" id="err-empty-email" style="display: none;">
                    <div class="error-message">
                      	이메일: 필수 정보입니다.
                    </div>
                </div>
                <div class="register-error-wrap" id="err-empty-pw" style="display: none;">
                    <div class="error-message">
                      	비밀번호: 필수 정보입니다.
                    </div>
                </div>
                <div class="register-error-wrap" id="err-empty-pw-check" style="display: none;">
                    <div class="error-message">
                      	비밀번호 확인: 필수 정보입니다.
                    </div>
                </div>
                <div class="register-error-wrap" id="err-pw-missmatch" style="display: none;">
                    <div class="error-message">
                       	비밀번호 확인: 일치하지 않습니다.
                    </div>
                </div>
                <div class="submit-wrap">
                    <button id="register-submit" type="button">회원가입</button>
                </div>
            </form>
        </div>
    </section>
</body>
</html>
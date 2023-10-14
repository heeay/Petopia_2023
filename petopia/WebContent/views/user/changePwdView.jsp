<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String token = (String)request.getAttribute("token");
String key = (String)request.getAttribute("key");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<style>
    .sub-title{
        text-align: center;
        font-size: 26px;
        margin-top: 80px;
        margin-bottom: 40px;
    }
    .input-wrap{
        width: 360px;
        height: 34px;
        margin: auto;
        margin-bottom: 5px;
        position: relative;
    }
    .input-wrap>input{
        width: 100%;
        height: 100%;
        padding: 0px 10px 0px 10px;
        border: none;
        border-bottom: 2px solid #c7ca93;
        box-sizing: border-box;
        font-size: 18px;
    }
    .input-wrap>input:focus{
        outline: none;
        border-color: #6b6e2e;
    }
    .submit-wrap{
        width: 360px;
        height: 50px;
        margin: auto;
        margin-top: 10px;
        margin-bottom: 450px;
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
    .change-pw-error-wrap{
        width: 350px;
        margin: auto;
        margin-bottom: 5px;
        color:#f53636;
        font-size: 13px;
        font-weight: bold;
    }
</style>
</head>
<body>
	<%@include file="../common/header-min.jsp" %>
	<section>
        <form id="change-pw-form" action="<%=contextPath %>/changePassword.process" method="post">
            <input type="hidden" name="token" value="<%=token %>">
            <input type="hidden" name="key" value="<%=key %>">
            <div class="sub-title">
                비밀번호 변경
            </div>
            <div class="input-wrap">
                <input id="pw" type="text" name="pw" placeholder="비밀번호" onkeyup="checkCaps(event);">
            </div>
            <div class="input-wrap">
                <input id="pw-check" type="text" placeholder="비밀번호 확인" onkeyup="checkCaps(event);">
            </div>
            <div class="change-pw-error-wrap" id="err-capslock" style="display: none;">
                <!--CapsLock이 켜져 있습니다.-->
            </div>
            <div class="change-pw-error-wrap" id="err-pw" style="display: none;">
                <!--비밀번호를 입력해 주세요.-->
            </div>
            <div class="submit-wrap">
                <button id="change-pw-submit" type="button">변경</button>
            </div>
        </form>
    </section>
    <script>
        let pwFlag = false;
        $(document).ready(function(){
            $("#change-pw-submit").click(function(){
                checkPw();

                if(pwFlag){
                    $("#change-pw-form").submit();
                }
            })
            $("#pw").focusout(function(){
                checkPw();
            });
            $("#pw-check").focusout(function(){
                checkPw();
            });
        })
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
	<%@include file="../common/footer.jsp" %>
</body>
</html>
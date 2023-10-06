<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%
String fail = request.getAttribute("fail")!=null ? (String)request.getAttribute("fail") : "";
String cookieEmail = "";
Cookie[] cookies = request.getCookies();
if(cookies!=null){
	for(int i=0;i<cookies.length;i++){
		if(cookies[i].getName().equals("rememberEmail")){
			cookieEmail = cookies[i].getValue();
		}
	}
}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <style>
        .margin-top{margin-top: 50px;}
        .margin-bottom{margin-bottom: 10px;}
    </style>
    <style>
        section{
            width: 800px;
            margin: auto;
            margin-top: 100px;
            overflow: auto;
        }
        #login-form-wrap{
            width: 350px;
            border-radius: 0 0 12px 12px;
            padding: 12px;
            box-sizing: border-box;
            background-color: rgb(245, 222, 179);
            margin: auto;
        }
        .input-wrap{
            width: 240px;
            height: 34px;
            margin: auto;
            margin-bottom: 5px;
            position: relative;
        }
        .input-wrap>input{
            width: 100%;
            height: 100%;
            padding: 0px 10px 0px 25px;
            border: 2px solid #c7ca93;
            border-radius: 10px;
            box-sizing: border-box;
        }
        .input-wrap>input:focus{
            outline: none;
            border-color: #6b6e2e;
        }
        .input-icon{
            position: absolute;
            left: 4px;
	        top: 5px;
	        color: #aaaaaa;
        }
        .input-icon > .icon-size{
            font-size: 22px;
        }
        .input-wrap>input:focus + .input-icon{
            color: #6b6e2e;
        }
        .checkbox-wrap{
            margin: 0px 50px;
            margin-bottom: 10px;
            font-size: 12px;
        }
        .checkbox-wrap>input,label{
            cursor: pointer;
        }
        .submit-wrap{
            width: 240px;
            height: 34px;
            margin: auto;
            margin-top: 10px;
        }
        .submit-wrap>button{
            width: 100%;
            height: 100%;
            border: 5px solid #C7CA93;
            border-radius: 10px;
            box-sizing: border-box;
            background-color: #DBDfA9;
            cursor: pointer;
        }
        .login-error-wrap{
            width: 230px;
            margin: auto;
            margin-bottom: 5px;
            color:#f53636;
            font-size: 13px;
            font-weight: bold;
        }
        #err-fail{
        	width: 260px;
        }
        .auth-wrap{
            height: 44px;
        }
        .auth-btn{
            width: 400px;
            height: 100%;
            margin: auto;
            border: 1px solid;
            border-radius: 12px;
            padding: 0 10px 0 10px;
            font-size: 20px;
            line-height: 44px;
            text-align: center;
            position: relative;
        }
        .auth-icon{
            height: 20px;
            position: absolute;
            top: 12px;
            left: 15px;
        }
        #email-auth{
            cursor: pointer;
            background-color: #dbdfa9;
            color: #4b4b4b;
            border-color: #c7ca93;
            box-sizing: border-box;
        }
        #naverIdLogin_loginButton{
            display: block;
            cursor: pointer;
            background-color: #03C75A;
            color: #ffffff;
            border-color: #03bd57;
            box-sizing: border-box;
        }
        #naverIdLogin_loginButton:hover{
            text-decoration: none;
        }
        #kakao-auth{
            cursor: pointer;
            background-color: #FEE500;
            color: #000000CC;
            border-color: #ebd300;
            box-sizing: border-box;
        }
        #google-auth{
            cursor: pointer;
            background-color: #ffffff;
            color: #505050;
            border-color: #bbbbbb;
            box-sizing: border-box;
        }
        
        .find-wrap{
            text-align: center;
            margin-bottom: 250px;
        }
    </style>
</head>
<body ondragstart="return false;">
	<%@include file="../common/header-min.jsp" %>
    <script>
        $(document).ready(function(){
            $("#email-auth").click(function(){
                if($("#login-form-wrap").css("display")=="none"){
                    $("#login-form-wrap").slideDown(100);
                }
                else{
                    $("#login-form-wrap").slideUp(100);
                }
            });
            $("#login-submit").click(function(){
                let emailFlag = false;
                let pwFlag = false;
                const email = document.getElementById("email");
                const errEmail = document.getElementById("err-email");
                const pw = document.getElementById("pw");
                const errPw = document.getElementById("err-pw");

                if(pw.value==""){
                    pw.focus();
                    errPw.style.display = "block";
                    errPw.innerText = "비밀번호를 작성해 주세요.";
                    pwFlag = false;
                }
                else{
                    errPw.style.display="none";
                    errPw.innerText = "";
                    pwFlag = true;
                }
                if(email.value==""){
                    email.focus();
                    errEmail.style.display = "block";
                    errEmail.innerText = "이메일을 작성해 주세요.";
                    emailFlag = false;
                }
                else{
                    errEmail.style.display="none";
                    errEmail.innerText = "";
                    emailFlag = true;
                }

                if(emailFlag && pwFlag){
                    $("#login-form").submit();
                }
            });
        });
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
    <section>
        <div class="margin-bottom margin-top">
            <div class="auth-wrap">
                <div id="email-auth" class="auth-btn">
                	이메일로 로그인
                </div>
            </div>
            <div id="login-form-wrap" <%if(fail.isEmpty()){ %>style="display: none;"<%} %>>
                <form id="login-form" action="<%=contextPath%>/login.prossess" method="post">
                	<%if(!fail.isEmpty()){ %>
                    <div class="login-error-wrap" id="err-fail">
                        이메일 또는 비밀번호를 잘못 입력했습니다.
                    </div>
                    <%} %>
                    <div class="input-wrap">
                        <input id="email" type="text" name="email" placeholder=" 이메일" value=<%=cookieEmail %>>
                        <div class="input-icon">
                            <span class="material-symbols-outlined icon-size">person</span>
                        </div>
                    </div>
                    <div class="input-wrap">
                        <input id="pw" type="password" name="pw" placeholder=" 비밀번호" onkeyup="checkCaps(event);">
                        <div class="input-icon">
                            <span class="material-symbols-outlined icon-size">lock</span>
                        </div>
                    </div>
                    <div class="checkbox-wrap">
                        <input id="remember" type="checkbox" name="remember" <%if(!cookieEmail.equals("")){ %>checked<%} %>><label for="remember">Remember Me</label>
                    </div>
                    <div class="login-error-wrap" id="err-capslock" style="display: none;">
                        <!--CapsLock이 켜져 있습니다.-->
                    </div>
                    <div class="login-error-wrap" id="err-email" style="display: none;">
                        <!--이메일을 작성해 주세요.-->
                    </div>
                    <div class="login-error-wrap" id="err-pw" style="display: none;">
                        <!--비밀번호를 작성해 주세요.-->
                    </div>
                    <div class="submit-wrap">
                        <button id="login-submit" type="button">로그인</button>
                    </div>
                </form>
            </div>
        </div>
        <%
        String clientId = "8ZYnqypIAIHZc2Ycz4px";//애플리케이션 클라이언트 아이디값";
        String redirectURI = URLEncoder.encode("http://localhost:8001/petopia/naverLogin", "UTF-8");
        SecureRandom random = new SecureRandom();
        String state = new BigInteger(130, random).toString();
        String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
        apiURL += "&client_id=" + clientId;
        apiURL += "&redirect_uri=" + redirectURI;
        apiURL += "&state=" + state;
        session.setAttribute("state", state);
        %>
        <div class="auth-wrap margin-bottom">
            <a href="<%=apiURL%>" id="naverIdLogin_loginButton" class="auth-btn">
                <img class="auth-icon" src="<%=contextPath %>/resources/images/naver_login_icon.svg">
                	네이버 로그인
            </a>
        </div>
        <div class="auth-wrap margin-bottom">
            <div id="kakao-auth" class="auth-btn" onclick="kakaoLogin();">
                <img class="auth-icon" src="<%=contextPath %>/resources/images/kakao_login_icon.svg">
                	카카오 로그인
            </div>
        </div>
        <div class="auth-wrap margin-bottom">
            <div id="google-auth" class="auth-btn">
                <img class="auth-icon" src="<%=contextPath %>/resources/images/Fill_google.svg">
               	    구글 로그인
            </div>
        </div>
        <div class="find-wrap">
            <a href="<%=contextPath %>/findPassword">비밀번호 찾기</a> /
            <a href="<%=contextPath %>/register">회원가입</a>
        </div>
    </section>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        //카카오로그인
        Kakao.init('f9947b6fb5f9eb6975bcffce3ad32133'); //발급받은 키
        console.log(Kakao.isInitialized()); // sdk초기화여부판단
        function kakaoLogin() {
            Kakao.Auth.login({
              success: function (response) {
                Kakao.API.request({
                  url: '/v2/user/me',
                  success: function (response) {
                      console.log(response)
                  },
                  fail: function (error) {
                    console.log(error)
                  },
                })
              },
              fail: function (error) {
                console.log(error)
              },
            })
          }
        //카카오로그아웃  
        function kakaoLogout() {
            if (Kakao.Auth.getAccessToken()) {
              Kakao.API.request({
                url: '/v1/user/unlink',
                success: function (response) {
                    console.log(response)
                },
                fail: function (error) {
                  console.log(error)
                },
              })
              Kakao.Auth.setAccessToken(undefined)
            }
          }  
    </script>
    <%@include file="../common/footer.jsp" %>
</body>
</html>
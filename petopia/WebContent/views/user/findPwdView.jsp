<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기</title>
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
        .find-pwd-error-wrap{
            width: 450px;
            margin: auto;
            margin-bottom: 5px;
            color:#f53636;
            font-size: 13px;
            font-weight: bold;
            font-size: 12px;
        }
    </style>
</head>
<body>
	<%@include file="../common/header-min.jsp" %>
	<section>
        <div class="sub-title">
            비밀번호 변경 및 찾기
        </div>
        <div class="input-wrap">
            <input id="email" type="text" name="email" placeholder="이메일" autocomplete="off">
        </div>
        <div class="find-pwd-error-wrap" id="err-email" style="display: none;">
            <!--이메일을 입력해 주세요.-->
        </div>
        <div class="submit-wrap">
            <button id="submit" type="button">재설정 링크 발송</button>
        </div>
    </section>
    <script>
        let emailFlag = false;
        $(document).ready(function(){
            $("email").focusout(function(){
                console.log("1");
                checkEmail();
            });
            $("submit").click(function(){
                $.ajax({
                    url : "findPasswordEmail",
                    type : "get",
                    data : {
                        email : email.value,
                    },
                    success : function(result){
                        console.log(result);
                        /*if(result == "true"){
                        }
                        else{
                        }*/
                    },
                    error : function(e){
                        console.log(e);
                    }
                })
            })
        });

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
        }
    </script>
    <%@include file="../common/footer.jsp" %>
</body>
</html>
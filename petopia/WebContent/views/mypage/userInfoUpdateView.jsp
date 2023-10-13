<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 변경</title>
<style>
    .sub-title{
        text-align: center;
        font-size: 26px;
        margin-top: 80px;
        margin-bottom: 40px;
    }
    .input-wrap{
        width: 360px;
        margin: auto;
        margin-bottom: 35px;
        position: relative;
    }
    .input-label{
        display: block;
        color: rgb(134, 134, 134);
        padding: 0px 10px;

    }
    .input-wrap>input{
        width: 100%;
        height: 34px;
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
    .button-wrap{
        width: 360px;
        height: 50px;
        margin: auto;
        margin-top: 10px;
    }
    .button-wrap>button{
        width: 100%;
        height: 100%;
        border: 5px solid #C7CA93;
        border-radius: 12px;
        box-sizing: border-box;
        background-color: #DBDfA9;
        cursor: pointer;
    }
    .error-wrap{
        width: 350px;
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
    <%@ include file = "mysidebar.jsp" %>
    <section>
        <div class="sub-title">
            내 정보수정 및 회원탈퇴
        </div>
        <form id="update-form" action="#" method="post">
            <div class="input-wrap">
                <label class="input-label" for="nickname">닉네임</label>
                <input id="nickname" type="text" name="nickname" placeholder="닉네임" autocomplete="off" value="<%=userInfo.getUserNickname()%>">
                <div class="error-wrap" id="err-nickname" style="display: none;">
                    <!--닉네임을 입력해 주세요.-->
                </div>
            </div>
            <div class="input-wrap">
                <label class="input-label" for="phone">전화번호</label>
                <input id="phone" type="text" name="phone" placeholder="전화번호" autocomplete="off" value="<%=userInfo.getUserPhone()%>">
                <div class="error-wrap" id="err-phone" style="display: none;">
                    <!--전화번호를 입력해 주세요.-->
                </div>
            </div>
            <div class="button-wrap">
                <button id="update-submit" type="button">수정</button>
            </div>
            <div class="button-wrap">
                <button id="delete-submit" type="button">회원 탈퇴</button>
            </div>
        </form>
    </section>
    <script>
        let nicknameFlag = false;
        let phoneFlag = false;
        $(document).ready(function(){
            $("#update-submit").click(function(){
                checkPhone();
                checkNickname();

                if(nicknameFlag && phoneFlag){
                    $("#update-form").submit();
                }
            })
            $("#nickname").focusout(function(){
                checkNickname();
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

        function checkNickname(){
            const nickname = document.getElementById("nickname");
            const errNickname = document.getElementById("err-nickname");
            if(nickname.value==""){
                errNickname.style.display="block";
                errNickname.innerText = "닉네임을 입력해 주세요.";
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
                            nicknameFlag = false;
				        }
				        else{
                            errNickname.style.display="none";
                            errNickname.innerText = "";
                            nicknameFlag = true;
				        }
			        },
			        error : function(e){
				        console.log(e);
			        }
		        });
            }
        }
        function checkPhone(){
            const phone = document.getElementById("phone");
            const errPhone = document.getElementById("err-phone");
            const regExpPhone = /\d{3}-\d{3,4}-\d{4}/;
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
    </script>
</body>
</html>
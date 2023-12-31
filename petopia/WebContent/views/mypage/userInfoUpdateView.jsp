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
    }
    .log-wrap{
        width: 350px;
        margin: auto;
        margin-bottom: 5px;
        color:#1bd659;
        font-size: 13px;
        font-weight: bold;
    }
</style>
</head>
<body>
    <%@ include file = "mysidebar.jsp" %>
    <section>
        <div class="sub-title">
            내 정보수정 및 회원탈퇴
        </div>
        <div class="log-wrap" id="log-success" style="display: none;">
            사용자 정보가 수정 되었습니다.
        </div>
        <div class="error-wrap" id="log-fail" style="display: none;">
            수정이 실패했습니다. 관리자에게 문의해 주세요
        </div>
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
            <%if(!userInfo.getRoleId().equals("관리자")){ %>
            <button id="delete-submit" type="button" data-toggle="modal" data-target="#askModal">회원 탈퇴</button>
            <%} else { %>
            <button id="delete-submit" type="button">회원 탈퇴</button>
            <div class="toast">
                <div class="toast-header">
                    <b>당신은 관리자 입니다!</b>
                </div>
                <div class="toast-body" style="background-color: #000000; color:#f5e236;">
                    관리자는 회원 탈퇴가 불가능 합니다.
                </div>
            </div>
            <style>
                .toast{border: 2px solid #f5e236;}
                .toast-header{
                    border-color: #f5e236;
                    background-color: #000000;
                    color: #f5e236;
                }
                .toast-body{
                    background-color: #000000;
                    color: #f5e236;
                }
            </style>
            <script>
                $(document).ready(function(){
                  $("#delete-submit").click(function(){
                    $('.toast').toast('show');
                  });
                });
            </script>
            <%} %>
        </div>
    </section>
    <script>
        let nicknameFlag = false;
        let phoneFlag = false;
        $(document).ready(function(){
            $("#update-submit").click(function(){
                checkPhone();
                checkNickname();

                if(nicknameFlag && phoneFlag){
                    $.ajax({
                        url : "mypage.userUpdate",
                        type : "post",
                        data : {
                            "nickname" : $("#nickname").val(),
                            "phone" : $("#phone").val()
                        },
                        success : function(result){
                            console.log(result);
                            const logSuccess = document.getElementById("log-success");
                            const logFail = document.getElementById("log-fail");
                            if(result["code"] == "1"){
                                document.getElementById("nickname").value = result["nickname"];
                                document.getElementById("profil-name").innerHTML = "<b>"+result["nickname"]+" 님</b>";
                                document.getElementById("phone").value = result["phone"];
                                logSuccess.style.display="block";
                                logFail.style.display="none";
                            } else{
                                document.getElementById("nickname").value = result["nickname"];
                                document.getElementById("phone").value = result["phone"];
                                logSuccess.style.display="none";
                                logFail.style.display="block";
                            }
                        },
                        error : function(e){
                            console.log(e)
                        }
                    })
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
            $("#nickname").change(function(){
                document.getElementById("log-success").style.display="none";
                document.getElementById("log-fail").style.display="none";
            })
            $("#phone").change(function(){
                document.getElementById("log-success").style.display="none";
                document.getElementById("log-fail").style.display="none";
            })
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
    <!-- The Modal -->
    <div class="modal fade" id="askModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">정말 회원 탈퇴를 진행하시겠습니까?</h4>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <br>
                    회원 탈퇴 시 계정 관련 데이터를 <b style="color:#f53636">복구할 수 없습니다.</b>
                    <br>
                    <br>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" onclick="location.href='<%=contextPath%>/mypage.userDelete'";>예</button>
                    <button type="button" class="btn btn-success" data-dismiss="modal">아니오</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
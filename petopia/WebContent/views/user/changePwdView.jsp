<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String token = (String)request.getAttribute("token");
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
    .change-pwd-error-wrap{
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
	<%@include file="../common/header-min.jsp" %>
	<section>
        <form action="" method="post">
            <input type="hidden" name="token" value="<%=token %>">
            <div class="sub-title">
                비밀번호 변경
            </div>
            <div class="input-wrap">
                <input id="pwd" type="text" name="pwd" placeholder="비밀번호">
            </div>
            <div class="change-pwd-error-wrap" id="err-pw" style="display: none;">
                <!--비밀번호를 입력해 주세요.-->
            </div>
            <div class="submit-wrap">
                <button id="submit" type="button">변경</button>
            </div>
        </form>
    </section>
	<%@include file="../common/footer.jsp" %>
</body>
</html>
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
    </style>
</head>
<body>
	<%@include file="../common/header-min.jsp" %>
	<section>
        <div class="sub-title">
            비밀번호 변경 및 찾기
        </div>
        <form action="">
            <div class="input-wrap">
                <input id="email" type="text" name="email" placeholder="이메일" autocomplete="off">
            </div>
            <div class="submit-wrap">
                <button id="submit" type="button">재설정 링크 발송</button>
            </div>
        </form>
    </section>
    <%@include file="../common/footer.jsp" %>
</body>
</html>
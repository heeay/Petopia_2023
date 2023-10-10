<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<body>
	<%@include file="../common/header-min.jsp" %>
	<section>
        <div class="sub-title">
            비밀번호 변경
        </div>
        <div class="input-wrap">
            <input id="pwd" type="text" name="pwd" placeholder="비밀번호">
        </div>
        <div class="find-pwd-error-wrap" id="err-pw" style="display: none;">
            <!--비밀번호를 입력해 주세요.-->
        </div>
        <div class="submit-wrap">
            <button id="submit" type="button">변경</button>
        </div>
    </section>
	<%@include file="../common/footer.jsp" %>
</body>
</html>
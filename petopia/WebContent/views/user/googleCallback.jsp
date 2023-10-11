<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
    window.onload = function(){
        const access_token = window.location.hash.substring(1);
        location.href = "<%=request.getContextPath() %>/googleLogin?"+access_token;
    }
</script>
</body>
</html>
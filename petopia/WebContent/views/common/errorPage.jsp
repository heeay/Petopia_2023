<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String errorMsg = (String)request.getAttribute("errorMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지</title>
	<style>
		h1{
			margin-top : 100px;
			text-align : center;
			font-size : 30px;
			font-weight : bold;
		}
	</style>
</head>
<body>

	<h1><%= errorMsg %></h1>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보공유_애견동반 리스트</title>

<style>
    #wrap{
        border : 1px solid red;
        width: 1100px;
        height: 800px;
        margin: auto;
        margin-top : 10px;
    }
</style>
</head>
<body>

	<%@ include file="../common/header-min.jsp" %>
	
	<div id="wrap">

        <table id="info-list" align="center" border="1">
            <tr>
                <td rowspan="2" width="400px">사진</td>
                <td width="700px">게시글 제목</td>
            </tr>
            <tr>
                <td>게시글 내용</td>
            </tr>

        </table>

    </div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보공유_애견동반 리스트</title>

<style>
	section{
		width: 1000px;
        height: 2000px;
        margin: auto;
        position: relative;
	}

    #wrap{
        border : 1px solid red;
        width: 780px;
        height: 100%;
        margin-top : 20px;
    }

    .info-list *{
        border : 1px solid black;
    }

</style>
</head>
<body>

	<%@ include file="../common/header-min.jsp" %>
	
	<section>
	
	<%@ include file="infoSidebar.jsp" %>
	
	<div id="wrap">
	
        <div align="right">
        	
        	<% if(userInfo != null) { %>
		    	<a href="<%= contextPath %>/insertForm.in" class="btn btn-sm btn-warning">글 쓰기</a>
        	<% } %>
        </div>

        <table class="info-list">
            <tr>
                <td rowspan="2" width="400px" height="150px">사진</td>
                <td width="600px">맛있는 음식점 방문</td>
            </tr>
            <tr>
                <td>맛있었다.</td>
            </tr>
            <tr>
                <td rowspan="2" width="400px" height="150px">사진</td>
                <td width="600px">맛있는 음식점 방문</td>
            </tr>
            <tr>
                <td>맛있었다.</td>
            </tr>
            <tr>
                <td rowspan="2" width="400px" height="150px">사진</td>
                <td width="600px">맛있는 음식점 방문</td>
            </tr>
            <tr>
                <td>맛있었다.</td>
            </tr>

        </table>

        <div class="share-paging" align="center">

			

        </div>

    </div>
    
    </section>
    

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, petopia.com.kh.jsp.info.model.vo.Info, petopia.com.kh.jsp.common.model.vo.PageInfo" %>
<%
	ArrayList<Info> list = (ArrayList<Info>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
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
    
    #content-area{text-align: right;}

    .info-list *{
        border : 1px solid black;
    }
    
    img{
    	width: 90%;
    	height: 100%;
    	margin-left: 15px;
    }

</style>
</head>
<body>

	<%@ include file="../common/header-min.jsp" %>
	
	<section>
	
	<%@ include file="infoSidebar.jsp" %>
	
	<div id="wrap">
	
        <div id="content-area">
        	<% if(userInfo != null) { %>
		    	<a href="<%= contextPath %>/insertForm.in" class="btn btn-sm btn-warning">글쓰기</a>
        	<% } %>
        </div>

        <table class="info-list">

			
            <tr>
                <td rowspan="2" width="400px" height="150px"><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEyMTdfMjM3%2FMDAxNjcxMjU4NDYzODU3.dwwsILxgh7etBvjzNnjpJrerNu5wUtU6yv7wVMysiPsg.3IZ1WxFc-d0_SJ2uJRlTdeTrOCKC9lzEhm35IfX-Lw0g.JPEG.moakym%2F1000000301.jpg&type=a340"></td>
                <td width="600px">맛있는 음식점 방문</td>
            </tr>
            <tr>
                <td>한 페이지에 12개 들어가면 딱 맞음</td>
            </tr>
            <tr height="10px"></tr>
            
             
        </table>

        <div class="pagin-area" align="center">

			

        </div>

    </div>
    
    </section>
    
    <%@ include file="../common/footer.jsp" %>

</body>
</html>
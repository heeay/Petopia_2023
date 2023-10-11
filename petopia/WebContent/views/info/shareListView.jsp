<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, petopia.com.kh.jsp.info.model.vo.Info, petopia.com.kh.jsp.common.model.vo.PageInfo" %>
<%
	ArrayList<Info> list = (ArrayList<Info>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int ctgNo = (int)request.getAttribute("ctgNo");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
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
        height: 95%;
        margin-top : 20px;
    }
    
    .paging-area{
    	width : 780px;
    	height : 5%;
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
    
    .share-btn{
    	bakground-color : orange;
    	border-radius: 5px;
        margin: 2px;
        width: 30px;
        height: 30px;
        text-align: center;
        line-height: 15px;
        border : 0px;
    }
</style>
</head>
<body>

	<section>
	
	<%@ include file="infoSidebar.jsp" %>
	
	<div id="wrap">
	
        <div id="content-area">
        	<% if(userInfo != null) { %>
        		<!-- 매핑값 : insertForm.in -->
		    	<a href="<%= contextPath %>/insertForm.in" class="btn btn-sm btn-warning">글쓰기</a>
        	<% } %>
        </div>

        <table class="info-list">
			
			<% if(list.isEmpty()) { %>
            <tr>
                <td>조회된 게시글이 없습니다.</td>
            </tr>
            <% } else { %>

                <% for(Info in : list) { %>
                    <tr>
                        <td rowspan="2" width="400px" height="150px"><img src="<%= in.getTitleImg() %>"></td>
                        <td width="600px"><%= in.getInfoTitle() %></td>
                    </tr>
                    <tr>
                        <td><%= in.getInfoContent() %></td>
                    </tr>
                    <tr height="10px"></tr>
                <% } %>
                
            <% } %>
			
			<!--
            <tr>
                <td rowspan="2" width="400px" height="150px"><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEyMTdfMjM3%2FMDAxNjcxMjU4NDYzODU3.dwwsILxgh7etBvjzNnjpJrerNu5wUtU6yv7wVMysiPsg.3IZ1WxFc-d0_SJ2uJRlTdeTrOCKC9lzEhm35IfX-Lw0g.JPEG.moakym%2F1000000301.jpg&type=a340"></td>
                <td width="600px">맛있는 음식점 방문</td>
            </tr>
            <tr>
                <td>한 페이지에 11개 들어가면 딱 맞음</td>
            </tr>
            <tr height="10px"></tr>
            -->
            
        </table>
        
    </div>

        <div class="pagin-area" align="center">

			<% if(currentPage != 1) { %>
				<button onclick="location.href='<%= contextPath %>/share.in?ictg=<%= ctgNo %>&ipage=<%= currentPage - 1 %>'" class="share-btn">&lt;</button>
			<% } %>
			
			<% for(int i = startPage; i <= endPage; i++) { %>
				<% if(currentPage != i) { %>
					<button onclick="location.href='<%= contextPath %>/share.in?ictg=<%= ctgNo %>&ipage=<%= i %>'" class="share-btn"><%= i %></button>
				<% } else { %>
					<button disabled class="share-btn"><%= i %></button>
				<% } %>
			<% } %>

			<% if(currentPage != maxPage) { %>
            	<button onclick="location.href='<%= contextPath %>/share.in?ictg=<%= ctgNo %>&ipage=<%= currentPage + 1 %>'" class="share-btn">&gt;</button>
            <% } %>
        </div>
    
    </section>
    
    <%@ include file="../common/footer.jsp" %>

</body>
</html>
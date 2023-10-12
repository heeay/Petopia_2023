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
	
	div{
		border : 1px solid red;
	}

    #wrap{
        width: 780px;
        height: 90%;
        margin-top : 20px;
    }
    
    .paging-area{
    	width : 780px;
    	height : 10%;
    }
    
    #content-area{text-align: right;}

    .info-list *{
        border : 1px solid black;
    }

    .info-list{
        border-collapse: separate;
        border-spacing: 0px 20px;
        display: flex;
        justify-content: center;
    }
    
    td{background-color : rgb(255, 248, 240);}
    
    #no-list{font-size : 30px;}
    
    img{
    	width: 90%;
    	height: 100%;
    	margin-left: 15px;
    }
    
    .share-btn{
    	background-color: rgb(228, 156, 92);
    	color : white;
    	border-radius: 5px;
        margin: 2px;
        width: 30px;
        height: 30px;
        text-align: center;
        line-height: 15px;
        border : 0px;
    }
    
    .click-area:hover{cursor : pointer;}
    
    #info-no{display : none;}
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
                <td id="no-list">조회된 게시글이 없습니다.</td>
            </tr>
            <% } else { %>

                <% for(Info in : list) { %>
                    <tr class="click-area">
                    	<!-- 각 게시글 번호를 알아내기 위한 td (css영역에서 display:none으로 안 보이게 함) -->
                    	<td id="info-no"><%= in.getInfoNo() %></td>
                        <td rowspan="2" width="400px" height="150px"><img src="<%= in.getTitleImg() %>"></td>
                        <td width="600px"><%= in.getInfoTitle() %></td>
                    </tr>
	                <tr>
	                    <td><%= in.getInfoContent() %></td>
	                </tr>
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
        
        <% if(list.isEmpty()) { %>
            <button disabled class="share-btn" style="background:rgba(228, 156, 92, 0.5)">1</button>
            
        <% } else { %>
			<% if(currentPage != 1) { %>
				<button onclick="location.href='<%= contextPath %>/share.in?ictg=<%= ctgNo %>&ipage=<%= currentPage - 1 %>'" class="share-btn">&lt;</button>
			<% } %>
			
			<% for(int i = startPage; i <= endPage; i++) { %>
				<% if(currentPage != i) { %>
					<button onclick="location.href='<%= contextPath %>/share.in?ictg=<%= ctgNo %>&ipage=<%= i %>'" class="share-btn"><%= i %></button>
				<% } else { %>
					<button disabled class="share-btn" style="background:rgba(228, 156, 92, 0.5)"><%= i %></button>
				<% } %>
			<% } %>
			
			<% if(currentPage != maxPage) { %>
	            <button onclick="location.href='<%= contextPath %>/share.in?ictg=<%= ctgNo %>&ipage=<%= currentPage + 1 %>'" class="share-btn">&gt;</button>
	        <% } %>
	    <% } %>
        
    </div>
    
    <script>
    	$(function() {
    		$('.click-area').click(function(){
    			location.href = '<%= contextPath %>/detailShare.in?ino=' + $(this).children().eq(0).text();
    		});
    	});
    </script>
    
    </section>
    
    <%@ include file="../common/footer.jsp" %>

</body>
</html>
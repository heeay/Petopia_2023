<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, petopia.com.kh.jsp.board.model.vo.Board, petopia.com.kh.jsp.common.model.vo.PageInfo" %>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	// 페이징바 만들 때 필요한 변수 미리 세팅
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인게시판</title>

<!-- css -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- javascript -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
    #wrapper{

        width: 1100px;
        height: 800px;
        margin: auto;
        
        /* border : 1px solid black; */
        background-color: rgb(255, 248, 240);
    }

    #search-area{
       width : 1100px;
       height : 10%;
       /* border : 1px solid black; */
       display : flex;
       justify-content: space-between;
       align-items: center;
    }

    .content-area{
        display : flex;
        justify-content: center;
        height : 80%;
        width : 1100px;
    }

</style>



<!-- search -->
<style>


    #search-bar{
        position : relative;
        display : flex;
        width : 50%;
        align-items: center;
    }

    #search-icon{
        position : absolute;
        right : 10px;
    }

    #search-text {
        width: 100%; /*search-bar의 100%길이란 뜻*/
    
        /* border: 1px solid #bbb; */
        
        border-radius: 10px;
        padding : 1%;
        font-size: 15px;
    
    }

    #search-help{
        display : flex;
        width : 100%;
        align-items: center;
    }
    #search-radio{
        /* border: 1px solid green; */
        
        margin-left : 10px;
        box-sizing: border-box;
    }

    #search-btn{
        display : none;
    }
  

   



</style>

<!-- content -->
<style>

  
    .content{
        margin : 20px 100px;
        width : 300px;
        height : 300px;
        /* border : 1px solid black; */
         
    }
    #img-thumbnail{
        width : 95%;
        height : 90%;
    }
    #writer-img{
        width : 15px;
        height : 15px;
        
    }
    #pasing-area{
        display : flex;
        justify-content: center;
    }
    #pasing-area button{
        margin : 0px 5px;
    }



</style>

</head>
<body>

<%@ include file="../common/header-min.jsp" %>
  <%@ include file="../common/sideBar.jsp" %>
	
	<div id="wrapper">
		
        <div id="search-area">

            <div id="search-help">
                <div id="search-bar">
                    <form action="main.bo" method="get" id="search-form">
                        <input type="text" id="search-text" placeholder="검색어 입력를 입력하세요.">
                        <i id="search-icon" class="fas fa-search"><button type="submit" id="search-btn"></button></i>
                    </form>
                </div>

        <script>
            $(function(){
                $('#search-icon').click(function(){
                    // ???
                    $('#search-btn').submit();
                })
            });
        </script>

                <div id="search-radio">
                    <input type="radio" name="">제목
                    <input type="radio" name="">작성자
                </div>

            </div>

               

                <div id="search-view">
                    <select name="" id="">
                        <option value="">게시글 4개씩 보기</option>
                        <option value="">게시글 2개씩 보기</option>
                        <option value="">게시글 8개씩 보기</option>
                    </select>   
                    
                </div>
            
        </div>


                
                <table class="content-area" align="center">
            <thead>
                <tr>
                    <th width="100">글번호</th>
                    <th width="100">이미지파일번호</th>
                    <th width="300">제목</th>
                    <th width="100">작성자</th>
                    <th width="50">조회수</th>
                    <th width="100">작성일</th>
                    <th width="100">카테고리번호</th>
                    <th width="100">펫카테고리번호</th>
                </tr>
            </thead>
            
            <br>
            
            <tbody>

            	<% if(list.isEmpty()) { %>
	                <tr>
	                    <td colspan="6">조회된 게시글이 없습니다.</td>
	                </tr>
                <% } else { %>
                
                	<% for(Board b : list) { %>
	                	<tr>
	                		<td><%= b.getBoardNo() %></td>
	                		<td><%= b.getFileNo() %></td>
	                		<td><%= b.getBoardTitle() %></td>
	                		<td><%= b.getUserNo() %></td>
	                		<td><%= b.getBoardViews() %></td>
	                		<td><%= b.getBoardCreateDate() %></td>
	                		<td><%= b.getCtgNo() %></td>
	                		<td><%= b.getPetCtgNo() %></td>
	                	</tr>
                	<% } %>

                <% } %>
                
            </tbody>
        </table>

        <script>

            $(function(){
            	
                $('.list-area > tbody > tr').click(function(){
                    location.href = '<%=contextPath%>/detail.bo?bno=' + $(this).children().eq(0).text();
                });
                
                $('.content-reply').html('댓글[' + ']');

                $('.content-view').html('조회수[' + ']');

                $('.content').click(function(){
                    
                });

            });

        </script>
            


            <div id="pasing-area">
                
              <% if(currentPage != 1) { %>
        		<button onclick="location.href='<%=contextPath%>/main.bo?cpage=<%= currentPage - 1 %>'" class="btn btn-sm btn-info">&lt;</button>
            <% } %>
            
            <% for(int i = startPage; i <= endPage; i++) { %>
            	<% if(currentPage != i) { %>
            		<button onclick="location.href='<%=contextPath%>/main.bo?cpage=<%=i%>'" class="btn btn-sm btn-info"><%= i %></button>
            	<% } else { %>
            		<button disabled class="btn btn-sm btn-info"><%= i %></button>
            	<% } %>
            <% } %>
            
            <% if(currentPage != maxPage) { %>
            	<button onclick="location.href='<%=contextPath %>/main.bo?cpage=<%= currentPage + 1 %>'" class="btn btn-sm btn-info">&gt;</button>
            <% } %>
            </div>
        </div>



<%@ include file="../common/footer.jsp" %>

</body>
</html>
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
    int boardLimit = pi.getBoardLimit();
    


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
       height : 20%;
       /* border : 1px solid black; */
       display : flex;
       justify-content: center;
       align-items: center;
    }

    #content-area{
        display : flex;
        justify-content: center;
        height : 70%;
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
        right : 1100px;
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
    #insert-board{
        width : 100px;
    }

    #insert-board a{
        font-style : none;
    }


</style>

<!-- content -->
<style>
    .contents{
       
        
    }
    #content-header{
        font-size : 20px;
        font-weight : 600;
       
    }
    #content-item{
        float : left;
    }

    #list-header {

    }
    #list-header li{
        display : inline;
        margin-right : 20px;
    }
    #list-item{
        float : left;
    }
    #list-item li{
        display : inline;
        margin-right : 20px;
        
    }
  
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
        <section id="search-area">

        <form>

            <article id="search-help">

                <div id="search-bar">
                    
                        <input type="text" name="search-text" id="search-text" placeholder="검색어 입력를 입력하세요.">

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
                    <input type="radio" name="search-radio" value="제목">제목
                    <input type="radio" name="search-radio" value="작성자">작성자
                </div>

            </article>

            <article id="search-view">
                <a href="#">4개씩 보기</a>
                <ul>
                    <li>
                        <a href="<%=contextPath%>/main.bo?display=2">2개씩 보기</a>
                    </li>
                    <li>
                        <a href="<%=contextPath%>/main.bo?display=4">4개씩 보기</a>
                    </li>
                    <li>
                        <a href="<%=contextPath%>/main.bo?display=9">9개씩 보기</a>
                    </li>
                </ul>
                
            </article>
            <i id="search-icon" class="fas fa-search"></i>
            <button type="submit" id="search-btn" class="btn btn-sm btn-info">검색</button>
            
        </form>
            
               <!-- <script>
              $(function(){
                
                 

            <!- js안에는 scriptlet사용불가 -->
            <!-- jsp에서는 가능 -->
          		
      
     
             
	
                 <!-- 한 페이지에 form태그 여러개 상관없음! -->
			<article>
                <button class="btn btn-sm btn-danger"><a href="<%=contextPath%>/insertForm.bo">글쓰기</a></button>
            </article>
                
                

        </section>


                
        <section id="content-area">

            <article id="content-header" class="contents">
                
                <ul id="list-header">
                    <li>글번호</li>
                    <li>파일번호</li>
                    <li>제목</li>
                    <li>작성자</li>
                    <li>조회수</li>
                    <li>작성일</li>
                    <li>카테고리번호</li>
                    <li>펫카테고리번호</li>
                </ul>
                  
            </article>
            
            <article id="content-item" class="contents">

            	<% if(list.isEmpty()) { %>
	                <ul id="list-item">
	                    <li>조회된 게시글이 없습니다.</li>
	                </ul>
                <% } else { %>
                
                
                	<% for(Board b : list) { %>
	                	<ul id="list-item">
	                		<li><%= b.getBoardNo() %></li>
	                		<li><%= b.getFileNo() %></li>
	                		<li><%= b.getBoardTitle() %></li>
	                		<li><%= b.getUserNo() %></li>
	                		<li><%= b.getBoardViews() %></li>
	                		<li><%= b.getBoardCreateDate() %></li>
	                		<li><%= b.getCtgNo() %></li>
	                		<li><%= b.getPetCtgNo() %></li>
	                	</ul>
                	<% } %>

                <% } %>
                
            </article>
        </section>

           <script>
            $(function(){
                //<a href="%= contextPath %/detail.bo?bno=%= b.getBoardNo()%"

                //content-item아래 ul의 자식들(== li들) 중 첫번째(== eq(0))의 text값
                $('#content-item > ul').click(function(){
                    location.href = '<%=contextPath%>/detail.bo?bno=' + $(this).children().eq(0).text();
                });


            })
        </script>
            

           
 <!-- startPage는 1, endPage는 0이므로 1 < 0가 성립못함 -->
            <div id="pasing-area">
                
            <% if(currentPage != 1) { %>
        		<button onclick="location.href='<%=contextPath%>/main.bo?cpage=<%= currentPage - 1 %>'" class="btn btn-sm btn-info">&lt;</button>
            <% } %>

            <%if(startPage >= endPage){%>
                <button class="btn btn-sm btn-info" >1</button>
            <%}%>

            <% for(int i = startPage; i < endPage; i++) { %>
       
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
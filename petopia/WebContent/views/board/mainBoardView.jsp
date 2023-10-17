<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, petopia.com.kh.jsp.board.model.vo.Board, petopia.com.kh.jsp.common.model.vo.PageInfo" %>
<%
	
	ArrayList<Board> bList = (ArrayList<Board>)request.getAttribute("bList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");

	int currentPage = pageInfo.getCurrentPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	int maxPage = pageInfo.getMaxPage();
    int boardLimit = pageInfo.getBoardLimit();

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

<!-- overal -->
<style>
    #wrapper{

        width: 1100px;
        height: 800px;
        margin: auto;
        
        border : 1px solid black;
        background-color: rgb(255, 248, 240);
    }

    #search-area{
       width : 1100px;
       height : 10%;
       border : 1px solid black;
       display : flex;
       justify-content: space-around;
       align-items: center;
    }

    #content-area{
    
  
        border : 1px solid black;
        height : 80%;
        width : 1100px;
    }

</style>







<!-- <script>
    $(function){
        $('#search-count-default').hover(function(){
            $('#search-count-list').css('display', 'block');
        });
    }
</script> -->

</head>
<body>


    <%@ include file="../common/header-min.jsp" %>
    <%@ include file="../common/sideBar.jsp" %>
	
	<div id="wrapper">
		
        <section id="search-area">

            <article id="search-header">

                <form action="<%=contextPath%>/main.bo" method="get" id="search-form">

                    <div id="search-bar">
                            <!-- <input type="hidden"> ??? -->
                            <input type="text" id="search-text" placeholder="검색어 입력를 입력하세요.">
                            <button type="submit" id="search-btn">🔍</button>        
                    </div>

                    <div id="search-radio">
                        <input type="radio" name="search-radio" checked>제목
                        <input type="radio" name="search-radio">작성자
                    </div>

                
            </article>

            <article id="search-count">
                <div id="search-count-toggle">
                    <a href="#">게시글 보기 갯수</a>
                </div>
                <ul id="search-count-list">
                    <li class="search-count">
                        <a href="<%=contextPath%>/main.bo?display=2">2개씩 보기</a>
                    </li>
                    <li class="search-count">
                        <a href="<%=contextPath%>/main.bo?display=4">4개씩 보기</a>
                    </li>
                    <li class="search-count">
                        <a href="<%=contextPath%>/main.bo?display=9">9개씩 보기</a>
                    </li>
                </ul>
                
            </article>
            <script>
                $(function(){
                    // $('.search-count:nth-child[0]').add('id', 'two');

                    // $('.search-count:nth-child[0]').on('click', function(){
                    //     $('.search-count:nth-child[0]').attr('id','two');
                    // });
                    // $('.search-count:nth-child[1]').on('click', function(){
                    //     $('.search-count:nth-child[1]').attr('id','four');
                    // });
                    $('.search-count:nth-child[2]').on('click', function(){
                        $('.search-count:nth-child[2]').attr('id','nine');
                    });
                })
            </script>
                
                 <!-- 한 페이지에 form태그 여러개 상관없음! -->
                 <!-- 로그인한 유저가 있을 때만 보여주기 -->
                  

            
			<article>
                <% if(userInfo != null) { %>
			<!-- button안에 a태그는 지양 -->
               <div id="insert-board-btn" class="btn btn-sm btn-info"><a href="<%= contextPath %>/insertForm.bo">글쓰기</a></div>
                <% } %>
            </article>
       
        </form>
        </section>


        <!-- search -->
<style>
    #search-header{
        /* display : flex;
        justify-content: center; */
        width : 50%;

    }
    #search-form{
        display : flex;
        align-items: center;
    }
    #search-bar{
        position : relative;
        display : flex;
        width : 100%;
        align-items: center;
    }
    #search-count{
        
        
    }   


    #search-text {
        width: 100%; /*search-bar의 100%길이란 뜻*/
    
        /* border: 1px solid #bbb; */
        
        border-radius: 10px;
        padding : 1%;
        font-size: 15px;
    
    }

   
    #search-radio{
        /* border: 1px solid green; */
        width : 30%;
        margin-left : 10px;
        box-sizing: border-box;
    }

    #search-btn{
        position : absolute;
        right : 10px;
        border : none;
        background-color: white;
    }
    #insert-board{
        width : 100px;
    }

    #insert-board a{
        font-style : none;
    }



    .search-count{
        list-style : none;
    }
    #search-count a{
        text-decoration: none;
        color : brown;
    }
    #search-count-list{
        display : none;
        
    }
    /* #search-count-default:hover + #search-count-list {
        display: block;

    } */
    #insert-board-btn {
        background-color: rgb(247, 189, 96);
    }

    #insert-board-btn a{
        text-decoration: none;
        color : white;
    }
</style>

<!-- n개씩 보기 기능 -->
<script>

        $(document).ready(function(){
            $("#search-count-toggle").on("click", function(){
                $("#search-count-list").slideToggle("fast");
            });
            
            $('#insert-board-btn').on('click', function(){
            	location.href  = "<%=contextPath%>/insertForm.bo";
            });
           
        });

</script>

                
        <section id="content-area">

            <article id="content-items">

 
                <% if(bList.isEmpty()) { %>

	                <div class="content-item">
	                    조회된 게시글이 없습니다.
	                </div>

                <% } else { %>


                	<% for(Board board : bList) { %>
	                	
                        <div class="content-item">

                            
                            <a href="<%=contextPath%>/detail.bo?bno=<%= board.getBoardNo() %>">
                            <img src="<%= board.getFileImg() %>" alt="">
                            </a>
                            <p><%= board.getBoardTitle() %></p>
                            <span><%= board.getBoardViews() %>|</span>
                            <span><%= board.getBoardCreateDate() %>|</span>
                            <span><%= board.getUserNo() %></span>
                        </div>

                	<% } %>

                <% } %>
             
            </article>


          
        
            

<!--  대신 이렇게 해도 됨 

            <script>
                $(function(){
        
                    $('.thumbnail').click(function(){
        
                        // 클릭할 때 마다 url요청 => location.href
                        const bno = $(this).children().eq(0).val();
        
                        location.href = '<%=contextPath%>/detail.th?bno=' + bno;
        
                    })
        
                })
            </script>
-->
       
        </section>



        <!-- content -->
        <style>

            /* #content-items{ */
                
                /* 2차원 flex */

       
            
  
            .content-item{
                border : 1px solid black;
                
                
            }
            .content-item img{
                width : 100%;
                height : 80%;
            }

        
            /* 1번째는 img입니당 */
            .content-item p{
                display: flex;
               justify-content: center;
               font-size: larger;
               font-weight: 600;
               
            }

            .content-item span{
                
             }

             
           
            #pasing-area{
                display : flex;
                justify-content: center;
            }
            #pasing-area button{
                margin : 0px 5px;
                background-color: rgb(247, 189, 96);
            }

        </style>

        <!-- 미디어 쿼리 혹은 사용자정의CSS -->
        <!-- boardLimit이 9일때 -->
        <style>
       
            #two{
                display : grid;
                 justify-content: center;
                 
                 grid-template-rows : 100px;
                 grid-template-columns : 100px 100px;
                 
                 row-gap : 35px;
                 column-gap : 100px;
 
                 /* grid-auto-rows: minmax(200px, auto);
                 grid-auto-columns: minmax(300px, auto); */
            }

            #four{
                display : grid;
                 justify-content: center;
                 
                 grid-template-rows : 100px 100px;
                 grid-template-columns : 100px 100px;
                 
                 row-gap : 35px;
                 column-gap : 200px;
 
                 /* grid-auto-rows: minmax(200px, auto);
                 grid-auto-columns: minmax(300px, auto); */
            }

            #nine{
                 
                 display : grid;
                 justify-content: center;
                 
                 grid-template-rows : 100px 100px 100px;
                 grid-template-columns : 100px 100px 100px;
                 
                 row-gap : 35px;
                 column-gap : 70px;
 
                 /* grid-auto-rows: minmax(200px, auto);
                 grid-auto-columns: minmax(300px, auto); */
             }
 
        </style>
        


        <script>
            $(function(){
              
          
  
             


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
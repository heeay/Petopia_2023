<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, petopia.com.kh.jsp.board.model.vo.Board, petopia.com.kh.jsp.common.model.vo.PageInfo" %>
<%
   
	ArrayList<Board> bList = (ArrayList<Board>)request.getAttribute("bList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
    PageInfo pageInfoDisplay = (PageInfo)request.getAttribute("pageInfoDisplay");

	int currentPage = pageInfo.getCurrentPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	int maxPage = pageInfo.getMaxPage();
    int boardLimit = pageInfo.getBoardLimit();
    String dpCount = pageInfoDisplay.getDpCount();

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
       height : 15%;
       border : 1px solid black;
       display : flex;
       justify-content: space-around;
       align-items: center;
    }

    #content-area{

        border : 1px solid black;
        height : 75%;
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
<style>

    #content-items{ 
       
       /* 2차원 flex */
   
  
    
    }

   

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



       
            .one{
                display : flex;
                width : 500px;
                height : 500px;
                 justify-content: center;
                 align-items: center;

            }

            .four{
                display : grid;
                 justify-content: center;
                 
                 grid-template-rows : 300px 300px;
                 grid-template-columns : 400px 400px;
                 
                 row-gap : 100px;
                 column-gap : 200px;
 
                 /* grid-auto-rows: minmax(200px, auto);
                 grid-auto-columns: minmax(300px, auto); */
            }

            .nine{
                 
                 display : grid;
                 justify-content: center;
                 
                 grid-template-rows : 100px 100px 100px;
                 grid-template-columns : 100px 100px 100px;
                 
                 row-gap : 35px;
                 column-gap : 70px;
 
                 /* grid-auto-rows: minmax(200px, auto);
                 grid-auto-columns: minmax(300px, auto); */
             }
 
       
        /* <!-- search --> */
        
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

</head>
<body>

    <%@ include file="../common/header-min.jsp" %>
    <%@ include file="../common/sideBar.jsp" %>
	
    <script>
        $('#insert-board-btn').on('click', function(){
            location.href  = "<%= contextPath %>/insertForm.bo";
        });
   
            // <!-- n개씩 보기 기능 -->
      
        
                $(document).ready(function(){

                    $('#content-items').removeClass();
                    $('#content-items').addClass('four');


                    $('#search-count-toggle').on('click', function(){
                        $('#search-count-list').slideToggle('slow');

                    });
        
                    // 해당 선택자에 one라는 클래스가 없을 때 one를 추가하고, 있다면 삭제(원상복귀 ==  4페이지)
                    $('#search-count-one').on('click', function(){

                        // 2_1. 무식한 방법이지만 하나씩 다 remove 후 마지막에 해당 클래스 추가하기
                        /*
                        $('#content-items').removeClass('one');
                        $('#content-items').removeClass('four');
                        $('#content-items').removeClass('nine');
                        $('#content-items').addClass('one');
                        */

                        //2_2. 더 나은 방법
                        $('#content-items').removeClass();
                        $('#content-items').addClass('one');

                    });
        
                    
                    $('#search-count-four').on('click', function(){
                        $('#content-items').removeClass();
                        $('#content-items').addClass('four');
                         
                        
                    });
        
                    // 해당 선택자에 nine라는 클래스가 없을 때 nine를 추가하고, 있다면 삭제(원상복귀 ==  4페이지)
                    $('#search-count-nine').on('click', function(){
                        $('#content-items').removeClass();
                        $('#content-items').addClass('nine');
                         
                        
                    });

                });

    </script>
	<div id="wrapper">
		
        <section id="search-area">

            <article id="search-header">

                <form action="<%=contextPath%>/main.bo" method="get" id="search-form">

                    <div id="search-bar">
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
                    <li>게시글 보기 갯수</li>
                </div>
                 <!-- 1_1. a태그를 이용해서 boardLimit을 변경해 화면을 변경하는 방법 -->
                <ul id="search-count-list">
                    <li id="search-count-one">
                        <a href="<%= contextPath %>/main.bo?cpage=<%= currentPage %>&display=1">1개씩 보기</a>
                    </li>
                    <li id="search-count-four">
                        <a href="<%= contextPath %>/main.bo?cpage=<%= currentPage %>&display=4">4개씩 보기</a>
                    </li>
                    <li id="search-count-nine">
                        <a href="<%= contextPath %>/main.bo?cpage=<%= currentPage %>&display=9">9개씩 보기</a>
                    </li>
                </ul>
               

                <!-- 1_2. form&input태그를 이용해서 boardLimit을 변경해 화면을 변경하는 방법
                    a태그와 달리 페이지 이동을 하지 않기 때문에 클릭 이벤트 후에도 상태가 유지됨 -->
                <!-- <form action="<%= contextPath %>/main.bo" method="get">
                    <div id="search-count-one">
                        <label for="one"><input type="hidden" id="one" name="display">1개씩 보기</label>
                    </div>
                    <div id="search-count-four">
                        <label for="four"><input type="hidden" id="four" name="display">4개씩 보기</label>
                    </div>
                    <div id="search-count-nine">
                        <label for="nine"><input type="hidden" id="nine" name="display">9개씩 보기</label>
                    </div>
                </form> -->
         
            </article>
           
			<article>
                <% if(userInfo != null) { %>
			<!-- button안에 a태그는 지양 -->
               <div id="insert-board-btn" class="btn btn-sm btn-info"><a href="<%= contextPath %>/insertForm.bo">글쓰기</a></div>
                <% } %>
            </article>
       
        </form>
        </section>

        <section id="content-area">

            <article id="content-items" >

 
                <% if(bList.isEmpty()) { %>

	                <div class="content-item">
	                    조회된 게시글이 없습니다.
	                </div>

                <% } else { %>

<!-- 9개씩 조회 == 레이아웃
     content-items에 class속성을 붙이는데 그 클래스 속성은 css속성들의 집합이다.
    n개씩 조회=선택자.onchange('class',)
-->
                <% for(Board board : bList) { %>
                    
                    <div class="content-item">
                    <!-- boardNo(bno), userNo(uno)를 다 넘기면 userNo가 있을 때만 전체 게시글 조회가 가능-->
                        <a href="<%= contextPath %>/detail.bo?bno=<%= board.getBoardNo() %>">
                        <!-- <a href="<%=contextPath%>/detail.bo?bno=<%= board.getBoardNo() %>"> -->
                        <img src="<%= contextPath %>/<%= board.getFileImg() %>" alt="">
                        </a>
                        <p><%= board.getBoardTitle() %></p>
                        <span><%= board.getBoardViews() %>|</span>
                        <span><%= board.getBoardCreateDate() %>|</span>
                        <span><%= board.getUserNo() %></span>
                    </div>

                <% } %>

            <% } %>
             
            </article>
<!-- content -->

        </section>

 <!-- startPage는 1, endPage는 0이므로 1 < 0가 성립못함 -->
            <div id="pasing-area">
            
            <!-- 게시글이 하나도 없을 때 -->
            <% if(currentPage != 1) { %>
        		<button onclick="location.href='<%= contextPath %>/main.bo?cpage=<%= currentPage - 1 %>&display=<%= dpCount %>'" class="btn btn-sm btn-info">&lt;</button>
            <% } %>

            <!-- 시작페이지와 끝페이지가 같다는 건 boardLimit보다 작거나 같은 수의 게시글이 있어 총 페이지 수가 1이란 뜻 -->
            <%if(startPage >= endPage){%>
                <button class="btn btn-sm btn-info" >1</button>
            <%}%>

            <!-- 숫자 페이징바 영역 -->
            <% for(int i = startPage; i <= endPage; i++) { %>
       
            	<% if(currentPage != i) { %> <!-- 현재페이지가 i가 아니라면 해당 i버튼은 활성화되어야 하고 클릭시 그i페이지로 이동해야-->
            		<button onclick="location.href='<%= contextPath %>/main.bo?cpage=<%= i %>&display=<%= dpCount %>'" class="btn btn-sm btn-info"><%= i %></button>
            	<% } else { %> <!-- 현재페이지가 i면.. 해당 버튼은 비활성화되어야 함 -->
            		<button disabled class="btn btn-sm btn-danger"><%= i %></button>
            	<% } %>

            <% } %>
            
            <!-- ***현재페이지가 최대페이지가 아니면 endPage오른쪽에 >이 표시되어야 하고 클릭시엔 현재페이지에서 +1이 더한 페이지가 나와야함 -->
            <% if(currentPage != maxPage) { %>
            	<button onclick="location.href='<%= contextPath %>/main.bo?cpage=<%= currentPage + 1 %>&display=<%= dpCount %>'" class="btn btn-sm btn-info">&gt;</button>
            <% }  %> 
                <!--현재페이지가 maxPage면 현재페이지버튼은 비활성화하고 내용은 maxPage-->
                <!-- <button disabled class="btn btn-sm btn-danger"><%= maxPage %></button> -->
         
            </div>
        </div>



<%@ include file="../common/footer.jsp" %>

</body>
</html>
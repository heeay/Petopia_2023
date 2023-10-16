<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="petopia.com.kh.jsp.board.model.vo.Board, petopia.com.kh.jsp.common.model.vo.File, java.util.ArrayList" %>
    <% 
    	Board b = (Board)request.getAttribute("b");
    	ArrayList<File> fList = (ArrayList<File>)request.getAttribute("fList");
    	int likeCount = (int)request.getAttribute("likeCount");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세보기</title>

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
        /* border : 1px solid black; */
        box-sizing: border-box;
        background-color: rgb(255, 248, 240);
    }

    #title-area{
        box-sizing: border-box;
        margin-bottom: 20px;
        display: flex;
        justify-content: space-between;
        border : 1px solid black; 
        width  : 1100px;
        height : 10%;
        border : 1px solid black;
    }
    #content-area{
        width : 1100px;
        height : 60%;
        box-sizing: border-box;
        border : 1px solid black;
        margin-bottom: 20px;
    }
    #reply-area {
        /* margin-top: 30px; */
        box-sizing: border-box;
        height : 20%;
    }
    #pasing-area{
        border : 1px solid black;
    }

</style>




<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
</head>
<body>

<%@ include file="../common/header-min.jsp" %>

<%@ include file="../common/sideBar.jsp" %>

<div id="wrapper">
    
   
    
    <div id="title-area">

        <div class="title-info">
            <div id="bno"><%=b.getBoardNo()%></div> 
            <div id="title"><%=b.getBoardTitle()%></div> 
            
        </div>

        <div class="title-info">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIoSkAEH1y2dT7rSK4fBEi3NOd8p9tR3si6w&usqp=CAU"  id="writer-img"><%=b.getUserNo()%>
            <div id="create-date"><%=b.getBoardCreateDate()%></div>
            <i class="fas fa-ellipsis-v"></i>
        </div>

    </div>
    <!-- title -->
    <style>
    .title-info{
        display: flex;
        /* justify-content: space-between; */
        align-items: center;
    }
    .title-info *{
        margin-left: 10px;
    }
    .title-info img{
    	width : 30px;
    	height : 30px;
    }
    #title{
        font-size : 30px;
    }
    #pet-category {
        font-size : 20px;
        margin-left: 10px;
    }
</style>


    <div id="content-area">

        <div id="content-text">  
           <%= b.getBoardContent()%>
        </div>

        <div id="content-imgs">
			<!-- <%= fList %> -->
        </div>

        <div id="content-like">
            <div>
            <img  id="like-icon"src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Bot%C3%B3n_Me_gusta.svg/200px-Bot%C3%B3n_Me_gusta.svg.png" alt="">
            <p id="likeCount">
         		<%= likeCount %>
            </p>
            </div>
        </div>

       
    </div>
    <!-- content-like -->
    <!--  -->
    <script>

        $(function(){

            // 좋아요아이콘 클릭시 이벤트
            $("#like-icon").on("click", function(){

                $.ajax({

                    url : "/petopia/increaseLike.bo",
                    type : "get",
                    data : {
                        bno : $('#bno').val()
                    },
                    
                    success : function(){
                        countLike();
                    }

                }),

            });

        });

        function countLike(){

            $.ajax({

                url : "/petopia/detail.bo",
                type : "get",
                data : {
           
                   likeCount : '<%= likeCount %>'
                },
                success : function(likeCount){

                    $("#likeCount").text(likeCount+1);

                },

            });


        };


    </script>
    <!-- content -->
    <style>
 
    #content-text{
      
    }
  
    #content-imgs{
        display : flex;
        justify-content: space-around;
      
        
    }
    /* 최대 5개의 사진 첨부 가능 */
    #content-img{ 
        max-width:200px;/*???*/
        max-height: fit-content;
    }
    #content-like{
		display : flex;
    	justify-content : center;
    	align-items : center;
    }


    #like-icon{
        width : 30px;
        height : 30px;
            	
    }   
    
    </style>

    <div id="reply-area">

        <form id="reply-form" action="" method="get">
            <input id="reply-text" type="text" placeholder="댓글을 입력해주세요."> 
            <button id="reply-btn" type="submit">등록</button>
        </form>

        <div id="reply-view">

            <div id="reply-writer"><img src="https://m.animalfriends.co.kr/web/product/big/20200319/3267e6876493093412cc9820784ce964.jpg" id="reply-writer-img">작성자이름</div>
            
            <div id="reply-content">
                <div>댓글내용</div>
                
                <div id="reply-date">댓글날짜</div>
                <i class="fas fa-ellipsis-v"></i>
            </div>    

            <form id="rereply-form" action="" method="get">
                <input id="rereply-text" type="text" placeholder="답글을 입력해주세요."> 
                <button type="submit" id="rereply-btn">답글쓰기</button>
            </form>

        </div>

    </div>

    <!-- reply -->
    <style>
    #reply-form{
        display : flex;
        justify-content: center;
        align-items: center;
    }
    #rereply-form{
      
    }
    #reply-text{
        width : 95%;
        border : none;
        
    }
    #rereply-text{
        border : none;
        width : 45%;
    }
    #reply-btn{
        border : 1px solid rgb(247, 189, 96);
        background-color: burlywood;
        color : white;
        width : 50px;
        height : 30px;
        border-radius: 5px;
    }
    #rereply-btn{
        border : 1px solid rgb(247, 189, 96);
        background-color: burlywood;
        color : white;
        width : 100px;
        height : 30px;
        margin-left : 10px;
        border-radius: 5px;
    }
    
    #reply-view{
        border : 1px solid black;
    }
    #reply-writer-img{
        width: 40px;
        height : 40px;
    }
    #reply-writer{
        font-size : 20px;
    }
    #reply-content{
        display : flex;
        align-items: center;
    }

    
    </style>


    <div id="pasing-area">
        <div class="pasing-btn">이전글</div>
        <div class="pasing-btn">다음글</div>
    </div>

    <!-- pasing -->
    <style>
    #pasing-area{
        display : flex;
        justify-content: space-between;
        
    }
    .pasing-btn{
        width : 60px;
        height : 30px;
        background-color: rgb(247, 189, 96);
        color : white;
        text-align: center;
        border-radius: 50%;
    }
    </style>
    
</div>


<%@ include file="../common/footer.jsp" %>
</body>
</html>
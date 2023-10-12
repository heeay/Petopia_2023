<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="petopia.com.kh.jsp.board.model.vo.Board" %>
    <% 
    	Board b = (Board)request.getAttribute("b");
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
        margin-bottom: 30px;
        display: flex;
        justify-content: space-between;
        border : 1px solid black; 
        width  : 1100px;
        height : 10%;
        border-bottom : 1px solid black;
    }
    #content-area{
        
        width : 1100px;
        height : 60%;
        box-sizing: border-box;
        border-bottom : 1px solid black;
    }
    #reply-area {
        /* margin-top: 30px; */
        box-sizing: border-box;
        height : 20%;
    }

</style>

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
    #title{
        font-size : 30px;
    }
    #category {
        font-size : 20px;
        margin-left: 10px;
    }
</style>

<!-- content -->
<style>
#content img{
   
}
#content{

   height : 40%;
}
#content-img{
    display : flex;
    justify-content: center;
    align-items: center;
}
</style>

<!-- like -->
<style>
#like-icons {
    display : flex;
    justify-content: center;
    height : 20%;
}
.like-icon{
    width : 30px;
    height : 30px;
}   

#like-icons >div {
   margin : 10px;

}
</style>

<!-- reply -->
<style>
#reply-form{
   
}
#reply-text{
    width : 80%;
    
}
#reply-btn{

}
#reply-view{

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
#reply-submit{
    display : flex;
}
#reply-btn{
    margin-left : 10px;
}

</style>

<!-- pasing -->
<style>
#pasing-area{
    display : flex;
    justify-content: space-between;
    
}
.pasing-btn{
    width : 50px;
    height : 30px;
    background-color: rgb(247, 189, 96);
    border-radius: 50%;
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
            <div id="title"><%=b.getBoardTitle()%></div> 
            <div id="category">동물종류</div>
        </div>

        <div class="title-info">
            <img src="" id="writer-img"><%=b.getUserNo()%>
            <div><%=b.getBoardCreateDate()%></div>
            <i class="fas fa-ellipsis-v"></i>
        </div>

    </div>

    <div id="content-area">

        <div id="content">  
           <%= b.getBoardContent()%>
        </div>

        <div id="content-img">
			<%= b.getFileNo()%>
        </div>

        <div id="like-icons">
            <div>
            <img class="like-icon" src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Bot%C3%B3n_Me_gusta.svg/200px-Bot%C3%B3n_Me_gusta.svg.png" alt="">
            <p>12</p>
            </div>
            <div>
            <img class="like-icon" src="data:image/jpeg;base64,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" alt="">
            <p>34</p>
            </div>
        </div>
       
    </div>

    <div id="reply-area">
        <form id="reply-form" action="" method="get">
            <input id="reply-text" type="text" placeholder="댓글을 입력해주세요."> 
            <button id="reply-btn" type="submit">등록</button>
        </form>
        <div id="reply-view">
            <div id="reply-writer"><img src="https://m.animalfriends.co.kr/web/product/big/20200319/3267e6876493093412cc9820784ce964.jpg" id="reply-writer-img">작성자이름</div>
            
            <div id="reply-content">
            <div>댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용</div>
            <i class="fas fa-ellipsis-v"></i>
            </div>    

            <div id="reply-submit">
            <div id="reply-date">2023-10-10</div>
            <button type="submit" id="reply-btn">답글쓰기</button>
            </div>  
        </div>
    </div>


    <div id="pasing-area">
        <div class="pasing-btn">이전글</div>
        <div class="pasing-btn">다음글</div>
    </div>
    
</div>


<%@ include file="../common/footer.jsp" %>
</body>
</html>
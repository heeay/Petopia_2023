<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        /* border : 1px solid black; */
        width  : 100%;
        height : 10%;
    }
    #content-area{
        
        width : 100%;
        height : 60%;
        box-sizing: border-box;
       
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
            <div id="title">게시판 제목</div> 
            <div id="category">동물종류</div>
        </div>

        <div class="title-info">
            <img src="" id="writer-img">작성자이름
            <div>2023.09.09</div>
            <i class="fas fa-ellipsis-v"></i>
        </div>

    </div>

    <div id="content-area">

        <div id="content">  
            내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
            내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용
        </div>

        <div id="content-img">
            <img  src="data:image/jpeg;base64,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" alt="">
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
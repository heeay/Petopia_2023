<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.ArrayList, petopia.com.kh.jsp.board.model.vo.Board, petopia.com.kh.jsp.common.model.vo.PageInfo, petopia.com.kh.jsp.user.model.vo.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매칭게시판</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>

    #main{
            width: 1000px;
            height: 2000px;
            margin: auto;
            position: relative;
            padding: 10px 0px;
        }

    #side-menu-wrap{
        width: 100px;
        height: 100%;
        float: right;
    }
    #side-menu{
        width: 130px;
        padding: 20px 8px;
        border-radius: 18px;
        margin-left: 350px;
        font-size: 18px;
        font-weight: 500;
        position: sticky;
        top: 120px;
        background-color: rgb(228, 156, 92);
    }
    #side-menu a{
        display: block;
        width: 100%;
        cursor: pointer;
    }
    #side-menu a:hover{
        color: dodgerblue;
    }
    #category li:not(#category li:last-child){ margin-bottom: 10px; }

    #wrapper{

    width: 800px;
    height: 1000px;
    margin: auto;
    border : 1px solid black;
    

    }
    </style>
    <style>
    #menu-list{
    list-style : none;
    }
    #menu-area{
    margin : 50px;


    }
    #search-bar{

    display : flex;
    justify-content: space-between;
    }
    #search-form{
    border :  1px solid black;
    width : 40%;
    }
    #content-area{
    margin : 50px;

    }
    .content-box{
    display : flex;
    position: relative;

    }
    .content{
    margin : 50px;
    width : 300px;
    height : 300px;
    border : 1px solid black;
    
    }
    #img-thumbnail{
    width : 100%;
    height : 80%;
    }
    #img-writer{
    width : 10px;
    height : 10px;
    }
    #pasing-area{
    display : flex;
    justify-content: center;
    }
    #pasing-area button{
    margin : 5px;
    }

    #title {
        text-align: center;
        font-size: 20px;
        margin-top : 10px;
    }



    #content-info {
        font-size: 10pt;
        text-align: right;
        margin-right : 5px;
    }


    .fa-heart{
        margin-left: -205px;
        margin-top : 2px;
        position: absolute;

    }
    
    .info {
    	margin : 5px;
    }

    .w-btn-outline {
    position: relative;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}
    
    .w-btn-gray-outline {
    border: 3px solid #a3a1a1;
    color: #6e6e6e;
}
.w-btn-gray-outline:hover {
    background-color: #a3a1a1;
    color: #e3dede;
}



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
  
  	.content {
  		cursor:pointer;
  		opactity: 0.9;
  	}

   



</style>

</style>
</head>
<body>


    <%@include file="../common/header.jsp" %>

    <section>
    <div id="main">
        <div id="side-menu-wrap">
            <div id="side-menu">
                <ul id="category">
                    <li><a>관심목록</a></li>
                    <li><a>채팅</a></li>
                    <li><a>받은후기</a></li>
                    <li><a>보낸후기</a></li>
                </ul>
            </div>
        </div>


        <div id="wrapper">

            <div id="search-area">

                <div id="search-help">
                    <div id="search-bar">
                        <form action="main.pb" method="get" id="search-form">
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
            <div id="content-area">
                <div class="content-box">
                    <div class="content">
                        <div><img id="img-thumbnail" src="https://image-notepet.akamaized.net/resize/620x-/seimage/20180309/86dc83a3dcf9b085c43903a83d814d96.png" alt=""></div>
                        <h2 id="title">강아지 목욕 꿀팁!</h2>

                    <div id="content-info">
                        <i class="far fa-heart fa-3x"></i>
                        <div class="info">
                        <span id="pet-detail">13살 푸들 남자 |</span>
                        <span id="user-detail">30대 남성</span>
                        </div>
                        <div class="info">
                        <span id="review">조회수:3</span>
                        <span id="like">관심:30</span>
                        <span id="chatting">채팅:30</span>
                        </div>
                    </div>
                    </div>
                   <div class="content">
                        <div><img id="img-thumbnail" src="https://image-notepet.akamaized.net/resize/620x-/seimage/20180309/86dc83a3dcf9b085c43903a83d814d96.png" alt=""></div>
                        <h2 id="title">강아지 목욕 꿀팁!</h2>

                    <div id="content-info">
                        <i class="far fa-heart fa-3x"></i>
                        <div class="info">
                        <span id="pet-detail">13살 푸들 남자 |</span>
                        <span id="user-detail">30대 남성</span>
                        </div>
                        <div class="info">
                        <span id="review">조회수:3</span>
                        <span id="like">관심:30</span>
                        <span id="chatting">채팅:30</span>
                        </div>
                    </div>
                    </div>
                </div>
                <div class="content-box">
                    <div class="content">
                        <div><img id="img-thumbnail" src="https://image-notepet.akamaized.net/resize/620x-/seimage/20180309/86dc83a3dcf9b085c43903a83d814d96.png" alt=""></div>
                        <h2 id="title">강아지 목욕 꿀팁!</h2>

                    <div id="content-info">
                        <i class="far fa-heart fa-3x"></i>
                        <div class="info">
                        <span id="pet-detail">13살 푸들 남자 |</span>
                        <span id="user-detail">30대 남성</span>
                        </div>
                        <div class="info">
                        <span id="review">조회수:3</span>
                        <span id="like">관심:30</span>
                        <span id="chatting">채팅:30</span>
                        </div>
                    </div>
                    </div>
                   <div class="content">
                        <div><img id="img-thumbnail" src="https://image-notepet.akamaized.net/resize/620x-/seimage/20180309/86dc83a3dcf9b085c43903a83d814d96.png" alt=""></div>
                        <h2 id="title">강아지 목욕 꿀팁!</h2>

                    <div id="content-info">
                        <i class="far fa-heart fa-3x"></i>
                        <div class="info">
                        <span id="pet-detail">13살 푸들 남자 |</span>
                        <span id="user-detail">30대 남성</span>
                        </div>
                        <div class="info">
                        <span id="review">조회수:3</span>
                        <span id="like">관심:30</span>
                        <span id="chatting">채팅:30</span>
                        </div>
                    </div>
                    </div>
                </div>                
    
    
                <div id="pasing-area">
                    <button type="button" class="btn btn-dark"><</button>
                    <button type="button" class="btn btn-dark">1</button>
                    <button type="button" class="btn btn-dark">2</button>
                    <button type="button" class="btn btn-dark">3</button>
                    <button type="button" class="btn btn-dark">4</button>
                    <button type="button" class="btn btn-dark">5</button>
                    <button type="button" class="btn btn-dark">></button>
                </div>
                
        <div id="write-button">
            <a href="<%=contextPath%>/enroller.pb" class="w-btn-outline w-btn-gray-outline" type="submit">글쓰기     </a>     
        </div>
            </div>
        </div>
    </div>
    </section>
<%@include file="../common/footer.jsp" %>
</body>
</html>
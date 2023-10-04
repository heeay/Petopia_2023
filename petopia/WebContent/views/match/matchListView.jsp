<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        }

    #side-menu-wrap{
        width: 220px;
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
    margin-top : 10px;
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

    #writer-info {
        font-size: 10pt;
        text-align: right;
        margin-right : 5px;

    }

    #content-info {
        font-size: 10pt;
        text-align: right;
        margin-right : 5px;

    }
    
    #user-detail {
    }

    .fa-heart{
        margin-right:10px;
    }

</style>
</head>
<body>


    <%@include file="../common/header.jsp" %>

    <section id="main">

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
            <div id="content-area">
                <div id="search-bar">
                    <div id="search-form">검색바<i class="fas fa-search"></i>
                    <input type="radio">제목
                    <input type="radio">작성자
                </div>
                    <div id="search-view">
                    <select name="" id="">
                        <option value="">게시글 4개씩 보기</option>
                        <option value="">게시글 2개씩 보기</option>
                        <option value="">게시글 8개씩 보기</option>
                    </select>   
                    </div>
                </div>
    
    
                <div class="content-box">
                    <div class="content">
                        <div><img id="img-thumbnail" src="https://image-notepet.akamaized.net/resize/620x-/seimage/20180309/86dc83a3dcf9b085c43903a83d814d96.png" alt=""></div>
                        <h2 id="title">강아지 목욕 꿀팁!</h2>

                    <div id="writer-info">
                        <span id="pet-detail">13살 푸들 남자</span>
                        <span id="user-detail">30대 남성</span>
                    </div>
                    <div id="content-info">
						<i class="far fa-heart fa-3x"></i>
                        <span id="review">조회수:3</span>
                        <span id="like">관심:30</span>
                        <span id="chatting">채팅:30</span>
                    </div>
                    </div>
                    <div class="content">
                        <div><img id="img-thumbnail" src="https://image-notepet.akamaized.net/resize/620x-/seimage/20180309/86dc83a3dcf9b085c43903a83d814d96.png" alt=""></div>
                        <h2 id="title">강아지 목욕 꿀팁!</h2>

                    <div id="writer-info">
                        <span id="pet-detail">13살 푸들 남자</span>
                        <span id="user-detail">30대 남성</span>
                    </div>
                    <div id="content-info">
                        <i class="far fa-heart fa-3x"></i>
                        <span id="review">조회수:3</span>
                        <span id="like">관심:30</span>
                        <span id="chatting">채팅:30</span>
                    </div>
                    </div>
                </div>
                <div class="content-box">
                    <div class="content">
                        <div><img id="img-thumbnail" src="https://image-notepet.akamaized.net/resize/620x-/seimage/20180309/86dc83a3dcf9b085c43903a83d814d96.png" alt=""></div>
                        <h2 id="title">강아지 목욕 꿀팁!</h2>

                    <div id="writer-info">
                        <span id="pet-detail">13살 푸들 남자</span>
                        <span id="user-detail">30대 남성</span>
                    </div>
                    <div id="content-info">
                        <i class="far fa-heart fa-3x"></i>
                        <span id="review">조회수:3</span>
                        <span id="like">관심:30</span>
                        <span id="chatting">채팅:30</span>
                    </div>
                    </div>
                    <div class="content">
                        <div><img id="img-thumbnail" src="https://image-notepet.akamaized.net/resize/620x-/seimage/20180309/86dc83a3dcf9b085c43903a83d814d96.png" alt=""></div>
                        <h2 id="title">강아지 목욕 꿀팁!</h2>

                    <div id="writer-info">
                        <span id="pet-detail">13살 푸들 남자</span>
                        <span id="user-detail">30대 남성</span>
                    </div>
                    <div id="content-info">
                        <i class="far fa-heart fa-3x"></i>
                        <span id="review">조회수:3</span>
                        <span id="like">관심:30</span>
                        <span id="chatting">채팅:30</span>
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
            </div>
        </div>

        

</section>
<%@include file="../common/footer.jsp" %>
</body>
</html>
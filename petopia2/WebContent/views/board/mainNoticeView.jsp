<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

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

    #content-area{
        width : 1100px;
        height : 85%;
      
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
</style>

<!-- content -->
<style>
    .content-area{
        width : 100%;
        display : flex;
        justify-content: center;
       
        
    }
    .content{
        margin : 20px 100px;
        width : 100%;
        height : 20%;
        display : flex;
       
        /* border : 1px solid black; */
         
    }
    .content img{
        width : 100px;
        height : 100px;
    }
    
    .discription{
        
    }
    .content-title{
        font-size : 20px;
    }

    .content-detail{
        font-size : 15px;
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
                    <input type="text" id="search-text" placeholder="검색어 입력를 입력하세요.">
                    <i id="search-icon" class="fas fa-search"></i>
                </div>

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
            
            <div class="content">
                <img src="https://m.animalfriends.co.kr/web/product/big/20200319/3267e6876493093412cc9820784ce964.jpg" alt="" id="content-img">
                <div class="discription">
                <p class="content-title">[필독] 등급 관련 안내입니다.</p>
                <span class="content-detail">끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의</span>
                </div>
            </div>
        
            <div class="content">
                <img src="https://m.animalfriends.co.kr/web/product/big/20200319/3267e6876493093412cc9820784ce964.jpg" alt="" id="content-img">
                <div class="discription">
                <p class="content-title">[필독] 등급 관련 안내입니다.</p>
                <span class="content-detail">끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의</span>
                </div>
            </div>

            <div class="content">
                <img src="https://m.animalfriends.co.kr/web/product/big/20200319/3267e6876493093412cc9820784ce964.jpg" alt="" id="content-img">
                <div class="discription">
                <p class="content-title">[필독] 등급 관련 안내입니다.</p>
                <span class="content-detail">끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의</span>
                </div>
            </div>

            <div class="content">
                <img src="https://m.animalfriends.co.kr/web/product/big/20200319/3267e6876493093412cc9820784ce964.jpg" alt="" id="content-img">
                <div class="discription">
                <p class="content-title">[필독] 등급 관련 안내입니다.</p>
                <span class="content-detail">끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의</span>
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
        
        
       


<%@ include file="../common/footer.jsp" %>

</body>
</html>
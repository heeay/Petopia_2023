<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인게시판</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
    #wrapper{

        width: 1100px;
        height: 800px;
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
        width : 90%;
        height : 90%;
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


</style>

</head>
<body>

<%@ include file="../common/header-min.jsp" %>
  <%@ include file="../common/sideBar.jsp" %>
	
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
                    <span>강아지 목욕 꿀팁!</span>
                    <span>댓글[]</span><br>
                    <img id="img-writer"src="" alt="">
                    <span>나는야집사</span>
                    <span>2023.09.09</span>
                    <span>조회수[]</span>
                </div>
                <div class="content">
                    <div><img id="img-thumbnail" src="https://image-notepet.akamaized.net/resize/620x-/seimage/20180309/86dc83a3dcf9b085c43903a83d814d96.png" alt=""></div>
                    <span>강아지 목욕 꿀팁!</span>
                    <span>댓글[]</span><br>
                    <img id="img-writer"src="" alt="">
                    <span>나는야집사</span>
                    <span>2023.09.09</span>
                    <span>조회수[]</span>
                </div>
            </div>
            <div class="content-box">
                <div class="content">
                    <div><img id="img-thumbnail" src="https://image-notepet.akamaized.net/resize/620x-/seimage/20180309/86dc83a3dcf9b085c43903a83d814d96.png" alt=""></div>
                    <span>강아지 목욕 꿀팁!</span>
                    <span>댓글[]</span><br>
                    <img id="img-writer"src="" alt="">
                    <span>나는야집사</span>
                    <span>2023.09.09</span>
                    <span>조회수[]</span>
                </div>
                <div class="content">
                    <div><img id="img-thumbnail" src="https://image-notepet.akamaized.net/resize/620x-/seimage/20180309/86dc83a3dcf9b085c43903a83d814d96.png" alt=""></div>
                    <span>강아지 목욕 꿀팁!</span>
                    <span>댓글[]</span><br>
                    <img id="img-writer"src="" alt="">
                    <span>나는야집사</span>
                    <span>2023.09.09</span>
                    <span>조회수[]</span>
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
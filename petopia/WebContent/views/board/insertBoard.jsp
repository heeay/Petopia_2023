<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>

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






</style>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
</head>
<body>

<%@ include file="../common/header-min.jsp" %>

<%@ include file="../common/sideBar.jsp" %>

<div id="wrapper">
    
    <div id="title-area">

        <div class="title-info">
            <div id="title">게시글 작성</div> 
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

   

   
       
    </div>


    
</div>


<%@ include file="../common/footer.jsp" %>
</body>
</html>
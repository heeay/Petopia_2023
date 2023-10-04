<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>행사 상세페이지</title>

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
        width : 100%;
        height : 20%;
        display : flex;
        text-align: center;
        font-size: 20px;
        box-sizing: border-box;
    }

    #content-area{
        margin : 50px 0px;
        width : 100%;
        height : 80%;
        /* border : 1px solid black; */
        box-sizing: border-box;
        font-size : 40px;
        
    }

</style>

<!-- title -->
<style>
    #title-area {
        border-bottom: 1px solid rgb(247, 189, 96);
        display : flex;
        justify-content: space-between;
        text-align : center;
    }

    #title-area img{
        width : 150px;
        height : 150px;
    }

    .title-event-info {
       
    }

    #title-event-name {
        padding-top : 50px;
    }
    .title-event-info span{
        display : block;
        
    }
  
    
</style>


<!-- join-info -->
<style>
    #join-or-not{
        display : flex;
        /* justify-content: space-between; */
        align-items: center;
        margin-right : 50px;
        
    }


    .join-info-detail{
        margin : 20px 0 20px 0;
    }

    #participant{
        margin-bottom: 50px;
    }

    #participant-detail{
        border-top: 1px solid rgb(247, 189, 96);
        padding-top : 50px;
    }
    .participant-img{
        display : inline-block;
    }
    .participant-img img{
        width: 100px;
        height: 100px;
        border-radius: 50%;
    }
    .participant-img span{
        display : block;
        font-size : 20px;
    }
</style>


</head>
<body>
    <%@ include file="../common/header-min.jsp" %>

    <%@ include file="../common/sideBar.jsp" %>

    <div id="wrapper">
    
        <div id="title-area">

            <div class="title-event-info">
            <img src="https://image-notepet.akamaized.net/resize/620x-/seimage/20180309/86dc83a3dcf9b085c43903a83d814d96.png" alt="">
            </div>

            <div class="title-event-info"  id="title-event-name">
            <span>국제토끼의 날</span>
            <span><a href="#">서울종로구</a><i class="fas fa-map-marker-alt"></i></span>
            </div>

            <div id="join-or-not">
                
                <span>참석합니까 ? </span>
                <i class="far fa-check-square fa-lg"></i>
            </div>
        </div>
    
        

        <div id="content-area">

         

            <div id="join-info">

                <div id="date-and-time" class="join-info-detail">
                    <i class="far fa-clock"></i>
                    <span>2023.10.10</span>
                </div>

                <div id="place-and-location" class="join-info-detail">
                    <i class="fas fa-map-signs"></i>
                    <span>서울 종로구 팔달동 용마산대로1341</span>
                </div>

                <div id="participant" class="join-info-detail">
                    <i class="far fa-user"></i>
                    <span>34명</span>
                </div>

                

                <div id="participant-detail" class="join-info-detail">
                    <div class="participant-img">
                        <img src="https://blog.kakaocdn.net/dn/pweD5/btq4qAY40mY/NMW7YLxEF9xCS1VI8kzMYk/img.png" alt="">
                        <span>칠라칠라</span>
                    </div>
                    <div class="participant-img">
                        <img src="https://blog.kakaocdn.net/dn/pweD5/btq4qAY40mY/NMW7YLxEF9xCS1VI8kzMYk/img.png" alt="">
                        <span>칠라칠라</span>
                    </div>
                    <div class="participant-img">
                        <img src="https://blog.kakaocdn.net/dn/pweD5/btq4qAY40mY/NMW7YLxEF9xCS1VI8kzMYk/img.png" alt="">
                        <span>칠라칠라</span>
                    </div>
                    <div class="participant-img">
                        <img src="https://blog.kakaocdn.net/dn/pweD5/btq4qAY40mY/NMW7YLxEF9xCS1VI8kzMYk/img.png" alt="">
                        <span>칠라칠라</span>
                    </div>
                    <div class="participant-img">
                        <img src="https://blog.kakaocdn.net/dn/pweD5/btq4qAY40mY/NMW7YLxEF9xCS1VI8kzMYk/img.png" alt="">
                        <span>칠라칠라</span>
                    </div>
                    <div class="participant-img">
                        <img src="https://blog.kakaocdn.net/dn/pweD5/btq4qAY40mY/NMW7YLxEF9xCS1VI8kzMYk/img.png" alt="">
                        <span>칠라칠라</span>
                    </div>
                    <div class="participant-img">
                        <img src="https://blog.kakaocdn.net/dn/pweD5/btq4qAY40mY/NMW7YLxEF9xCS1VI8kzMYk/img.png" alt="">
                        <span>칠라칠라</span>
                    </div>
                    <div class="participant-img">
                        <img src="https://blog.kakaocdn.net/dn/pweD5/btq4qAY40mY/NMW7YLxEF9xCS1VI8kzMYk/img.png" alt="">
                        <span>칠라칠라</span>
                    </div>
                    <div class="participant-img">
                        <img src="https://blog.kakaocdn.net/dn/pweD5/btq4qAY40mY/NMW7YLxEF9xCS1VI8kzMYk/img.png" alt="">
                        <span>칠라칠라</span>
                    </div>
                   
                    

                </div>
            </div>

        </div>
    
        
    
      
        
    </div>




    <%@ include file="../common/footer.jsp" %>
</body>
</html>
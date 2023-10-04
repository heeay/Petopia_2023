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
        font-size : 30px;
        
    }

</style>

<!-- title -->
<style>
    #title-info {
        margin : 10% 0 0 1%;
    }
   #title-info span{
    display : flex;
    align-items: center;
   }
   #title-img{

   }
   #title-img img{
    width : 200px;
    height : 200px;
    border-radius: 10px;
    }

    
</style>

<!-- join-info -->
<style>
    #join-check{
        border-top : 1px solid rgb(247, 189, 96);
        margin : 20px 0px;
        font-size : 50px;
        display : flex;
        justify-content: space-between;
        align-items: center;
    }
    #join-info{
        margin : 20px 0px;
    }
    #time-info{
        margin : 20px 0px;
        border-top : 1px solid rgb(247, 189, 96);
        
    }

    #place-info{
        
    }
    #participant-info{
        margin : 20px 0px;
        
       
    }
    #check{
      
    }
</style>

<!-- participant-count -->
<style>
    #participant-count{
        
        border-top : 1px solid rgb(247, 189, 96);
        
    }


    #participants{
        margin : 20px 0px;
        display : flex;
        font-size: 30px;
    }


    .participant img{
        width : 100px;
        height : 100px;
        border-radius : 50%;
    }
    #participant-count span{
       font-size : 25px;
       
    }
    .participant{
        text-align: center;
        font-size: 20px;

    }

   

</style>

</head>
<body>
    <%@ include file="../common/header-min.jsp" %>

    <%@ include file="../common/sideBar.jsp" %>

    <div id="wrapper">
    
        <div id="title-area">

            <div id="title-img">
                <img src="https://image-notepet.akamaized.net/resize/620x-/seimage/20180309/86dc83a3dcf9b085c43903a83d814d96.png" alt="">
            </div>
            
            <div id="title-info">
                <span>국제친칠라의 날</span>
                <span><a href="#">서울종로구</a><i class="fas fa-map-marker-alt"></i></span>
            </div>

            

            
        </div>
    

        

        <div id="content-area">

         <div id="join-check">    

                <span>참석합니까 ?&nbsp;&nbsp;&nbsp;</span>
                <input type="checkbox" id="check" name="">
                <!-- <i class="far fa-check-square fa-lg"></i> -->
        </div>

            <script>
                $(function(){
                    $(':checkbox').css({width:'50px', height:'50px'}).attr('checked', false);
                })
            </script>



            <div id="join-info">

                <div id="time-info" class="">
                    <i class="far fa-clock"></i>
                    <span>2023.10.10</span>
                </div>

                <div id="place-info" class="">
                    <i class="fas fa-map-signs"></i>
                    <span>서울 종로구 팔달동 용마산대로1341</span>
                </div>

                <div id="participant-info" class="">
                    <i class="far fa-user"></i>
                    <span>34명</span>
                </div>

            </div>

            <div id="participant-count">
                <span>참가인원</span>
                <div id="participants" class="">
                    <div class="participant">
                        <img src="https://blog.kakaocdn.net/dn/pweD5/btq4qAY40mY/NMW7YLxEF9xCS1VI8kzMYk/img.png" alt="">
                        <span>칠라스</span>
                    </div>
                    <div class="participant">
                        <img src="https://blog.kakaocdn.net/dn/pweD5/btq4qAY40mY/NMW7YLxEF9xCS1VI8kzMYk/img.png" alt="">
                        <span>칠라스</span>
                    </div>
                    <div class="participant">
                        <img src="https://blog.kakaocdn.net/dn/pweD5/btq4qAY40mY/NMW7YLxEF9xCS1VI8kzMYk/img.png" alt="">
                        <span>칠라스</span>
                    </div>
                    <div class="participant">
                        <img src="https://blog.kakaocdn.net/dn/pweD5/btq4qAY40mY/NMW7YLxEF9xCS1VI8kzMYk/img.png" alt="">
                        <span>칠라스</span>
                    </div>
                    <div class="participant">
                        <img src="https://blog.kakaocdn.net/dn/pweD5/btq4qAY40mY/NMW7YLxEF9xCS1VI8kzMYk/img.png" alt="">
                        <span>칠라스</span>
                    </div>
                    <div class="participant">
                        <img src="https://blog.kakaocdn.net/dn/pweD5/btq4qAY40mY/NMW7YLxEF9xCS1VI8kzMYk/img.png" alt="">
                        <span>칠라스</span>
                    </div>
                    <div class="participant">
                        <img src="https://blog.kakaocdn.net/dn/pweD5/btq4qAY40mY/NMW7YLxEF9xCS1VI8kzMYk/img.png" alt="">
                        <span>칠라스</span>
                    </div>
                    <div class="participant">
                        <img src="https://blog.kakaocdn.net/dn/pweD5/btq4qAY40mY/NMW7YLxEF9xCS1VI8kzMYk/img.png" alt="">
                        <span>칠라스</span>
                    </div>
                    <div class="participant">
                        <img src="https://blog.kakaocdn.net/dn/pweD5/btq4qAY40mY/NMW7YLxEF9xCS1VI8kzMYk/img.png" alt="">
                        <span>칠라스</span>
                    </div>
                   
                </div>    

                
            </div>

        </div>
    
        
    
      
        
    </div>





    <%@ include file="../common/footer.jsp" %>
</body>
</html>
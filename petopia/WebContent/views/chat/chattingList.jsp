<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅방리스트</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>

    #main{
            width: 1000px;
            height: 1200px;
            margin: auto;
            position: relative;
        }

    #side-menu-wrap{
        width: 80px;
        height: 100%;
        float: right;
    }
    #side-menu{
        width: 130px;
        padding: 20px 8px;
        border-radius: 18px;
        margin-left: 150px;
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
    position: relative;

    }



    .chatting-room {
        width: 800px;
        height: 100px;
        border: 1px solid black;
        margin-bottom: 10px;
        align-items: center;
        display:flex;
}
.image-wrapper {
  margin-right: 10px;
}

.pet-img {
    margin: 15px;
    width: 70px;
    height: 70px;
}

.user-name {
    margin-top : 12px;
    font-size : 16pt;
    font-weight : 800;
}

.time {
    margin-top: 20px;
    margin-left : 370px;
}

.chat-contents {
    font-weight: bold;
}


    #pasing-area{
    display : flex;
    justify-content: center;
    position: absolute;
    top: 50%;
    left: 50%;
    margin-left: -150px; 
    margin-top: 400px; 
    }
    
    #pasing-area button{
    margin : 5px;
    
    }

    .chat-detail{
        display: flex;
    }

        .chatting-rooms {
        display: flex;
        flex-wrap: wrap;
    }


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

        <section id="wrapper">
            <div class="chatting-rooms">
            <div class="chatting-room">
                <div class="image-wrapper">
                    <img src="https://www.ikbc.co.kr/data/kbc/image/2023/03/23/kbc202303230044.800x.0.png" alt="펫사진" width="70" height="70" class="pet-img">
                </div>
                <div class="chat-contents">
                    <h2 class="user-name">보리맘</h2>
                    <div class="chat-detail">
                        <h2 class="chat-content">안녕하세요 ㅎㅎ</h2>
                        <span class="time">1시간전</span>
                    </div>
                </div>
            </div>         
            <div class="chatting-room">
                <div class="image-wrapper">
                    <img src="https://www.ikbc.co.kr/data/kbc/image/2023/03/23/kbc202303230044.800x.0.png" alt="펫사진" width="70" height="70" class="pet-img">
                </div>
                <div class="chat-contents">
                    <h2 class="user-name">보리맘</h2>
                    <div class="chat-detail">
                        <h2 class="chat-content">안녕하세요 ㅎㅎ</h2>
                        <span class="time">1시간전</span>
                    </div>
                </div>
            </div>         
            <div class="chatting-room">
                <div class="image-wrapper">
                    <img src="https://www.ikbc.co.kr/data/kbc/image/2023/03/23/kbc202303230044.800x.0.png" alt="펫사진" width="70" height="70" class="pet-img">
                </div>
                <div class="chat-contents">
                    <h2 class="user-name">보리맘</h2>
                    <div class="chat-detail">
                        <h2 class="chat-content">안녕하세요 ㅎㅎ</h2>
                        <span class="time">1시간전</span>
                    </div>
                </div>
            </div>         
            <div class="chatting-room">
                <div class="image-wrapper">
                    <img src="https://www.ikbc.co.kr/data/kbc/image/2023/03/23/kbc202303230044.800x.0.png" alt="펫사진" width="70" height="70" class="pet-img">
                </div>
                <div class="chat-contents">
                    <h2 class="user-name">보리맘</h2>
                    <div class="chat-detail">
                        <h2 class="chat-content">안녕하세요 ㅎㅎ</h2>
                        <span class="time">1시간전</span>
                    </div>
                </div>
            </div>  
            <div class="chatting-room">
                <div class="image-wrapper">
                    <img src="https://www.ikbc.co.kr/data/kbc/image/2023/03/23/kbc202303230044.800x.0.png" alt="펫사진" width="70" height="70" class="pet-img">
                </div>
                <div class="chat-contents">
                    <h2 class="user-name">보리맘</h2>
                    <div class="chat-detail">
                        <h2 class="chat-content">안녕하세요 ㅎㅎ</h2>
                        <span class="time">1시간전</span>
                    </div>
                </div>
            </div>  
            <div class="chatting-room">
                <div class="image-wrapper">
                    <img src="https://www.ikbc.co.kr/data/kbc/image/2023/03/23/kbc202303230044.800x.0.png" alt="펫사진" width="70" height="70" class="pet-img">
                </div>
                <div class="chat-contents">
                    <h2 class="user-name">보리맘</h2>
                    <div class="chat-detail">
                        <h2 class="chat-content">안녕하세요 ㅎㅎ</h2>
                        <span class="time">1시간전</span>
                    </div>
                </div>
            </div>  
            <div class="chatting-room">
                <div class="image-wrapper">
                    <img src="https://www.ikbc.co.kr/data/kbc/image/2023/03/23/kbc202303230044.800x.0.png" alt="펫사진" width="70" height="70" class="pet-img">
                </div>
                <div class="chat-contents">
                    <h2 class="user-name">보리맘</h2>
                    <div class="chat-detail">
                        <h2 class="chat-content">안녕하세요 ㅎㅎ</h2>
                        <span class="time">1시간전</span>
                    </div>
                </div>
            </div>                                                       
            <div class="chatting-room">
                <div class="image-wrapper">
                    <img src="https://www.ikbc.co.kr/data/kbc/image/2023/03/23/kbc202303230044.800x.0.png" alt="펫사진" width="70" height="70" class="pet-img">
                </div>
                <div class="chat-contents">
                    <h2 class="user-name">보리맘</h2>
                    <div class="chat-detail">
                        <h2 class="chat-content">안녕하세요 ㅎㅎ</h2>
                        <span class="time">1시간전</span>
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
        </section>
    </div>
    </section>
    <%@include file="../common/footer.jsp" %>

</body>
</html>
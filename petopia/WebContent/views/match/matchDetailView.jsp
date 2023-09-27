<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매칭게시판 상세보기</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>

        
    .fas {
        color: black;
    }   

    #location {
    margin-top: 20px; /* 원하는 만큼 음수값으로 조정 */
    margin-left : 40px;
    font-size: 20pt;
    }

    #time {
    margin-top: 20px; /* 원하는 만큼 음수값으로 조정 */
    margin-left : 40px;
    font-size: 20pt;
    }

    #user-name {
    margin-top: 20px; /* 원하는 만큼 음수값으로 조정 */
    margin-left : 20px;
    font-size: 20pt;
    }

    #user-detail {
    margin-left: 20px;
    margin-left : 40px;
    font-size: 12pt;
    }
    
    #pet-name {
    margin-top: 20px; /* 원하는 만큼 음수값으로 조정 */
    margin-left : 20px;
    font-size: 20pt;
    }

    #pet-detail {
        margin-left: 30px;
        font-size: 12pt;
    }

    #user-detail {
        margin-left: 30px;
        font-size: 12pt;
    }

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
        margin-left: 20px;
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

    #info {
        display: flex;
    }

    .image-container {
    display: flex;
    }

    #grade {
		width: 40px;
        height: 60px;
        text-align: center;
        background-color: gray;
        border-radius: 30px;

			
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

    <div>
        <section id="info">
                <di class="image-container">
                    <img src="https://www.ikbc.co.kr/data/kbc/image/2023/03/23/kbc202303230044.800x.0.png" class="Img" width="130" height="170">
                    <img src="https://www.ikbc.co.kr/data/kbc/image/2023/03/23/kbc202303230044.800x.0.png" class="Img" width="130" height="170">
                </di>
                <div id="name">
                    <h2 id="user-name"><a href="#"><i class="fas fa-user"></i></a>김순자<span id="user-detail">30대 남성</span></h2>
                    <h2 id="pet-name"><a href="#"><i class="fas fa-dog"></i></a>절미<span id="pet-detail">리트리버 1살 남</span></h2>
                </div>   
                <div>
                    <h2 id="location"><a href="#"><i class="fas fa-map-marker"></i></a>고양시 덕양구</h2>
                    <h2 id="time"><i class="far fa-clock"></i>활동 1시간 전</h2>
                    <div id="grade"></div>
                </div>
    


        </section>        
    </div>



    
	</section>
    <%@include file="../common/footer.jsp" %>

</body>
</html>
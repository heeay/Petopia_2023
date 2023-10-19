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
    
    .fa-heart {
        color : red;
    }

    #location {
    margin-top: 28px; 
    margin-left : 100px;
    font-size: 16pt;
    }

    #time {
    margin-top: 28px;
    margin-left : 100px;
    font-size: 16pt;
    }

    #user-name {
    margin-top: 20px; 
    margin-left : 20px;
    font-size: 20pt;
    }

    #user-detail {

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
		width: 450px;
        height: 40px;
        text-align: center;
        line-height: 40px;
        position: absolute;
        background-color: lightgray;
        border-radius: 60px;
        right: 250px;
        margin-top: 20px;
    }
    
    #write {
        margin: 60px;
        width: 800px;
        
    }

    #pet-introduction {
        margin-top: 100px;
    }

    #request {
        display: flex;
    }
    
    #chatting {
    	margin-left : 400px
    }
    
    #like {
    	margin-left : 50px
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

    
        <section id="info">
                <div class="image-container">
                    <img src="https://www.ikbc.co.kr/data/kbc/image/2023/03/23/kbc202303230044.800x.0.png" class="Img" width="130" height="170">
                    <img src="https://www.ikbc.co.kr/data/kbc/image/2023/03/23/kbc202303230044.800x.0.png" class="Img" width="130" height="170">
                </div>
                <div id="name">
                    <h2 id="user-name"><a href="#"><i class="fas fa-user"></i></a>김순자<span id="user-detail">30대 남성</span></h2>
                    <h2 id="pet-name"><a href="#"><i class="fas fa-dog"></i></a>절미<span id="pet-detail">리트리버 1살 남</span></h2>
                </div>   
                <div>
                    <h2 id="location"><a href="#"><i class="fas fa-map-marker"></i></a>고양시 덕양구</h2>
                    <h2 id="time"><i class="far fa-clock"></i>활동 1시간 전</h2>
                    <div id="grade">
				<table>
				    <tr class="heart">
				       <i class="fas fa-heart"></i> 30 &nbsp;  &nbsp; &nbsp; &nbsp; |   &nbsp; &nbsp; &nbsp; &nbsp;
				    </tr>
				    <tr class="return">
				        응답률 100%    &nbsp; &nbsp; &nbsp; &nbsp; |   &nbsp; &nbsp; &nbsp; &nbsp;
				    </tr>
				    <tr class="grade">
                   	  평점 4.3
				    </tr>
				</table>
                    </div>
                </div>
  		 </section>
            <section id="write">
                <div id="hope-activity">
                    <h2>제목</h2>
                    <textarea cols=90 rows=10 disabled>읽기만하세요</textarea>
                </div>
                <div id="hope-activity">
                    <h2>희망 교류 활동</h2>
                    <textarea cols=90 rows=10 disabled>읽기만하세요</textarea>
                </div>
                <div id="pet-introduction">
                    <h2>우리 아이 소개</h2>
                    <textarea cols=90 rows=10 disabled>읽기만하세요</textarea>
                </div>
		</section>      

        <section id="request">
            <div id="like">
                <button class="w-btn-outline w-btn-gray-outline" type="button">귀여워요</button>
            </div>

            <div id="chatting">
                <button class="w-btn-outline w-btn-gray-outline" type="button">1:1 채팅하기</button>
            </div>
        </section>

        <div align="center">
            <a href="">목록으로</a>
            <a href="">수정하기</a>
            <a href="">삭제하기</a>
        </div>


    
    <%@include file="../common/footer.jsp" %>
	</section>

</body>
</html>
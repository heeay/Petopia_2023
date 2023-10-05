<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1채팅창</title>
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
position: relative;
}

.pet-img {
	margin : 20px;
}

#pet-info{
    display: flex;
}

#user-name{
    font-size: 40px;
    font-weight: 900;
    margin-top : 20px;
}

#time {
	margin-top : 100px;
	margin-left : -200px;
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
        <section id="wrapper">
        <div id="pet-info">
            <img src="https://www.ikbc.co.kr/data/kbc/image/2023/03/23/kbc202303230044.800x.0.png" alt="펫사진" width="140" height="140" class="pet-img">
            <h2 id="user-name">보리맘</h2>
            <h2 id="time">1시간 전 활동</h2>
        </div>
        



        </section>




    </section>

    <%@include file="../common/footer.jsp" %>
</body>
</html>
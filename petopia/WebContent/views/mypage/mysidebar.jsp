<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        #sidemenu{
            margin-top: 50px;
            margin-bottom: 50px;
        }
        .side-area{
            background-color: rgb(244, 217, 174);
            display : table-cell;
            padding-top: 15px;
            position: relative;
            z-index: 1;
            height : 100%;
        }
        .side-area a {
            text-decoration : none;
            width : 100%;
            height : 100%;
            display : block;
            line-height : 50px;
            color : black;
            font-weight : bold;
        }
        .side{
         	height :50px;
         	width : 300px;
         	text-align: center;
            font-size: 16px;
        }
        .side a{
         text-decoration : none;
         width : 100%;
         height : 100%;
         line-height : 50px;
         color : black;
         font-weight : bold;
        }
        .side a:hover{background-color: rgb(228, 156, 92);}

        .btn-border-none{
            border: 0;
            background-color: rgb(230, 204, 184);
        }
        .logo img{
        	width: 120px;
        }

        img {
            margin: auto;
            display: block;
        }

        .profil-bar{
            margin-top: 100px;
        }
        .profil img {
            width: 200px;
        }
        #profil-name{
            text-align: center; 
        }
        
        .header{

        }

    </style>

<style>
    a{
        text-decoration: none;
    }
    ul,ol{
        list-style: none;
    }

</style>
<style>
    header{
        width: 100%;
        background-color: rgb(255, 248, 240);
    }

    .header-navi{
        height: 100%;
        float: left;
        padding-left: 400px;
    }
    .header-navi-item{
        width: 120px;
        height: 100%;
        float: left;
    }
    .header-navi a{
        display: block;
        width: 100%;
        height: 100%;
        color: black;
        font-size: 20px;
        font-weight: bold;
        text-align: center;
        line-height: 75px;
    }
    .header-navi a:hover{
        color: dodgerblue;
    }
    .user-navi{
        float: right;
        padding-right:100px;
    }
    .user-navi-item{
        width: 150px;
        height: 100%;
        float: left;
    }
    .user-navi-icon-btn{
        width: 50px;
        height: 100%;
        float: left;
    }
    #header-bar{
        width: 100%;
        height: 80px;
        position: fixed;
        z-index: 1;
        top: 0px;
        left: 0px;
        background-color: rgb(247, 222, 205);
    }

</style>

</head>
<body>
	<div>

        <header>
            <div id="header-bar">
                <div id="header-bar-wrap">
                    
                    <ul class="header-navi">
                        <li class="header-navi-item"><a href="#">커뮤니티</a></li>
                        <li class="header-navi-item"><a href="#">정보</a></li>
                        <li class="header-navi-item"><a href="#">행사</a></li>
                        <li class="header-navi-item"><a href="#">매칭</a></li>
                    </ul>
                    <ul class="header-navi user-navi">
                        <li class="user-navi-item"><a href="">마이페이지</a></li>
                        <li class="user-navi-icon-btn"><a href="#"><span class="material-symbols-outlined icon-size">search</span></a></li>
                        <li class="user-navi-icon-btn"><a href="#"><span class="material-symbols-outlined icon-size">menu</span></a></li>
                    </ul>
                </div>
            </div>


        <div class="side-area">

            <div class="logo">
                <a href=""><img src="<%=contextPath%>\resources\images\logo.png" alt="로고"></a>
            </div>


            <div class="profil-bar">
                <div class="profil"><img src="<%=contextPath%>\resources\images\profil.png" alt="기본프로필"></div>
                <div id="profil-name"><a href="#">닉네임</a></div>
            </div>

            <div id="sidemenu">
                <div class="side"><a href="#">내 등급 및 점수</a></div>
                <div class="side"><a href="#">내정보 변경</a></div>
                <div class="side"><a href="#">펫 다이어리 작성</a></div>
                <div class="side"><a href="#">내 애완동물 프로필</a></div>
                <div class="side"><a href="#">건의사항/고객센터</a></div>
            </div>

        </div>

	<%@ include file="../common/footer.jsp" %>

    </div>
</body>
</html>
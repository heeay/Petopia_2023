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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        #sidemenu{
            margin-top: 50px;
            margin-bottom: 50px;
        }
        .side-area{
            border: 1px solid black;
            background-color: rgb(244, 217, 174);
            display : table-cell;
            padding-top: 50px;
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
        .logo img{width: 200px;}

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
        

    </style>

</head>
<body>
	<div>
        
        <br clear="both">

        <div class="navi-area" align="center">
            
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
    </div>
</body>
</html>
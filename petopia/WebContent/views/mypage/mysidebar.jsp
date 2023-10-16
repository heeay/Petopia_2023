<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="petopia.com.kh.jsp.user.model.vo.*"%>
<%
    String contextPath = request.getContextPath();
	User userInfo = (User)session.getAttribute("userInfo");
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
        body{
            -webkit-user-select:none;
            -moz-user-select:none;
            -ms-user-select:none;
            user-select:none
        }
    </style>
    <style>
        #sidemenu{
            margin-top: 120px;
            margin-bottom: 50px;
        }
        .side-area{
            background-color: rgb(244, 217, 174);
            display : table-cell;
            padding-top: 15px;
            position: absolute;
            z-index: 1;
            height : 100%;
            top: 0px;
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
            margin-top: 150px;
        }
        .profil img {
            width: 200px;
        }
        #profil-name{
            text-align: center; 
        }

    </style>

    <style>
        *{
            padding: 0px;
            margin: 0px;
            box-sizing: border-box;
        }
        a{
            text-decoration: none;
        }
        ul,ol{
            list-style: none;
        }
        section,footer,div,li{
            box-sizing: border-box;
        }
    </style>
    
	<style>

		.header-navi a:hover{
            color: dodgerblue;
        }
        
        #header-wrap{
            width: 1100px;
            height: 100%;
            margin: auto;
        }
        .header-navi{
            height: 100%;
            float: left;
        }
        .header-navi-item{
            width: 120px;
            height: 100%;
            float: left;
        }
        .header-navi a{
            text-decoration: none;
            display: block;
            width: 100%;
            height: 100%;
            color: black;
            font-size: 20px;
            font-weight: bold;
            text-align: center;
            line-height: 75px;
        }
        .user-navi{
            float: right;
        }
        .user-navi-item{
            width: 100px;
            height: 100%;
            float: left;
            margin-right: 50px;
        }
        .user-navi-icon-btn{
            width: 50px;
            height: 100%;
            float: left;
        }
        #header-bar{
            width: 100%;
            height: 80px;
            z-index: 1;
            top: 0px;
            left: 0px;
            background-color: rgb(247, 222, 205);
        }
        #header-bar-wrap{
            width: 100%;
            height: 100%;
            margin: auto;
            padding-left: 400px;
            padding-right: 80px;
        }
    </style>
    <script>
        $(document).ready(function(){
            $(document).bind("dragstart", function(){return false});
            $(document).bind("", function(){return false});
        })
    </script>

</head>
<body>
	<div>
        <div id="header-bar">
            <div id="header-bar-wrap">
                    
                <ul class="header-navi">
                    <li class="header-navi-item"><a href="<%= contextPath %>/main.bo">커뮤니티</a></li>
                    <li class="header-navi-item"><a href="<%= contextPath %>/share.in?ictg=12&ipage=1">정보</a></li>
                    <li class="header-navi-item"><a href="#">행사</a></li>
                    <li class="header-navi-item"><a href="<%=contextPath %>/main.pb">매칭</a></li>
                </ul>
                <ul class="header-navi user-navi">
                    <li class="user-navi-icon-btn"><a href="<%=contextPath %>/logout"><span class="material-symbols-outlined icon-size">logout</span></a></li>
                    <li class="user-navi-icon-btn"><a href="#"><span class="material-symbols-outlined icon-size">search</span></a></li>
                    <li class="user-navi-icon-btn"><a href="#"><span class="material-symbols-outlined icon-size">menu</span></a></li>
                </ul>
            </div>
        </div>

        <div class="side-area">

            <div class="logo">
                <a href="<%=contextPath %>"><img src="<%=contextPath%>\resources\images\logo.png" alt="로고"></a>
            </div>


            <div class="profil-bar">
                <div class="profil">
                <% if(userInfo.getFileMypageNo().equals("/")) {%>
                	<img src="<%=contextPath%>\resources\images\profil.png" alt="기본프로필">
                <% } else {%>
                <%
                String url = userInfo.getFileMypageNo();
                if(!url.substring(0, url.indexOf('/')).equals("https:")&&!url.substring(0, url.indexOf('/')).equals("http:")){
                %>
                	<img src="<%=contextPath%>/<%=userInfo.getFileMypageNo()%>" class="rounded-circle" alt="프로필기본">
                <%} else { %>
                	<img src="<%=userInfo.getFileMypageNo()%>" class="rounded-circle" alt="프로필기본">
                <%} %>
                <% } %>
                </div>
                <br>
                <div id="profil-name"><b><%=userInfo.getUserNickname() %> 님</b></div>
            </div>

            <div id="sidemenu">
                <div class="side"><a href="<%=contextPath %>/views/mypage/mygradeView.jsp">내 등급 및 점수</a></div>
                <div class="side"><a href="<%=contextPath %>/change.my">내 정보변경</a></div>
                <div class="side"><a href="<%=contextPath %>/pet.my?cpage=1">내 애완동물 프로필</a></div>
                <div class="side"><a href="<%=contextPath %>/hosMain.my">펫 다이어리 작성</a></div>
                <div class="side"><a href="<%=contextPath %>/views/mypage/suggestions.jsp">건의사항/고객센터</a></div>
            </div>

        </div>

    </div>
</body>
</html>
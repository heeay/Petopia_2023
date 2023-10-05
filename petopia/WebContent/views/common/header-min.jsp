<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="petopia.com.kh.jsp.user.model.vo.User"%>
<%
String contextPath = request.getContextPath();
User userInfo = (User)session.getAttribute("userInfo");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>header</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
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
        header,section,footer,div,li{
            /*border: 1px solid seagreen;*/
            box-sizing: border-box;
        }
    </style>
    <style>
        header{
            width: 100%;
            height: 80px;
            background-color: rgb(255, 248, 240);
        }
        #header-wrap{
            width: 1100px;
            height: 100%;
            margin: auto;
        }
        .header-logo{
            width: 180px;
            height: 100%;
            float: left;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 50px;
            background-color: rgb(247, 189, 96);
        }
        .logo{
            width: 100px;
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
            display: block;
            width: 100%;
            height: 100%;
            color: black;
            font-size: 18px;
            font-weight: bold;
            text-align: center;
            line-height: 75px;
        }
        .header-navi a:hover{
            color: dodgerblue;
        }
        .user-navi{
            float: right;

        }
        .user-navi-item{
            width: 90px;
            height: 100%;
            float: left;
        }
        .user-navi-item > span{
            display: inline-block;
            width: 65px;
            height: 100%;
        }
        .user-navi-icon-btn{
            width: 50px;
            height: 100%;
            float: left;
            position: relative;
        }
        #header-bar{
            width: 100%;
            height: 80px;
            position: fixed;
            z-index: 10;
            top: 0px;
            left: 0px;
            background-color: rgb(247, 222, 205);
        }
        #header-bar-wrap{
            width: 1100px;
            height: 100%;
            margin: auto;
        }
        .header-tool{
            width: 100%;
            height: 100%;
            border: none;
            line-height: 75px;
            background-color: unset;
        }
        .header-tool:hover{
            color: dodgerblue;
        }
        .header-search-bar-wrap{
            width: 360px;
            height: 35px;
            position: absolute;
            top: 20px;
            right: 10px;
        }
        .header-search-bar{
            width: 85%;
            height: 100%;
            border: 2px solid rgb(80, 49, 8);
            border-radius: 10px 0 0 10px;
            padding: 0 10px;
            margin: 0;
            box-sizing: border-box;
            float: left;
            box-shadow: 0 4px 4px -4px black;
        }
        .header-search-bar:focus{
            outline: none;
        }
        .header-search-btn{
            width: 15%;
            height: 100%;
            color: rgb(80, 49, 8);
            background-color: rgb(255, 193, 99);
            border-style: solid;
            border-color: rgb(80, 49, 8);
            border-width: 2px 2px 2px 0;
            border-radius: 0 10px 10px 0;
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            float: left;
            box-shadow: 0 4px 4px -4px black;
        }
    </style>
</head>
<body>
    <header>
        <div id="header-bar" style="display: none;">
            <div id="header-bar-wrap">
                <div class="header-logo">
                    <a href="<%=contextPath %>"><img class="logo" src="<%=contextPath %>/resources/images/logo.png" alt=""></a>
                </div>
                <ul class="header-navi">
                    <li class="header-navi-item"><a href="<%= contextPath %>/views/board/mainBoard.jsp">커뮤니티</a></li>
                    <li class="header-navi-item"><a href="<%= contextPath %>/share.in">정보</a></li>
                    <li class="header-navi-item"><a href="#">행사</a></li>
                    <li class="header-navi-item"><a href="<%=contextPath %>/views/chat/chattingList.jsp">매칭</a></li>
                </ul>
                <ul class="header-navi user-navi">
                	<%if(userInfo == null){ %>
                    	<li class="user-navi-item"><a href="<%=contextPath %>/login">로그인</a></li>
                    <%} else { %>
                    	<li class="user-navi-item"><span><a href="<%=contextPath %>/views/mypage/mygradeView.jsp"><%=userInfo.getUserNickname() %></a></span>님</li>
                    	<li class="user-navi-item"><a href="<%=contextPath %>/logout">로그아웃</a></li>
                    <%} %>
                    <li class="user-navi-icon-btn">
                        <button class="header-tool header-search-tool"><span class="material-symbols-outlined icon-size">search</span></button>
                        <form class="header-search-bar-wrap" style="display: none;" action="test" method="get">
                            <input class="header-search-bar" type="text" name="query">
                            <button type="submit" class="header-search-btn"><span class="material-symbols-outlined icon-size">search</span></button>
                        </form>
                    </li>
                    <li class="user-navi-icon-btn"><a href="#"><span class="material-symbols-outlined icon-size">menu</span></a></li>
                </ul>
            </div>
        </div>
        <div id="header-wrap">
            <div class="header-logo">
                <a href="<%=contextPath %>"><img class="logo" src="<%=contextPath %>/resources/images/logo.png" alt=""></a>
            </div>
            <ul class="header-navi">
                <li class="header-navi-item"><a href="<%= contextPath %>/views/board/mainBoard.jsp">커뮤니티</a></li>
                <li class="header-navi-item"><a href="<%= contextPath %>/share.in">정보</a></li>
                <li class="header-navi-item"><a href="#">행사</a></li>
                <li class="header-navi-item"><a href="<%=contextPath %>/views/chat/chattingList.jsp">매칭</a></li>
            </ul>
            <ul class="header-navi user-navi">
                <%if(userInfo == null){ %>
                	<li class="user-navi-item"><a href="<%=contextPath %>/login">로그인</a></li>
                <%} else { %>
                	<li class="user-navi-item"><span><a href="<%=contextPath %>/views/mypage/mygradeView.jsp"><%=userInfo.getUserNickname() %></a></span>님</li>
                	<li class="user-navi-item"><a href="<%=contextPath %>/logout">로그아웃</a></li>
                <%} %>
                <li class="user-navi-icon-btn">
                    <button class="header-tool header-search-tool"><span class="material-symbols-outlined icon-size">search</span></button>
                    <form class="header-search-bar-wrap" style="display: none;" action="test" method="get">
                        <input class="header-search-bar" type="text" name="query">
                        <button type="submit" class="header-search-btn"><span class="material-symbols-outlined icon-size">search</span></button>
                    </form>
                </li>
                <li class="user-navi-icon-btn"><a href="#"><span class="material-symbols-outlined icon-size">menu</span></a></li>
            </ul>
        </div>
    </header>
    <script>
        $(document).ready(function(){
            const headerBar = document.getElementById("header-bar");
            $(window).scroll(function(){
                if($(window).scrollTop()>80){
                    headerBar.style.display="block";
                }
                else{
                    headerBar.style.display="none";
                }
            });

            $(".header-search-tool").click(function(){
                if($(this).siblings(".header-search-bar-wrap").css("display")=="none"){
                    $(this).siblings(".header-search-bar-wrap").show(100);
                    $(this).siblings(".header-search-bar-wrap").children().select();
                }
                else{
                    $(this).siblings(".header-search-bar-wrap").hide(100);
                }
            });
            $(".header-search-bar").focusout(function(){
                $(this).parent().css("display","none");
            });
        })
    </script>
</body>
</html>
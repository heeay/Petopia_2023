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
        body{
            -webkit-user-select:none;
            -moz-user-select:none;
            -ms-user-select:none;
            user-select:none
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
            width: 1200px;
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
        	text-decoration: none;
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
            width: 80px;
            height: 100%;
            float: left;
        }
        .user-nickname{
            width: 160px;
            text-align: right;
            padding: 0 5px;
        }
        .user-nickname > span{
            display: inline-block;
            width: 130px;
            height: 100%;
            padding: 0 5px;
        }
        .user-nickname a{
            text-align: right;
        }
        .user-navi-icon-btn{
            width: 50px;
            height: 100%;
            float: left;
            position: relative;
        }
        #fixed-header-bar-wrap{
            width: 100%;
            height: 80px;
            position: fixed;
            z-index: 10;
            top: 0px;
            left: 0px;
            background-color: rgb(245, 216, 190);
        }
        #header-bar-wrap{
            width: 100%;
            height: 80px;
            position: fixed;
            z-index: 10;
            top: 0px;
            left: 0px;
            background-color: rgb(247, 222, 205);
        }
        .header-bar{
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
            box-shadow: 4px 5px 5px -4px black;
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
            box-shadow: -4px 5px 5px -4px black;
        }
    </style>
    <script>
        $(document).ready(function(){
            $(document).bind("dragstart", function(){return false});
            $(document).bind("", function(){return false});
        })
    </script>
<!--<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
    //네이버 로그아웃
    var testPopUp;
    function openPopUp() {
        testPopUp = window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=no,scrollbars=no,resizable=no,width=1,height=1");
    }
    function closePopUp(){
        testPopUp.close();
    }
    function naverLogout() {
        openPopUp();
        closePopUp();
    }
    //카카오 로그아웃
    Kakao.init('f9947b6fb5f9eb6975bcffce3ad32133');
    function kakaoLogout() {
        if (Kakao.Auth.getAccessToken()) {
          Kakao.API.request({
            url: '/v1/user/unlink',
            success: function (response) {
                console.log(response)
                alert("wewe");
            },
            fail: function (error) {
              console.log(error)
              alert("wewe");
            },
          })
          Kakao.Auth.setAccessToken(undefined)
        }
      }
</script>-->

</head>
<body>
    <header>
        <div id="fixed-header-bar-wrap">
            <div id="header-bar">
                <div class="header-logo">
                    <a href="<%=contextPath %>"><img class="logo" src="<%=contextPath %>/resources/images/logo.png" alt=""></a>
                </div>
                <ul class="header-navi">

                    <li class="header-navi-item"><a href="<%= contextPath %>/main.bo">커뮤니티</a></li>
                    <li class="header-navi-item"><a href="<%= contextPath %>/share.in?ictg=12&ipage=1">정보</a></li>
                    <li class="header-navi-item"><a href="#">행사</a></li>
                    <li class="header-navi-item"><a href="<%=contextPath %>/main.pb">매칭</a></li>
                </ul>
                <ul class="header-navi user-navi">
                	<%if(userInfo == null){ %>
                    	<li class="user-navi-item"><a href="<%=contextPath %>/login">로그인</a></li>
                    <%} else { %>
                    	<li class="user-navi-item user-nickname"><span><a href="<%=contextPath %>/views/mypage/mygradeView.jsp"><%=userInfo.getUserNickname() %></a></span>님</li>
                    	<li class="user-navi-icon-btn"><button class="header-tool" onclick="location.href='<%=contextPath %>/logout'"><span class="material-symbols-outlined icon-size">logout</span></button></li>
                    <%} %>
                    <li class="user-navi-icon-btn">
                        <button class="header-tool header-search-tool"><span class="material-symbols-outlined icon-size">search</span></button>
                        <form class="header-search-bar-wrap" style="display: none;" action="test" method="get">
                            <input class="header-search-bar" type="text" name="query">
                            <button type="submit" class="header-search-btn"><span class="material-symbols-outlined icon-size">search</span></button>
                        </form>
                    </li>
                    <li class="user-navi-icon-btn"><button class="header-tool" onclick=""><span class="material-symbols-outlined icon-size">menu</span></button></li>
                </ul>
            </div>
        </div>
        <div id="header-wrap">
            <div id="header-bar-wrap">
                <div class="header-bar">
                    <div class="header-logo">
                        <a href="<%=contextPath %>"><img class="logo" src="<%=contextPath %>/resources/images/logo.png" alt=""></a>
                    </div>
                    <ul class="header-navi">
                        <li class="header-navi-item"><a href="<%= contextPath %>/main.bo">커뮤니티</a></li>
                        <li class="header-navi-item"><a href="<%= contextPath %>/share.in?ictg=12&ipage=1">정보</a></li>
                        <li class="header-navi-item"><a href="#">행사</a></li>
                        <li class="header-navi-item"><a href="<%=contextPath %>/views/chat/chattingList.jsp">매칭</a></li>
                    </ul>
                    <ul class="header-navi user-navi">
                        <%if(userInfo == null){ %>
                            <li class="user-navi-item"><a href="<%=contextPath %>/login">로그인</a></li>
                        <%} else { %>
                            <li class="user-navi-item user-nickname"><span><a href="<%=contextPath %>/views/mypage/mygradeView.jsp"><%=userInfo.getUserNickname() %></a></span>님</li>
                            <li class="user-navi-icon-btn"><button class="header-tool" onclick="location.href='<%=contextPath %>/logout'"><span class="material-symbols-outlined icon-size">logout</span></button></li>
                        <%} %>
                        <li class="user-navi-icon-btn">
                            <button class="header-tool header-search-tool"><span class="material-symbols-outlined icon-size">search</span></button>
                            <form class="header-search-bar-wrap" style="display: none;" action="test" method="get">
                                <input class="header-search-bar" type="text" name="query">
                                <button type="submit" class="header-search-btn"><span class="material-symbols-outlined icon-size">search</span></button>
                            </form>
                        </li>
                        <li class="user-navi-icon-btn"><button class="header-tool" onclick=""><span class="material-symbols-outlined icon-size">menu</span></button></li>
                    </ul>
                </div>
            </div>
        </div>
    </header>
    <script>
        $(document).ready(function(){
            /*const headerBar = document.getElementById("fixed-header-bar");
            $(window).scroll(function(){
                if($(window).scrollTop()>80){
                    headerBar.style.display="block";
                }
                else{
                    headerBar.style.display="none";
                }
            });*/

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
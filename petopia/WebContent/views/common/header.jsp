<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            height: 350px;
            background-color: rgb(255, 248, 240);
        }
        #header-wrap{
            width: 1100px;
            height: 80px;
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
        }
        .user-navi-item{
            width: 80px;
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
        #header-bar-wrap{
            width: 1100px;
            height: 100%;
            margin: auto;
        }

        .banner-img{
            width: 500px;
            margin: auto;
            display: block;
        }
    </style>
</head>
<body>
    <header>
        <div id="header-bar" style="display: none;">
            <div id="header-bar-wrap">
                <div class="header-logo">
                    <a href="./main.html"><img class="logo" src="./resources/image/logo.png" alt=""></a>
                </div>
                <ul class="header-navi">
                    <li class="header-navi-item"><a href="#">커뮤니티</a></li>
                    <li class="header-navi-item"><a href="#">정보</a></li>
                    <li class="header-navi-item"><a href="#">행사</a></li>
                    <li class="header-navi-item"><a href="#">매칭</a></li>
                </ul>
                <ul class="header-navi user-navi">
                    <li class="user-navi-item"><a href="./login.html">로그인</a></li>
                    <li class="user-navi-icon-btn"><a href="#"><span class="material-symbols-outlined icon-size">search</span></a></li>
                    <li class="user-navi-icon-btn"><a href="#"><span class="material-symbols-outlined icon-size">menu</span></a></li>
                </ul>
            </div>
        </div>
        <div id="header-wrap">
            <div class="header-logo">
                <a href="./main.html"><img class="logo" src="./resources/image/logo.png" alt=""></a>
            </div>
            <ul class="header-navi">
                <li class="header-navi-item"><a href="#">커뮤니티</a></li>
                <li class="header-navi-item"><a href="#">정보</a></li>
                <li class="header-navi-item"><a href="#">행사</a></li>
                <li class="header-navi-item"><a href="#">매칭</a></li>
            </ul>
            <ul class="header-navi user-navi">
                <li class="user-navi-item"><a href="./login.html">로그인</a></li>
                <li class="user-navi-icon-btn"><a href="#"><span class="material-symbols-outlined icon-size">search</span></a></li>
                <li class="user-navi-icon-btn"><a href="#"><span class="material-symbols-outlined icon-size">menu</span></a></li>
            </ul>
        </div>
        <img class="banner-img" src="./resources/image/Download Kitty cat vector design illustration isolated on white background for free1.jpg">
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
        })
    </script>
</body>
</html>
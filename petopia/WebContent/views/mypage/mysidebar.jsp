<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        .navi-area{
            border: 1px solid black;
            background-color: rgb(230, 204, 184);
            display : table-cell;
        }
        .navi-area a {
            text-decoration : none;
            width : 100%;
            height : 100%;
            display : block;
            line-height : 50px;
            color : white;
            font-weight : bold;
            font-size : 20px;
        }
        .menu{
         display : table-cell;
         height : 50px;
         width : 500px;
        }
      
        .menu a{
         text-decoration : none;
         width : 100%;
         height : 100%;
         display : block;
         line-height : 50px;
         color : white;
         font-weight : bold;
         font-size : 20px;
        }

        .menu a:hover{background: linear-gradient(to left, #dae2f8, #d6a4a4);}

        .btn-border-none{
            border: 0;
            background-color: rgb(230, 204, 184);
        }
    </style>

</head>
<body>
	<div>
        
        <br clear="both">

        <div class="navi-area" align="center">
            <div class="menu"><a href="#">커뮤니티</a></div>
            <div class="menu"><a href="#">정보</a></div>
            <div class="menu"><a href="#">행사</a></div>
            <div class="menu"><a href="#">매칭</a></div>
            
            <div class="menu"><a href="#">마이페이지</a></div>
        
            <div class="menu"><button type="submit" class="btn-border-none">🔍</button></div>
            <div class="menu"><button type="menu" class="btn-border-none">≡</button></div>
        </div>


        <div class="side-area">

        </div>
    </div>
</body>
</html>
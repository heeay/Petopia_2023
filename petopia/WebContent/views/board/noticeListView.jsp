<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

<!-- css -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- javascript -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


<style>
    #wrapper{
        width: 1100px;
        height: 800px;
        margin: auto;
        
        /* border : 1px solid black; */
        box-sizing: border-box;
        background-color: rgb(255, 248, 240);
    }

    #search-area{
        width: 100%;
        height: 5%;
        /* border: 1px solid black; */
        
    }



</style>

<style>

    #search-bar {
        position: relative;
        width: 300px;
        float: left;
        width: 30%;
        box-sizing: border-box;
        /* border: 1px solid red; */
    }

    #search {
        width: 100%;
        /* border: 1px solid #bbb; */
        border-radius: 8px;
        padding: 10px 12px;
        font-size: 14px;
    }

    #search-img {
        position : absolute;
        width: 22px;
        top: 10px;
        right: 12px;
        margin: 0;
    }

    #search-radio{
        /* border: 1px solid green; */
        float: left;
        margin-top: 9px;
        box-sizing: border-box;
    }

    #search-select{
        /* border: 1px solid blue; */
        float: right;
        box-sizing: border-box;
        margin-top: 9px;
    }
    



    

   
   



</style>

</head>
<body>
	<%@ include file="../common/header-min.jsp" %>

	<%@ include file="../common/sideBar.jsp" %>

	<div id="wrapper">

        <div id="search-area">

            <div id="search-bar">
                <input type="text" id="search" placeholder="검색어 입력">
                <img id="search-img" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
            </div>

            <div id="search-radio">
                <input type="radio">제목
                <input type="radio">작성자
            </div>

            <div id="search-select">
                <select name="" id="">
                    <option value="">게시글 4개씩 보기</option>
                    <option value="">게시글 6개씩 보기</option>
                    <option value="">게시글 8개씩 보기</option>
                </select>
            </div>
        </div>
        
        <br>

        <div class="">


        </div>
        
        
         





        


       

            




















    



	</div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>
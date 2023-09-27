<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

<style>
    #wrapper{
        width: 1100px;
        height: 1500px;
        margin: auto;
        margin-top : 10px;
        border : 1px solid black;
    }

    #search-area{
        width: 1000px;
        height: 45px;
        border: 1px solid black;
        margin: 50px;
    }

    #search-bar {
        position: relative;
        width: 300px;
        float: left;
        width: 30%;
        box-sizing: border-box;
        border: 1px solid red;
    }

    #search2 {
        width: 100%;
        border: 1px solid #bbb;
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
        border: 1px solid green;
        float: left;
        margin-top: 9px;
        box-sizing: border-box;
    }

    #search-select{
        border: 1px solid blue;
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
                <input type="text" id="search2" placeholder="검색어 입력">
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
        
        
         





        


       

            




















    



	<br><br><br><br><br><br><br><br><br><br><br><br>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>
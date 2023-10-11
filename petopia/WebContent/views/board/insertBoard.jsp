<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% User user = (User)request.getAttribute("user");  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>

<!-- css -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- javascript -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- overal -->
<style>
    #wrapper{
        width: 1100px;
        height: 800px;
        margin: auto;
        /* border : 1px solid black; */
        box-sizing: border-box;
        background-color: rgb(255, 248, 240);
    }

    #option-area{
        box-sizing: border-box;
        width  : 1100px;
        height : 70%;
        
        
    }
    
    #upload-area{
        width : 1100px;
        height : 15%;
        box-sizing: border-box;
    }

    p {
        font-size : 20px;
        font-weight: 600;
        /* float : left; */
      
    }
   

</style>

<!-- option -->
<style>
    #option{
       
    }
    .option-list{
        display : flex;

        margin : 10px 0px;
       
    }
    .option-name{
        margin-right : 20px;
       
    }

    #option-board{
        
    }
    #option-animal{

    }
    #option-detail{
        
    }
    #option-title{
        width : 900px;
    }
    #option-content{
        width : 900px;
        height : 300px;
        resize:none;
    }
   
</style>

<!-- upload -->
<style>
    #upload-admin{
        display : flex;
        justify-content: right;
    }
</style>

<!-- button -->
<style>

</style>


</style>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
</head>
<body>

<%@ include file="../common/header-min.jsp" %>
<%@ include file="../common/sideBar.jsp" %>


<div id="wrapper">
    
    <p>게시글 작성</p>

    <section id="option-area">

        <form action="<%=contextPath%>/insert.bo" id="option-form" enctype="multipart/form-data" method="post" >

            <input type="hidden" name="userNo" value="<%=user.getUserNo()%>">
       
            <li class="option-list">
                <span class="option-name">게시판&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                <select name="" id="option-board">
                    <option value="">동물게시판</option>
                    <option value="">실종게시판</option>
                </select>
            </li>
            <li class="option-list">
                <span class="option-name">동물&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                <select name="" id="option-animal">
                    <option value="">강아지</option>
                    <option value="">고양이</option>
                    <option value="">설치류</option>
                    <option value="">파충류</option>
                    <option value="">조류</option>
                    <option value="">어류</option>
                </select>
            </li>
            <li class="option-list">
                <span class="option-name">세부게시판</span>
                <select name="" id="option-detail">
                    <option value="">꿀팁공유</option>
                    <option value="">QnA</option>
                    <option value="">수제간식 레시피</option>
                    <option value="">전국 동물자랑</option>
                    <option value="">무료나눔</option>
                    <option value="">돌봄SOS</option>
                </select>
            </li>
            <li class="option-list">
                <span class="option-name">제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                <input type="text" id="option-title" placeholder="제목을 입력하세요">
            </li>
            <li class="option-list">
                <span class="option-name">내용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                <textarea name="" id="option-content" placeholder="내용을 입력하세요"></textarea>
            </li>
        
      
        </form>

    </section>


    <section id="upload-area">

        <ul>
            <li>
                <span class="option-name">사진 업로드&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                <button type="button" id="upload-picture">사진첨부</button>
                <span class="upload-file">선택된 파일 없음</span>
            </li>
            <li>
                <span class="option-name">동영상 업로드</span>
                <button type="button" id="upload-video">동영상첨부</button>
                <span class="upload-file">선택된 파일 없음</span>
            </li>
        </ul>
   
    <div id="upload-admin">
        <button type="submit">글등록</button>
        <button>취소</button>
    </div>

   
       
    </section>

    
</div>


<%@ include file="../common/footer.jsp" %>
</body>
</html>
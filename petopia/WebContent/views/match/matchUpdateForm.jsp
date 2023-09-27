<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매칭게시판 수정하기</title><link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>

    #main{
            width: 1000px;
            height: 2000px;
            margin: auto;
            position: relative;
        }

    #side-menu-wrap{
        width: 220px;
        height: 100%;
        float: right;
    }
    #side-menu{
        width: 130px;
        padding: 20px 8px;
        border-radius: 18px;
        margin-left: 20px;
        font-size: 18px;
        font-weight: 500;
        position: sticky;
        top: 120px;
        background-color: rgb(228, 156, 92);
    }
    #side-menu a{
        display: block;
        width: 100%;
        cursor: pointer;
    }
    #side-menu a:hover{
        color: dodgerblue;
    }
    #category li:not(#category li:last-child){ margin-bottom: 10px; }

   


    #write {
        margin: 60px;
    }

    #pet-introduction {
        margin-top: 100px;
    }

    #write-button {
        margin-left: 620px;
    }
    
    
    

	.w-btn-outline {
    position: relative;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}
    
    .w-btn-gray-outline {
    border: 3px solid #a3a1a1;
    color: #6e6e6e;
}
.w-btn-gray-outline:hover {
    background-color: #a3a1a1;
    color: #e3dede;
}

</style>
</head>
<body>


    <%@include file="../common/header.jsp" %>

    <section id="main">
        <div id="side-menu-wrap">
        <div id="side-menu">
            <ul id="category">
                <li><a>관심목록</a></li>
                <li><a>채팅</a></li>
                <li><a>받은후기</a></li>
                <li><a>보낸후기</a></li>
            </ul>
        </div>
    </div>
            <section id="pet-img">
                <div>
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcST-HI6N_3Y_1v9mHFbaBVQYVe5bT6jNVAfDA&usqp=CAU"  width="130" height="170">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcST-HI6N_3Y_1v9mHFbaBVQYVe5bT6jNVAfDA&usqp=CAU"  width="130" height="170">
                </div>
                </div>

            </section>
   
            <section id="write">
                <div id="hope-activity">
                    <h2>희망 교류 활동</h2>
                    <textarea style="background-color:transparent;" required cols=90 rows=10 onclick="this.value=''">1000자 이내로 내용을 입력하세요</textarea>
                </div>
                <div id="pet-introduction">
                    <h2>우리 아이 소개</h2>
                    <textarea style="background-color:transparent;" required cols=90 rows=10 onclick="this.value=''">1000자 이내로 내용을 입력하세요</textarea>
                </div>
		</section>      
   
            <div id="write-button">
                <button class="w-btn-outline w-btn-gray-outline" type="submit">글쓰기</button>            
            </div>
 


    
	</section>
    <%@include file="../common/footer.jsp" %>

</body>
</html>
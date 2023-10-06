<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보제공 리스트_카드뉴스</title>
<style>
	section{
		width: 1000px;
        height: 2000px;
        margin: auto;
        position: relative;
	}

    div{
        border : 1px solid red;
    }

    #wrap{
        width: 780px;
        height: 100%;
        margin-top : 20px;
    }

    .info-list{
        text-align: center;
    }

    .info-list-content{
        width: 200px;
        display: inline-block;
        margin: 5px;
    }

    .info-list-content > img{
        width: 150px;
        height: 150px;
    }

    .info-list-content > img:hover{
        cursor: pointer;
        width: 160px;
    }
</style>
</head>
<body>

	<section>
	
	<%@ include file="infoSidebar.jsp" %>
	
	<div id="wrap">
	
        <div align="right">
        <!-- 관리자만 보이게 할 것 -->
		    <a href="#" class="btn btn-sm btn-warning">글 쓰기</a>
        </div>
		
		<div class="info-list">
           
            <div class="info-list-content">
                <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEyMTdfMjM3%2FMDAxNjcxMjU4NDYzODU3.dwwsILxgh7etBvjzNnjpJrerNu5wUtU6yv7wVMysiPsg.3IZ1WxFc-d0_SJ2uJRlTdeTrOCKC9lzEhm35IfX-Lw0g.JPEG.moakym%2F1000000301.jpg&type=a340" alt="이미지">
                <p>
                    	제목
                </p>
            </div>
            <div class="info-list-content">
                <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEyMTdfMjM3%2FMDAxNjcxMjU4NDYzODU3.dwwsILxgh7etBvjzNnjpJrerNu5wUtU6yv7wVMysiPsg.3IZ1WxFc-d0_SJ2uJRlTdeTrOCKC9lzEhm35IfX-Lw0g.JPEG.moakym%2F1000000301.jpg&type=a340" alt="이미지">
                <p>
                    	제목
                </p>
            </div>
            <div class="info-list-content">
                <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEyMTdfMjM3%2FMDAxNjcxMjU4NDYzODU3.dwwsILxgh7etBvjzNnjpJrerNu5wUtU6yv7wVMysiPsg.3IZ1WxFc-d0_SJ2uJRlTdeTrOCKC9lzEhm35IfX-Lw0g.JPEG.moakym%2F1000000301.jpg&type=a340" alt="이미지">
                <p>
                   	 제목
                </p>
            </div>
            <div class="info-list-content">
                <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEyMTdfMjM3%2FMDAxNjcxMjU4NDYzODU3.dwwsILxgh7etBvjzNnjpJrerNu5wUtU6yv7wVMysiPsg.3IZ1WxFc-d0_SJ2uJRlTdeTrOCKC9lzEhm35IfX-Lw0g.JPEG.moakym%2F1000000301.jpg&type=a340" alt="이미지">
                <p>
                    	제목
                </p>
            </div>

        </div>

        <div class="info-paging">

            

        </div>

    </div>
    
    </section>

</body>
</html>
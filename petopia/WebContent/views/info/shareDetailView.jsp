<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보공유 상세</title>

<style>
	section{
		width: 1000px;
        height: 800px;
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

    #content{
        width: 100%;
        height: 70%;
    }

    #reply-content{
        width: 100%;
        height: 25%;
    }

    #photo-content, #text-content{
        width: 50%;
        height: 100%;
        float:left;
    }

    #text-content td{
        padding-bottom: 10px;
    }

    #edit > h4:hover{
        cursor: pointer;
    }

    #edit-option a, #text-content a{
        color: black;
        text-decoration: none;
    }

    #edit-option a:hover{
        color:gray;
    }

    #photo-content > img{
        width: 100%;
        height: 95%;
    }

    #next-btn {
        float: right;
    }

</style>
</head>
<body>

	<%@ include file="../common/header-min.jsp" %>
	
	<section>
	
        <%@ include file="infoSidebar.jsp" %>
        
        <div id="wrap">
        
           <div id="edit" align="right">
                <h4>⋮</h4>
                <div id="edit-option" style="display:none">
                    <a href="#">수정</a>
                    <a href="#">삭제</a>
                    <a href="#">신고</a>
                </div>
           </div>
           <div id="content">
                
                <div id="photo-content">
                    <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEyMTdfMjM3%2FMDAxNjcxMjU4NDYzODU3.dwwsILxgh7etBvjzNnjpJrerNu5wUtU6yv7wVMysiPsg.3IZ1WxFc-d0_SJ2uJRlTdeTrOCKC9lzEhm35IfX-Lw0g.JPEG.moakym%2F1000000301.jpg&type=a340" alt="">
                    <button class="btn btn-sm btn-secondary"> < </button>
                    <button id="next-btn" class="btn btn-sm btn-secondary"> > </button>
                </div>
                <div id="text-content">
                    <table border="1">
                        <tr>
                            <td width="500px">맛있는 음식점 방문</td>
                        </tr>
                        <tr>
                            <td>별점</td>
                        </tr>
                        <tr>
                            <td>유저</td>
                        </tr>
                        <tr>
                            <td>2023/09/27</td>
                        </tr>
                        <tr>
                            <td height="350px;">
                                	어쩌고 저쩌고 정말 맛있었다
                            </td>
                        </tr>
                        <tr>
                            <td align="center"><a href="#">❤</a>3</td>
                        </tr>
                    </table>
                </div>

           </div>

           <div id="reply-content">
                
                댓글영역

           </div>
    
        </div>
        
        </section>

        <script>
            $(document).ready(function(){
                $("#edit > h4").click(function(){
                    const editOption = $("#edit-option");
                    if(editOption.css("display") == 'none'){
                        editOption.slideDown(100);
                    }
                    else{
                        editOption.slideUp(100);
                    }
                });
            });
        </script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보공유 등록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

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

    #enroll-form{
        background-color: rgb(255, 248, 240);
    }

    #enroll-form th{
        padding-left: 30px;
    }

    #enroll-form th, #enroll-form td{
        padding-bottom: 5px;
        padding-top: 10px;
    }

    #enroll-form input, #enroll-form textarea{
        width: 600px;
    }

    #star{
    	text-decoration: none;
    	color : black;
    }
    
    #star:hover{cursor:pointer;}
</style>
</head>
<body>

	<%@ include file="../common/header-min.jsp" %>
	
	<section>
	
        <%@ include file="infoSidebar.jsp" %>
        
        <div id="wrap">
        
           <h4>게시글 작성</h4>
            <br>

            <form enctype="multipart/form-data" id="enroll-form" method="post">

                <table align="center">

                    <tr>
                        <th width="150">제목</th>
                        <td witdh="600"><input type="text" name="title" required placeholder="제목을 입력해주세요"></td>
                    </tr>
                    <tr>
                        <th>카테고리</th>
                        <td>
                            <select name="category">
                                <option value="병원">병원</option>
                                <option value="애견동반">애견동반</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>별점</th>
                        <td>
                        	<a class="star" id="star">☆</a>
                        	<a class="star" id="star">☆</a>
                        	<a class="star" id="star">☆</a>
                        	<a class="star" id="star">☆</a>
                        	<a class="star" id="star">☆</a>
                        </td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td><textarea name="content"rows="20" style="resize: none;" placeholder="내용을 입력해주세요."></textarea></td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td><input type="file" name="upfile"></td>
                    </tr>

                </table>

                <div align="right">
                    <button type="submit" class="btn btn-sm btn-warning">등록</button>
                    <button type="reset" class="btn btn-sm btn-secondary">취소</button>
                </div>

            </form>
    
        </div>
        
    </section>

    <script>

    	$(function(){
    		$('.star').click(function(){
    			const stars = document.getElementsByClassName('star');
    			const index = $(this).index();
    			// console.log(index);
    			// console.log(stars[index]);
    			for(let i = 0; i <= index; i++){
    				// console.log(stars[i]);
    				$(stars[i]).css('color', 'red');
    			};
    			
    			if($(this).css('color', 'red')){
    				for(let i = stars.length; i > index; i--){
    					$(stars[i]).css('color', 'black');
    				};
    			};
    			
    		});	
    	});

    </script>

</body>
</html>
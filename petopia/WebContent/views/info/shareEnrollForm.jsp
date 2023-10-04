<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, petopia.com.kh.jsp.info.model.vo.InfoCategory" %>
<%
	ArrayList<InfoCategory> list = (ArrayList<InfoCategory>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보공유 등록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<style>
	section{
		width: 1000px;
        height: 1000px;
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
        
           <h4 align="center">게시글 작성</h4>
            <br>

            <form action="<%= contextPath %>/insert.in" enctype="multipart/form-data" id="enroll-form" method="post">

                <table align="center">

                    <tr>
                        <th width="150">제목</th>
                        <td witdh="600"><input type="text" name="title" required placeholder="제목을 입력해주세요"></td>
                    </tr>
                    <tr>
                        <th>카테고리</th>
                        <td>
                            <select name="category">
                                <% for(InfoCategory ic : list) { %>
                                	<option value="<%= ic.getCategoryNo() %>">
                                		<%= ic.getCategoryName() %>
                                	</option>
                                <% } %>
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
                </table>
                
                <div id="file-area">
                	<input type="file" name="file1" id="file1">
                    <input type="file" name="file2" id="file2">
                    <input type="file" name="file3" id="file3">
                    <input type="file" name="file4" id="file4">
                    <input type="file" name="file5" id="file5">
                </div>
                 
                <div align="right">
                    <button type="submit" class="btn btn-sm btn-warning">등록</button>
                    <button type="reset" class="btn btn-sm btn-secondary">취소</button>
                </div>

            </form>
    
        </div>
        
    </section>

    <script>

    	// 별점 관련 function
    	$(function(){
    		$('.star').click(function(){
    			const stars = document.getElementsByClassName('star');
    			const index = $(this).index();
    			// console.log(index);
    			// console.log(stars[index]);
    			for(let i = 0; i <= index; i++){
    				// console.log(stars[i]);
    				$(stars[i]).text('⭐');
    			};
    			
    			if($(this).text('⭐')){
    				for(let i = stars.length; i > index; i--){
    					$(stars[i]).text('☆');
    				};
    			};
    			
    			// DB로 넘길 별점 개수 (1 ~ 5)
    			console.log(($(this).text('⭐').last().index()) + 1);
    			
    		});
    	});

    </script>

</body>
</html>
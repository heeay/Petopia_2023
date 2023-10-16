<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, petopia.com.kh.jsp.info.model.vo.InfoCategory" %>
<!-- 카테고리 중 인포에 관한 리스트를 불러옴 -->
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

	/* 전체 div */
    #wrap{
        width: 780px;
        height: 100%;
        margin-top : 20px;
    }

	/* 사용자가 입력한 값을 넘길 form */
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
	
	/* 별점 영역의 a태그(각각의 별을 a태그로 만들었음) */
    #stars > a{
    	text-decoration: none;
    	color : black;
    }
    
    #stars > a:hover{cursor:pointer;}
</style>
</head>
<body>

	<section>
	
        <%@ include file="infoSidebar.jsp" %>
        
        <div id="wrap">
        
           <h4 align="center">게시글 작성</h4>
            <br>

			<!-- 매핑값 : insert.in / 이미지 파일을 무조건 한 개는 넘겨야 하기에 post 방식 선택 -->
            <form action="<%= contextPath %>/insert.in" enctype="multipart/form-data" name="enroll" id="enroll-form" method="post">
			
				<!-- 게시글을 작성한 작성자 번호를 hidden으로 넘김 (userInfo는 include한 infoSidebar 파일에서 include한 header-min 파일에 포함) -->
				<input type="hidden" name="userNo" value="<%= userInfo.getUserNo() %>">
				<!-- 자바스크립트 영역의 starNum에 담긴 값을 value로 받아서 hidden으로 넘김 -->
				<input type="hidden" name="star" value="">

                <table align="center">

                    <tr>
                        <th width="150">제목</th>
                        <td witdh="600"><input type="text" name="title" required placeholder="제목을 입력해주세요"></td>
                    </tr>
                    <tr>
                        <th>카테고리</th>
                        <td>
                            <select name="category">
                                <% for(InfoCategory ic : list) { %> <!-- list의 값을 ic에 담음 -->
                                	<option value="<%= ic.getCategoryNo() %>"> <!-- select의 option의 value에 ic에서 카테고리 번호를 뽑아서 담음 -->
                                		<%= ic.getCategoryName() %> <!-- 텍스트 영역에는 ic의 카테고리명을 담음 -->
                                	</option>
                                <% } %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>별점</th>
                        <td id="stars">
                        	<a class="star" id="star1">☆</a> <!-- 비어있는 별 -->
                        	<a class="star" id="star2">☆</a>
                        	<a class="star" id="star3">☆</a>
                        	<a class="star" id="star4">☆</a>
                        	<a class="star" id="star5">☆</a>
                        </td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td><textarea name="content" rows="20" style="resize: none;" placeholder="내용을 입력해주세요."></textarea></td>
                    </tr>
                </table>
                
                <div id="file-area">
                	<!-- 썸네일이 있어야 해서 file1은 필수 첨부 -->
                	<input type="file" name="file1" id="file1" required>
                    <input type="file" name="file2" id="file2">
                    <input type="file" name="file3" id="file3">
                    <input type="file" name="file4" id="file4">
                    <input type="file" name="file5" id="file5">
                </div>
                 
                <div align="right">
                    <button type="submit" class="btn btn-sm btn-warning">작성</button>
                    <button type="button" class="btn btn-sm btn-secondary" onclick="history.back();">취소</button>
                    <!-- history.back()을 사용해서 취소를 클릭하면 이전 페이지로 이동 -->
                </div>

            </form>
            
        </div>
        
    </section>

    <script>

    	// 별점 관련 function
    	$(function(){
    		$('.star').click(function(){ // 클래스명이 star인 요소를 클릭하면
    			const stars = document.getElementsByClassName('star'); // 이 문서에서 클래스명이 star인 요소들을 stars라는 배열에 담음
    			const index = $(this).index(); // 현재 클릭한 요소(this)의 index를 변수 index에 담음
    			// console.log(index);
    			// console.log(stars[index]);
    			for(let i = 0; i <= index; i++){ // 배열의 0번 인덱스부터 i번째 인덱스까지
    				// console.log(stars[i]);
    				$(stars[i]).text('⭐'); // 텍스트를 노란별로 바꿈
    			};
    			
    			if($(this).text('⭐')){ // 현재 클릭한 요소의 텍스트가 노란별이라면
    				for(let i = stars.length; i > index; i--){ // 배열의 마지막 인덱스부터 현재 클릭한 인덱스보다 하나 큰 인덱스까지
    					$(stars[i]).text('☆'); // 텍스트를 비어있는 별로 바꿈
    				};
    			};
    			
    			// DB로 넘길 별점 개수 (1 ~ 5) => 위에 hidden을 만들어서 value에 담기
    			let starNum = ($(this).text('⭐').last().index()) + 1; // 현재 클릭한 요소의 텍스트가 노란별인 요소의 마지막 요소의 인덱스 -> 0 ~ 4
    			document.enroll.star.value = starNum; // 이 문서 중에서 name이 enroll인 요소 중 name이 star인 요소의 value값에 starNum을 담음
    		});
    	});

    </script>

</body>
</html>
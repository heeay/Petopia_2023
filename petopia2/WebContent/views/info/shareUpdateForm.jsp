<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
<%@ page import="java.util.ArrayList, petopia.com.kh.jsp.info.model.vo.InfoCategory, petopia.com.kh.jsp.info.model.vo.Info, petopia.com.kh.jsp.info.model.vo.InfoFile" %>
<!-- 카테고리 중 인포에 관한 리스트를 불러옴 -->
<%
	ArrayList<InfoCategory> ctgList = (ArrayList<InfoCategory>)request.getAttribute("ctgList");
	Info in = (Info)request.getAttribute("in");
	ArrayList<InfoFile> fileList = (ArrayList<InfoFile>)request.getAttribute("fileList");
%>
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보공유 수정</title>
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

	/* 전체 div */
    #wrap{
        width: 780px;
        height: 100%;
        margin-top : 20px;
    }

	/* 사용자가 입력한 값을 넘길 form */
    #update-form{
        background-color: rgb(255, 248, 240);
    }

    #update-form th{
        padding-left: 30px;
    }

    #update-form th, #update-form td{
        padding-bottom: 5px;
        padding-top: 10px;
    }

    #update-form input, #update-form textarea{
        width: 600px;
    }
	
	/* 별점 영역의 a태그(각각의 별을 a태그로 만들었음) */
    #stars > a{
    	text-decoration: none;
    	color : black;
    }
    
    #stars > a:hover{cursor:pointer;}
    
    .img-area{
    	width : 100%;
    	height : 100px;
    	text-align : center;
    }
    
    .file-area{width : 100%;}
    
    .original-img{
    	width : 140px;
    	height : 100px;
    	margin-left : 5px;
    	margin-right : 5px;
    }
</style>
</head>
<body>

	<section>
	
        <%@ include file="infoSidebar.jsp" %>
        
        <div id="wrap">
        
           <h4 align="center">게시글 수정</h4>
            <br>

			<!-- 매핑값 : update.in / 이미지 파일을 무조건 한 개는 넘겨야 하기에 post 방식 선택 -->
            <form action="<%= contextPath %>/update.in" enctype="multipart/form-data" name="update" id="update-form" method="post">
			
				<!-- 게시글 번호를 넘김 -->
				<input type="hidden" name="infoNo" value="${ in.infoNo }">
				<!-- 자바스크립트 영역의 starNum에 담긴 값을 value로 받아서 hidden으로 넘김 -->
				<input type="hidden" name="star" value="">

                <table align="center">

                    <tr>
                        <th width="150">제목</th>
                        <td witdh="600"><input type="text" name="title" required value="${ in.infoTitle }"></td>
                    </tr>
                    <tr>
                        <th>카테고리</th>
                        <td>
                            <select name="category">
                                <c:forEach var="ctg" items="${ requestScope.ctgList }">
                            		<option value="${ ctg.categoryNo }">
                                		${ ctg.categoryName }
                                	</option>
                            	</c:forEach>
                            </select>
                            <script>
                            // 사용자가 게시글 작성할 때 선택했던 option이 선택된 상태로 나타남
                            	$(function(){
                            		$('#update-form option').each(function(){
                            			if($(this).text().trim() == '${ in.category }') {
                            				$(this).attr('selected', 'true');
                            			}
                            		});
                            	});
                            </script>
                        </td>
                    </tr>
                    <tr>
                        <th>별점</th>
                        <td id="stars">
                        <!-- 사용자가 클릭했던 별의 수만큼 -->
                        <c:forEach var="star" begin="0" end="4">
                            	<c:choose>
                            		<c:when test="${ star lt requestScope.in.starScore }">
                            			<a class="star">⭐</a> <!-- 노란 별 -->
                            		</c:when>
                            		<c:otherwise>
                            			<a class="star">☆</a> <!-- 빈별 -->
                            		</c:otherwise>
                            	</c:choose>
                            </c:forEach>
                        </td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td><textarea name="content" rows="20" style="resize: none;">${ in.infoContent }</textarea></td>
                    </tr>
                </table>
                
                <div class="img-area">
                	
                	<c:forEach var="file" items="${ requestScope.fileList }">
                		<img src="<%= contextPath %>/${ file.filePath }/${ file.uploadName }" class="original-img">
                		<input type="hidden" name="originalFileNo" value="${ file.fileNo }">
                	</c:forEach>
                	
                	<%--
                	<% for(int i = 0; i < fileList.size(); i++) { %>
                		<img src="<%= contextPath %>/<%= fileList.get(i).getFilePath() %>/<%= fileList.get(i).getUploadName() %>" class="original-img">
                		<input type="hidden" name="originalFileNo" value="<%= fileList.get(i).getFileNo() %>">
                	<% } %>
                	--%>
                
                </div>
                
                <div class="file-area">
                	
                	<!-- 새로 올릴 파일(게시글 수정 시 기존 파일 삭제하고 이 파일들로 바꿀 것) -->
                	<input type="file" name="reUpFile1" id="reUpFile1" required>
                    <input type="file" name="reUpFile2" id="reUpFile2">
                    <input type="file" name="reUpFile3" id="reUpFile3">
                    <input type="file" name="reUpFile4" id="reUpFile4">
                    <input type="file" name="reUpFile5" id="reUpFile5">
                    
                </div>
                 
                <div align="right">
                    <button type="submit" class="btn btn-sm btn-warning">수정</button>
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
    			// console.log(starNum);
    			document.update.star.value = starNum; // 이 문서 중에서 name이 update인 요소 중 name이 star인 요소의 value값에 starNum을 담음
    		});
    	});

    </script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- User user = (User)request.getAttribute("user");
Board b = (Board)request.getAttribute("b"); -->
<%@ page import="petopia.com.kh.jsp.board.model.vo.*" %>
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

        <table id="detail-area" align="center" border="1">
            <tr>
                <th width="100">카테고리</th>
                <td width="150">?</td>
                <th width="100">제목</th>
                <td width="400">?</td>
            </tr>
            <tr>
                <th>작성자</th>
                <td>?</td>
                <th>작성일</th>
                <td>?</td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3">
                    <p style="height:400px;">?</p>
                </td>
            </tr>
            <tr>
                <th>첨부파일</th>
                <td colspan="3">
                	<% if(b.getFileNo() == null) { %>
                    <!-- 첨부파일이 없을 경우 -->
                        	첨부파일 없어요 ~
                    <% } else {%>
                    <!-- 첨부파일이 있을 경우 -->
                    <!-- /jsp/resources/board_upfiles/changeName -->
                        <a href="#" download="#"></a>
                    <% } %>
                </td>
            </tr>
        </table>

        <br>

        <div align="center">
            <a href="#" class="btn btn-sm btn-info">목록으로</a>
            
            <% if(user != null && user.getUserNo().equals(b.getBoardWriter())) { %>
	            <a href="#" class="btn btn-sm btn-warning">수정하기</a>
	            <a href="#">삭제하기</a>
            <% } %>
            
        </div>
        <br><br>
	    <!-- <div id="reply-area">
			
			<table border="1" align="center">
				<thead>
					<tr>
						<th>댓글작성</th>
						<% if(user != null) { %>
							<td>
								<textarea id="replyContent" cols="50" rows="3" style="resize:none;"></textarea>
							</td>
							<td><button onclick="insertReply();">댓글등록</button></td>
						<% } else { %>
							<td>
								<textarea readonly cols="50" rows="3" style="resize:none;">로그인 후 이용가능한 서비스입니다.</textarea>
							</td>
							<td><button>댓글등록</button></td>
						<% } %>
					</tr>
				</thead>
				<tbody>
				
				</tbody> -->
			</table>
    
        
            <span class="option-name">제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <input class="option-list" type="text" id="option-title" placeholder="제목을 입력하세요">
        
          
            <span class="option-name">내용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <textarea name="" id="option-content" placeholder="내용을 입력하세요"></textarea>
    
        
      
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
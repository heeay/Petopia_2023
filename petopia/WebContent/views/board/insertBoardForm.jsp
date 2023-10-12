<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, petopia.com.kh.jsp.board.model.vo.*, petopia.com.kh.jsp.info.model.vo.*" %>
<%  User user = (User)request.getAttribute("user");
    Board b = (Board)request.getAttribute("b"); 
    ArrayList<InfoCategory> list = (ArrayList<InfoCategory>)request.getAttribute("list");
%>

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
        <br>
        <h2 align="center">게시글 작성하기!</h2>
        <br><br>


		<!--파일을 첨부하는 요청을 할 때는 반드시 form태그에 enctype="multipart/form-data" 를 추가해줘야함!!-->
        <form enctype="multipart/form-data" action="<%=contextPath%>/insert.bo" id="enroll-form" method="post">
            <!-- 제목*, 내용*, 카테고리*, 글쓴이*, 첨부파일*, 제출버튼* -->

            <!-- 작성자의 회원번호를 hidden으로 같이 넘겨서 board테이블에 INSERT--> <!-- loginUser는 어디서 왔지> -->
            <input type="hidden" name="userNo" value="<%=user.getUserNo()%>">

            <table align="center">
                <tr>
                    <th width="150">카테고리</th>
                    <td width="600">
                        <select name="category">
                            <% for(InfoCategory c : list) { %>
								<option value="<%= c.getCategoryNo() %>">
									<%= c.getCategoryName() %>
								</option>                            
                            <% } %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="title" required></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><textarea name="content" style="resize:none;" rows="10"></textarea></td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td><input type="file" name="upfile"></td>
                </tr>
            </table>
            <br><br>
            <div align="center">
                <button type="submit" class="btn btn-sm btn-info">글작성</button>
            </div>

        </form>
		<br><br><br>

    
</div>


<%@ include file="../common/footer.jsp" %>
</body>
</html>
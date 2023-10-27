<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, petopia.com.kh.jsp.board.model.vo.*, petopia.com.kh.jsp.info.model.vo.*, petopia.com.kh.jsp.info.model.vo.*, petopia.com.kh.jsp.user.model.vo.*"  %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
       
        box-sizing: border-box;
        background-color: rgb(255, 248, 240);
    }

    #content-area{
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

<!-- content -->
<style>
    #content{
       
    }
    .content-list{
        display : flex;

        margin : 10px 0px;
       
    }
    .content-name{
        margin-right : 20px;
       
    }

    #content-board{
        
    }
    #content-animal{

    }
    #content-detail{
        
    }
    #content-title{
        width : 900px;
    }
    #content-content{
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


<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
</head>
<body>

<jsp:include page="../common/header-min.jsp" />
<jsp:include page="../common/sideBar.jsp" />

<div id="wrapper">

    <section id="content-area">
        <br>
        <h2 align="center">게시글 작성</h2>
        <br><br>


		<!--파일을 첨부하는 요청을 할 때는 반드시 form태그에 enctype="multipart/form-data" 를 추가해줘야함!!-->
        <form enctype="multipart/form-data" action="/petopia/insert.bo" id="insert-form" method="post">
            <!-- 제목*, 내용*, 카테고리*, 글쓴이*, 첨부파일*, 제출버튼* -->
			<input type="hidden" name="userNo" value="${ userInfo.userNo }">
            <!-- 작성자의 회원번호를 hidden으로 같이 넘겨서 board테이블에 INSERT--> 
            <table id="content-items" align="center">
                
                <tr class="content-item">
                    <th class="content-item-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;카테고리</th>
                    <td class="content-item-content">
                        <select id="ctg" name="category">
                            <c:forEach var="category" items="${ cList }">
								<option value="${ category.ctgNo }">
									${ category.ctgName }
								</option>                            
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr class="content-item">
                    <th class="content-item-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제목</th>
                    <td class="content-item-content">
                        <input id="title" type="text" name="title" required>
                    </td>
                </tr>
                <tr class="content-item">
                    <th class="content-item-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내용</th>
                    <td class="content-item-content">
                        <textarea id="content" name="content" style="resize:none;" rows="10" required></textarea>
                    </td>
                </tr>

                <tr class="content-item">
                    <th class="content-item-title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;첨부파일</th>
                    <td class="content-item-content">
                        <label id="upfile1" class="fileUpload">
                            File1🖼️
                            <input type="file" name="file1" id="upfile1" class="upfiles" required>
                        </label>
                        <label id="upfile2" class="fileUpload">
                            File2🖼️
                            <input type="file" name="file2" id="upfile2" class="upfiles">
                        </label>
                        <label id="upfile3" class="fileUpload">
                            File3🖼️
                            <input type="file" name="file3" id="upfile3" class="upfiles">
                        </label>
                        <label id="upfile4" class="fileUpload">
                            File4🖼️
                            <input type="file" name="file4" id="upfile4" class="upfiles">
                        </label>
                    </td>
                    
                </tr>
            </table>
            <br><br>
            <script>
              
            </script>
            
            <div align="center">
                <button type="submit" id="insert-btn" class="btn btn-sm btn-info">글작성</button>
            </div>
   
        </form>
		<br><br><br>

        <style>
            #content-items{
                width : 90%;
            }
            .content-item{

            }
            .content-item-title{
                width : 10%;
                
            }
            .content-item-content{
                width : 70%;
                
                
            }
            #ctg{
                width : 100%;
            }
            #title{
                width : 100%;
            }
            #content{
                width : 100%;
            }
            .upfiles {
                position: absolute;
                width: 0;
                height: 0;
                padding: 0;
                overflow: hidden;
                border: 0;
                
            }
            .fileUpload {
                color : black;
                background-color: rgb(247, 189, 96);
                width : 60px;
                height : 30px;
                
                display: flex;
                justify-content: center;
                align-items: center;
                border-radius: 10px;
          
            }
            #insert-btn{
                background-color: burlywood;
            }
        </style>
    
</div>


<jsp:include page="../common/footer.jsp" />
</body>
</html>
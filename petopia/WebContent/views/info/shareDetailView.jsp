<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, petopia.com.kh.jsp.info.model.vo.Info, petopia.com.kh.jsp.info.model.vo.InfoFile" %>
<%
	ArrayList<InfoFile> list = (ArrayList<InfoFile>)request.getAttribute("list");
	Info in = (Info)request.getAttribute("in");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보공유 상세</title>

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

    #content{
    	background-color : rgb(255, 248, 240);
    	border : 1px solid black;
        width: 100%;
        height: 60%;
    }

    #reply-content{
        width: 100%;
        height: 20%;
    }
    
    #back{
    	width : 100%;

    	display: flex;
        justify-content: center;
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
    
    #img{
        display : none;
    }

</style>
</head>
<body>

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
                    <img src="<%= contextPath %>/<%= list.get(0).getFilePath() %>/<%= list.get(0).getUploadName() %>" id="titleImg" alt="대표이미지">
                    <% for(int i = 1; i < list.size(); i++) { %>
                    	<img src="<%= contextPath %>/<%= list.get(i).getFilePath() %>/<%= list.get(i).getUploadName() %>" id="img" alt="이미지">
                    <% } %>
                    
                    <button id="before-btn" class="btn btn-sm btn-secondary"> < </button>
                    <button id="next-btn" class="btn btn-sm btn-secondary"> > </button>
                </div>
                <div id="text-content">
                    <table border="1">
                        <tr>
                            <td width="500px"><%= in.getInfoTitle() %></td>
                        </tr>
                        <tr>
                            <td><%= in.getStarScore() %></td>
                        </tr>
                        <tr>
                            <td><%= in.getInfoWriter() %></td>
                        </tr>
                        <tr>
                            <td><%= in.getInfoCreateDate() %></td>
                        </tr>
                        <tr>
                            <td height="350px;">
                                	<%= in.getInfoContent() %>
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
           
           <div id="back">
           		<button type="button" class="btn btn-sm btn-secondary" onclick="history.back();">목록으로</button>
           </div>
    
        </div>
        
        </section>
        
        <%@ include file="../common/footer.jsp" %>

        <script>
            $(function(){
                $("#edit > h4").click(function(){
                    const editOption = $("#edit-option");
                    if(editOption.css("display") == 'none'){
                        editOption.slideDown(100);
                    }
                    else{
                        editOption.slideUp(100);
                    }
                });
                
                $('#next-btn').click(function(){
                	$('#img').show();
                	$('#titleImg').hide();
                });
            });
        </script>

</body>
</html>
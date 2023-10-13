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

    #edit > h4:hover{cursor: pointer;}

    #edit-option a, #text-content a{
        color: black;
        text-decoration: none;
    }

    #edit-option a:hover{color:gray;}

    #photo-content > img{
    	position : relative;
        width: 100%;
        height: 94%;
    }
    
	/* 부모 요소를 relative로 설정하고 해당 요소를 absolute로 설정해서 띄움 */
	#before-btn{
		position : absolute;
		top : 420px;
		left : 0px;
	}
	
    #next-btn{
    	position : absolute;
        top: 420px;
        left : 362px;
    }
    
    /* class가 img인 요소 중 첫번째 요소를 제외한 나머지 선택해서 display:none 적용 */
    .img:not(:first-child){
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
                <!-- 로그인 안 하면 아무것도 안 보임 / 내 글 : 수정, 삭제 / 다른 사람 글 : 신고 -->
                <% if(userInfo != null) { %>
                	<% if(userInfo.getUserNickname().equals(in.getInfoWriter())) {  %>
                    	<a href="<%= contextPath %>/updateForm.in?ino=<%= in.getInfoNo() %>">수정</a>
                    	<a href="<%= contextPath %>/delete.in?ictg=<%= in.getCategoryNo() %>&ino=<%= in.getInfoNo() %>">삭제</a>
                	<% } else {%>
                    	<a href="#">신고</a>
                    <% } %>
                <% } %>
                </div>
           </div>
           <div id="content">
                
                <div id="photo-content">
                    
                    <% for(int i = 0; i < list.size(); i++) { %>
                    	<img src="<%= contextPath %>/<%= list.get(i).getFilePath() %>/<%= list.get(i).getUploadName() %>" class="img" alt="이미지">
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
                            <td id="stars">
                            <!-- 별점을 DB에 보낼 때 클릭한 인덱스 + 1로 했으니까 받아올 때는 별점 수 - 1로 보여주기 -->
                            <% for(int i = 0; i <in.getStarScore(); i++) { %>
	                            <a class="star">⭐</a> <!-- 노란 별 -->
	                        <% } %>
	                        <!-- 총 별의 개수(5) - 사용자가 클릭한 별의 개수 -->
	                    	<% for(int i = 0; i < 5 - in.getStarScore(); i++) { %>
	                    		<a class="star">☆</a>
	                    	<% } %>
                            </td>
                        </tr>
                        <tr>
                            <td><%= in.getInfoWriter() %></td>
                        </tr>
                        <tr>
                            <td><%= in.getInfoCreateDate() %></td>
                        </tr>
                        <tr>
                            <td height="390px">
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
                
                // 클래스로 접근해서 img들이 있는 images 배열을 만듦
                let images = document.getElementsByClassName('img');
                // 사진의 인덱스에 접근할 i
                let i = 0;
                // console.log(images.length); -> 사진이 두 개일 때 2
                
                $('#next-btn').click(function(){
                	
					if(i == (images.length - 1)) { // i값이 배열의 길이 - 1일 때 (= 배열의 마지막 요소의 인덱스와 같을 때, 배열의 길이가 2이면 배열의 인덱스는 0, 1이기 때문에 -1 함)
						$(images[0]).css('display', 'block'); // 처음 요소 다시 보여지게 함
						for(i = (images.length - 1); i > 0; i--) { // 배열의 마지막 요소부터 1번째 요소까지
							$(images[i]).css('display', 'none'); // 이미지 안 보이게 함
						}
						i = 0; // i가 0이 되어야 다시 클릭 이벤트에 접근할 수 있음
					}
					else {
						i++; // i에 다음 인덱스 저장
                		$(images[i]).css('display', 'block');
                		$(images[i - 1]).css('display', 'none'); // 이전 인덱스 안 보이게 함
					}
                });
                
                $('#before-btn').click(function(){
                	
                	if(i == 0) { // i의 값이 0일 때 (처음 사진일 때)
						$(images[images.length - 1]).css('display', 'block'); // 배열의 마지막 요소 나오게 함
						for(i = 0; i < images.length - 1; i++) { // 배열의 처음 요소부터 마지막 요소 전까지
							$(images[i]).css('display', 'none'); // 이미지 안 보이게 함
						}
						i = images.length - 1;
					}
					else {
						i--; // i에 이전 인덱스 저장
                		$(images[i]).css('display', 'block');
                		$(images[i + 1]).css('display', 'none'); // 다음 인덱스 안 보이게 함
					}
                });
            });
        </script>

</body>
</html>
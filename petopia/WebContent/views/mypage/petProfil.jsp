<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, petopia.com.kh.jsp.mypage.model.vo.*"%>
<%
	ArrayList<Pet> list = (ArrayList<Pet>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 애완동물 프로필</title>
    <style>
        /*div{border: 1px solid black;}*/
        .content-area{
            position: absolute;
            top: 130px;
            left: 340px;
            box-sizing: border-box;
            height: 80%;
            width: 80%;
        }
    </style> 
    <style>
        .petImg{
            margin-top: 20px;
            display:inline-flex;
            margin-bottom: 50px;
        }
        #PetImg{
            float: left;
        }
        #petProfil{
            padding-top: 100px;
            float: right;
        }
        #petEnroll{padding-top: 100px;}
        .area-padding{padding-left: 300px;}
        .btn-right{
            float: right; 
            height: 35px;
            margin-top: 400px;
        }
        .page-btn{
            position:absolute;
            top: 95%;
            left: 40%;
        }
        input{border: none;}
        textarea{border: none;}
        select{border: none;}
    </style>
    <style>
        .profil-content{
            width: 900px;
            height: 450px;
            background-color:  rgb(244, 217, 174);
            border-radius: 0px 10px 10px 10px;
            display:flex;
        }
        .profil-content-name{
            width: 150px;
            height: 40px;
            background-color:  rgb(244, 217, 174);
            margin: 0;
            padding: 0;
            padding-top: 8px;
            text-align: center;
            font-weight: bold;
            border-radius: 20px 20px 0px 0px;
        }
        .petfil-size {    
            display: table;       
            font-size: 18px;
            margin-left: 50px;
            padding-top: 30px;
            height: 400px;
        }
        .profil-name{
            width: 300px;
            height: 70px;
        }
        .profil-name2{
            width: 400px;
            height: 210px;
        }
        .profil-name3{
            width: 425px;
            height: 70px;
        }
        .profil-align-left{float: left;}
        .profil-align-right{float: right;}
        .petProfil-list{
            margin: 0;
            padding: 0;
            width: 800px;
        }
    </style>
    <style>
        #modalOpenButton, #modalCloseButton {
            cursor: pointer;
        }
        #modalContainer {
            width: 100%;
            height: 100%;
            position: fixed;
            top: 0;
            left: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            background: rgba(0, 0, 0, 0.5);
        }
        #modalContent {
            position: absolute;
            width: 950px;
            height: 550px;
            padding: 15px;
        }
        #modalContainer.hidden {
            display: none;
        }
    </style>
</head>
<body>
    <%@ include file = "mysidebar.jsp" %>

	<div class="content-area">

        <div class="area-padding">

            <div class="petImg">
                <img src="<%=contextPath%>\resources\images/profil.png" alt="프로필기본" width="150px" height="150px" id="PetImg">
                <input type="file" id="petProfil" name="petProfil">

                <span id="petEnroll">
                    <button type="button" id="modalOpenButton" class="btn btn-sm btn-secondary">프로필 등록하기</button>
                </span>
            </div>


            <div class="petProfil-list">
 
                <div>

                    <table class="table table-hover" id="list-area">
        
                        <thead class>
                            <tr>
                                <th style="width: 200px;">No.</th>
                                <th style="width: 400px;">Name</th>
                                <th style="width: 300px;">Species</th>
                            </tr>
                        </thead>
        
                        <tbody>
                        
                        <% if(list.isEmpty()) { %>
                        	<tr>
                        		<td colspan="3" align="center">등록된 프로필이 없습니다.</td>
                        	</tr>
                        <% }else { %>
                        	<% for(Pet p : list){ %>
                        	<tr>
                        		<td><%=p.getPetNo() %></td>
                        		<td><%=p.getPetName() %></td>
                        		<td><%=p.getPetSpecies() %></td>
                        	</tr>
                        	<% } %>
                        <% } %>
							<!--				
                            <tr>
                                <td>1.</td>
                                <td>제리</td>
                                <td>강아지</td>
                                <td style="width: 20px; border-top:none;">
                                    <btn class="btn btn-sm btn-secondary">—</btn>
                                </td>
                            </tr>
                            <tr>
                                <td>2.</td>
                                <td>톰</td>
                                <td>고양이</td>
                                <td style="width: 20px; border-top:none;">
                                    <btn class="btn btn-sm btn-secondary">—</btn>
                                </td>
                            </tr>
						    -->	
                        </tbody>
        
                    </table>
                    
                </div>

            </div>


            <!--모달창으로 프로필 등록-->            
            <div id="modalContainer" class="hidden">
            <div id="modalContent">
                
                <form action="<%=contextPath%>/petInsert.my" enctype="multipart/form-data" method="post">
                	<input type="hidden" name="userNo" value="<%=userInfo.getUserNo()%>">
                    <div>
                        <p class="profil-content-name">반려동물 프로필</p>
    
                        <div class="profil-content">
    
                            <div class="petfil-size">
    
                                <div class="profil-name">
                                    이름
                                    <div class="profil-align-right"><input type="text" name="petName"></div>
                                </div>
    
                                <div class="profil-name">
                                    <label>종</label>
                                    <div class="profil-align-right">
                                        <select name="petSpecies" style="width: 205px;">
                                            <option value="강아지">강아지</option>
                                            <option value="고양이">고양이</option>
                                            <option value="설치류">설치류</option>
                                            <option value="파충류">파충류</option>
                                            <option value="조류">조류</option>
                                            <option value="어류">어류</option>
                                        </select>
                                    </div>
                                </div>
                                
                                <div class="profil-name">
                                    세부종
                                    <div class="profil-align-right"><input type="text" name="petSpecific"></div>
                                </div>
                                
                                <div class="profil-name">
                                    몸무게
                                    <div class="profil-align-right"><input type="number" name="petWeight" min="0" max="100" style="width: 175px;" value="1">&nbsp; Kg</div>
                                </div>
    
                                <div class="profil-name">
                                    성별
                                    <div class="profil-align-right">
                                        <input type="radio" name="petGender" id="F" value="F">&nbsp;F
                                        &nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="petGender" id="M" value="M">&nbsp;M
                                        &nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="petGender" id="N" checked value="N">&nbsp;중성화
                                        &nbsp;&nbsp;
                                    </div>
                                </div>
                                
                            </div>
    
                            <div class="petfil-size">
    
                                <div class="profil-name">
                                    성격
                                    <div class="profil-align-right">
                                        <input type="text" name="petPersonality">
                                    </div>
                                </div>
    
                                <div class="profil-name2">
                                    기타사항
                                    <div class="profil-align-right">
                                        <textarea name="petEtc" cols="35" rows="7" style="resize:none;"></textarea>
                                    </div>
                                </div>
                                <div class="profil-name3">
                                    사진등록
                                    <div class="profil-align-right">
                                        <input type="file" name="petImgFile" id="petImgFile" required>
                                    </div>
                                </div>
                            </div>
    
                            <button type="submit" class="btn btn-sm btn-secondary btn-right">등록하기</button>
                        
                        </div>
    
                        
                    </div>
                    
                </form>

                <button id="modalCloseButton" class="btn btn-sm btn-danger">닫기</button>
            </div>
            </div>
            <!--모달창-->
            <script>
                const modalOpenButton = document.getElementById('modalOpenButton');
                const modalCloseButton = document.getElementById('modalCloseButton');
                const modal = document.getElementById('modalContainer');

                modalOpenButton.addEventListener('click', () => {
                modal.classList.remove('hidden');
                });

                modalCloseButton.addEventListener('click', () => {
                modal.classList.add('hidden');
                });
            </script>

            <!-- 동물목록 클릭 시 디테일 창-->
            <script>
                $(function(){

                    $('#list-area>tbody>tr').click(function(){
                        location.href="<%= contextPath %>/petDetail.my?pno=" + $(this).children().eq(0).text();
                    });
                })

            </script>
            
            
        </div>

        <div class="page-btn" align="center">
           	<% if(currentPage != 1) { %>
        		<button onclick="location.href='<%=contextPath%>/pet.my?cpage=<%=currentPage-1%>'" class="btn btn-sm btn-secondary">&lt;</button>
        	<% } %>
        	
        	<% for(int i = startPage; i <= endPage; i++) { %>
        		<% if(currentPage != i) { %>
        			<button onclick="location.href='<%=contextPath%>/pet.my?cpage=<%=i%>'" class="btn btn-sm btn-secondary"><%= i %></button>
        		<% } else {%>
        			<button disabled class="btn btn-sm btn-gracolors"><%= i %></button>
        		<% } %>
        	<% } %>
        	
        	<% if(currentPage != maxPage) { %>
            	<button onclick="location.href='<%=contextPath%>/pet.my?cpage=<%=currentPage+1%>'" class="btn btn-sm btn-secondary">&gt;</button>
        	<% } %>
        </div>

    </div>

</body>
</html>
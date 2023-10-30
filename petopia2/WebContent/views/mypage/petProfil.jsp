<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 애완동물 프로필</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
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
            display:flex;
            margin-bottom: 50px;
        }
        #PetImg{
            float: left;
        }
        #petProfil{
            padding-top: 100px;
            float: right;
        }
        #petEnroll{
            padding-top: 20px;
           padding-bottom: 20px;
           float: right;
        }
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
        #style-user{
            border: 3px solid rgb(244, 217, 174);
            border-radius: 90px;
            padding-top: 20px;
            padding-left: 20px;
        }
        .pointer-events-none{pointer-events: none;}
        .petSpecies-width{width: 205px;}
        .petWeight-width{width: 175px;}
    </style>
</head>
<body>
    <%@ include file = "mysidebar.jsp" %>

	<div class="content-area">

        <div class="area-padding">

            <div class="petProfil-list">
 
                <div>

                    <table class="table table-hover" id="list-area">
                        <div id="petEnroll">
                            <button type="button" id="modalOpenButton" class="btn btn-sm btn-info">펫프로필 등록</button>
                        </div>
                        
                        <thead class>
                            <tr>
                                <th class>No.</th>
                                <th class>Name</th>
                                <th class>Species</th>
                            </tr>
                        </thead>
        
                        <tbody>
                        <c:choose>
                        <c:when test="${empty list}">
	                        	<tr>
	                        		<td colspan="3" align="center" class="pointer-events-none">등록된 프로필이 없습니다.</td>
	                        	</tr>
	                        </c:when>
	                        <c:otherwise>
	                        	<c:forEach var="list" items="${list}" varStatus="status">
	                                <tr>
	                                    <input type="hidden" name="pno" value="${list.petNo}">
	                                    <td>${status.count}</td>
	                                    <td>${list.petName}</td>
	                                    <td>${list.petSpecies}</td>
	                        	    </tr>
	                        	</c:forEach>
	                        </c:otherwise>
						</c:choose>	
                        </tbody>
        
                    </table>
                    
                </div>

            </div>


            <!--모달창으로 프로필 등록-->            
            <div id="modalContainer" class="hidden">
            <div id="modalContent">
                
                <form action="<%=contextPath%>/petInsert.my" enctype="multipart/form-data" method="post" id="checkedPetName">
                	<input type="hidden" name="userNo" value="<%=userInfo.getUserNo()%>">
					
                    <div>
                        <p class="profil-content-name">반려동물 프로필</p>
    
                        <div class="profil-content">
    
                            <div class="petfil-size">
    
                                <div class="profil-name">
                                    이름			
                                    <div class="profil-align-right"><input type="text" name="petName" required class="input_name"></div>
                                    <div id="checkName"></div>
                                </div>

                                <script>
                                    let checkResult = false;

                                    // submit버튼 활성화/비활성화
                                    function checkPetName(){
                                        //console.log(checkResult);
                                        if(checkResult){
                                            return true;
                                        } else{
                                            return false;
                                        }
                                    };

                                    // 중복일때는 클릭 안되게, 중복이 아닐때는 submit으로 전송
                                    $(document).ready(function(){
                                        
                                            $('.input_name').focusout(function(){
                                                let petName = $('.input_name').val();
                                                let userNo = '${userInfo.userNo}';
        
                                                $.ajax({
                                                    url: 'checkPetName.my',
                                                    type: 'post',
                                                    data:{petName: petName, 
                                                          userNo: userNo},
                                                    success : function(result){
                                                        if(result == '0'){
                                                            $('#checkName').html('* 사용할 수 없는 이름입니다.');
                                                            $('#checkName').css('color','red');
                                                            checkResult = false;
                                                        } else {
                                                            $('#checkName').html('* 사용가능한 이름입니다.');
                                                            $('#checkName').css('color','green');
                                                            checkResult = true;
                                                        }
                                                    },
                                                    error:function(){
                                                        alert("실패");
                                                    }
                                                })
                                            });
                                    });
                                    
                                </script>
    
                                <div class="profil-name">
                                    <label>종</label>
                                    <div class="profil-align-right">
                                        <select name="petSpecies" class="petSpecies-width">
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
                                    <div class="profil-align-right"><input type="text" name="petSpecific" required></div>
                                </div>
                                
                                <div class="profil-name">
                                    몸무게
                                    <div class="profil-align-right"><input type="number" name="petWeight" class="petWeight-width" min="0" max="100" value="1">&nbsp; Kg</div>
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
                                        <input type="text" name="petPersonality" required>
                                    </div>
                                </div>
    
                                <div class="profil-name2">
                                    기타사항
                                    <div class="profil-align-right">
                                        <textarea name="petEtc" cols="35" rows="7"></textarea>
                                    </div>
                                </div>
                                <div class="profil-name3">
                                    사진등록
                                    <div class="profil-align-right">
                                        <input type="file" name="petImgFile" id="petImgFile" required>
                                    </div>
                                </div>
                            </div>
    
                            <button type="submit" class="btn btn-sm btn-secondary btn-right" id="profilSubmit" onclick="return checkPetName();">등록하기</button>
                        
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
                        location.href="<%= contextPath %>/petDetail.my?pno=" + $(this).children().eq(0).val();
                    });
                })

            </script>
            
            
        </div>

        <div class="page-btn" align="center">
        	<c:if test="${ pi.currentPage ne 1 }">
        		<button onclick="location.href='<%=contextPath%>/pet.my?cpage=${pi.currentPage-1}'" class="btn btn-sm btn-secondary">&lt;</button>
        	</c:if>
        	<c:forEach var="i" begin="${ pi.startPage }" end="${pi.endPage}">
        		<c:choose>
        			<c:when test="${ pi.currentPage ne 1 }">
	        			<button onclick="location.href='<%=contextPath%>/pet.my?cpage=${i}'" class="btn btn-sm btn-secondary">${i}</button>
	        		</c:when>
	        		<c:otherwise>
	        			<button disabled class="btn btn-sm btn-gracolors">${i}</button>
	        		</c:otherwise>
        		</c:choose>
        	</c:forEach>
        	<c:if test="${ pi.currentPage ne maxPage }">
            	<button onclick="location.href='<%=contextPath%>/pet.my?cpage=${pi.currentPage+1}'" class="btn btn-sm btn-secondary">&gt;</button>
        	</c:if>
        </div>

    </div>

</body>
</html>
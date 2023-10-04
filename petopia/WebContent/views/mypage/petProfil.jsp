<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 애완동물 프로필</title>
    <style>
        div{/*border: 1px solid black;*/}
        .content-area{
            /*border: 1px solid black;*/
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
    </style>
    <style>
        .profil-content{
            width: 900px;
            height: 450px;
            background-color:  rgb(244, 217, 174);
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
            height: 300px;
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
                    <button id="modalOpenButton" class="btn btn-sm btn-secondary">프로필 등록하기</button>
                </span>
            </div>


            <div class="petProfil-list">
                
                <div>

                    <table class="table table-hover">
        
                        <thead class>
                            <tr>
                                <th style="width: 200px;">No.</th>
                                <th style="width: 400px;">Name</th>
                                <th style="width: 300px;">Date</th>
                            </tr>
                        </thead>
        
                        <tbody>

                            <tr>
                                <td>1.</td>
                                <td>제리</td>
                                <td>2023-10-04</td>
                                <td style="width: 20px; border-top:none;">
                                    <btn class="btn btn-sm btn-secondary">—</btn>
                                </td>
                            </tr>
                            <tr class>
                                <td>2.</td>
                                <td>톰</td>
                                <td>2023-10-04</td>
                                <td style="width: 20px; border-top:none;">
                                    <btn class="btn btn-sm btn-secondary">—</btn>
                                </td>
                            </tr>

                        </tbody>
        
                    </table>
                    
                </div>

            </div>


            <!--모달창으로 프로필 등록-->            
            <div id="modalContainer" class="hidden">
            <div id="modalContent">
                
                <form action="">
                    <div>
                        <p class="profil-content-name">반려동물 프로필</p>
    
                        <div class="profil-content">
    
                            <div class="petfil-size">
    
                                <div class="profil-name">
                                    이름
                                    <div class="profil-align-right"><input type="text"></div>
                                </div>
    
                                <div class="profil-name">
                                    <label for="">종</label>
                                    <div class="profil-align-right">
                                        <select name="" id="" style="width: 205px;">
                                            <option value="1">강아지</option>
                                        </select>
                                    </div>
                                </div>
    
                                <div class="profil-name">
                                    <label for="">세부종</label>
                                    <div class="profil-align-right">
                                        <select name="" id="" style="width: 205px;">
                                            <option value="1">푸들</option>
                                        </select>
                                    </div>
                                </div>
                                
                                <div class="profil-name">
                                    몸무게
                                    <div class="profil-align-right"><input type="number" min="0" max="100" style="width: 175px;" value="1">&nbsp; Kg</div>
                                </div>
    
                                <div class="profil-name">
                                    성별
                                    <div class="profil-align-right">
                                        <input type="radio" name="gender" id="F">&nbsp;F
                                        &nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="gender" id="M">&nbsp;M
                                        &nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="gender" id="N" checked>&nbsp;중성화
                                        &nbsp;&nbsp;
                                    </div>
                                </div>
                                
                            </div>
    
                            <div class="petfil-size">
    
                                <div class="profil-name">
                                    성격
                                    <div class="profil-align-right">
                                        <input type="text">
                                    </div>
                                </div>
    
                                <div class="profil-name2">
                                    기타사항
                                    <div class="profil-align-right">
                                        <textarea name="" id="" cols="35" rows="10" resize:none;></textarea>
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
            
            
        </div>

        <div class="page-btn">
            페이지 버튼 위치
        </div>

    </div>

</body>
</html>
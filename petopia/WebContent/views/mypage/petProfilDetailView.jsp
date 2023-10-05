<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려동물 프로필</title>
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
            position:relative;
            width: 870px;
            height: 500px;
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
        .mg-a{
            padding-top: 50px;
            width: 1000px;
            margin: auto;
        }
        .btn-wid{
            display: inline-block;
            width: 180px;
            height: 40px;
            position:absolute;
	        bottom:15px;
            left: 650px;
        }
        </style>
</head>
<body>
    <%@ include file = "mysidebar.jsp" %>
    <div class="content-area">
        
        <div class="mg-a">

            <div>
                <p class="profil-content-name">반려동물 프로필</p>
                <div>
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
                                        <option value="dog">강아지</option>
                                        <option value="cat">고양이</option>
                                        <option value="rodent">설치류</option>
                                        <option value="reptile">파충류</option>
                                        <option value="birds">조류</option>
                                        <option value="pisces">어류</option>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="profil-name">
                                세부종
                                <div class="profil-align-right"><input type="text"></div>
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
                                <textarea name="" id="" cols="35" rows="7" style="resize:none;"></textarea>
                            </div>
                        </div>
                        <div class="profil-name3">
                            사진등록
                            <div class="profil-align-right">
                                <input type="file">
                            </div>
                        </div>
                    </div>

                    <div class="btn-wid">
                        <button type="submit" class="btn btn-sm btn-secondary">수정하기</button>
                        <button type="submit" class="btn btn-sm btn-danger">삭제하기</button>
                    </div>

                </div>

            </div>
            
        </div>
        
        
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="petopia.com.kh.jsp.mypage.model.vo.*"%>
<%
	Pet p = (Pet)request.getAttribute("p");
	// 번호, 카테고리명, 제목, 내용, 작성자 아이디, 작성일
	
	PetFile pt = (PetFile)request.getAttribute("pt");
	// 파일번호, 원본명, 수정된이름, 저장경로 || null
%>
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
        .petSpecies-width{width: 205px;}
        </style>
</head>
<body>
    <%@ include file = "mysidebar.jsp" %>

    <div class="content-area">
        
            <div class="mg-a">

                <form action="<%=contextPath%>/petUpdate.my" enctype="multipart/form-data" method="post">
                    <input type="hidden" name="pno" value="<%=p.getPetNo()%>">
                    <div>
                        <p class="profil-content-name">프로필 상세보기</p>
                        <div>
                            <div class="profil-content">

                                <div class="petfil-size">

                                    <div class="profil-name">
                                        이름
                                        <div class="profil-align-right"><input type="text" name="petName" value="<%=p.getPetName()%>"></div>
                                    </div>

                                    <div class="profil-name">
                                        <label>종</label>
                                        <div class="profil-align-right">
                                            <select id="petSpecies" name="petSpecies" class="petSpecies-width">
                                                    <option value="강아지">강아지</option>
                                                    <option value="고양이">고양이</option>
                                                    <option value="설치류">설치류</option>
                                                    <option value="파충류">파충류</option>
                                                    <option value="조류">조류</option>
                                                    <option value="어류">어류</option>
                                            </select>
                                        </div>
                                    </div>
                                    <script>
                                        $('#petSpecies option[value=<%=p.getPetSpecies()%>]').attr('selected','selected');
                                    </script>
                                    
                                    
                                    <div class="profil-name">
                                        세부종
                                        <div class="profil-align-right"><input type="text" name="petSpecific" value="<%=p.getPetSpecific()%>"></div>
                                    </div>
                                    
                                    <div class="profil-name">
                                        몸무게
                                        <div class="profil-align-right"><input type="number" name="petWeight" min="0" max="100" style="width: 175px;" value="<%=p.getPetWeight()%>">&nbsp; Kg</div>
                                    </div>

                                    <div class="profil-name">
                                        성별
                                        <div class="profil-align-right">
                                            <input type="radio" name="petGender" id="F" value="F">&nbsp;F
                                            &nbsp;&nbsp;&nbsp;
                                            <input type="radio" name="petGender" id="M" value="M">&nbsp;M
                                            &nbsp;&nbsp;&nbsp;
                                            <input type="radio" name="petGender" id="N" value="N">&nbsp;중성화
                                            &nbsp;&nbsp;
                                        </div>
                                    </div>
                                    
                                    <script>
                                        $("input:radio[name='petGender']:radio[value='<%=p.getPetGender()%>']").prop('checked', true);
                                    </script>
                                    
                            </div>

                            <div class="petfil-size">

                                    <div class="profil-name">
                                    성격
                                        <div class="profil-align-right">
                                            <input type="text" name="petPersonality" value="<%=p.getPetPersonality()%>">
                                        </div>
                                    </div>
        
                                    <div class="profil-name2">
                                        기타사항
                                        <div class="profil-align-right">
                                        <% if(p.getPetEtc() != null) { %>
                                            <textarea name="petEtc" cols="35" rows="7"><%=p.getPetEtc()%></textarea>
                                        <% } else {%>
                                            <textarea name="petEtc" cols="35" rows="7"></textarea>
                                        <% } %>
                                    </div>
                                </div>
                                <div class="profil-name3">
                                    사진등록
                                    <div class="profil-align-right">
                                    <input type="file" name=petImgFile id="petImgFile">
                                    </div>
                                </div>
                                <div class="profil-name3">
                                    기존사진 : 
                                    <a href="<%=contextPath%>/<%=pt.getFilePath()%>/<%=pt.getUploadName()%>" download="<%=pt.getOriginalName()%>">
                                        <%=pt.getOriginalName()%>
                                        <input type="hidden" name="petFileNo" value="<%=pt.getFileNo()%>">
                                    </a>
                                </div>
                            </div>

                            <div class="btn-wid">
                                <button type="submit" class="btn btn-sm btn-secondary">수정하기</button>
                                <a href="<%=contextPath%>/deletePet.my?pno=<%=p.getPetNo() %>" class="btn btn-sm btn-danger" onclick="if(!confirm('삭제하시면 관련된 모든 기능이 같이 삭제되어 복구할수 없습니다. \n정말 삭제하시겠습니까??')){return false;}">삭제하기</a>
                            </div>

                        </div>

                        <script>
                            $(document).ready(function() {
                                $('button[type=submit]').attr('disabled', 'disabled');
        
                                // 파일 변경경시 버튼 활성화
                                $('input[type=file]').on('input', function() {
                                    if ($(this).val() !== '') {
                                        $('button').removeAttr("disabled");
                                    }
                                    else {
                                        $('button').attr('disabled', 'disabled');
                                    }
                                });
                                
                                // 옵션 변경 시 버튼 활성화
                                $('select').on('input', function() {
                                    if ($(this).val() !== '') {
                                        $('button').removeAttr("disabled");
                                    }
                                    else {
                                        $('button').attr('disabled', 'disabled');
                                    }
                                });
        
                                // 제목: 글 한글자라도 수정할 시 버튼 활성화
                                $('input[type=text]').on('input', function() {
                                    if ($(this).val() !== '') {
                                        $('button').removeAttr("disabled");
                                    }
                                    else {
                                        $('button').attr('disabled', 'disabled');
                                    }
                                });
        
                                // 내용: 글 한글자라도 수정할 시 버튼 활성화
                                $('textarea').on('input', function() {
                                    if ($(this).val() !== '') {
                                        $('button').removeAttr("disabled");
                                    }
                                    else {
                                        $('button').attr('disabled', 'disabled');
                                    }
                                });
        
                            });
                        </script>

                    </div>
                </form>
            </div>
       
        
    </div>
</body>
</html>
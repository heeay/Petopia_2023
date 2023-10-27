<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 등급 및 점수</title>

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
            min-width: 1350px;
            max-width: 1800px;
        }
    </style>  
    
    <style>
        .top{
            margin-top: 100px;
        }
        .text-null{
            padding-top: 40px;
        }
        .text-null2{
            padding-top: 10px;
        }
        .cricle{
            border-radius: 400px;
            background-color: rgb(247, 222, 205);
            height: 400px;
            width: 400px;

        }
        .text-bold{
            text-align: center;
            font-size: 20px;
            font-weight: bold;
        }
        .text-stand{
            font: bold;
            font-size: 18px;
            padding-left: 60px;
        }
        .content{
            display: inline-table;
        }
        .grade{
            float: left;
            margin-left: 250px;
        }
        .point{
            float: right;
            margin-right: 250px;
        }
        .stars{
            float: right;
            margin-right: 170px;
        }
        .text-small{
            margin-top: 10px;
            font-size: 13px;
        }
    </style>

    <style> /*막대그래프*/
        .zt-skill-bar {
            color: #ffffff;
            font-size: 11px;
            line-height: 25px;
            height: 25px;
            width: 300px;
            background-color: rgb(255, 255, 255);
            margin-left: 50px;
        }
 
        .zt-skill-bar * {
            -moz-transition: all 0.5s ease;
            -ms-transition: all 0.5s ease;
                -o-transition: all 0.5s ease;
                transition: all 0.5s ease;
        }
    
        .zt-skill-bar div {
            background-color: #ffc600;
            position: relative;
            padding-left: 15px;
        }
    
        .zt-skill-bar span {
            display: block;
            position: absolute;
            right: 0;
            top: 0;
            height: 100%;
            padding: 0 5px 0 10px;
            background-color: #1a1a1a;
        }
    </style>
    <style>
        .cricle-margin{
            padding-top: 40px;
            padding-left: 50px;
        }
        .btn-hidden{border: none;}
    </style>
     
</head>
<body>
	
	<%@ include file = "mysidebar.jsp" %>
	<div class="content-area">
	
        <div class="content1 top">

            <div class="grade">
                <div class="cricle">

                    <div class="text-null"></div>
                    <div class="text-bold">${userInfo.roleId}</div>

                    <div class="text-null"></div>
                    <div class="text-null"></div>
                    <div class="text-stand"><b>다음 등급까지</b></div>
                    <div class="zt-skill-bar">
                        <div data-width="88" id="percent">✏
                            <span id="count"></span>
                        </div>
                    </div>

                    <script>
                        <c:choose>
	                        <c:when test="${userInfo.roleId eq '관리자'}" >
	                        	var variable = document.getElementById('percent');
	                            //variable.dataset.width;
	                            variable.dataset.width = 100;
	
	                            variable.innerHTML = '관리자입니다';
	                        </c:when>
	                        <c:when test="${userInfo.roleId eq '초급'}" >
	                            var grade =11;
	                        </c:when>
	                        <c:when test="${userInfo.roleId eq '중급'}" >
	                            var grade = 31;
	                        </c:when>
	                        <c:otherwise>
		                        var variable = document.getElementById('percent');
		
		                        //variable.dataset.width;
		                        variable.dataset.width = 100;
		
		                        variable.innerHTML = '최종 등급입니다';
	                       </c:otherwise>
                       </c:choose> 
                       var myInt = '${bcount}';
                       var myGrade = Math.abs(grade-myInt);
                       var percent = Math.ceil((myInt/grade)*100);
                        
                       var str = document.getElementById("count");
                       str.innerHTML = percent+'%';

                       var variable = document.getElementById('percent');
                       //variable.dataset.width;
                       variable.dataset.width = percent;
                    </script>

                    <div class="text-null"></div>
                    <div class="text-stand">게시글 수&nbsp;:&nbsp;&nbsp;<b>${bcount}</b>개</div>
                    
                    <div class="text-null2"></div>
                    <c:choose>
                    	<c:when test="${!empty lastDate}" >
	                        <div class="text-stand">마지막 게시글&nbsp;:&nbsp;&nbsp;<b>${lastDate}</b></div>
	                    </c:when>
	                    <c:otherwise>
	                        <div class="text-stand">마지막 게시글&nbsp;: <b>게시글</b>을 <b>작성</b>하세요!</div>
	                    </c:otherwise>
                    </c:choose>
                </div>

                <div class="text-null"></div>
                <div class="text-bold">내 등급</div>
            </div>

        </div>

        <div class="content2 top">
            <div class="point">
                <div class="cricle cricle-margin">
                <div class="petImg">
                <form action="<%=contextPath%>/userProfil.my" method="post" enctype="multipart/form-data">
                    
                    <div id="style-user">
                        <div style="width: 300px;" id="file-area">
                        	<c:choose>
			                	<c:when test="${ empty userInfo.fileMypageNo}">
			                		<img src="resources\images\profil.png" alt="기본프로필" width="200px" height="200px" id="titleImg">
			                	</c:when>
			                	
			                	<c:otherwise>
				                	<c:choose>
				                		<c:when test="${ !userInfo.fileMypageNo.substring(0, userInfo.fileMypageNo.indexOf('/')).equals('https:')&&!userInfo.fileMypageNo.substring(0, userInfo.fileMypageNo.indexOf('/')).equals('http:')}">
					                		<img src="${userInfo.fileMypageNo}" class="rounded-circle" alt="프로필기본" width="200px" height="200px" id="titleImg">
					                	</c:when>
					                	
					                	<c:otherwise>
					                		<img src="${userInfo.fileMypageNo}" class="rounded-circle" alt="프로필기본" width="200px" height="200px" id="titleImg">
					                	</c:otherwise>
					                </c:choose>
				                </c:otherwise>
			                </c:choose>
                        </div>
                        
                        <div class="text-null2"></div>
                        <div class="text-null2"></div>
                        <div>
                            <div style="margin-left: 30px; margin-bottom: 5px; margin-top: 10px;">
                                <input type="file" id="userProfil" name="userProfil" onchange="loadImg(this, 1);">
                            </div>
                            <div style="margin-left: 30px; padding-bottom: 10px;">
                                <button type="submit" class="btn btn-sm btn-warning">유저프로필 등록</button>
                            </div>
                        </div>
                    </div>
                    
                    <!-- 프로필 첨부안할시 버튼 비활성화/첨부 시 활성화 -->
                    <script>
                        $(document).ready(function() {
                            $('button[type=submit]').attr('disabled', 'disabled');
                        
                            $('input[type=file]').on('input', function() {
                                if ($(this).val() !== '') {
                                    $('button').removeAttr("disabled");
                                }
                                else {
                                    $('button').attr('disabled', 'disabled');
                                }
                            });
                        });
                    </script>
                    
                </form>

            </div>
            <!-- 파일 첨부시 첨부된 이미지 보여주는 스크립트 -->
            <script>
                function loadImg(inputFile, num){
                    if(inputFile.files.length == 1){ // 파일이 첨부
                        let reader = new FileReader();
                        reader.readAsDataURL(inputFile.files[0]);
                        reader.onload = function(e){
                            switch(num){
                                case 1 : $('#titleImg').attr('src', e.target.result); break;
                            }
                        }
                    }
                    else {
                        const str = '<%=contextPath%>\resources\images/profil.png';
                        switch(num){
                                case 1 : $('#titleImg').attr('src', str); break;
                        }
                    }
                };
            </script>


        </div>

        <div class="text-null"></div>
        <div class="text-bold">내 프로필</div>
        
    </div>
        

    <script>
        
        (function( $ ) {
            "use strict";
                $(function() {
                    function animated_contents() {
                        $(".zt-skill-bar > div ").each(function (i) {
                            var $this  = $(this),
                            skills = $this.data('width');
            
                            $this.css({'width' : skills + '%'});
            
                        });
                    }
                    
                    if(jQuery().appear) {
                        $('.zt-skill-bar').appear().on('appear', function() {
                            animated_contents();
                        });
                    } else {
                        animated_contents();
                    }
                });
        }(jQuery));
    </script>

	

</body>
</html>
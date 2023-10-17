<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, petopia.com.kh.jsp.mypage.model.vo.*"%>
<%
	int bcount = (int)request.getAttribute("bcount");
%>
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
     
</head>
<body>
	
	<%@ include file = "mysidebar.jsp" %>
	<div class="content-area">
	
        <div class="content1 top">

            <div class="grade">
                <div class="cricle">

                    <div class="text-null"></div>
                    <div class="text-bold"><%=userInfo.getRoleId() %></div>

                    <div class="text-null"></div>
                    <div class="text-null"></div>
                    <div class="text-stand">내 등급은?</div>
                    <div class="zt-skill-bar">
                        <div data-width="88">다음 등급까지
                            <span>88%</span>
                        </div>
                    </div>

                    <div class="text-null"></div>
                    <div class="text-stand">게시글 수 : <b><%=bcount %></b>개</div>
                    <div class="text-null2"></div>
                    <div class="text-stand">마지막 게시글 :</div>
                    
                </div>

                <div class="text-null"></div>
                <div class="text-bold">내 등급</div>
            </div>

        </div>

        <div class="content2 top">
            <div class="point">
                
                <div class="cricle">
                    <div class="text-null"></div>
                    <div class="text-bold">❤ 33</div>

                    <div class="text-null"></div>
                    <div class="text-null"></div>
                    <div class="text-stand">나의 매칭 : </div>
                    
                    <div class="text-null"></div>
                    <div class="text-null2"></div>

                    <div class="text-stand">평균 점수 : 
                        <div class="stars">⭐(4.6)</div>

                    </div>

                    <div class="text-null2"></div>

                    <div class="text-stand">최근 점수 :
                        <div class="stars">⭐(4.2)</div>
                        <p class="text-small">* 최근 10건의 평균 점수 입니다.</p>

                    </div>
                    
                </div>

                <div class="text-null"></div>
                <div class="text-bold">내 점수</div>

            </div>

        </div>
        
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
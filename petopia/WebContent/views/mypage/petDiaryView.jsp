<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, petopia.com.kh.jsp.mypage.model.vo.*"%>
<%
    HosRecords hr = (HosRecords)request.getAttribute("hr");
	WalkRecords wr = (WalkRecords)request.getAttribute("wr");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫다이어리 작성</title>

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
        .content-title{
            background-color: rgb(244, 217, 174);
            text-align: left;
            font-size: 20px;
            font-weight: bold;
            padding-top: 10px;
            padding-left: 10px;
            height: 50px;
            width: 100px;
            border-radius: 20px 20px 0px 0px;
        }
        .hos-content{
            float: left;
            margin-left: 150px;
        }
        .walk-content{
            float: right;
            margin-right: 150px;
        }
        .content{
            background-color: rgb(244, 217, 174);
            line-height: 40px;
            width: 500px;
            height: 520px; 
            font-size: 18px;
            border-radius: 0px 10px 10px 10px;
        }

        .hos-content, .walk-content{
            margin-top: 100px;
        }

        .hos-box{
            height: 150px;
            width: 445px;
            background-color: rgba(255, 255, 255, 0.815);
            padding-left: 10px;
            padding-right: 10px;
            padding-top: 5px;
            padding-bottom: 5px;
            border-radius: 10px;
        }
        .walk-box{
            height: 105px;
            width: 435px;
            padding-left: 10px;
            padding-right: 10px;
            padding-top: 5px;
            padding-bottom: 5px;
        }
        .content-top {
            padding-top: 20px;
        }
        .walk-top{
            margin-top: 10px;
        }
        .btn-right{
            padding-left: 420px;
        }
        .content-inblock{
            /*border: 1px solid black;*/
            display: inline-block;
        }
        .hos-text{
            padding-left: 25px;
        }

        .text-hidden {
            /*border: 1px solid black;*/
            height: 35px;
            width: 440px;
            overflow: hidden;
        }
        .text-auto{
            /*border: 1px solid black;*/
            overflow: auto;
        }

    </style>

</head>
<body>

	<%@ include file = "mysidebar.jsp" %>

	    <div class="content-area">
            
            <div class="hos">

                <div  class="hos-content">
                    
                    <div class="content-title">병원기록</div>

                    <div  class="content">

                            <div>
                                <div class="hos-text">
                                	<% if(hr != null) {%>
	                                    <div class="content-top"></div>
	                                    <div class="content-top"></div>
	                                    <div class="text-hidden">이름 : <%=hr.getPetName() %></div>
	                                    
	                                    <div>일자 : <%=hr.getHosDate() %></div>
	                                    
	                                    <div class="content-top"></div>
	                                    
	                                    <% if(hr.getHosVaccination() != null) {%>
	                                    <div class="text-hidden">예방접종 종류 : <%=hr.getHosVaccination() %></div>
	                                    <% }else { %>
	                                    <div class="text-hidden">예방접종 종류 : 작성하지않음</div>
	                                    <% } %>
	                                    
	                                    <% if(hr.getHosIllness() != null) { %>
	                                    <div class="text-hidden">질병 여부 : <%=hr.getHosIllness() %></div>
	                                    <% }else { %>
	                                    <div class="text-hidden">질병 여부 : 작성하지않음</div>
	                                    <% } %>
	                                    
	                                    <% if(hr.getHosMedicine() != null) {%>
	                                    <div class="text-hidden">약 복용기록 : <%=hr.getHosMedicine() %></div>
	                                    <% }else { %>
	                                    <div class="text-hidden">약 복용기록 : 작성하지않음</div>
	                                     <% } %>
	                                     
	                                    <div class="content-top"></div>
	                                    <% if(hr.getHosContent() != null) {%>
	                                    <div>기타사항</div>
	                                    <div class="content-inblock hos-box text-auto">
	                                        <p><%=hr.getHosContent() %></p>
	                                    </div>
	                                    <% }else { %>
	                                    <div>기타사항</div>
	                                    <div class="content-inblock hos-box text-auto">
	                                        <p>작성하지않음</p>
	                                    </div>
	                                    <% } %>
	                                    
                                    <% } else { %>
                                    <div>
                                    <div class="content-top"></div>
                                    <div class="content-top"></div>
                                    <div class="content-inblock hos-box text-auto">내용을 작성해 주세요</div>
                                    </div>
                                    <% } %>
                                </div>
                                
                        <div class="btn-right">
                            <a href="<%=contextPath %>/hosList.my?cpage=1" class="btn btn-sm btn-secondary">more</a>
                        </div>
                            </div>
                            

                    </div>
                </div>

            </div>

            <div class="walk">
                
                <div  class="walk-content">
                    
                    <div class="content-title">산책기록</div>

                    <div class="content">
                        
                            
                            <div align="center">
								<% if(hr == null) {%>
                                <div class="content-top">
                                    <img src="<%=contextPath%>\resources\images\walk.png" alt="산책기본" width="350" height="250">
                                </div>
                                <div class="content-top"></div>
                                <div class="text-hidden">
                                    <b>산책기록을 작성해 주세요</b>
                                </div>
								<% } else { %>
								<div class="content-top">
                                    <img src="<%=contextPath%>/<%=wr.getFileNo() %>" alt="산책기본" width="350" height="250">
                                </div>
                                
                                <div class="content-top"></div>
                                <div class="text-hidden">
                                    <b><%=wr.getWalkTitle() %></b>
                                </div>

                                <div class="content-top"></div>
                                <div class="content-inblock walk-box text-auto">
                                    <p><%=wr.getWalkContent() %></p>
                                </div>
                            </div>
							<% } %>
                        

                        <div class="btn-right">
                            <a href="<%=contextPath %>/walkList.my?cpage=1" class="btn btn-sm btn-secondary">more</a>
                        </div>

                    </div>
                    
                </div> 
            </div>

        </div>

	
</body>
</html>
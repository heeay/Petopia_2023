<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, petopia.com.kh.jsp.mypage.model.vo.*"%>
<%
    HosRecords hr = (HosRecords)request.getAttribute("hr");
	ArrayList<Pet> petList = (ArrayList<Pet>)request.getAttribute("petList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원기록</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

	<style>
        /*div{border: 1px solid black;}*/
        .content-area{
            position: absolute;
            top: 130px;
            left: 340px;
            box-sizing: border-box;
            height: 80%;
            width: 78%;  
        }
        input{border: none;}
        textarea{border: none;}
     </style>
     <style>
        #sug-content{
            padding-top: 15px;
            width: 1000px;
            height: 600px;
            margin: auto;
            display: block;
        }
        #sub-content-back{
            background-color: rgb(247, 222, 205);
            padding-top: 20px;
            padding-bottom: 20px;
            padding-left: 40px;
            border-radius: 10px 10px 10px 10px;
            font-size: 17px;
            font-weight: bold;
        }
        #suggestion{
            padding-left: 5px;
            font-size: 30px;
            font-weight: bold;
            padding-bottom: 10px;
        }
        .input-width{
            width: 700px;
        }
        .float-left{
            float: left;
            width: 110px;
            height: 40px;
        }
        .float-right{
            float: right;
            width: 800px;
        }
        .float-right2{
            float: right;
            width: 800px;
        }
        .contentSize{height: 45px;}
        .contentSize2{height: 250px;}
        .btn-right{
            float: right;
            padding-right: 20px;
        }
    </style>
</head>
<body>

	<%@ include file = "mysidebar.jsp" %>
	<div class="content-area">

        <form action="<%=contextPath%>/hosUpdate.my" method="post">
        
            <div id="sug-content">

                <div>
                    
                    <div>
                        <div id="suggestion">병원기록</div>
                    </div>
                    

                    <div id="sub-content-back">
                        <div class="contentSize">
                            <div class="float-left">이름</div>
                            <div class="float-right">
                                <select class="input-width" name="petNo" style="border: none;">
                                	<% for(Pet p : petList) {%>
                                    	<option value="<%=p.getPetNo()%>"><%=p.getPetName() %></option>
                                    <% } %>
                                </select>
                            </div>
                        </div>

                        <div class="contentSize">
                            <div class="float-left">일자</div>
                            <div class="float-right"><input type="date" class="input-width" name="hosDate" id="getDate"></div>
                        </div>
                        
                        <script>
                             $(function () {

                                $("#getDate").datepicker();
                                $("#getDate").datepicker('setDate', '2018-12-25');
                                
                                });
                        </script>

                        <div class="contentSize">
                            <div class="float-left">예방접종 종류</div>
                            <% if(hr.getHosVaccination() == null) { %>
                            <div class="float-right"><input type="text" class="input-width" name="hosVaccination"></div>
                            <% } else { %>
                            <div class="float-right"><input type="text" class="input-width" name="hosVaccination" value="<%=hr.getHosVaccination()%>"></div>
                        	<% } %>
                        </div>

                        <div class="contentSize">
                            <div class="float-left">질병 여부</div>
                            <% if(hr.getHosIllness() == null) { %>
                            <div class="float-right"><input type="text" class="input-width" name="hosIllness"></div>
                            <% } else { %>
                            <div class="float-right"><input type="text" class="input-width" name="hosIllness" value="<%=hr.getHosIllness()%>"></div>
                            <% } %>
                        </div>

                        <div class="contentSize">
                            <div class="float-left">약 복용 기록</div>
                            <% if(hr.getHosMedicine() == null) { %>
                            <div class="float-right"><input type="text" class="input-width" name="hosMedicine"></div>
                            <% } else { %>
                            <div class="float-right"><input type="text" class="input-width" name="hosMedicine" value="<%=hr.getHosMedicine()%>"></div>
                            <% } %>
                        </div>
                        <br>

                        <div class="contentSize2">
                            <div class="float-left">내용</div>
                            <% if(hr.getHosContent() == null) { %>
                            <div class="float-right2"><textarea cols="85" rows="9" style="resize:none;" name="hosContent"> </textarea></div>
                            <% } else { %>
                            	<div class="float-right2"><textarea cols="85" rows="9" style="resize:none;" name="hosContent"><%=hr.getHosContent()%></textarea></div>
                        	<% } %>
                        </div>

                        <div class="btn-right">
                        	<button type="submit" class="btn btn-sm btn-secondary">수정</button>
                        	<a href="javascript:history.back();" class="btn btn-sm btn-secondary">닫기</a>
                        </div>
                        <br>

                    </div>
                </div>
                
            </div>
        </form>


        </div>

	</div>
	

</body>
</html>
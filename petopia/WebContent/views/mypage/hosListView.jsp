<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, petopia.com.kh.jsp.mypage.model.vo.*"%>
<%
	ArrayList<HosRecords> hosList = (ArrayList<HosRecords>)request.getAttribute("hosList");
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
<title>병원기록</title>

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
        .hos-title{
            font-size: 30px;
            font-weight: bold;
            float: left;
        }
        .btn-right{
            float: right;
            margin-top: 20px;
            padding-right: 55px;
            height: 60px;
        }
        .margin-none{margin: 0; padding: 0;}
        .page-btn{
            position:absolute;
            top: 90%;
            left: 40%;
        }
        .pad-top{padding-top: 5px;}
        .mg-t-b{
            margin-top: 50px;
            margin-bottom: 50px;
        }
    </style>
    
</head>
<body>
	<%@ include file = "mysidebar.jsp" %>
	
	<div class="content-area">

        <div class="container margin-none">
            
            <div class="mg-t-b">
                <div class="hos-title">병원기록</div>

                <div class="btn-right"><a href="<%=contextPath %>/views/mypage/hosEnrollForm.jsp" class="btn btn-secondary">글작성</a></div>
                
                <div class="btn-right pad-top" style="border-top:none;">
                    <input type="date" name="startday"> ~ <input type="date" name="lastday">
                </div>

            </div>
            
        </div>

        <div class="container">

            <table class="table table-hover">

                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Date</th>
                        <th>Name</th>
                    </tr>
                </thead>

                <tbody>
                	<% if(hosList.isEmpty()) { %>
                        	<tr>
                        		<td colspan="3" align="center" style="pointer-events: none;">등록된 프로필이 없습니다.</td>
                        	</tr>
                        <% }else { %>
                       		<% for(int i=hosList.size()-1; i>=0; i--){ %>
                                <tr>
                                    <input type="hidden" name="hno" value="<%=hosList.get(i).getHosNo() %>">
                                    
                                    <td><%=i+1%></td>
                                    <td><%=hosList.get(i).getHosDate() %></td>
                                    <td><%=hosList.get(i).getPetName() %></td>
                                    <td style="width: 20px; border-top:none;">
				                        <button type="button" class="btn btn-sm btn-secondary">—</button>
				                    </td>
                        	    </tr>
                        	<% } %>
                        <% } %>
                	<!-- 
                    <td>1.</td>
                    <td>2023-09-27</td>
                    <td>제리</td>
                    <td style="width: 20px; border-top:none;">
                        <button type="button" class="btn btn-sm btn-secondary">—</button>
                    </td>
                     -->
                </tbody>

            </table>
            
        </div>

        <div class="page-btn">
           	<% if(currentPage != 1) { %>
        		<button onclick="location.href='<%=contextPath%>/hosList.my?cpage=<%=currentPage-1%>'" class="btn btn-sm btn-secondary">&lt;</button>
        	<% } %>
        	
        	<% for(int i = startPage; i <= endPage; i++) { %>
        		<% if(currentPage != i) { %>
        			<button onclick="location.href='<%=contextPath%>/hosList.my?cpage=<%=i%>'" class="btn btn-sm btn-secondary"><%= i %></button>
        		<% } else {%>
        			<button disabled class="btn btn-sm btn-gracolors"><%= i %></button>
        		<% } %>
        	<% } %>
        	
        	<% if(currentPage != maxPage) { %>
            	<button onclick="location.href='<%=contextPath%>/hosList.my?cpage=<%=currentPage+1%>'" class="btn btn-sm btn-secondary">&gt;</button>
        	<% } %>
        </div>

	</div>

</body>
</html>
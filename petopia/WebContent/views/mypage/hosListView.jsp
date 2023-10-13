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

  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

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

                <div class="btn-right"><a href="<%=contextPath %>/hosEnrollForm.my" class="btn btn-secondary">글작성</a></div>
                
                <form action="">
                <div class="btn-right pad-top" style="border-top:none;">
                    <input type="date" name="startDate"> ~ <input type="date" name="endDate">
                    <button type="submit">조회</button>
                </div>
				</form>
            </div>
            
        </div>
        
        <div class="container">

            <table class="table table-hover" id="list-area">
		
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
                        		<td colspan="3" align="center" style="pointer-events: none;">등록된 기록이 없습니다.</td>
                        	</tr>
                        <% }else { %>
                       		<% for(int i=0; i<hosList.size(); i++){ %>
                                <tr>
                                    <input type="hidden" name="hno" value="<%=hosList.get(i).getHosNo() %>">
                                    
                                    <td><%=hosList.get(i).getRowNum()%></td>
                                    <td><%=hosList.get(i).getHosDate() %></td>
                                    <td><%=hosList.get(i).getPetName() %></td>
                                    <td style="width: 20px; border-top:none;">
				                        <a href="<%=contextPath%>/deleteHos.my?hno=<%=hosList.get(i).getHosNo() %>" class="btn btn-sm btn-secondary" onclick="if(!confirm('삭제하시면 복구할수 없습니다. \n삭제하시겠습니까??')){return false;}">—</button>
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
            
            <script>
                $(function(){

                    $('#list-area>tbody>tr').click(function(){
                        location.href="<%= contextPath %>/hosDetail.my?hno=" + $(this).children().eq(0).val();
                    });
                })

            </script>
            
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
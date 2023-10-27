<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, petopia.com.kh.jsp.mypage.model.vo.*"%>
<%
	ArrayList<Suggestion> sugList = (ArrayList<Suggestion>)request.getAttribute("sugList");

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
<title>건의사항 확인</title>
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
        .sug-title{
            height: 70px;
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
            margin-top: 20px;
            margin-bottom: 50px;
        }
        .pointer-events-style{pointer-events: none;}
    </style>
    
</head>
<body>
	<%@ include file = "mysidebar.jsp" %>
	
	<div class="content-area">

        <div class="container margin-none">
            
            <div class="mg-t-b">
                <div class="sug-title">건의사항 확인</div>
            </div>
            
        </div>

        <div class="container">

            <table class="table table-hover" id="list-area">
		
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Title</th>
                        <th>Email</th>
                        <th>Date</th>
                    </tr>
                </thead>

                <tbody>
                	<% if(sugList.isEmpty()) { %>
                        	<tr>
                        		<td colspan="4" align="center" class="pointer-events-style">요청된 건의사항이 없습니다.</td>
                        	</tr>
                        <% }else { %>
                       		<% for(int i= 0; i<sugList.size(); i++){ %>
                                <tr>
                                    <input type="hidden" name="sno" value="<%=sugList.get(i).getSugNo() %>">
                                    
                                    <td><%=sugList.get(i).getInd() %></td>
                                    <td><%=sugList.get(i).getSugTitle() %></td>
                                    <td><%=sugList.get(i).getUserEmail() %></td>
                                    <td><%=sugList.get(i).getSugDate() %></td>
                                    <td style="width: 20px; border-top:none;">
				                        <a href="<%=contextPath%>/deleteSug.my?sno=<%=sugList.get(i).getSugNo() %>" class="btn btn-sm btn-danger" onclick="if(!confirm('삭제하시면 복구할수 없습니다. \n삭제하시겠습니까??')){return false;}">—</a>
				                    </td>
                        	    </tr>
                        	<% } %>
                        <% } %>
                </tbody>

            </table>
            
            <script>
                $(function(){

                    $('#list-area>tbody>tr').click(function(){
                        location.href="<%= contextPath %>/sugDetail.my?sno=" + $(this).children().eq(0).val();
                    });
                })

            </script>
            
        </div>

        <div class="page-btn">
           	<% if(currentPage != 1) { %>
        		<button onclick="location.href='<%=contextPath%>/sugList.my?cpage=<%=currentPage-1%>'" class="btn btn-sm btn-secondary">&lt;</button>
        	<% } %>
        	
        	<% for(int i = startPage; i <= endPage; i++) { %>
        		<% if(currentPage != i) { %>
        			<button onclick="location.href='<%=contextPath%>/sugList.my?cpage=<%=i%>'" class="btn btn-sm btn-secondary"><%= i %></button>
        		<% } else {%>
        			<button disabled class="btn btn-sm btn-gracolors"><%= i %></button>
        		<% } %>
        	<% } %>
        	
        	<% if(currentPage != maxPage) { %>
            	<button onclick="location.href='<%=contextPath%>/sugList.my?cpage=<%=currentPage+1%>'" class="btn btn-sm btn-secondary">&gt;</button>
        	<% } %>
        </div>

	</div>

</body>
</html>
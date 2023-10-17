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
<title>Insert title here</title>
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
                <div class="hos-title">건의사항 확인</div>
                
                <form action="<%=contextPath %>/sugList.my">
                <div class="btn-right pad-top" style="border-top:none;">
                    <input type="date" name="startDate"> ~ <input type="date" name="endDate">
                    <input type="hidden" name="cpage" value="<%=currentPage%>">
                    <button type="submit" class="btn btn-sm btn-secondary">조회</button>
                </div>
                </form>
            </div>
            <script>
                const urlParams = new URL(location.href).searchParams;

                const startDate = urlParams.get('startDate');
                const endDate = urlParams.get('endDate');


                console.log(startDate);
                console.log(endDate);

                $(function () {

                const dateControl = document.querySelector('input[name="startDate"]')
                dateControl.value = startDate;

                const dateControl2 = document.querySelector('input[name="endDate"]')
                dateControl2.value = endDate;
                });

            </script>
            
        </div>
        
        <div class="container">

            <table class="table table-hover" id="list-area">
		
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Date</th>
                        <th>userID</th>
                        <th>Title</th>
                    </tr>
                </thead>

                <tbody>
                	<% if(sugList.isEmpty()) { %>
                        	<tr>
                        		<td colspan="4" align="center" style="pointer-events: none;">요청된 건의사항이 없습니다.</td>
                        	</tr>
                        <% }else { %>
                       		<% for(int i=sugList.size(); i>0; i--){ %>
                                <tr>
                                    <input type="hidden" name="hno" value="<%=sugList.get(i-1).getSugNo() %>">
                                    
                                    <td><%=i%></td>
                                    <td><%=sugList.get(i-1).getSugDate() %></td>
                                    <td><%=sugList.get(i-1).getUserNo() %></td>
                                    <td>어쩌고저쩌고 안되요</td>
                                    <td style="width: 20px; border-top:none;">
				                        <a href="<%=contextPath%>/deleteSug.my?sno=<%=sugList.get(i-1).getSugNo() %>" class="btn btn-sm btn-danger" onclick="if(!confirm('삭제하시면 복구할수 없습니다. \n삭제하시겠습니까??')){return false;}">—</a>
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
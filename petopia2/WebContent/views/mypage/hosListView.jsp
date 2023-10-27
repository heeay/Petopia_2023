<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        .pointer-events-none{pointer-events: none;}
    </style>
    
</head>
<body>
	<%@ include file = "mysidebar.jsp" %>
	
	<div class="content-area">

        <div class="container margin-none">
            
            <div class="mg-t-b">
                <div class="hos-title">병원기록</div>

                <div class="btn-right"><a href="<%=contextPath %>/hosEnrollForm.my" class="btn btn-secondary">글작성</a></div>
                
                <form action="<%=contextPath %>/hosDay.my">
                <div class="btn-right pad-top" style="border-top:none;">
                    <input type="hidden" name="cpage" value="1">
                    
                    <input type="date" name="startDate" value="${startDate}"> ~ <input type="date" name="endDate" value="${endDate}">
                    <button type="submit" class="btn-sm btn-secondary">조회</button>
                </div>
                </form>
            </div>
            <script>
                const urlParams = new URL(location.href).searchParams;

                const startDate = urlParams.get('startDate');
                const endDate = urlParams.get('endDate');

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
                        <th>Name</th>
                    </tr>
                </thead>

                <tbody>
                	<c:choose>
                		<c:when test="${empty hosList}">
                        	<tr>
                        		<td colspan="3" align="center" class="pointer-events-none">등록된 기록이 없습니다.</td>
                        	</tr>
                        </c:when>
                        <c:otherwise>
                        	<c:forEach var="hos" items="${ hosList }" varStatus="status">
                                <tr>
                                    <input type="hidden" name="hno" value="${hos.hosNo}" varStatus="status">

                                    <td>${status.count}</td>
                                    <td>${hos.hosDate}</td>
                                    <td>${hos.petName}</td>
                                    <td style="width: 20px; border-top:none;">
				                        <a href="<%=contextPath%>/deleteHos.my?hno=${hos.hosNo}" class="btn btn-sm btn-danger" onclick="if(!confirm('삭제하시면 복구할수 없습니다. \n삭제하시겠습니까??')){return false;}">—</a>
				                    </td>
                        	    </tr>
                        	</c:forEach>
                        </c:otherwise>
                	</c:choose>
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
        	<c:forEach var="p" begin="${requestScope.pi.startPage}" end="${requestScope.pi.endPage}">
				<c:choose>
					<c:when test="${empty startDate}">
						<a href="hosList.my?cpage=${p}">[${p}]</a>
					</c:when>
					<c:otherwise>
						<a href="hosDay.my?cpage=${p}&startDate=${startDate}&endDate=${endDate}">[${p}]</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
        </div>

	</div>

</body>
</html>
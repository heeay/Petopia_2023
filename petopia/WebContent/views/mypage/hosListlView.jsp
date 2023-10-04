<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            border: 1px solid black;
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
        }
        .btn-right{
            float: right;
            margin-top: 20px;
        }
        .margin-none{margin: 0; padding: 0;}
        .page-btn{
            position:absolute;
            top: 90%;
            left: 40%;
        }
    </style>
    
</head>
<body>
	<%@ include file = "mysidebar.jsp" %>
	
	<div class="content-area">

        <div class="container margin-none">
            <table class="table">
                
                <tr>
                    <th><p class="hos-title">병원기록</p></th>

                    <td class="btn-right" style="border-top:none;">
                    <input type="date" name="startday"> ~ <input type="date" name="lastday">
                    </td>

                    <td><a href="" class="btn btn-secondary btn-right">글작성</a></td>
                </tr>
                
            </table>
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
                    <td>1.</td>
                    <td>2023-09-27</td>
                    <td>제리</td>
                    <td style="width: 20px; border-top:none;">
                        <button type="button" class="btn btn-sm btn-secondary">—</button>
                    </td>
                </tbody>

            </table>
            
        </div>

        <div class="page-btn">
            페이지 버튼 위치
        </div>

	</div>

</body>
</html>
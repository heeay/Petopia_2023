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
        .content-area{
            /*border: 1px solid black;*/
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
            margin-left: 210px;
            margin-top: 40px;
        }
        .inner{
            float: left;
        }
        .btn-right{
            margin-left: 900px;
            margin-top: 40px;
        }
    </style>
    
</head>
<body>
	<%@ include file = "mysidebar.jsp" %>
	
	<div class="content-area">

        <div class="inner">
            <p class="hos-title">병원기록</p>
        </div>

        <div >
            <a href="" class="btn btn-secondary btn-right">글작성</a>
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
                </tbody>

            </table>
            <a href="" class="btn btn-secondary">—</a>
        </div>


	</div>

</body>
</html>
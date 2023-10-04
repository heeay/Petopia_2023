<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>산책기록 작성</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        div{/*border: 1px solid black;*/}
        .content-area{
            /*border: 1px solid black;*/
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
        .walk-table-title{
            width: 150px;
        }
        .input-width{
            width: 700px;
        }
        .walk-table-content{
            width: 500px;
        }
        .btn-right{float: right;}
        table{background-color: rgb(247, 222, 205);}
        .img-content{float: left;}
    </style>

</head>
<body>

    <%@ include file = "mysidebar.jsp" %>
	<div class="content-area">

        <form action="">
        
            <div class="container">

                <table class="table table-hover">
                    
                    <thead>
                        <h2 style="border-bottom:none;">산책기록</h2>
                        <br>
                    </thead>

                    <tbody>
                        <tr>
                            <th class="walk-table-title">제목</th>
                            <td class="walk-table-content"><input type="text" class="input-width"></td>
                        </tr>

                        <tr>
                            <th>기록</th>
                            <td><textarea name="" id="" cols="93" rows="10" resize: none></textarea></td>
                        </tr>

                        <tr>
                            <th>사진첨부</th>
                            <td><input type="file" name="fil1" id="file1"></td>
                        </tr>
                        
                    </tbody>

                </table>

                <button type="submit" class="btn btn-right btn-secondary">글작성</button>

            </div>

        </form>
	</div>



</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원 기록 작성</title>

	<style>
        div{border: 1px solid black;}
        .content-area{
            border: 1px solid black;
            position: absolute;
            top: 130px;
            left: 340px;
            box-sizing: border-box;
            height: 80%;
            width: 78%;  
        }
     </style>
     <style>
        .hos-table-title{
            width: 150px;
        }
        .input-width{
            width: 600px;
        }
        .hos-table-content{
            width: 500px;
        }
        .btn-right{float: right;}
     </style>
</head>
<body>

	<%@ include file = "mysidebar.jsp" %>
	<div class="content-area">

        <div class="container">

            <table class="table table-hover">

                <thead>
                    <h3 style="border-bottom:none;">병원기록</h3>
                </thead>

                <tbody>
                    <tr>
                        <th class="hos-table-title">이름</th>
                        <td class="hos-table-content"><input type="text" class="input-width"></td>
                    </tr>

                    <tr>
                        <th>일자</th>
                        <td><input type="date" name="sysdate"></td>
                    </tr>

                    <tr>
                        <th>예방접종 종류</th>
                        <td><input type="text" class="input-width"></td>
                    </tr>

                    <tr>
                        <th>질병여부</th>
                        <td><input type="text" class="input-width"></td>
                    </tr>

                    <tr>
                        <th>약 복용 기록</th>
                        <td><input type="text" class="input-width"></td>
                    </tr>

                    <tr>
                        <th>기타사항</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th colspan="2"><textarea name="" id="" cols="120" rows="10" resize: none></textarea></th>
                    </tr>
                    
                </tbody>
                <tfoot>
                    <a href="" class="btn btn-right btn-secondary">글작성</a>
                </tfoot>
                

            </table>
            
        </div>



	</div>
	

</body>
</html>
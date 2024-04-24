<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
		font-size:9pt;
		font-colr:#333333;
		font-family:맑은 고딕;
	}
	a {
		text-decoration:none;
	}
	table {
		width:600px;
		border-collapse:collapse; /* cell 간격 조정*/	
	}
	th,td {
		border:1px solid #cccccc;
		padding:3px;
		line-height:2;
	}
	.div_btn {
		width:600px;
		text-align:center;
		margin-top:5px;
	}
	caption {
		font-size:15px;
		font-weight:bold;
		margin-top:10px;
		padding-bottom:5px;
	}
</style>
</head>
<body>
	<table>
		<tr>
			<th>홈</th>
			<th><a href="/egovTest/memberList.do">회원목록</a></th>
			<th><a href="/egovTest/memberWrite.do">회원가입</a></th>
			<th><a href="/egovTest/loginWrite.do">로그인</a></th>
		</tr>
	</table>
</body>
</html>
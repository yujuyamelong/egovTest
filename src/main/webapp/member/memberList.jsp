<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
</head>
<style>
body {
	font-size: 9pt;
	font-colr: #333333;
	font-family: 맑은 고딕;
}

a {
	text-decoration: none;
}

table {
	width: 600px;
	border-collapse: collapse; /* cell 간격 조정*/
}

th, td {
	border: 1px solid #cccccc;
	padding: 3px;
	line-height: 2;
}

caption {
	font-size: 15px;
	font-weight: bold;
	margin-top: 10px;
	padding-bottom: 5px;
}
</style>
<body>
	<%@ include file="topMenu.jsp" %>
	<p>
	<form>
	<table>
		<caption>회원목록</caption>
		<tr>
			<th>순번</th>
			<th>아이디</th>
			<th>패스워드</th>
			<th>이름</th>
			<th>성별</th>
			<th>생일</th>
			<th>전화번호</th>
			<th>주소</th>
		</tr>
		<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr>
				<td>${result.rownum}</td>
				<td><a href="memberDetail.do?userid=${result.userid}">${result.userid}</a></td>
				<td>${result.pass}</td>
				<td>${result.name}</td>
				<td>${result.gender}</td>
				<td>${result.birth}</td>
				<td>${result.tel}</td>
				<td>${result.address}</td>
			</tr>
		</c:forEach>
	</table>
	
	<div class="search_div" style="margin-top:20px; margin-left: 10%;">
      <select name="search" id="search">
         <option value="userid">아이디</option>
         <option value="name">이름</option>
      </select>
      <input type="text" name="searchText" id="searchText">
      <button type="submit">검색</button>
   </div>
	</form>
</body>
</html>
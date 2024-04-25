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
<title>회원 등록</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script>
  $( function() {
	  var userid = $("#userid").val();
	  $("#userid").val(userid);
	  $(document).on('click', '#btn_delete', function() {
			if (confirm("정말 삭제하시겠습니까 ?")) {
				$.ajax({
					url : "memberDelete.do",
					type : "POST",
					data : {
						uesrid : userid
					},
					success : function(result){
						if(result == "ok") {
							alert("삭제완료하였습니다.");
							location.href='memberList.do';
						} else {
							alert("삭제불가능");
						}
						
					},
					
					error : function() {
						alert("error 발생하였습니다.");
					}
				})
			}
		});
  });
  </script>
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
   <%@ include file="topMenu.jsp" %>
   <form name="frm" id="frm">
      <table>
         <caption>회원상세</caption>
         <tr>
            <th><label for="userid">아이디</label></th>
            <td>${memberVO.userid}</td>
         </tr>
         <tr>
            <th><label for="pass">패스워드</label></th>
            <td>${memberVO.pass}
            </td>
         </tr>
         <tr>
            <th><label for="name">이름</label></th>
            <td>${memberVO.name}
            </td>
         </tr>
         <tr>
            <th><label for="gender">성별</label></th>
            <td>${memberVO.gender}
            </td>
         </tr>
         <tr>
            <th><label for="birth">생년월일</label></th>
            <td>${memberVO.birth}
               
            </td>
         </tr>
         <tr>
            <th><label for="tel">연락처</label></th>
            <td>${memberVO.tel}
               
            </td>
         </tr>
         <tr>
            <th><label for="address">주소</label></th>
            <td>${memberVO.address}
               
            </td>
         </tr>
      </table>
      <div class="div_btn">
         <button type="button" onclick="location='memberModifyWrite.do?name=${memberVO.name}'">수정</button>
         <button type="button" onclick="location='memberDelete.do?userid=${memberVO.userid}'">삭제</button>
      </div>
   </form>
</body>
</html>
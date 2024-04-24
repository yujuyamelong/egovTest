<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	//datePicker 선택 시 날짜 가져오
    $( "#birth" ).datepicker({
      changeMonth: true,
      changeYear: true,
      dateFormat : 'yy-mm-dd' 
    });
	
	//중복 확인
	$("#btn_idChk").click(function(){
		var userid = $("#userid").val(); //현재 창에 입력된 값
		userid = $.trim(userid); //앞뒤 공백 제거
		if(userid == ""){
			alert("아이디를 입력해주세요");
			$("#userid").focus();
			return false;
		}
		$.ajax({
		 type:"POST",
		 data:"userid="+userid,	//json 전송타입, userid라는 이름으로 userid가 데이터를 전송.
		 url:"idChk.do", //idChk.do로 데이터 전송
		 datatype:"text", //리턴 타입
		 success:function(result){
			 if(result=="ok"){
				 alert("사용할수 있는 아이디입니다.");
			 }else{
				 alert("이미 등록된 아이디입니다.");
			 }
		 },
		 error:function(){
			 alert("error가 발생하였습니다");
		 }
		});
	});
	
	$("#reset").click(function(){
		$("#frm")[0].reset();
	});
	
    $("#btn_submit").click(function(){
		var userid = $("#userid").val(); 
		var pass = $("#pass").val(); 
		var name = $("#name").val();
		userid = $.trim(userid);
		pass = $.trim(pass);
		name = $.trim(name);
		if(userid == ""){
			alert("아이디를 입력해주세요");
			$("#userid").focus();
			return false;
		}
		if(pass == ""){
			alert("패스워드를 입력해주세요");
			$("#pass").focus();
			return false;
		}
		if(name == ""){
			alert("이름을 입력해주세요");
			$("#name").focus();
			return false;
		}
		$("#userid").val(userid);
		$("#pass").val(pass);
		$("#name").val(name);
		
		//ajax : 비동기 전송방식의 기능을 가지고 있는 jquery 함수
		var formData = jQuery("#frm").serialize(); //폼에 있는 정보를 가져온다.
		//한 번에 전송 가능한 data로 만들 수 있어 많은 data를 보낼 때 필요
		$.ajax({
			//전송 전 셋팅
			type:"POST",
			data:formData,
			url:"memberWriteSave.do", //전송할 url
			dataType:"text", //return type
			
			//전송 후 셋팅
			success:function(result){
				if(result=="ok"){
					alert("저장 완료하였습니다.");
					$("#frm")[0].reset();
 					location="loginWrite.do";  //로그인화면으로 감
				}else{
					alert("저장 실패하였습니다.");
				}
				
			},
			error: function(){ //문제 발생
				alert("error가 발생하였습니다");
			}
		});
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
			<caption>회원등록</caption>
			<tr>
				<th><label for="userid">아이디</label></th>
				<td><input type="text" name="userid" id="userid" placeholder="아이디">
				<button type="button" id="btn_idChk">중복체크</button>
				</td>
			</tr>
			<tr>
				<th><label for="pass">패스워드</label></th>
				<td><input type="password" name="pass" id="pass">
				</td>
			</tr>
			<tr>
				<th><label for="name">이름</label></th>
				<td><input type="text" name="name" id="name" placeholder="이름">
				</td>
			</tr>
			<tr>
				<th><label for="gender">성별</label></th>
				<td><input type="radio" name="gender" id="gender" value="m">남
					<input type="radio" name="gender" id="gender2" value="f">여
				</td>
			</tr>
			<tr>
				<th><label for="birth">생년월일</label></th>
				<td>
					<input type="text" name="birth" id="birth" >
				</td>
			</tr>
			<tr>
				<th><label for="tel">연락처</label></th>
				<td>
					<input type="text" name="tel" id="tel" placeholder="예):010-0000-0000"> 
				</td>
			</tr>
			<tr>
				<th><label for="address">주소</label></th>
				<td>
					<input type="text" name="address" id="address">
				</td>
			</tr>
		</table>
		<div class="div_btn">
			<button type="button" name="btn_submit" id="btn_submit">저장</button>
			<button type="reset">초기화</button>
		</div>
	</form>
</body>
</html>
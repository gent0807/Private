<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Private</title>
</head>
<body>
	<p>가입한 이메일 주소를 입력해주세요.</p>
	<form style="text-align:center;">
		<input type="text" placeholder="이메일" style="height:20px; border:1px solid grey; vertical-align:top;">
		<input type="button" value="확인" style="height:22px;  vertical-align:top;" disabled>
		<p style="visibility:hidden;">필수 입력 항목입니다.</p>
		<input type="button" value="이메일로 비밀번호 받기" disabled> 
	</form>
</body>
</html>
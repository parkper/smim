<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dao" class="com.smim.member.MemberDAO" />
<%
	String id = request.getParameter("id");
	boolean result = dao.checkId(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 확인</title>
<style>
	@font-face {
	  font-family:pr;
	  src:url('../fonts/Pretendard-Regular.eot');
	  src:url('../fonts/Pretendard-Regular.woff') format('woff'); 
	}
	.id-check-container {
	width:200px; height:200px; text-align:center; margin:20px auto;
	font-family:pr;
	}
	.id-check-container h2 {color:red; border-bottom:1px solid #393e41; font-weight:bold;}
	strong {color:blue;}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
	<div class="id-check-container">
		<h2>아이디 중복 확인</h2>
		<p>입력한 아이디는<br> <strong><%=id %></strong>입니다.</p>
		<p>
<%
	if(result) out.println("아이디가 중복되어 입력한 아이디는 사용할 수 없습니다.");
	else out.println("입력한 아이디를 사용할 수 있습니다.");
%>
		</p>
		<button onClick="self.close()" class="btn btn-danger">닫기</button>
	</div>
</body>
</html>






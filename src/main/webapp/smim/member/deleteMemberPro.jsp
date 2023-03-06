<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String id = (String) session.getAttribute("idKey"); %>
<jsp:useBean id="dao" class="com.smim.member.MemberDAO" />
<%
	boolean result = dao.deleteMember(id);
	
	if(result) {
%>
	<script>
		alert("회원 탈퇴 하였습니다.");
		location.href="login.jsp";
	</script>
<%
	}else{
%>
	<script>
		alert("회원 탈퇴에 실패했습니다.");
		history.back();
	</script>
<%
	}
%>







<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="vo" class="com.smim.member.MemberVO" />
<jsp:setProperty name="vo" property="*" />
<jsp:useBean id="dao" class="com.smim.member.MemberDAO" />

<%
	boolean result = dao.updateMember(vo);
	
	if(result) {
%>
	<script>
		alert("회원 정보를 수정 하였습니다.");
		location.href="mypage.jsp";
	</script>
<%
	}else{
%>
	<script>
		alert("회원 정보를 수정에 실패했습니다.");
		history.back();
	</script>
<%
	}
%>






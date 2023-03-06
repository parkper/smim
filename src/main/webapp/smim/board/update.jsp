<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.smim.board.BoardVO"%>
<%
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	BoardVO bean = (BoardVO)session.getAttribute("bean");
	String subject = bean.getSubject();
	String name = bean.getName(); 
	String content = bean.getContent();
%>

<script>
	function check( ) {
		if (document.updateFrm.pass.value == "") { 
			alert("수정을 위해 패스워드를 입력하세요.");
			document.updateFrm.pass.focus( );
			return false;
		}
		document.updateFrm.submit( ); 
	}
</script>

<jsp:include page="../include/header.jsp" flush="false"/>

<div class="sub-bn sub-bn-bg-3"></div>
	<h4 class="db-title">게시글 수정</h4>


<form name="updateFrm" method="post" action="updateProc.jsp" >
	<div class="bd-container mt50 board-container">
		<table class="bd-table">
			<tr><td><p id="post-name">이름</p><input type="text" name="name" value="<%=name%>" class="input-pbox ip-idbox" autofocus></td></tr>
			<tr><td><p id="post-name">제목</p><input type="text" name="subject" size="50" value="<%=subject%>" class="input-pbox ip-ttbox"></td></tr>
			<td id="post-text">본 문 내 용</td>
		    <tr><td><textarea name="content" rows="10" cols="25" class="input-pbox ip-ctbox"><%=content%></textarea></td></tr>
		    <tr><td><p id="post-name">비밀번호</p><input type="password" name="pass" placeholder="비밀번호" class="input-pbox ip-pwbox"></td></tr>
		    <tr><td></td></tr>
		    <tr>
		    	<td>
		    		<input type="button" value="수정완료" onClick="check( )" class="btn btn-outline-success">
		    		<input type="reset" value="다시수정" class="btn btn-outline-warning">
		    		<input type="button" value="뒤 로" onClick="history.go(-1)" class="btn btn-outline-info">
		    	</td>
		    </tr>
		</table>
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
		<input type='hidden' name="num" value="<%=num%>">
	</div>
</form>

<jsp:include page="../include/footer.jsp" flush="false"/>

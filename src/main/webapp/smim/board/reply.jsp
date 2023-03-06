<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:useBean id="bean" class="com.smim.board.BoardVO" scope="session"/>

<%
	request.setCharacterEncoding("utf-8");
	String nowPage = request.getParameter("nowPage");
	String subject = bean.getSubject();
	String content = bean.getContent();
%>

<jsp:include page="../include/header.jsp" flush="false"/>
	
<div class="sub-bn sub-bn-bg-3"></div>
	<h4 class="db-title">답변 달기</h4>


<form name="post" method="post" action="replyProc.jsp" >
	<div class="bd-container reply-wrap board-container	">
		<table class="bd-table">
			<tr><td><p id="post-name">이름</p><input type="text" name="name" placeholder="이 름" class="input-pbox ip-idbox" autofocus></td></tr>
			<tr><td><p id="post-name">제목</p><input type="text" name="subject" size="50" value="답변 : <%=subject%>" class="input-pbox ip-ttbox"></td></tr>
			<td id="post-text">본 문 내 용</td>
			<tr>
				<td>
					<textarea name="content" rows="10" cols="25" placeholder="내 용" class="input-pbox ip-ctbox"><%=content %></textarea>
				</td>
			</tr>
			<tr><td><p id="post-name">비밀번호</p><input type="password" name="pass" placeholder="비밀번호" class="input-pbox ip-pwbox rbottom"></td></tr>
			<tr> 
				<td>
					<input type="submit" value="답변등록" class="bt bt-border-blue">
					<input type="reset" value="다시쓰기" class="bt bt-border-sky">
					<input type="button" value="뒤로" onClick="history.back( )" class="bt bt-border-dark">
				</td>
			</tr>
		</table>
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr( )%>" >
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
		<input type="hidden" name="ref" value="<%=bean.getRef( )%>">
		<input type="hidden" name="pos" value="<%=bean.getPos( )%>">
		<input type="hidden" name="depth" value="<%=bean.getDepth( )%>">
	</div>
</form>

<jsp:include page="../include/footer.jsp" flush="false"/>	

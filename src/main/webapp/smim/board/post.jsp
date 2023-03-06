<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String id = (String) session.getAttribute("idKey");
%>

<jsp:include page="../include/header.jsp" flush="false"/>
	
	<div class="sub-bn bd-bn-img-2"></div>
		<h4 class="db-title">게시글 작성</h4>
	

	<form name="postFrm" method="post" action="postProc.jsp" enctype="multipart/form-data">
	<div class="bd-container board-container mt50">
		<table class="bd-table">
<%
		if(id != null) {
%>
			<tr><td><p id="post-name">작성자</p><input type="text" name="name" value="<%=id %>" class="input-pbox ip-idbox" readonly></td></tr>
<%
		}else {
%>		
			<tr><td><p id="post-name">이름</p><input type="text" name="name" placeholder="이 름" class="input-pbox ip-nmbox" autofocus></td></tr>
<%
		}
%>
			<tr><td><p id="post-name">타이틀</p><input type="text" name="subject" placeholder="제 목" class="input-pbox ip-ttbox"></td></tr>
			<td id="post-text">본 문 내 용</td>
			<tr><td><textarea name="content" rows="10" cols="25" placeholder="내 용" class="input-pbox ip-ctbox"></textarea></td></tr>
			<tr><td><p id="post-name">비밀번호</p><input type="password" name="pass" placeholder="비밀번호" class="input-pbox ip-pwbox"></td></tr>
			<tr><td><input type="file" name="filename" placeholder="파일선택" class="input-box ip-ulbox"></td></tr>
 			<tr>
 				<td>내용타입 : HTML<input type=radio name="contentType" value="HTTP" >&nbsp;&nbsp;&nbsp;
  			 	TEXT<input type=radio name="contentType" value="TEXT" checked></td>
 			</tr>
 			<tr><td></td></tr>				
			<tr>
				<td>
					 <input type="submit" value="등 록" class="btn btn-outline-success">
					 <input type="reset" value="초기화" class="btn btn-outline-warning">
					 <input type="button" value="목 록" onClick="javascript:location.href='list.jsp'" class="btn btn-outline-info">
				</td>
			</tr>
		</table>
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr( )%>">
	</div>
	</form>

<jsp:include page="../include/footer.jsp" flush="false"/>	

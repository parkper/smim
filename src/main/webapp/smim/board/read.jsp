<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.smim.board.BoardVO"%>

<jsp:include page="../include/header.jsp" flush="false"/>
<jsp:useBean id="bm" class="com.smim.board.BoardDAO" />

<%
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num")); 
	String nowPage = request.getParameter("nowPage");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	bm.upCount(num);
	BoardVO bean = bm.getBoard(num); 
	String name = bean.getName( );
	String subject = bean.getSubject( );
	String regdate = bean.getRegdate( ); 
	String content = bean.getContent( );
	String filename = bean.getFilename( ); 
	int filesize = bean.getFilesize( ); 
	String ip = bean.getIp( );
	int count = bean.getCount( );
	session.setAttribute("bean", bean);
%>

<script>
	function list( ) {
	 	document.listFrm.action="list.jsp";
	    document.listFrm.submit( ); 
	 } 
	
	function down(filename) {
		 document.downFrm.filename.value=filename; 
		 document.downFrm.submit( ); 
	}
</script>


	
	<div class="sub-bn sub-bn-bg-3"></div>
		<h4 class="db-title board-subject"><%=subject%></h4>
	

	<div class="bd-container">
		<table class="bd-table">
		<p id="read-count">조회수 : <%=count%></p>
			<tr>
				<td>
					<table class="bd-table"> 
						<tr> 
							<%-- <%=ip%>로 부터 글을 남기셨습니다 /  --%>	
							<td class="bd-title">이 름</td>
							<td><%=name%></td>
							<td class="bd-title">작성일</td>
							<td><%=regdate%></td>
						</tr>
						<tr> 
							<td class="bd-title">제 목</td>
							<td colspan="3" class="td-left"><%=subject%></td>
						</tr>
						<tr> 
							<td class="bd-title">첨부파일</td>
							<td colspan="3" class="td-left">
<% 
						if( filename !=null && !filename.equals("")) {
%>
								<a href="javascript:down('<%=filename%>')"><img src="../uploadFile/<%=filename%>"><%=filename%></a>	
								&nbsp;&nbsp;<font color="blue">(<%=filesize%>KBytes)</font>
<%
						}else {
%> 
							등록된 파일이 없습니다.
<%
						}
%>
							</td>
						</tr>
						<tr> 
							<td colspan="4" class="bd-txt"><br><pre><%=content%></pre><br></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<ul>
			<li class="flex listinput">
				<a href="javascript:list( )"  class="btn btn-outline-info">목 록</a>
				<a href="update.jsp?nowPage=<%=nowPage%>&num=<%=num%>" class="btn btn-outline-success">수 정</a>
				<a href="reply.jsp?nowPage=<%=nowPage%>" class="btn btn-outline-secondary">답 변</a>
				<a href="delete.jsp?nowPage=<%=nowPage%>&num=<%=num%>" class="btn btn-outline-danger">삭 제</a>
			</li>
		</ul>
		
		<form name="downFrm" method="post" action="download.jsp">
			<input type="hidden" name="filename">
		</form>
		
		<form name="listFrm" method="post">
			<input type="hidden" name="num" value="<%=num%>">
			<input type="hidden" name="nowPage" value="<%=nowPage%>">
<%
	if(!(keyWord==null || keyWord.equals("null"))) {
%>
			<input type="hidden" name="keyField" value="<%=keyField%>">
			<input type="hidden" name="keyWord" value="<%=keyWord%>">
<%
	}
%>
		</form>
	</div>

<jsp:include page="../include/footer.jsp" flush="false"/>

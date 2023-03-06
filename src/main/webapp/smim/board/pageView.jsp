<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	int totalRecord = Integer.parseInt(request.getParameter("totalRecord"));
	int numPerPage = 10;
	int pagePerBlock = 15;
	int totalPage = 0;
	int totalBlock = 0;
	int nowPage = 1;
	int nowBlock = 1;
	int start=0;
	int end=10;
	int listSize=0;
	if (request.getParameter("nowPage") != null) { 
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	start = (nowPage * numPerPage)-numPerPage;
	totalPage =(int)Math.ceil((double)totalRecord / numPerPage);
	nowBlock= (int)Math.ceil((double)nowPage/pagePerBlock);
	totalBlock =(int)Math.ceil((double)totalPage / pagePerBlock);
%>

<script>
	function pageing(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit( );
	}

	function block(value) {
	 	document.readFrm.nowPage.value=<%=pagePerBlock%>*(value-1)+1;
	 	document.readFrm.submit( );
	} 
</script>

<jsp:include page="../include/header.jsp" flush="false"/>

	<h2>페이징 & 블록 처리 테스트</h2>

		<table align="center" border="0" width="80%">
				<tr align="center">
					<td>Total : <%=totalRecord%>Articles(<font color="red">
					<%=nowPage%>/<%=totalPage%>Pages</font>)</td>
				</tr>
		</table>
		<table>
		<tr>
			<td>게시물 번호 : &nbsp;</td>
			<%
				listSize = totalRecord-start;
				for(int i = 0;i<numPerPage; i++){
					if (i == listSize) break;
			%>
			<td align="center">
				<%=totalRecord-((nowPage-1)*numPerPage)-i%>&nbsp;
			</td>
			<%}//for%>
			<td align="center">&nbsp;</td>
		</tr>
	</table>
	<!-- 페이징 및 블럭 -->
	<table>
		<tr>
			<td>
				<!-- 페이징 및 블럭 처리 Start--> 
				<%
	   				  int pageStart = (nowBlock -1)*pagePerBlock + 1 ; //하단 페이지 시작번호
	   				  int pageEnd = ((pageStart + pagePerBlock ) < totalPage) ?  (pageStart + pagePerBlock): totalPage+1; 
	   				  //하단 페이지 끝번호
	   				  if(totalPage !=0){
	    			  	if (nowBlock > 1) {%>
	    			  		<a href="javascript:block('<%=nowBlock-1%>')">prev...</a><%}%>&nbsp; 
	    			  			
								<%for ( ; pageStart < pageEnd; pageStart++){%>
	     			     			<a href="javascript:pageing('<%=pageStart %>')"> 
	     						<%if(pageStart==nowPage) {%><font color="blue"> <%}%>
	     						[<%=pageStart %>] 
	     						<%if(pageStart==nowPage) {%></font> <%}%></a> 
	    						<%}//for%>&nbsp; 
	    					
	    					<%if (totalBlock > nowBlock ) {%>
	    					<a href="javascript:block('<%=nowBlock+1%>')">.....next</a>
	    				<%}%>&nbsp;  
	   				<%}%>
	 			<!-- 페이징 및 블럭 처리 End-->
			</td>
		</tr>
	</table>
	<hr width="45%"/>
	<form name="readFrm">
		<input type="hidden" name="totalRecord" value="<%=totalRecord%>">
		<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
	</form>
	<b>
	totalRecord : <%=totalRecord%>&nbsp;
	numPerPage : <%=numPerPage%>&nbsp;
	pagePerBlock : <%=pagePerBlock%>&nbsp;
	totalPage : <%=totalPage%>&nbsp;<br>
	totalBlock : <%=totalBlock%>&nbsp;
	nowPage : <%=nowPage%>&nbsp;
	nowBlock : <%=nowBlock%>&nbsp;</b>	
	<input type="button" value="TotalRecord 입력폼" onClick="javascript:location.href='pageView.html'">

<jsp:include page="../include/footer.jsp" flush="false"/>

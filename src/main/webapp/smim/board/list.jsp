<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" flush="false"/>
<%@ page import="com.smim.board.BoardVO"%>
<%@ page import="java.util.Vector"%>
<jsp:useBean id="bm" class="com.smim.board.BoardDAO" />
<%
	request.setCharacterEncoding("utf-8");
	String id = (String) session.getAttribute("idKey");
	  
	int totalRecord=0;
	int numPerPage=10;
	int pagePerBlock=15;
	int totalPage=0;
	int totalBlock=0;
	int nowPage=1;
	int nowBlock=1;
	int start=0;
	int end=10;
	int listSize=0;
	String keyWord = "", keyField = "";
	Vector<BoardVO> vlist = null;
	
	if(request.getParameter("keyWord") != null) {
		keyWord = request.getParameter("keyWord");
		keyField = request.getParameter("keyField");
	}
	
	if(request.getParameter("reload") != null) {
		if(request.getParameter("reload").equals("true")) {
			keyWord = "";
			keyField = "";
		}
	}

	if(request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	start=(nowPage * numPerPage)-numPerPage;
	end= start+numPerPage;
	totalRecord = bm.getTotalCount(keyField, keyWord);
	totalPage =(int)Math.ceil((double)totalRecord / numPerPage);
	nowBlock= (int)Math.ceil((double)nowPage/pagePerBlock);
	totalBlock =(int)Math.ceil((double)totalPage / pagePerBlock);
%>

<script>
	function list( ) {
		document.listFrm.action = "list.jsp";
		document.listFrm.submit( );
	}
	
	function pageing(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit( );
	}
	
	function block(value) {
		document.readFrm.nowPage.value=<%=pagePerBlock%>*(value-1)+1;
		document.readFrm.submit( );
	} 
	
	function read(num) {
		document.readFrm.num.value=num;
		document.readFrm.action="read.jsp";
		document.readFrm.submit( );
	}
	
	function check( ) {
		if(document.searchFrm.keyWord.value == "") { // 검색어가 없으면
			alert("검색어를 입력하세요.");
			document.searchFrm.keyWord.focus( );
			return;
		}
		document.searchFrm.submit( ); 
	}
</script>


	<div class="sub-bn bd-bn-img-1">
    		<div class="list-center list-h1title">
  			    <h1>Community</h1>
  	        </div>
	</div>
	
	<div class="bd-container">
		<p class="bd-txt">총게시글 : <%=totalRecord%>개(현재페이지:<%=nowPage%>/전체페이지:<%=totalPage%>)</p>
		<table class="bd-table">
			<tr>
				<td>
<%
				vlist = bm.getBoardList(keyField, keyWord, start, end);
				listSize = vlist.size( );
				
				if (vlist.isEmpty( )) {
					out.println("등록된 게시물이 없습니다.");
				}else {
%>
					<table class="bd-table table table-hover">
					<tr>
						<th>번 호</th>
						<th>제 목</th>
						<th>이 름</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
					<%
					for(int i = 0;i<numPerPage; i++) {
						if (i == listSize) break;
						BoardVO bean = vlist.get(i);
						int num = bean.getNum( );
						String name = bean.getName( );
						String subject = bean.getSubject( );
						String regdate = bean.getRegdate( );
						int depth = bean.getDepth( );
						int count = bean.getCount( );
%>
					<tr>
						<td><%=totalRecord-((nowPage-1)*numPerPage)-i%></td>
						<td class="subject">
<%
							if(depth>0) {
								for(int j=0;j<depth;j++) {
									out.println("&nbsp;&nbsp;ㄴ");
								}
							}
%> 
							<a href="javascript:read('<%=num%>')"><%=subject%></a>
						</td>
						<td><%=name%></td>
						<td><%=regdate%></td>
						<td><span class="bt bt-border-dark"><%=count%></span></td>
					</tr>
<%
					} // for:end
%>
				</table> <%
				} // if:end
%>
				</td>
			</tr>				
			<tr>
				<td class="flex">
				<!-- 페이징 및 블럭 처리 : 시작 -->
<%
			int pageStart = (nowBlock -1)*pagePerBlock + 1 ;
			int pageEnd = ((pageStart + pagePerBlock) < totalPage) ?  (pageStart + pagePerBlock): totalPage+1; 
			
			if(totalPage !=0) {
   			  	if(nowBlock > 1) {
%>
	   			  		<a href="javascript:block('<%=nowBlock-1%>')">
	   			  			<span class="glyphicon glyphicon-step-backward"></span>이전 &nbsp;&nbsp;
	   			  		</a>
<%
				}
%>
				&nbsp; 
<%
				for( ; pageStart < pageEnd; pageStart++) {
%>
   			     		<a href="javascript:pageing('<%=pageStart %>')">
<%						
					if(pageStart==nowPage) {
%>
							<span>
<%						
					}
%>
   							[<%=pageStart %>]
<%
					if(pageStart==nowPage) {
%>
							</span> 
<%
					}
%>
						</a> 
<%
				} // for:end
%>
				&nbsp; 
<%
				if(totalBlock > nowBlock ) {
%>
	   					<a href="javascript:block('<%=nowBlock+1%>')">
	   						&nbsp;&nbsp; 다음<span class="glyphicon glyphicon-step-forward"></span>
	   					</a>
<%
				}
%>
				&nbsp;  
<%
			} // if:end
%>
				<!-- 페이징 및 블럭 처리 End-->
				</td>
			</tr>
			<tr>
				<td class="flex">
<%
			if(id != null) {
%>
				<a href="post.jsp" class="btn btn-outline-dark writing">글쓰기</a>
<%
			}
%>
<!-- 					<a href="javascript:list( )" class="bt bt-border-green">목 록</a> -->
				</td>
			</tr>
		</table>
		
		<form name="searchFrm"  method="post" action="list.jsp">
			<ul>
		 		<li class="flex listinput">
	   				<select name="keyField" class="input-combo">
	    				<option value="name" class="input-combo-item"> 이 름</option>
	    				<option value="subject" class="input-combo-item"> 제 목</option>
	    				<option value="content" class="input-combo-item"> 내 용</option>
	   				</select>
	   				<input type="text" name="keyWord" placeholder="검색어" class="input-box input-search">
	   				<input type="button"  value="찾기" onClick="javascript:check( )" class="bt bt-find">
	   				<input type="hidden" name="nowPage" value="1">
		  		</li>
			</ul>
		</form>
		<form name="listFrm" method="post">
			<input type="hidden" name="reload" value="true">
			<input type="hidden" name="nowPage" value="1">
		</form>
		<form name="readFrm" method="get">
			<input type="hidden" name="num"> 
			<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
			<input type="hidden" name="keyField" value="<%=keyField%>"> 
			<input type="hidden" name="keyWord" value="<%=keyWord%>">
		</form>
	</div>

<jsp:include page="../include/footer.jsp" flush="false"/>


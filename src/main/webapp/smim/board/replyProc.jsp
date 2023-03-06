<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="bm" class="com.smim.board.BoardDAO"/>
<jsp:useBean id="reBean" class="com.smim.board.BoardVO"/>
<jsp:setProperty name="reBean" property="*"/>

<%
	bm.replyUpBoard(reBean.getRef( ), reBean.getPos( ));
	
	bm.replyBoard(reBean);
	String nowPage = request.getParameter("nowPage");
	response.sendRedirect("list.jsp?nowPage="+nowPage);
%>
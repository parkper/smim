<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:useBean id="bm" class="com.smim.board.BoardDAO"/>

<%
	request.setCharacterEncoding("utf-8");
	bm.insertBoard(request);
	response.sendRedirect("list.jsp");
%>
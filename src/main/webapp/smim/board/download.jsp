<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:useBean id="bm" class="com.smim.board.BoardDAO" />

<% bm.downLoad(request, response, out, pageContext); %>
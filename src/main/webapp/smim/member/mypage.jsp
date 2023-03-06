<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String id = (String) session.getAttribute("idKey"); %>

<jsp:useBean id="vo" class="com.smim.member.MemberVO" />
<jsp:useBean id="dao" class="com.smim.member.MemberDAO" />
<% vo = dao.getMyInfo(id); %>
   
<jsp:include page="../include/header.jsp" flush="false" />

	<div class="sub-bn sub-bn-bg-2"></div>
	<h4 class="db-title">내정보</h4>
	
	<div class="mb-container">
		<table class="table table-mypage">
			<tr>	<td>아이디</td><td><%=id %></td>	</tr>
			<tr><td>비밀번호</td><td><%=vo.getPwd() %></td></tr>
			<tr><td>이름</td><td><%=vo.getName() %></td></tr>
<%
	String gender = null;
	if(vo.getGender().equals("1")) {
		gender = "남자";
	}else{
		gender = "여자";
	}
%>
			<tr><td>성별</td><td><%=gender %></td></tr>
			<tr><td>생일</td><td><%=vo.getBirth() %></td></tr>
			<tr><td>이메일</td><td><%=vo.getEmail() %></td></tr>
			<tr><td>주소</td><td><%=vo.getZipcode() %> &nbsp; <%=vo.getAddr() %></td></tr>
			<tr><td>취미</td><td>
<%
	String[] hb = vo.getHobby();
	String[] lists = {"인터넷","여행","게임","영화","운동"};
	
	for(int i=0; i<hb.length; i++) {
		if(hb[i].equals("1")) {
			String hobby = lists[i];
%>
		<%=hobby %>&nbsp;
<%
		}
	}
%>
			</td></tr>
			<tr><td>직업</td><td><%=vo.getJob() %></td></tr>
		</table>
		
		<div class="flex mbtn">
			<a href="logout.jsp" class="btn btn-outline-primary">로그아웃</a>
			<a href="updateMember.jsp" class="btn btn-outline-secondary">정보수정</a>
			<a href="deleteMemberPro.jsp" class="btn btn-outline-danger">회원탈퇴</a>
<%
		if(id.equals("admin")) {
%>
			<a href="admin-memberList.jsp" class="btn btn-outline-success">회원 목록</a>
<%
		}
%>
		</div>
	</div> <!-- mb-container:end  -->

<jsp:include page="../include/footer.jsp" flush="false" />










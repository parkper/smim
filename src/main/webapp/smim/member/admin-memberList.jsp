<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="com.smim.member.MemberVO" %>

<jsp:useBean id="dao" class="com.smim.member.MemberDAO" />
<% Vector<MemberVO> mlist = dao.getMemberList(); %>

<jsp:include page="../include/header.jsp" flush="false" />

<script>
	$(document).ready(function(){
		$('button#userid').on('click', function(){
			var id = $(this).val();
			alert(id+'님을 선택했습니다.'); 
			var url = 'admin-update.jsp?userid='+id;
			$(location).attr('href', url);
		});
		$('#search').keyup(function(){ 
			var value = $(this).val().toLowerCase(); 
			$('.search-row').filter(function(){
				$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
			});
		});
	});
</script>
	<div class="sub-bn sub-bn-bg-3"></div>
	<h4 class="db-title">회원목록</h4>
	
	<input type="text" placeholder="검색어 입력" id="search" class="form-control search-box">
	
	<table class="table table-hover ad-table">
		<tr class="table-secondary">
			<th>아이디</th>
			<th>이름</th>
			<th>성별</th>
			<th>생일</th>
			<th>이메일</th>
			<th>우편번호</th>
			<th>주소</th>
			<th>취미</th>
			<th>직업</th>
		</tr>
<%
if(mlist.isEmpty()) {
%>
		<tr><td>회원 목록이 없습니다.</td></tr>
<%
}else{
	for(int i=0; i<mlist.size(); i++) { 
		MemberVO mvo = mlist.get(i);
		String id = mvo.getId();
		String name = mvo.getName();
		String birth = mvo.getBirth();
		String email = mvo.getEmail();
		String zipcode = mvo.getZipcode();
		String addr = mvo.getAddr();
		String job = mvo.getJob();
%>

		<tr class="search-row">
			<td><button type="button" id="userid" value="<%=id %>" ><%=id %></button></td>
			<td><%=name %></td>
<%
String gender = null;
if(mvo.getGender().equals("1")) {
	gender = "남자";
}else{
	gender = "여자";
}
%>
			<td><%=gender %></td>
			<td><%=birth %></td>
			<td><%=email %></td>
			<td><%=zipcode %></td>
			<td><%=addr %></td>
			<td>
<%
String[] hb = mvo.getHobby();
String[] lists = {"인터넷","여행","게임","영화","운동"};

for(int j=0; j<hb.length; j++) {
	if(hb[j].equals("1")) {
		String hobby = lists[j];
%>
				<%=hobby %>&nbsp;
<%
	}
}
%>
			</td>
			<td><%=job %></td>
		</tr>
<%
	} //for-end
} //else-end
%>	
	</table>

<jsp:include page="../include/footer.jsp" flush="false" />










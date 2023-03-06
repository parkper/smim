<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ page import="com.smim.member.ZipcodeVO" %>
    
<%
    request.setCharacterEncoding("utf-8");
    %>
<jsp:useBean id="dao" class="com.smim.member.MemberDAO" />

<%
	String check = request.getParameter("check");
	String area3 = null;
	Vector<ZipcodeVO> vlist = null;

	if(check.equals("n")) {
		area3 = request.getParameter("area3");
		vlist = dao.zipcodeRead(area3);
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호 검색(주소지 검색으로 우편번호 설정)</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<style>
	a {color:#333; text-decoration:none;}
</style>
<script>
	function sendAdd(zipcode, area1, area2, area3, area4) {
		address = area1+" "+area2+" "+area3+" "+area4;
		window.opener.updateFrm.zipcode.value = zipcode;
		window.opener.updateFrm.addr.value = address;
		self.close();
	}
</script>
</head>
<body>
	<div class="container">
		<form name="zipFrm" action="admin-zipCheck.jsp" method="post">
			<input type="hidden" name="check" value="n">
			<table class="table">
				<tr>
					<td>
						동/면 이름 입력: <input type="text" name="area3" autofocus required>
						<input type="submit" value="검색">
					</td>
				</tr>
<%
	if(check.equals("n")) {
		if(vlist.isEmpty()) {
%>
				<tr><td>검색된 결과가 없습니다.</td></tr>
<%
		}else{
%>
				<tr><td>※ 아래 우편번호를 클릭하면 주소지가 자동으로 입력됩니다.</td></tr>
<%
			for(int i=0; i<vlist.size(); i++) {
				ZipcodeVO zvo = vlist.get(i);
				String dZipcode = zvo.getZipcode();
				String dArea1 = zvo.getArea1();
				String dArea2 = zvo.getArea2();
				String dArea3 = zvo.getArea3();
				String dArea4 = zvo.getArea4();
%>
				<tr>
					<td>
						<a href="#" onClick="javascript:sendAdd('<%=dZipcode %>', '<%=dArea1 %>', '<%=dArea2 %>', '<%=dArea3 %>', '<%=dArea4 %>')">
						<%=dZipcode %> <%=dArea1 %> <%=dArea2 %> <%=dArea3 %> <%=dArea4 %>
						</a>
					</td>
				</tr>
<%
			} //for-end
		} //else-end
	} //if-end
%>
				<tr><td><a href="#" onClick="self.close()" class="btn btn-danger">닫기</a></td></tr>
			</table>
		</form>
	</div>
</body>
</html>










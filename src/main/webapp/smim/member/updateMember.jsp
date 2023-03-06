<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String id = (String) session.getAttribute("idKey"); %>
<jsp:useBean id="vo" class="com.smim.member.MemberVO" />
<jsp:useBean id="dao" class="com.smim.member.MemberDAO" />
<% vo = dao.getMyInfo(id); %>
    
<jsp:include page="../include/header.jsp" flush="false" />

<script>
	function zipCheck() {
		url = "zipCheck.jsp?check=y";
		window.open(url, "ZipCodeCheck", "width=500, height=300, scrollbars=yes");
	}
</script>

	<div class="sub-bn sub-bn-bg-2"></div>
		<h4 class="db-title">정보 수정</h4>
	
	
	
	<div class="mb-container join-container">
		<form name="regFrm" action="updateMemberPro.jsp" method="post">
			<ul>
				<li><input type="text" name="id" class="form-control" value="<%=id %>" readonly autofocus required></li>
				<li><input type="password" name="pwd" value="<%=vo.getPwd() %>" class="form-control" required></li>
				<li><input type="text" name="name" value="<%=vo.getName() %>" class="form-control" required></li>
				<li>
					성별 : 
					<input type="radio" name="gender" value="1" checked> 남자 &nbsp;&nbsp; 
					<input type="radio" name="gender" value="2"> 여자
				</li>
				<li>생일 : <input type="text" name="birth" value="<%=vo.getBirth() %>" class="form-control input-birth"></li>
				<li><input type="email" name="email" value="<%=vo.getEmail() %>" class="form-control" required></li>
				<li>
					<input type="text" name="zipcode" value="<%=vo.getZipcode() %>" class="form-control input-zipcode" readonly>
					<input type="button" value="우편번호 찾기" class="btn btn-outline-success btn-zipcode" onClick="zipCheck()">
				</li>
				<li><input type="text" name="addr" value="<%=vo.getAddr() %>" class="form-control"></li>
				<li>
					취미 : 
					<input type="checkbox" name="hobby" value="인터넷" checked> 인터넷&nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="여행"> 여행&nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="게임"> 게임&nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="영화"> 영화&nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="운동"> 운동
				</li>
				<li>
					<select name="job" class="form-control">
						<option value="0" selected>직장을 선택하세요.</option>
						<option value="회사원">회사원</option>
						<option value="전문직">전문직</option>
						<option value="공무원">공무원</option>
						<option value="자영업">자영업</option>
						<option value="의료인">의료인</option>
						<option value="교사">교사</option>
						<option value="주부">주부</option>
						<option value="무직">무직</option>
						<option value="기타">기타</option>
					</select>
				</li>
			</ul>
			<div class="flex">
				<button type="submit" class="btn btn-outline-secondary">정보수정</button>
				<a href="mypage.jsp" class="btn btn-success">나의정보</a>
			</div>
		</form>
	</div>
	
<jsp:include page="../include/footer.jsp" flush="false" />










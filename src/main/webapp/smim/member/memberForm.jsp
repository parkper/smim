<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp" flush="false" />

	<div class="sub-bn sub-bn-bg-2"></div>
	<h4 class="db-title">회원가입</h4>
	
	<div class="mb-container join-container">
		<form name="regFrm" action="memberPro.jsp" method="post">
			<ul>
				<li>
					<div class="memberfrm-txt">아이디</div>
					<input type="text" name="id" placeholder="아이디 입력" class="form-control input-id" autofocus required>
					<input type="button" value="아이디 중복 확인" onClick="idCheck(this.form.id.value)" class="btn btn-outline-success">
					<div class="clear"></div>
				</li>
				<div class="memberfrm-txt">비밀번호</div>
				<li><input type="password" name="pwd" placeholder="비밀번호 입력" class="form-control" required></li>
				<div class="memberfrm-txt">비밀번호 재확인</div>
				<li><input type="password" name="repwd" placeholder="비밀번호 확인" class="form-control" required></li>
				<div class="memberfrm-txt">이름</div>
				<li><input type="text" name="name" placeholder="이름 입력" class="form-control" required></li>
				<li>
					<div class="memberfrm-txt">성별</div> 
					<input type="radio" name="gender" value="1" checked> 남자 &nbsp;&nbsp; 
					<input type="radio" name="gender" value="2"> 여자
				</li>
				<li>
					<div class="memberfrm-txt">생일</div>
					<input type="text" name="birth" class="form-control input-birth" placeholder="1996-03-22">
					<div class="clear"></div>
				</li>
				<div class="memberfrm-txt">이메일</div>
				<li><input type="email" name="email" placeholder="이메일 입력" class="form-control" required></li>
				<li>
					<div class="memberfrm-txt">우편번호</div>
					<input type="text" name="zipcode" placeholder="우편번호" class="form-control input-zipcode" readonly>
					<input type="button" value="우편번호 찾기" class="btn btn-outline-success btn-zipcode" onClick="zipCheck()">
					<div class="clear"></div>
				</li>
				<div class="memberfrm-txt">주소</div>
				<li><input type="text" name="addr" placeholder="주소" class="form-control"></li>
				<li>
			        <div class="memberfrm-txt">취미(중복선택)</div>
					<input type="checkbox" name="hobby" value="인터넷" checked> 인터넷&nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="여행"> 여행&nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="게임"> 게임&nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="영화"> 영화&nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="운동"> 운동
				</li>
				<li>
					<div class="memberfrm-txt">직업</div>
					<select name="job" class="form-control">
						<option value="0" selected>직업을 선택하세요.</option>
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
			<div class="joinjoin-wrap">
				<button onClick="submitCheck()" class="btn btn-primary joinjoin">가입하기</button>
			</div>
			<div class="flex">
				<button type="reset" class="btn btn-secondary jreset">초기화</button>
				<a href="login.jsp" class="btn btn-success jlogin">로그인</a>
			</div>
		</div>
		</form>
	<div class="clear"></div>

<jsp:include page="../include/footer.jsp" flush="false" />















<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp" flush="false" />

		<div class="sub-bn sub-bn-bg-1"></div>
			<h4 class="db-title">로그인</h4>
		<div class="mb-container login-container">
			<form name="loginFrm" action="loginPro.jsp" method="post">
			
				<ul>
					<li><input type="text" name="id" placeholder="아이디" autofocus required class="form-control input-box"></li>
					<li><input type="password" name="pwd" placeholder="비밀번호" required class="form-control input-box"></li>
				</ul>
					<input type="submit" value="로그인" class="btn btn-success joinlogin">
	<!-- 				<input type="reset" value="다시쓰기" class="btn btn-secondary"> -->
	<!-- 				<a href="memberForm.jsp" class="btn btn-danger">회원가입</a> -->
					<div class="loginfind">
						<a href="#" class="find fpwd">비밀번호찾기</a><a href="#" class="find fid">아이디찾기</a><a href="memberForm.jsp" class="find fjoin">회원가입</a>
					</div>
			</form>
		</div>

<jsp:include page="../include/footer.jsp" flush="false" />









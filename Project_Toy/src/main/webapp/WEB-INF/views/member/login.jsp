<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="org.Lecha.dto.MemberDTO"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"
	integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js"
	integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj"
	crossorigin="anonymous"></script>
<%
	MemberDTO name = (MemberDTO) session.getAttribute("login");
if (name != null) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인이 되어있습니다.');");
	script.println("location.href='/index';");//특정 페이지 화면으로 이동
	script.println("</script>");
	script.close();
	return;//오류가 발생시 jsp파일을 종료시킨다.
} else {
	
}
%>
</head>
<body>
	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="/index">강의평가사이트</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
				aria-controls="navbarCollapse" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse " id="navbarCollapse">
				<ul class="navbar-nav me-auto mb-2 mb-md-0">
					<li class="nav-item"><a class="nav-link"
						aria-current="page" href="/board/evaluationlist">강의평가게시판</a></li>

				</ul>

			</div>
			%nbsp;
			<div class="btn-group">
				<button class="btn btn-secondary btn-sm dropdown-toggle"
					type="button" data-bs-toggle="dropdown" aria-expanded="false">
					회원관리</button>
				<ul class="dropdown-menu">
					<c:choose>
						<c:when test="${sessionScope.login==null }">
							<li><a class="dropdown-item active" href="/member/login">로그인</a></li>
							<li><a class="dropdown-item " href="/member/join">회원가입</a></li>
						</c:when>
						<c:otherwise>
							<li><a class="dropdown-item " href="/member/logout">로그아웃</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>
	<br>
	<section class="container mt-5" style="max-width: 560px;">
		<!-- 컨테이너는 반응형으로 알아서 작아지는데 도움을 준다 -->
		<!-- 로그인창과 거리를 좀 떨어뜨리고 싶어서 mt-3을 준다. -->
		<form method="post" action="/member/login">
			<div class="form-group">
				<label>아이디</label> <input type="text" name="id" class="form-control" required="required">
			</div>
			<div class="form-group">
				<label>비밀번호</label> <input type="password" name="pw"
					class="form-control" required="required">
			</div>
			<br>
			<div>
			<button type="submit" class="btn btn-primary">로그인</button>
			<button class="btn btn-primary" onclick="location.href='/member/join'">회원가입</button>
			</div>
		</form>
	</section>
	<footer class="bg-dark mt-4 p-5 text-center " style="color: #FFFFFF;">
		Copyright &copy; 2020 이채은 All Rights Reserved. </footer>
</body>
</html>
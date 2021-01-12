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
<title>글쓰기</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<script type="text/javascript" src="/resources/js/jquery-3.5.1.js"></script>
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
	
} else {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인을 해주세요.');");
	script.println("location.href='/member/login';");//특정 페이지 화면으로 이동
	script.println("</script>");
	script.close();
	return;//오류가 발생시 jsp파일을 종료시킨다.
}
%>
</head>
<body>
	<header class="site-header sticky-top py-5">
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
						<li class="nav-item active"><a class="nav-link"
							aria-current="page" href="#">게시판</a></li>
						<li class="nav-item"><a class="nav-link" href="#">게시판2</a></li>
						<li class="nav-item"><a class="nav-link" href="#">게시판3</a></li>

					</ul>

					<form class="d-flex">
						<input class="form-control me-2" type="search" placeholder="검색"
							aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
				</div>
				%nbsp;
				<div class="btn-group">
					<button class="btn btn-secondary btn-sm dropdown-toggle"
						type="button" data-bs-toggle="dropdown" aria-expanded="false">
						회원관리</button>
					<ul class="dropdown-menu">
						<c:choose>
							<c:when test="${sessionScope.login==null }">
								<li><a class="dropdown-item" href="/member/login">로그인</a></li>
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
	</header>
	<div class="container-fluid" >
		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">제목
				</label> <input type="email" class="form-control"
				id="exampleFormControlInput1" >
		</div>
		<div class="mb-3">
			<label for="exampleFormControlTextarea1" class="form-label">내용
				</label>
			<textarea class="form-control" id="exampleFormControlTextarea1"
				rows="5"></textarea>
				<br><br>
			<button type="submit" class="btn btn-primary">등록</button>	
		</div>

	</div>



</body>
</html>
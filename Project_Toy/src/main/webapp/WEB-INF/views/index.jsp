<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>메인</title>
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

</head>
<body>
	<header class="site-header sticky-top py-4">
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
	<section class="py-5 text-center container">
		<div class="row py-lg-5">
			<div class="col-lg-6 col-md-8 mx-auto">
				<h1 class="fw-light">놀라운 변화 강의를 평가해보세요.</h1>
				<p class="lead text-muted">
					자신이 들어보았던 강의의 경험을 리뷰하세요. <br>소중한 경험을 남들과 공유하세요.
				</p>
				<p>
				<c:if test="${sessionScope.login==null }">
					<a href="/member/join" class="btn btn-primary my-2">가입하기</a> 
				</c:if>	
					<a href="/board/evaluationlist"
						class="btn btn-secondary my-2">강의평가글 보러가기</a>
				</p>
			</div>
		</div>
	</section>


</body>
</html>
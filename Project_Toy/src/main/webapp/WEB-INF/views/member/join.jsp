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
<title>회원가입</title>
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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/resources/css/bootstrap-datepicker.min.css">
<script type="text/javascript" src="/resources/js/emailCheckAction.js"></script>
<script type="text/javascript" src="/resources/js/doublecheck.js"></script>
<script src="/resources/js/bootstrap-datepicker.js"></script>
<script src="/resources/js/bootstrap-datepicker.ko.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#datePicker').datepicker({
			format : "yyyy-mm-dd", //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
			startDate : '-50y', //달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
			endDate : '1d', //달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
			autoclose : true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
			calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
			clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
			datesDisabled : [ '2019-06-24', '2019-06-26' ],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
			daysOfWeekDisabled : [ 0, 6 ], //선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
			daysOfWeekHighlighted : [ 3 ], //강조 되어야 하는 요일 설정
			disableTouchKeyboard : false, //모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
			immediateUpdates : false, //사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
			multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
			multidateSeparator : ",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
			templates : {
				leftArrow : '&laquo;',
				rightArrow : '&raquo;'
			}, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
			showWeekDays : true,// 위에 요일 보여주는 옵션 기본값 : true
			title : "", //캘린더 상단에 보여주는 타이틀
			todayHighlight : true, //오늘 날짜에 하이라이팅 기능 기본값 :false 
			toggleActive : true, //이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
			weekStart : 0,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
			language : "ko" //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.

		});//datepicker end
	});//ready end
</script>
<%
	MemberDTO name = (MemberDTO) session.getAttribute("login");
if (name != null) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그아웃 후 이용해주세요.');");
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
			
			<div class="btn-group">
				<button class="btn btn-secondary btn-sm dropdown-toggle"
					type="button" data-bs-toggle="dropdown" aria-expanded="false">
					회원관리</button>
				<ul class="dropdown-menu">
					<c:choose>
						<c:when test="${sessionScope.login==null }">
							<li><a class="dropdown-item " href="/member/login">로그인</a></li>
							<li><a class="dropdown-item active" href="/member/join">회원가입</a></li>
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
		<form method="post" action="/member/join">
			<!-- 사용자가 로그인 정보를 입력했을때 userLoginAction 페이지로 넘어가게 된다 -->
			<div class="form-group" >
				<label>아이디</label> <input type="text" id="userid" name="id" class="form-control" required="required" placeholder="">
			</div>
			<div>
			<input type="button" class="btn btn-outline-primary btn-sm" value="중복확인" id="doublecheckbtn" >
			</div>
			<br>
			<div class="form-group">
				<label>비밀번호</label> <input type="password" name="pw"
					class="form-control" required="required">
			</div>
			<br>
			<div class="form-floating mb-3">
				<div>
					<input type="email" class="form-control" 
						placeholder="name@example.com (이메일인증에 사용됩니다.)" id="usermail" name="email">
					<span><input type="button" name="btemail"
						class="btn btn-outline-primary btn-sm" di id="btemail" value="인증번호 발송하기"></span>
				</div>
				<br>
				<div>
					<input type="text" name="writechk" id="writechk1" maxlength="6"> <span
						style="color: red;" id="writechk2">* 메일로 보낸 인증번호 6자리를 입력해주세요.</span>
					<input type="hidden" name="emailChk" id="emailChk" value="">
				</div>
			</div>
			<div class="form-group">
				<label>성별</label><br> &emsp; <input type="radio" name="gender"
					class="form-check-input" checked="checked" value="남">남
				&emsp;<input type="radio" name="gender" class="form-check-input"
					value="여">여
			</div>
			<div class="form-group">
				<label>생년월일</label> <input type="text" id="datePicker"
					class="form-control" value="0000-00-00" name="birth">
			</div>
			<button type="submit" id="joinbtn" class="btn btn-primary" disabled="disabled">회원가입</button>
		</form>
	</section>
	<footer class="bg-dark mt-4 p-5 text-center " style="color: #FFFFFF;">
		Copyright &copy; 2020 이채은 All Rights Reserved. </footer>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상세글</title>
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
<!-- 댓글js -->
<script type="text/javascript" src="/resources/js/reply.js?ver=123"></script>
<!-- 좋아요js -->
<script type="text/javascript" src="/resources/js/likeaction.js"></script>
<!-- 아이콘 js -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style type="text/css">
	#replies { list-style-type : none;padding-left: 0px; }

</style>
</head>
<body>
<div class="modal fade" id="registerModal" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">평가 등록</h5>
					<button type="button" class="close" data-bs-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
						<!-- &times;닫기 아이콘 -->
					</button>
				</div>
				<div class="modal-body">
					<form action="/board/evaluationupdate" method="post">
						<div class="form-row">
							<input type="hidden" value=${detail.getBno() }>
							<!-- 한개의 행은 12만큼의 공간을 할당해준다. -->
							<div class="form-group col-sm-6">
								<label>강의이름</label> <input type="text" name="lecturename"
									class="form-control" maxlength="20" required="required" value=${detail.getLecturetitle() }>
								<!-- 작성자id -->
								<input type="hidden" name="id" value="${login.getId() }">
							</div>
							<div class="form-group col-sm-6">
								<label>강사명</label> <input type="text" name="lectureteacher"
									class="form-control" maxlength="20" required="required" value=${detail.getLectureteacher() }>
							</div>
						</div>
						<div class="form-row">
							<!-- 한개의 행은 12만큼의 공간을 할당해준다. -->
							<div class="form-group col-sm-4">
								<label>수강 연도</label> <select name="lectureyear"
									class="form-control" >
									<option value="2011">2011</option>
									<option value="2012">2012</option>
									<option value="2013">2013</option>
									<option value="2014">2014</option>
									<option value="2015">2015</option>
									<option value="2016">2016</option>
									<option value="2017">2017</option>
									<option value="2018">2018</option>
									<option value="2019">2019</option>
									<option value="2020" selected>2020</option>
									<option value="2021">2021</option>
									<option value="2022">2022</option>
								</select>
							</div>
							<div class="form-group col-sm-4">
								<label>수강 분기</label> <select name="quarterdivide"
									class="form-control">
									<option value="1분기" selected>1분기(1~3월)</option>
									<option value="2분기">2분기(4~6월)</option>
									<option value="3분기">3분기(7~9월)</option>
									<option value="4분기">4분기(10~12월)</option>
								</select>
							</div>
							<!-- <div class="form-group col-sm-4">
								<label>강의 구분</label> <select name="lecturedivide"
									class="form-control">
									<option value="프로그래밍" selected>프로그래밍</option>
									<option value="고시">고시</option>
									<option value="자격증">자격증</option>
									<option value="기타" selected>기타</option>
								</select>
							</div> -->
						</div>
						<div class="form-row">
							<div class="form-group col-sm-4">
								<label>강의료<br><span style="color: gray;">(한달기준, 단위:만)</span></label> 
								<input type="number" name="lecturefee" class="form-control" >
							</div>
						</div>
						<div class="form-group">
							<label>제목</label> <input type="text" name="lecturetitle"
								class="form-control" maxlength="30" required="required" value=${detail.getLecturetitle() }>
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea name="lecturecontent" class="form-control"
								maxlength="2048" style="height: 180px;" required="required" >value=${detail.getLecturecontent() }</textarea>
						</div>
						<div class="form-row">
							<div class="form-group col-sm3">
								<div class="accordion accordion-flush"
									id="accordionFlushExample">
									<div class="accordion-item">
										<h2 class="accordion-header" id="flush-headingOne">
											<button class="accordion-button collapsed" type="button"
												data-bs-toggle="collapse"
												data-bs-target="#flush-collapseOne3" aria-expanded="false"
												aria-controls="flush-collapseOne">평점기준#1</button>
										</h2>
										<div id="flush-collapseOne3"
											class="accordion-collapse collapse"
											aria-labelledby="flush-headingOne"
											data-bs-parent="#accordionFlushExample">
											<div class="accordion-body">
												<b>적절성 (Relevance)</b> : 수업 내용이 적절한지 그리고 배우고자하는 내용의 우선순위에 맞게
												진행되는가를 나타내는 수치입니다.<br> <br> <b>효율성(Efficiency)</b>
												: 얼마나 효율적으로 수업이 진행되고 강의료 대비 얼마나 효율적인지에 대한 수치입니다.<br> <br>
												<b>효과성(Effectiveness)</b> : 원하고자 했던 목표에 얼마나 달성했는지를 평가하는
												수치입니다.<br> <br> <b>지속가능성(Sustainability)</b> : 강의
												수강완료 이후에도 스스로 지속적으로 발전이 가능한가에 대한 수치입니다.
											</div>
										</div>
									</div>
									<div class="accordion-item">
										<h2 class="accordion-header" id="flush-headingOne">
											<button class="accordion-button collapsed" type="button"
												data-bs-toggle="collapse"
												data-bs-target="#flush-collapseOne4" aria-expanded="false"
												aria-controls="flush-collapseOne">평점등급#1</button>
										</h2>
										<div id="flush-collapseOne4"
											class="accordion-collapse collapse"
											aria-labelledby="flush-headingOne"
											data-bs-parent="#accordionFlushExample">
											<div class="accordion-body">
												<b>A</b>: 매우 우수<br> <b>B</b>: 우수<br> <b>C</b>: 보통<br>
												<b>D</b>: 부족함<br> <b>F</b>: 매우 부족함<br>
											</div>
										</div>
									</div>

								</div>
							</div>
							<div class="form-group col-sm-3">
								<label>적절성 (Relevance)</label> <select name="relevancescore"
									class="form-control">
									<!-- form-control 부트스트랩 기본양식 사용기능 -->
									<option value="A" selected>A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="F">F</option>
								</select>
							</div>
							<div class="form-group col-sm-3">
								<label>효율성(Efficiency)</label> <select name="efficiencyscore"
									class="form-control">
									<!-- form-control 부트스트랩 기본양식 사용기능 -->
									<option value="A" selected>A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="F">F</option>
								</select>
							</div>
							<div class="form-group col-sm-3">
								<label>효과성(Effectiveness)</label> <select
									name="effectivenessscore" class="form-control">
									<!-- form-control 부트스트랩 기본양식 사용기능 -->
									<option value="A" selected>A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="F">F</option>
								</select>
							</div>
							<div class="form-group col-sm-3">
								<label>지속가능성(Sustainability)</label> <select
									name="sustainabilityscore" class="form-control">
									<!-- form-control 부트스트랩 기본양식 사용기능 -->
									<option value="A" selected>A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="F">F</option>
								</select>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary">등록하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
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
	<br>
	<br>
	<input type="hidden" id="id" value="${login.getId() }">
	<div class="container-sm ">

		<table class="table">
			<thead>
				<tr>
					<td colspan="2">강의평가게시판</td>
				</tr>
			</thead>
			<tr class="table-light">
				<td scope="col" colspan="2">
					<div style="font-size: x-large;">${detail.getLecturetitle() }</div>

					<div style="font-size: x-small;">
						<span style="color: gray;">작성일</span>&ensp;${detail.getWritetime()}&emsp;
						<span style="color: gray;">작성자</span>&ensp;${detail.getId() }&emsp;
						<span style="color: gray;">조회수</span>&ensp;${detail.getViews() }&emsp;
						<span style="color: gray;">좋아요</span>
						<span id="heartexist"></span> 
					<c:if test="${login.getId() == detail.getId()}">
					<div style="float: right;">
						<button class="btn btn-outline-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#registerModal">수정</button>
						<form method="post" action="/board/evaluationdelete">
						<input type="hidden" name="bno" value="${detail.getBno() }">
						<button type="submit" class="btn btn-outline-secondary btn-sm" >삭제</button>
						</form>
					</div>	
					</c:if>
						<input type="hidden"
							id="bno" name="bno" value="${detail.getBno() }">
					</div>
				</td>
			</tr>


			<tr class="table-light">
				<td scope="col" colspan="2"><div style="float: left;">
						<b style="color: gray; ">강의명</b> &ensp;${detail.getLecturename() }&ensp;&ensp;
					</div> <div style="float: left;"><b style="color: gray;">강사명 </b>
					&ensp;${detail.getLectureteacher() }&ensp;&ensp;</div>
					<div><b style="color: gray;">강의료</b> &ensp;${detail.getLecturefee() }만원</div>
					</td>

			</tr>
			<tr class="table-light">
				<td colspan="2"><b>평점</b> <span style="color: gray;">적절성
						: ${detail.getRelevancescore() }&nbsp; 효율성 :
						${detail.getEfficiencyscore() }&nbsp; 효과성 :
						${detail.getEffectivenessscore() }&nbsp;지속가능성 :
						${detail.getSustainabilityscore() }</span></td>

			</tr>

			<tr class="table-light">
				<td scope="row" colspan="2">
				<!-- 이미지 상대경로로 설정 // 절대경로는 고유한 경로이므로 경로수정이 번거롭다// 상대경로 HTML 문서를 기준으로 경로가 설정되기에 따로 수정할필요가없다 -->
				<c:if test="${detail.getUploadPath()!=null}">
				<span style="float: left;">
				<img  width="175" height="250" src="/resources/uploadFolder/${detail.getUploadPath()}" class="rounded mx-auto d-block" alt="...">
				</span><br>
				</c:if>
				<span>${detail.getLecturecontent() }</span></td>
			</tr>

		</table>
	</div>
	<div class="container-sm ">
		<div><h5>댓글</h5></div>
		<ul id="replies">

		</ul>
	</div>
	<div class="container-sm ">
		<div>

			<div class="form-floating">
				<textarea class="form-control" placeholder="Leave a comment here"
					id="reply" name="reply" style="height: 100px"></textarea>
				<label for="reply">Comments</label>
			</div>
		</div>
		<div>
			<input id="replyer" type="hidden" name="replyer"
				value="${login.getId() }">
		</div>
		<div>
			<button id="replyAddBtn" class="btn btn-primary">댓글 쓰기</button>
		</div>
	</div>

</body>
</html>
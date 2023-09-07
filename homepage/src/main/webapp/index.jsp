<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<section class="py-5" style="background-color: #f0f8ff">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="col-md-6">
					<img class="card-img-top mb-5 mb-md-0" src="../images/mountain.png"
						alt="..." />
				</div>
				<div class="col-md-6">
					<div class="small mb-1">2023. 08. 09. ~ 2023. 09. 15.</div>
					<h1 class="display-5 fw-bolder">
						풀스택 개발자 양성과정<br />: 프로젝트 (1)
					</h1>
					<div class="fs-5 mb-5">
						<span>설문조사, 게시판, 공지사항, 웹게임</span>
					</div>
					<p class="lead">
						2023년 풀스택 개발자 양성 과정 프로그램에서 진행된 첫 번째 프로젝트 입니다.
						미션은 설문조사, 게시판, 공지사항, 웹게임 페이지를 생성하는 것입니다. Bootstrap 5를 사용하여 웹페이지를
						디자인하였습니다.
					</p>

					<a class="btn btn-dark btn-lg" href="#mission">더보기</a>
				</div>
			</div>
		</div>
	</section>

	<div class="container my-5" id="mission">
		<h2 class="fw-bolder mb-4">미션 목록</h2>
		<div class="row row-cols-1 row-cols-md-4 mb-3 text-center">
			<div class="col">
				<div class="card mb-4 rounded-3 shadow-sm" style="height: 400px">
					<div class="card-header py-3">
						<h4 class="my-0 fw-normal">설문조사</h4>
					</div>
					<div class="card-body">
						<p>난이도</p>
						<h1 class="card-title pricing-card-title">3/5</h1>
						<div class="d-flex justify-content-center small text-warning mt-3 mb-2">
							<i class="fa-solid fa-star fa-xl" style="color: #ffea00"></i> 
							<i class="fa-solid fa-star fa-xl" style="color: #ffea00"></i> 
							<i class="fa-solid fa-star fa-xl" style="color: #ffea00"></i>
						</div>
						<ul class="list-unstyled mt-3 mb-4">
							<li>설문생성</li>
							<li>설문정보: 설문, 항목들</li>
							<li>투표하기</li>
							<li>결과보기</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card mb-4 rounded-3 shadow-sm" style="height: 400px">
					<div class="card-header py-3">
						<h4 class="my-0 fw-normal">게시판</h4>
					</div>
					<div class="card-body">
						<p>난이도</p>
						<h1 class="card-title pricing-card-title">2/5</h1>
						<div class="d-flex justify-content-center small text-warning mt-3 mb-2">
							<i class="fa-solid fa-star fa-xl" style="color: #ffea00"></i> 
							<i class="fa-solid fa-star fa-xl" style="color: #ffea00"></i>
						</div>
						<ul class="list-unstyled mt-3 mb-4">
							<li>게시판 목록</li>
							<li>검색, paging, 테이블: 글쓴이, 제목, 조회수, 등록날짜</li>
							<li>게시판 생성</li>
							<li>폼: 글쓴이, 제목, 내용, 비밀번호</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card mb-4 rounded-3 shadow-sm" style="height: 400px">
					<div class="card-header py-3">
						<h4 class="my-0 fw-normal">공지사항</h4>
					</div>
					<div class="card-body">
						<p>난이도</p>
						<h1 class="card-title pricing-card-title">2/5</h1>
						<div class="d-flex justify-content-center small text-warning mt-3 mb-2">
							<i class="fa-solid fa-star fa-xl" style="color: #ffea00"></i> 
							<i class="fa-solid fa-star fa-xl" style="color: #ffea00"></i>
						</div>
						<ul class="list-unstyled mt-3 mb-4">
							<li>공지사항 목록</li>
							<li>검색, paging, 테이블: 글쓴이, 제목, 조회수, 등록날짜</li>
							<li>공지사항 생성</li>
							<li>폼: 글쓴이, 제목, 내용, 비밀번호</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card mb-4 rounded-3 shadow-sm" style="height: 400px">
					<div class="card-header py-3">
						<h4 class="my-0 fw-normal">웹게임</h4>
					</div>
					<div class="card-body">
						<p>난이도</p>
						<h1 class="card-title pricing-card-title">4/5</h1>
						<div class="d-flex justify-content-center small text-warning mt-3 mb-2">
							<i class="fa-solid fa-star fa-xl" style="color: #ffea00"></i> 
							<i class="fa-solid fa-star fa-xl" style="color: #ffea00"></i> 
							<i class="fa-solid fa-star fa-xl" style="color: #ffea00"></i> 
							<i class="fa-solid fa-star fa-xl" style="color: #ffea00"></i>
						</div>
						<ul class="list-unstyled mt-3 mb-4">
							<!-- <li>공지사항 목록</li> -->
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
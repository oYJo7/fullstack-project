<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String root = request.getContextPath();
%>
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
<!--Jquery-->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<!--toastr-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<!--font awesom-->
<script src="https://kit.fontawesome.com/a190c8bc0c.js"
	crossorigin="anonymous"></script>
<style>
.fakeimg {
	height: 200px;
	background: #aaa;
}

a {
	text-decoration: none;
}

html {
	scroll-behavior: smooth !important;
}
</style>
</head>

<body class="d-flex flex-column min-vh-100">
	<nav
		class="navbar navbar-expand-sm bg-dark navbar-dark shadow fixed-top">
		<div class="container container-fluid">
			<a class="navbar-brand" href="<%=root%>/index.jsp">
				<img src="<%=root%>/images/header-icon.png" alt="" width="30" height="24" class="d-inline-block align-text-top mx-2 mt-1" />
				Fullstack
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown">설문조사</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="<%=root%>/poll/list.jsp">설문조사 목록</a></li>
							<li><a class="dropdown-item" href="<%=root%>/poll/create.jsp">설문조사 생성</a></li>
						</ul>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">게시판</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="<%=root%>/board/list.jsp">게시판 목록</a></li>
							<li><a class="dropdown-item" href="<%=root%>/board/create.jsp">게시물 생성</a></li>
						</ul>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">공지사항</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="<%=root%>/notice/list.jsp">공지사항 목록</a></li>
							<li><a class="dropdown-item" href="<%=root%>/notice/create.jsp">공지사항 생성</a></li>
						</ul>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="<%=root%>/game/game.jsp">게임</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>
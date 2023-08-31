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
<script src="js/vote_create.js"></script>
<!--Jquery-->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<!--toastr-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<!--bootstrap icon-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" />
<style>
.fakeimg {
	height: 200px;
	background: #aaa;
}

a {
	text-decoration: none;
}

.centered-div {
	display: flex;
	align-items: center;
	justify-content: center;
	border: 4px dotted #999;
	height: 200px;
}
</style>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="container mt-5">
		<ul class="list-group mt-5">
			<li class="list-group-item list-group-item-secondary">
				<h3>공지사항 타이틀입니다.</h3>
			</li>
			<li class="list-group-item">content</li>
			<li class="list-group-item bg-light">name</li>
			<li class="list-group-item bg-light">view</li>
			<li class="list-group-item bg-light">date</li>
		</ul>
		<div class="column mt-3 mb-5">
			<button class="btn btn-dark px-4" onclick="radioAdd()">수정</button>
			<button class="btn btn-dark px-4" onclick="radioAdd()">삭제</button>
			<button class="btn btn-dark px-4" onclick="radioAdd()">목록</button>
		</div>

	</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
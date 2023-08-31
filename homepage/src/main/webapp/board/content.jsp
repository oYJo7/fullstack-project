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
<script src="../js/board_content.js"></script>
<style>
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
				<h3>게시판 타이틀입니다.</h3>
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

		<!-- Comments section-->
		<section>
			<div class="card bg-light mb-5">
				<div class="card-body">
					<!-- Comment form-->
					<!-- <input class="mb-2" id="nickname" name="nickname" placeholder="닉네임"></input> -->
					<input type="text" class="form-control shadow-sm mb-2"
						id="nickname" placeholder="이름" />
					<textarea class="form-control shadow-sm" id="comment" rows="3"
						placeholder="댓글을 작성하세요."></textarea>
					<button class="btn btn-dark my-3" id="submitButton" type="submit"
						onclick="comment_upload()">업로드</button>
					<!-- Single comment-->

					<ul class="list-group shadow-sm my-3">
						<li class="list-group-item bg-light fw-bold">이름 <span
							class="badge rounded-pill text-dark" id="comment-1"
							style="cursor: pointer" data-bs-toggle="tooltip"
							data-bs-placement="top" title="공감" onclick="commed(this)">
								<img src="../images/heart.png" alt="Red Heart" width="16"
								height="16" class="mb-1 me-2" />12
						</span>
						</li>
						<li class="list-group-item">내용</li>
					</ul>
					<ul class="list-group shadow-sm my-3">
						<li class="list-group-item bg-light fw-bold">이름 <span
							class="badge rounded-pill text-dark" id="comment-2"
							style="cursor: pointer" data-bs-toggle="tooltip"
							data-bs-placement="top" title="공감" onclick="commed(this)">
								<img src="../images/heart.png" alt="Red Heart" width="16"
								height="16" class="mb-1 me-2" />12
						</span>
						</li>
						<li class="list-group-item">내용</li>
					</ul>
				</div>
			</div>
		</section>
	</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
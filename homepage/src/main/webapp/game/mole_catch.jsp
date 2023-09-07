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
<script src="../js/game/mole_catch.js" defer></script>
<style>
.cell {
	display: inline-block;
	position: relative;
	width: 200px;
	height: 200px;
	background: "yellow";
	overflow: hidden;
}

.gopher, .bomb {
	width: 200px;
	height: 200px;
	bottom: 0;
	position: absolute;
	transition: bottom 1s;
}

.gopher {
	background: url("../images/gopher.png") center center no-repeat;
	background-size: 200px 200px;
}

.dead {
	background: url("../images/dead_gopher.png") center center no-repeat;
	background-size: 200px 200px;
}

.bomb {
	background: url("../images/bomb.png") center center no-repeat;
	background-size: 200px 200px;
}

.boom {
	background: url("../images/explode.png") center center no-repeat;
	background-size: 200px 200px;
}

.hidden {
	bottom: -200px;
}

.hole {
	width: 200px;
	height: 150px;
	position: absolute;
	bottom: 0;
	background: url("../images/mole-hole.png") center center no-repeat;
	background-size: 200px 150px;
}

.hole-front {
	width: 200px;
	height: 30px;
	position: absolute;
	bottom: 0;
	background: url("../images/mole-hole-front.png") center center no-repeat;
	background-size: 200px 30px;
}
</style>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="container my-5">
		<span class="mt-5" id="timer">8</span>초&nbsp; <span id="score">0</span>점
		<button class="mt-5"  id="start">시작</button>

		<div id="game">
			<div class="col">
				<div class="cell">
					<div class="hole"></div>
					<div class="gopher hidden"></div>
					<div class="bomb hidden"></div>
					<div class="hole-front"></div>
				</div>
				<div class="cell">
					<div class="hole"></div>
					<div class="gopher hidden"></div>
					<div class="bomb hidden"></div>
					<div class="hole-front"></div>
				</div>
				<div class="cell">
					<div class="hole"></div>
					<div class="gopher hidden"></div>
					<div class="bomb hidden"></div>
					<div class="hole-front"></div>
				</div>
			</div>
			<div class="col">
				<div class="cell">
					<div class="hole"></div>
					<div class="gopher hidden"></div>
					<div class="bomb hidden"></div>
					<div class="hole-front"></div>
				</div>
				<div class="cell">
					<div class="hole"></div>
					<div class="gopher hidden"></div>
					<div class="bomb hidden"></div>
					<div class="hole-front"></div>
				</div>
				<div class="cell">
					<div class="hole"></div>
					<div class="gopher hidden"></div>
					<div class="bomb hidden"></div>
					<div class="hole-front"></div>
				</div>
			</div>
			<div class="col">
				<div class="cell">
					<div class="hole"></div>
					<div class="gopher hidden"></div>
					<div class="bomb hidden"></div>
					<div class="hole-front"></div>
				</div>
				<div class="cell">
					<div class="hole"></div>
					<div class="gopher hidden"></div>
					<div class="bomb hidden"></div>
					<div class="hole-front"></div>
				</div>
				<div class="cell">
					<div class="hole"></div>
					<div class="gopher hidden"></div>
					<div class="bomb hidden"></div>
					<div class="hole-front"></div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
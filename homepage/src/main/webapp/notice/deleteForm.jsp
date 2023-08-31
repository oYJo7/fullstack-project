<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
#red {
	color: red;
}
</style>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
		<div class="container mt-5">
			<h3 class="mt-5">삭제</h3>
			<p id="red">삭제하면 복구할 수 없습니다.</p>
			<form action="deleteProc.jsp" method="post">
				<input type="hidden" name="bbsno" value="<%=request.getParameter("bbsno") %>">
				<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
				<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
				<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
				<div class="row">
					<div class="col">
						<input type="password" name="passwd" placeholder="Enter passwd" class="form-control" required>
					</div>
					<div class="col">
						<button class="btn btn-dark">삭제</button>
					</div>
				</div>
			</form>
		</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi_bbs.jsp" %>
<jsp:useBean id="dao" class="bbs.BbsDAO" />
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno")); //read에서 보낸 것
	BbsDTO dto = dao.noticeRead(bbsno);
%>
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
<script src="../js/board_create.js"></script>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
		<form action="updateProc.jsp" method="post">
			<div class="container px-6 py-5 mt-5">
			<input type="hidden" name="bbsno" value="<%=bbsno %>">
				<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
				<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
				<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
				<div class="form-group my-3 input-group">
					<span class="input-group-text shadow-sm col-sm-2 justify-content-center"id="basic-addon1"> 이름 </span> 
					<input type="text" class="form-control shadow-sm" name="wname" id="wname" value="<%=dto.getWname() %>" />
				</div>
				<div class="form-group my-3 input-group">
					<span class="input-group-text shadow-sm col-sm-2 justify-content-center" id="basic-addon1">제목</span> 
					<input type="text" class="form-control shadow-sm" name="title" id="title" value="<%=dto.getTitle() %>" />
				</div>
				<div class="form-group my-3 input-group">
					<span class="input-group-text shadow-sm col-sm-2 justify-content-center" id="basic-addon1">내용</span>
					<textarea class="form-control shadow-sm" rows="18" name="content" id="content"><%=dto.getContent() %></textarea>
				</div>
				<div class="form-group my-3 input-group">
					<span class="input-group-text shadow-sm col-sm-2 justify-content-center" id="basic-addon1">비밀번호</span >
					<input type="password" class="form-control shadow-sm" name="passwd" id="pwd" placeholder="비밀번호를 입력하세요."/>
				</div>
				<div class="form-group my-3">
					<div class="col-sm-offset-1 col-sm-11">
						<!--onsubmit : 유효성 체크-->
						<button type="submit" class="btn btn-primary px-4 my-3">업로드</button>
						<button type="button" class="btn btn-primary px-4 my-3" onclick="reset()">초기화</button>
					</div>
				</div>
			</div>
		</form>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
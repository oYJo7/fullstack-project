<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi_bbs.jsp"%>
<jsp:useBean id="dao" class="bbs.BbsDAO" />
<jsp:useBean id="dto" class="bbs.BbsDTO" />
<jsp:setProperty name="dto" property="*" />
<%
boolean flag = dao.noticeCreate(dto);
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
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="container mt-5">
		<div class="container p-5 my-5 border">
			<%
			if (flag) {
				out.print("공지사항을 등록하였습니다.");
			} else {
				out.print("공지사항을 등록하지 못했습니다.");
			}
			%>
		</div>
		<button class="btn btn-light" onclick="location.href='create.jsp'">다시
			등록</button>
		<button type="button" class="btn btn-light"
			onclick="location.href='list.jsp'">목록</button>
	</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
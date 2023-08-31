<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi_bbs.jsp"%>
<jsp:useBean id="dao" class="bbs.BbsDAO" />
<jsp:useBean id="dto" class="bbs.BbsDTO" />
<jsp:setProperty name="dto" property="*" />
<%
int bbsno = Integer.parseInt(request.getParameter("bbsno"));
boolean flag = dao.cmtCreate(dto, bbsno);

String nowPage = request.getParameter("nowPage");
String col = request.getParameter("col");
String word = request.getParameter("word");
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
<script type="text/javascript">
function read(){
	let url = "read.jsp";
	url += "?bbsno=<%=request.getParameter("bbsno")%>";
	
	url += "&nowPage=<%=nowPage%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";

	location.href = url;
	location.href = url;
}
</script>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="container mt-5">
		<div class="container p-5 my-5 border">
			<%
			if (flag) {
				out.print("댓글을 등록하였습니다.");
			} else {
				out.print("댓글을 등록하지 못했습니다.");
			}
			%>
		</div>
		<button class="btn btn-light" onclick="history.back()">다시 등록</button>
		<button class="btn btn-light" onclick="read()">돌아가기</button>
		<button type="button" class="btn btn-light"
			onclick="location.href='list.jsp'">목록</button>
	</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
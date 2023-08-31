<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi_bbs.jsp"%>
<jsp:useBean id="dao" class="bbs.BbsDAO" />
<jsp:useBean id="dto" class="bbs.BbsDTO" />
<jsp:setProperty name="dto" property="*" />
<%
//패스워드 체크
Map map = new HashMap();
map.put("bbsno", dto.getBbsno());
map.put("passwd", dto.getPasswd());

boolean pflag = dao.noticePassCheck(map);

boolean flag = false;
if (pflag)
	flag = dao.noticeUpdate(dto);
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
<script>
function list(){
	let url = "list.jsp";
	url += "?nowPage=<%=request.getParameter("nowPage") %>";
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";

	location.href = url;
}
</script>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="container mt-5">
		<div class="container p-5 my-5 border">
			<%
			if (!pflag) {
				out.print("패스워드 오류입니다.");
			} else if (flag) {
				out.print("공지사항을 수정하였습니다.");
			} else {
				out.print("공지사항을 수정하지 못했습니다.");
			}
			%>
		</div>
		<% if(!pflag) %> <button class="btn btn-light" onclick="history.back()">다시 시도</button>
		<button class="btn btn-light" onclick="location.href='create.jsp'">등록</button>
		<button type="button" class="btn btn-light" onclick="list()">목록</button>
	</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
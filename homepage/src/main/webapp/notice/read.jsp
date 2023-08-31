<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi_bbs.jsp"%>
<jsp:useBean id="dao" class="bbs.BbsDAO" />
<%
int ntno = Integer.parseInt(request.getParameter("bbsno"));
String nowPage = request.getParameter("nowPage");
String col = request.getParameter("col");
String word = request.getParameter("word");

dao.NoticeUpViewcnt(ntno); //조회수 증가
BbsDTO dto = dao.noticeRead(ntno); //한 건의 데이터 조회
String content = dto.getContent().replaceAll("\r\n", "<br>"); //엔터를 br태그로 변환

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
<script type="text/javascript">
	function list(){
		let url = "list.jsp";
		url += "?nowPage=<%=nowPage%>";
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
	
		location.href = url;
	}
	function update(){
		let url = "updateForm.jsp";
		url += "?nowPage=<%=nowPage%>";
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&bbsno=<%=ntno%>";
	
		location.href = url;
	}
	function del(){
		let url = "deleteForm.jsp";
		url += "?nowPage=<%=nowPage%>";
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&bbsno=<%=ntno%>";
	
		location.href = url;
	}
</script>
</head>
<body>
<jsp:include page="/menu/top.jsp" />
	<div class="container mt-5">
		<ul class="list-group mt-5">
			<li class="list-group-item list-group-item-secondary">
				<h3><%=dto.getTitle() %></h3>
			</li>
			<li class="list-group-item"><%=content %></li>
			<li class="list-group-item bg-light">name : <%=dto.getWname() %></li>
			<li class="list-group-item bg-light">view : <%=dto.getViewcnt() %></li>
			<li class="list-group-item bg-light">date/time : <%=dto.getWdate() %></li>
		</ul>
		<div class="column mt-3 mb-5">
			<button class="btn btn-dark px-4" onclick="location='create.jsp'">등록</button>
			<button class="btn btn-dark px-4" onclick="list()">목록</button>
			<button class="btn btn-dark px-4" onclick="update()">수정</button>
			<button class="btn btn-dark px-4" onclick="del()">삭제</button>
		</div>
	</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
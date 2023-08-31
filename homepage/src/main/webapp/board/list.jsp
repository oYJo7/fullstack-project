<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi_bbs.jsp"%>
<jsp:useBean id="dao" class="bbs.BbsDAO" />
<%
//검색 처리
String col = Utility.chechNull(request.getParameter("col"));
String word = Utility.chechNull(request.getParameter("word"));

if (col.equals("total"))
	word = "";

//페이지 처리
int nowPage = 1;//현재 보고있는 페이지
if (request.getParameter("nowPage") != null) {
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
}
int recordPerPage = 5;//한페이지당 보여줄 레코드갯수

int sno = ((nowPage - 1) * recordPerPage); //디비에서 가져올 시작위치
int eno = 5;//디비에서 가져올 레코드 갯수

Map map = new HashMap();
map.put("col", col);
map.put("word", word);
map.put("sno", sno);
map.put("eno", eno);

List<BbsDTO> list = dao.list(map);

int total = dao.total(col, word);

String url = "list.jsp";

String paging = Utility.paging(total, nowPage, recordPerPage, col, word, url);
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
<style>

a {
	text-decoration: none;
}
</style>
<script type="text/javascript">
function read(bbsno) {
	let url = "read.jsp";
	url += "?bbsno="+bbsno;
	url += "&nowPage=<%=nowPage%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";

	location.href = url;
}
</script>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<!-- Begin Page Content -->
	<div class="container container-fluid px-6 py-5 mt-5"
		id="scroll-target">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">게시판 목록</h1>
		<p class="mb-3">게시판 목록을 보여줍니다.</p>
		<form action="list.jsp">
			<div class="row" id="search">
				<div class="input-group mb-3">
					<select class="form-select shadow-sm" name="col">
						<option value="wname"
							<%if (col.equals("wname")) out.print("selected");%>>작성자</option>
						<option value="title"
							<%if (col.equals("title")) out.print("selected");%>>제목</option>
						<option value="content"
							<%if (col.equals("content")) out.print("selected");%>>내용</option>
						<option value="title_content"
							<%if (col.equals("title_content")) out.print("selected");%>>제목+내용</option>
						<option value="total"
							<%if (col.equals("total")) out.print("selected");%>>전체출력</option>
					</select>
					<input  type="search" class="form-control shadow-sm" name="word" required="required" value="<%=word%>" placeholder="검색어를 입력하세요." />
					<button class="btn btn-primary shadow-sm px-4">검색</button>
				</div>
			</div>
		</form>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-hover" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>No</th>
								<th>Title</th>
								<th>Name</th>
								<th>View</th>
								<th>Date/Time</th>
							</tr>
						</thead>
						<tbody id="tableBody">
							<!--table-->
							<%
							if (list.size() == 0) {
							%>
							<tr>
								<td colspan="8">등록된 글이 없습니다.</td>
			
								<%
								} else {
			
								for (int i = 0; i < list.size(); i++) {
									BbsDTO dto = list.get(i);
								%>
							
							<tr>
								<td><%=dto.getBbsno()%></td>
								<td>
									<a href="javascript:read('<%=dto.getBbsno()%>')"><%=dto.getTitle()%></a>
			                        <%
			                        if (Utility.compareDay(dto.getWdate().substring(0, 10))) {
			                        %> <img src="../images/new.gif"> 
			                        <% } %>
		                        </td>
								<td><%=dto.getWname()%></td>
								<td><%=dto.getViewcnt()%></td>
								<td><%=dto.getWdate()%></td>
							</tr>
							<%
							} //for_end
			
							} //if_end
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<%=paging%>
		<ul class="pagination justify-content-center mt-5" id="pagination">
			<!--pagination-->
		</ul>
	</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
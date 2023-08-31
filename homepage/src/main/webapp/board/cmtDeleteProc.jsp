<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_bbs.jsp"%>
<jsp:useBean id="dao" class="bbs.BbsDAO" />
<jsp:useBean id="dto" class="bbs.BbsDTO" />
<%
//int bbsno = Integer.parseInt(request.getParameter("bbsno"));
//System.out.println("bbsno: " + bbsno);

//패스워드 체크
Map map = new HashMap();
int cmtno = Integer.parseInt(request.getParameter("cmtno"));
String passwd = request.getParameter("passwd");
map.put("cmtno", cmtno);
map.put("passwd", passwd);

boolean pflag = dao.cmtPassCheck(map);

boolean flag = false;
if (pflag)
	flag = dao.cmtDelete(cmtno);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>게시판 생성</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script type="text/javascript">
function list(){
	let url = "list.jsp";
	url += "?nowPage=<%=request.getParameter("nowPage") %>";

	location.href = url;
}

function read(){
	let url = "read.jsp";
	url += "?bbsno=<%=request.getParameter("bbsno")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	
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
				out.print("댓글을 삭제하였습니다.");
			} else {
				out.print("댓글을 삭제하지 못했습니다.");
			}
			%>
		</div>
		<% if(!pflag) %> <button class="btn btn-light" onclick="history.back()">다시 시도</button>
		<button class="btn btn-light" onclick="read()">돌아가기</button>
		<button type="button" class="btn btn-light" onclick="list()">목록</button>
	</div>
</body>
</html>
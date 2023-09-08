<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi_bbs.jsp"%>
<jsp:useBean id="dao" class="bbs.BbsDAO" />
<%
int bbsno = Integer.parseInt(request.getParameter("bbsno"));
String nowPage = request.getParameter("nowPage");
String col = request.getParameter("col");
String word = request.getParameter("word");

dao.upViewcnt(bbsno); //조회수 증가
BbsDTO dto = dao.read(bbsno); //한 건의 데이터 조회
String content = dto.getContent().replaceAll("\r\n", "<br>"); //엔터를 br태그로 변환

Map map = new HashMap();
map.put("bbsno", bbsno);

List<BbsDTO> list = dao.cmtRead(map);
List<BbsDTO> cn_list = dao.cmtChildRead(map);

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
	url += "&bbsno=<%=bbsno%>";

	location.href = url;
}
function del(){
	let url = "deleteForm.jsp";
	url += "?nowPage=<%=nowPage%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&bbsno=<%=bbsno%>";

	location.href = url;
}
function cmtDel(e){
	let cmtno = document.getElementById(e.getAttribute('id')).getAttribute('id');
	let url = "cmtDeleteForm.jsp";
	url += "?nowPage=<%=nowPage%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&cmtno="+cmtno;
	url += "&bbsno=<%=bbsno%>";

	location.href = url;
}
function upHeart(e) {
	let cmtno = document.getElementById(e.getAttribute('id')).getAttribute('id');
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "request_ajax.jsp?cmtno="+cmtno, true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
			//전송 성공
			alert("공감하였습니다.");
			location.reload();
		}
	}
}
function cmtCreate(){
	let url="commentProc.jsp";
	url += "?nowPage=<%=nowPage%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";

	location.href = url;
}
function newCmt(e){
	let cmtno = document.getElementById(e.getAttribute('id')).getAttribute('id');
<%-- 	let str='<from action="commentProc.jsp" method="post"><input type="hidden" id="bbsno" name="bbsno" value="'+<%=bbsno%>+> --%>
	let str='<form action="commentProc.jsp" method="post"><input type="hidden" id="bbsno" name="bbsno" value="<%=bbsno %>"><input type="hidden" name="nowPage" value="<%=nowPage %>"><input type="hidden" name="col" value="<%=col %>"><input type="hidden" name="word" value="<%=word %>"><input type="hidden" name="prent" value=';
	str+=cmtno;
	str+='-><div class="container"><div class="row"><div class="col p-0 pe-3"><input type="text" class="form-control shadow-sm mb-2" name="wname" id="wname" placeholder="이름" /> </div><div class="col p-0"><input type="password" class="form-control shadow-sm mb-2" name="passwd" id="pwd" placeholder="비밀번호" /> </div><textarea class="form-control shadow-sm mb-2" name="content" id="content" rows="3" placeholder="댓글을 작성하세요."></textarea></div><button class="btn btn-dark mb-3" type="submit">업로드</button></form>';
	console.log(str);
	let cmtForm = document.getElementById(cmtno+"new_cmt");
	console.log(cmtno+"new_cmt");
	cmtForm.innerHTML=str;
}

</script>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />N
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

		<!-- Comments section-->
		<section>
			<div class="card bg-light mb-5">
				<div class="card-body">
					<!-- Comment form-->
					<form action="commentProc.jsp" method="post">
						<input type="hidden" id="bbsno" name="bbsno" value="<%=bbsno %>">
						<input type="hidden" name="nowPage" value="<%=nowPage %>">
						<input type="hidden" name="col" value="<%=col %>">
						<input type="hidden" name="word" value="<%=word %>">
						<input type="hidden" name="prent" value="0">
						<div class="container">
						  <div class="row">
						    <div class="col p-0 pe-3">
						      <input type="text" class="form-control shadow-sm mb-2" name="wname" id="wname" placeholder="이름" />
						    </div>
						    <div class="col p-0">
						      <input type="password" class="form-control shadow-sm mb-2" name="passwd" id="pwd" placeholder="비밀번호" />
						    </div>
						  </div>
						</div>
						<textarea class="form-control shadow-sm mb-2" name="content" id="content" rows="3" placeholder="댓글을 작성하세요."></textarea>
						<button class="btn btn-dark mb-3" type="submit">업로드</button>
					</form>
					<!-- Single comment-->
					<%
						if (list.size() != 0) {
							for (int i = 0; i < list.size(); i++) {
								BbsDTO cmtdto = list.get(i);
					%>
					<ul class="commentList list-group shadow-sm my-3">
						<li class="list-group-item bg-light fw-bold"><%=cmtdto.getCname()%> 
							<span class="badge rounded-pill text-dark" id="comment-1" style="cursor: pointer" data-bs-toggle="tooltip" data-bs-placement="top" title="공감">
								<img src="../images/heart.png" alt="Red Heart" width="16" height="16" class="mb-1 me-2" /><%=cmtdto.getHeart()%> 
							</span>
						</li>
						<li class="list-group-item"><%=cmtdto.getCmtcontent()%></li>
						<li class="list-group-item bg-light"><%=cmtdto.getCdate()%></li>
						<li class="list-group-item bg-light">
							<div class="row">
								<div class="col">
									<button class="btn btn-light" id="<%=cmtdto.getCmtno()%>" onclick="cmtDel(this)">삭제</button>
						  			<button class="btn btn-light"  id="<%=cmtdto.getCmtno()%>" onclick="newCmt(this)">댓글</button>
						  			<button class="btn btn-light" id="<%=cmtdto.getCmtno()%>" onclick="upHeart(this)">공감</button>
					  			</div>
					  		</div>
				  		</li>
			  		</ul>
			  		<div class="card-body  m-0  p-0" id="<%=cmtdto.getCmtno()%>new_cmt" style="min-height:0"></div>
			  		<%
			  			if(cn_list.size()!=0){
			  				for(int j = 0; j<cn_list.size(); j++){
			  					BbsDTO child_dto = cn_list.get(j);
			  					System.out.println("Child: "+child_dto.getPrent().split("-")[0]+"Cmt no: "+cmtdto.getCmtno());
			  					if(Integer.parseInt(child_dto.getPrent().split("-")[0])==cmtdto.getCmtno()){

			  		%>
			  		<img src="../images/re2.png" alt="Reply" width="16" height="16" class="col" style=" float:left;"" />
					<ul class="commentList list-group shadow-sm mt-0 my-1 ms-4"  style=" float:left; width: 98%;" >
						<li class="list-group-item bg-light fw-bold"><%=child_dto.getCname()%> 
							<span class="badge rounded-pill text-dark" id="comment-1" style="cursor: pointer" data-bs-toggle="tooltip" data-bs-placement="top" title="공감">
								<img src="../images/heart.png" alt="Red Heart" width="16" height="16" class="mb-1 me-2" /><%=child_dto.getHeart()%> 
							</span>
						</li>
						<li class="list-group-item"><%=child_dto.getCmtcontent()%></li>
						<li class="list-group-item bg-light"><%=child_dto.getCdate()%></li>
						<li class="list-group-item bg-light">
							<div class="row">
								<div class="col">
									<button class="btn btn-light" id="<%=child_dto.getCmtno()%>" onclick="cmtDel(this)">삭제</button>
						  			<button class="btn btn-light"  id="<%=child_dto.getCmtno()%>" onclick="newCmt(this)">댓글</button>
						  			<button class="btn btn-light" id="<%=child_dto.getCmtno()%>" onclick="upHeart(this)">공감</button>
					  			</div>
					  		</div>
				  		</li>
			  		</ul><div style="clear:both;"></div>
			  		
			  		<div class="card-body  m-0  p-0 ms-5 mt-2" id="<%=child_dto.getCmtno()%>new_cmt" style="min-height:0;"></div>
			  		<%
			  					}
			  				}
			  			}
			  		%>
			  		<%
			  		
							} //for_end
			
						} //if_end
					%>
				</div>
			</div>
		</section>
	</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
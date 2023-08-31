<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi_poll.jsp" %>
<jsp:useBean id="dto" class="poll.PollDTO"/>
<jsp:setProperty name="dto" property="*"/>
<jsp:useBean id="idto" class="poll.PollitemDTO"/>
<jsp:setProperty name="idto" property="*" />
<jsp:useBean id="service" class="poll.PollService"/>
<%
//문항별 항목 개수 가져오기
int[] itemsCnt = new int[idto.getItemTitle().length];
for (int i=1; i<=idto.getItemTitle().length; i++){
	String temp = "";
	int j = 1;
	int cnt = 0;
	while (temp != null){
		temp = request.getParameter("item"+i+"-"+j);
		j ++;
		cnt ++;
		itemsCnt[i-1] = cnt-1;
	}
}
//문항별 항목 값 저장하기
String[][] array = new String[idto.getItemTitle().length][]; //동적할당
for (int i=1; i<=idto.getItemTitle().length; i++){
	array[i-1] = new String [itemsCnt[i-1]];
	for (int j=1; j<=itemsCnt[i-1]; j++){
		array[i-1][j-1] = request.getParameter("item"+i+"-"+j);
	}
}
idto.setItems(array);

//idto.getItems()[0][1];
//System.out.println("dto: " + dto);
//System.out.println("idto: " + idto);

boolean flag = service.create(dto, idto);
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
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
		<div class="container mt-5">
			<div class="container p-5 my-5 border">
				<%
				if (flag) {
					out.print("설문조사를 등록하였습니다.");
				} else {
					out.print("설문조사를 등록하지 못했습니다.");
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
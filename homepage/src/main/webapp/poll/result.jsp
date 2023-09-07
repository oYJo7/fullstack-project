<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi_poll.jsp" %>
<jsp:useBean id="dto" class="poll.PollDTO"/>
<jsp:setProperty name="dto" property="*"/>
<jsp:useBean id="idto" class="poll.PollitemDTO"/>
<jsp:setProperty name="idto" property="*" />
<jsp:useBean id="service" class="poll.PollService"/>
<%
int parent = Integer.parseInt(request.getParameter("parent"));

//설문조사 질문 읽어오기
Vector<PollitemDTO> list = service.readQuestion(parent);
//설문조사 결과 읽어오기
Vector<PollitemDTO> itemlist = service.readPollItem(list);

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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="../js/chart.js"></script>
</head>
<body>
<jsp:include page="/menu/top.jsp" />
<div class="container mt-5">
	<% if(list.size() == 0) { %>
	<h3>응답할 설문이 없습니다.</h3>
	<%
	}else{
		int cnt = 0;
		int eloof = 0;
		int chartCnt = 0; //차트 번호
		for(int i=0; i<list.size(); i++){
			int sloof = 0;
			PollitemDTO ldto = list.get(i);
			PollitemDTO itdto = itemlist.get(cnt);
			sloof = cnt;
			int sloofParent = itdto.getParent();
			for(int j=cnt; j<itemlist.size(); j++){
				//자식 항목 몇 개인지 구하기
				PollitemDTO tempItdto = itemlist.get(j);
				if (sloofParent == tempItdto.getParent()){
					eloof ++;
				}
			}
			cnt = eloof;
	%>
	<ul class="list-group shadow-sm mt-5 mb-5">
		<li class="list-group-item list-group-item-secondary">
			<h3><%=ldto.getQuestion() %></h3>
		</li>
		<li class="list-group-item">

		<% if(itdto.getType() == 1) { %>
			<% if(sloof+1 == eloof){ %>
				<div id="<%= "item-"+i+"-"+ itdto.getType() %>" class="form-control shadow-sm bg-light my-2">※ 답변이 없습니다.</div>
			<% }else{
				for(int j=sloof+1; j<eloof; j++){ 
					PollitemDTO temp = itemlist.get(j);
			%>
			    <div id="<%= "item-"+i+"-"+ itdto.getType() %>" class="form-control shadow-sm my-2"><%= temp.getContent() %></div>
		    <% 
		    	} //for end 
			} //if end
		    %>
		<% }else if(itdto.getType() == 2) { %>
			<% if(sloof+1 == eloof){ %>
				<div id="<%= "item-"+i+"-"+ itdto.getType() %>" class="form-control shadow-sm bg-light my-2">※ 답변이 없습니다.</div>
			<% }else{
				for(int j=sloof+1; j<eloof; j++){ 
					PollitemDTO temp = itemlist.get(j);
			%>
			    <div id="<%= "item-"+i+"-"+ itdto.getType() %>" class="form-control shadow-sm my-2"><%= temp.getContent() %></div>
		    <% 
		    	} //for end 
			} //if end
		    %>
		<% 
		}else if(itdto.getType() == 3) { 
			chartCnt++;
		%>
			<div class="chart-div my-3" id="<%= "PchartCanvas-"+chartCnt %>">
           		<canvas id="<%= "ChartCanvas-"+chartCnt %>" width="400px" height="300px"></canvas>
           		<% 
        		int loofcnt = 0; //hidden count
				for(int j=sloof; j<eloof; j++){  
					PollitemDTO temp = itemlist.get(j);
					
				%>
					<input type="hidden" id="<%= "ChartCanvas-"+chartCnt+"-"+loofcnt %>" value="<%=temp.getContent()%>">
					<% loofcnt ++; %>
					<input type="hidden" id="<%= "ChartCanvas-"+chartCnt+"-"+loofcnt %>" value="<%=temp.getCount()%>">
				<% 
					loofcnt ++;
				    } //for end 
			    %>
        	</div>
        	
		<% 
		}else if(itdto.getType() == 4) {
			chartCnt++;
		%>
			<div class="chart-div my-3" id="<%= "PchartCanvas-"+chartCnt %>">
           		<canvas id="<%= "ChartCanvas-"+chartCnt %>" width="400px" height="300px"></canvas>
           		<% 
        		int loofcnt = 0; //hidden count
				for(int j=sloof; j<eloof; j++){  
					PollitemDTO temp = itemlist.get(j);
					
				%>
					<input type="hidden" id="<%= "ChartCanvas-"+chartCnt+"-"+loofcnt %>" value="<%=temp.getContent()%>">
					<% loofcnt ++; %>
					<input type="hidden" id="<%= "ChartCanvas-"+chartCnt+"-"+loofcnt %>" value="<%=temp.getCount()%>">
				<% 
					loofcnt ++;
				    } //for end 
			    %>
        	</div>
		<% 
		} //if end 
		%> 
	
		</li>
	</ul>
	<%
		} //for end
	} //if end
	%>
</div>
<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
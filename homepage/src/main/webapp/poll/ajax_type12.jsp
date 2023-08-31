<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi_poll.jsp" %>
<jsp:useBean id="dto" class="poll.PollDTO"/>
<jsp:setProperty name="dto" property="*"/>
<jsp:useBean id="idto" class="poll.PollitemDTO"/>
<jsp:setProperty name="idto" property="*" />
<jsp:useBean id="service" class="poll.PollService"/>
<%
int parent = Integer.parseInt(request.getParameter("parents"));//idto.getParents()
int type= Integer.parseInt(request.getParameter("nowPage"));
String anwser = request.getParameter("anwser");
boolean flag = service.insertVoteItem(parent, type, anwser); 
%>
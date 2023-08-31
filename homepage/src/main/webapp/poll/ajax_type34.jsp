<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi_poll.jsp" %>
<jsp:useBean id="dto" class="poll.PollDTO"/>
<jsp:setProperty name="dto" property="*"/>
<jsp:useBean id="idto" class="poll.PollitemDTO"/>
<jsp:setProperty name="idto" property="*" />
<jsp:useBean id="service" class="poll.PollService"/>
<%
String parent = request.getParameter("parents");//idto.getParents()
String[] parents = parent.split("-");
boolean flag = service.voteItem(parents); 
%>
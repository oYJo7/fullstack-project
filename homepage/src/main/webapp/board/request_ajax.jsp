<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi_bbs.jsp"%>
<jsp:useBean id="dao" class="bbs.BbsDAO" />
<%
int cmtno = Integer.parseInt(request.getParameter("cmtno"));
dao.upHeartCnt(cmtno); 
%>
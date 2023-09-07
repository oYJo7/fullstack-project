<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
 <script src="../js/game/2048.js" defer></script>
<style>
      #table {
        border-collapse: collapse;
        user-select: none;
      }
      #table td {
        border: 10px solid #bbada0;
        width: 116px;
        height: 128px;
        font-size: 50px;
        font-weight: bold;
        text-align: center;
      }
      #score {
        user-select: none;
      }
      .color-2 {
        background-color: #eee4da;
        color: #776e65;
      }
      .color-4 {
        background-color: #eee1c9;
        color: #776e65;
      }
      .color-8 {
        background-color: #f3b27a;
        color: "white";
      }
      .color-16 {
        background-color: #f69664;
        color: "white";
      }
      .color-32 {
        background-color: #f77c5f;
        color: "white";
      }
      .color-64 {
        background-color: #f75f3b;
        color: "white";
      }
      .color-128 {
        background-color: #edd073;
        color: #776e65;
      }
      .color-256 {
        background-color: #edcc62;
        color: #776e65;
      }
      .color-512 {
        background-color: #edc950;
        color: #776e65;
      }
      .color-1024 {
        background-color: #edc53f;
        color: #776e65;
      }
      .color-2048 {
        background-color: #edc22e;
        color: #776e65;
      }
</style>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="container mt-5">
		<table class="my-5" id="table"></table>
	    <div id="score">0</div>
    </div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
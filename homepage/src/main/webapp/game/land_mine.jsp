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
<script src="../js/game/land_mine.js" defer></script>
<style>
      table {
        border-collapse: collapse;
      }
      td {
        border: 1px solid #bbb;
        text-align: center;
        line-height: 20px;
        width: 20px;
        height: 20px;
        background: #888;
      }
      td.opened {
        background: white;
      }
      td.flag {
        background: red;
      }
      td.question {
        background: orange;
      }
</style>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="container my-5">
		<form class="mt-5" id="form">
	      <input placeholder="가로 줄" id="row" size="5" />
	      <input placeholder="세로 줄" id="cell" size="5" />
	      <input placeholder="지뢰" id="mine" size="5" />
	      <button>생성</button>
	    </form>
	    <div id="timer">0초</div>
	    <table id="table">
	      <tbody></tbody>
	    </table>
	    <div id="result"></div>
    </div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
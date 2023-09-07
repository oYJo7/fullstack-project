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
<script src="../js/game/calculator.js" defer></script>
<style>
    * {
      box-sizing: border-box;
    }
    #result {
      width: 180px;
      height: 50px;
      margin: 5px;
      text-align: right;
    }
    #operator {
      width: 50px;
      height: 50px;
      margin: 5px;
      text-align: center;
    }
    button {
      width: 50px;
      height: 50px;
      margin: 5px;
    }
  </style>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="container my-5">
		  <input readonly id="operator" class="mt-5"/>
		  <input readonly type="number" id="result" /> <!-- 숫자만 입력 -->
		  <div class="col">
		    <button id="num-7">7</button>
		    <button id="num-8">8</button>
		    <button id="num-9">9</button>
		    <button id="plus">+</button>
		  </div>
		  <div class="col">
		    <button id="num-4">4</button>
		    <button id="num-5">5</button>
		    <button id="num-6">6</button>
		    <button id="minus">-</button>
		  </div>
		  <div class="col">
		    <button id="num-1">1</button>
		    <button id="num-2">2</button>
		    <button id="num-3">3</button>
		    <button id="divide">/</button>
		  </div>
		  <div class="col">
		    <button id="clear">C</button>
		    <button id="num-0">0</button>
		    <button id="calculate">=</button>
		    <button id="multiply">x</button>
		  </div>
	</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
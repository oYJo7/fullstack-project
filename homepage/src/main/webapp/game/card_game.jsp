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
<script src="../js/game/card_game.js" defer></script>
<style>
      .card {
        display: inline-block;
        margin-right: 20px;
        margin-bottom: 20px;
        width: 70px;
        height: 100px;
        perspective: 140px;  /* 3차원에서 원근감을 준다.   */
      }
 
      .card-inner {
        position: relative;
        width: 100%;
        height: 100%;
        text-align: center;
        transition: transform 0.8s;
        transform-style: preserve-3d; /* 요소의 하위 항목이 3D 공간에 배치 : 카드 앞(.card-front) 뒤(.card-back) 구성*/
      }
 
      .card.flipped .card-inner {
        transform: rotateY(180deg);
      }
 
      .card-front {
        background: navy;
      }
 
      .card-front,
      .card-back {
        position: absolute;
        width: 100%;
        height: 100%;
        border: 1px solid black;
        backface-visibility: hidden; /* 사용자로 향하는 요소의 뒷면을 숨긴다. , 카드 뒤를 안보이게 한다.*/
      }
 
      .card-back {
        transform: rotateY(180deg);
      }
</style>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="container my-5">
		<div class="container mt-5" id="wrapper"></div>
	</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
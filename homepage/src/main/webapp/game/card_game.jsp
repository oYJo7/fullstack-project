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
	*{
          margin: 0;
          padding: 0;
          box-sizing: border-box;
      }
      ul {
          list-style: none;
      }
      img {
          width: 100%;
          vertical-align: top;
      }
      body {
          background: #7345fd;
      }
      .wrap__card {
          display: flex;
          align-items: center;
          justify-content: center;
          height: 100vh;
      }
      .card__inner {
          width: 700px;
          height: 700px;
          background-color: #fff;
          border-radius: 20px;
          padding: 30px;
      }
      .cards {
          display: flex;
          flex-wrap: wrap;
          justify-content: space-around;
          align-content: space-around;
          width: 100%;
          height: 100%;
         
      }
      .cards li {
          width: calc(100% / 4 - 20px);
          height: calc(100% / 4 - 20px);
          border: 1px solid #ccc;
          perspective: 1000px;
          transform-style: preserve-3d;
          position: relative;  
      }
      .cards li .view {
          position: absolute;
          background:rgba(0, 0, 255, 0.2);
          padding: 10%;
          transition: transform 0.5s linear;
          backface-visibility: hidden;
          width: 100%;
          height: 100%;
          user-select: none;
          pointer-events: none;
      }
      .cards li .view.front {
          z-index: 10;
          
          transform: rotateY(0deg);
      }
      .cards li .view.back {
          transform: rotateY(180deg);
      }
      .cards li.flip .view.front {
          transform: rotateY(-180deg);
      }
      .cards li.flip .view.back {
          transform: rotateY(0deg);
      }
      .cards li.shake {
          animation: shake 0.35s ease-in-out;
      }
      @keyframes shake {
          0% {transform: translateX(0);}
          20% {transform: translateX(-13px);}
          40% {transform: translateX(13px);}
          60% {transform: translateX(-8px);}
          80% {transform: translateX(8px);}
          100% {transform: translateX(0);}
      }
</style>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="wrap__card">
        <div class="card__inner">
            <ul class="cards">
                <li>
                    <div class="view front">
                        <img src="../images/symbol-of-spades.png" alt="symbol-of-spades.png">
                    </div>
                    <div class="view back">
                        <img src="../images/aubergine.png" alt="aubergine.png">
                    </div>
                </li>
                <li>
                    <div class="view front">
                        <img src="../images/symbol-of-spades.png" alt="symbol-of-spades.png">
                    </div>
                    <div class="view back">
                        <img src="../images/grapes.png" alt="grapes.png">
                    </div>
                </li>
                <li>
                    <div class="view front">
                        <img src="../images/symbol-of-spades.png" alt="symbol-of-spades.png">
                    </div>
                    <div class="view back">
                        <img src="../images/carrot.png" alt="carrot.png">
                    </div>
                </li>
                <li>
                    <div class="view front">
                        <img src="../images/symbol-of-spades.png" alt="symbol-of-spades.png">
                    </div>
                    <div class="view back">
                        <img src="../images/cherries.png" alt="cherries.png">
                    </div>
                </li>
                <li>
                    <div class="view front">
                        <img src="../images/symbol-of-spades.png" alt="symbol-of-spades.png">
                    </div>
                    <div class="view back">
                        <img src="../images/toffee.png" alt="toffee.png">
                    </div>
                </li>
                <li>
                    <div class="view front">
                        <img src="../images/symbol-of-spades.png" alt="symbol-of-spades.png">
                    </div>
                    <div class="view back">
                        <img src="../images/cherries.png" alt="cherries.png">
                    </div>
                </li>
                <li>
                    <div class="view front">
                        <img src="../images/symbol-of-spades.png" alt="symbol-of-spades.png">
                    </div>
                    <div class="view back">
                        <img src="../images/aubergine.png" alt="aubergine.png">
                    </div>
                </li>
                <li>
                    <div class="view front">
                        <img src="../images/symbol-of-spades.png" alt="symbol-of-spades.png">
                    </div>
                    <div class="view back">
                        <img src="../images/carrot.png" alt="carrot.png">
                    </div>
                </li>
                <li>
                    <div class="view front">
                        <img src="../images/symbol-of-spades.png" alt="symbol-of-spades.png">
                    </div>
                    <div class="view back">
                        <img src="../images/cupcake.png" alt="cupcake.png">
                    </div>
                </li>
                <li>
                    <div class="view front">
                        <img src="../images/symbol-of-spades.png" alt="symbol-of-spades.png">
                    </div>
                    <div class="view back">
                        <img src="../images/grapes.png" alt="grapes.png">
                    </div>
                </li>
                <li>
                    <div class="view front">
                        <img src="../images/symbol-of-spades.png" alt="symbol-of-spades.png">
                    </div>
                    <div class="view back">
                        <img src="../images/meat.png" alt="meat">
                    </div>
                </li>
                <li>
                    <div class="view front">
                        <img src="../images/symbol-of-spades.png" alt="symbol-of-spades.png">
                    </div>
                    <div class="view back">
                        <img src="../images/meat.png" alt="meat">
                    </div>
                </li>
                <li>
                    <div class="view front">
                        <img src="../images/symbol-of-spades.png" alt="symbol-of-spades.png">
                    </div>
                    <div class="view back">
                        <img src="../images/strawberry.png" alt="strawberry.png">
                    </div>
                </li>
                <li>
                    <div class="view front">
                        <img src="../images/symbol-of-spades.png" alt="symbol-of-spades.png">
                    </div>
                    <div class="view back">
                        <img src="../images/cupcake.png" alt="cupcake.png">
                    </div>
                </li>
                <li>
                    <div class="view front">
                        <img src="../images/symbol-of-spades.png" alt="symbol-of-spades.png">
                    </div>
                    <div class="view back">
                        <img src="../images/strawberry.png" alt="strawberry.png">
                    </div>
                </li>
                <li>
                    <div class="view front">
                        <img src="../images/symbol-of-spades.png" alt="symbol-of-spades.png">
                    </div>
                    <div class="view back">
                        <img src="../images/toffee.png" alt="toffee.png">
                    </div>
                </li>
            </ul>
        </div>
    </div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
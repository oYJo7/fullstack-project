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
<script src="../js/game/rpg_game.js" defer></script>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="container my-5">
		<form class="mt-5" id="start-screen">
	      <input id="name-input" placeholder="주인공 이름을 입력하세요!" />
	      <button id="start">시작</button>
	    </form>
	    <div id="screen">
	      <div id="hero-stat">
	        <span id="hero-name"></span>
	        <span id="hero-level"></span>
	        <span id="hero-hp"></span>
	        <span id="hero-xp"></span>
	        <span id="hero-att"></span>
	      </div>
	      <form id="game-menu" style="display: none">
	        <div id="menu-1">1.모험</div>
	        <div id="menu-2">2.휴식</div>
	        <div id="menu-3">3.종료</div>
	        <input id="menu-input" />
	        <button id="menu-button">입력</button>
	      </form>
	      <form id="battle-menu" style="display: none">
	        <div id="battle-1">1.공격</div>
	        <div id="battle-2">2.회복</div>
	        <div id="battle-3">3.도망</div>
	        <input id="battle-input" />
	        <button id="battle-button">입력</button>
	      </form>
	      <div id="message"></div>
	      <div id="monster-stat">
	        <span id="monster-name"></span>
	        <span id="monster-hp"></span>
	        <span id="monster-att"></span>
	      </div>
	    </div>
    </div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
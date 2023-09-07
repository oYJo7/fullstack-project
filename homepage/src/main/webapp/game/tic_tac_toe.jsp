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
<script src="../js/game/tic_tac_toe.js" defer></script>
<style>
h1 {
	color: orangered;
	margin-bottom: -5px;
}
p {
	margin-bottom: -10px;
}
.ui {
	display: flex;
	flex-direction: column;
	align-items: center;
}
.row2 {
	display: flex;
}
.cell {
	border: none;
	width: 80px;
	height: 80px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 24px;
	text-align: center;
	cursor: pointer;
}
.cell:active {
	outline: none;
}
/* 3*3 Grid */
#b1{
	border-bottom: 1px solid gray;
	border-right: 1px solid gray;
}

#b2 {
	border-bottom: 1px solid gray;
	border-right: 1px solid gray;
	border-left: 1px solid gray;
}

#b3 {
	border-bottom: 1px solid gray;
	border-left: 1px solid gray;
}

#b4 {
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
	border-right: 1px solid gray;
}
	
#b5 {
	border: 1px solid gray;
}

#b6 {
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
	border-left: 1px solid gray;
}

#b7 {
	border-top: 1px solid gray;
	border-right: 1px solid gray;
}

#b8 {
	border-top: 1px solid gray;
	border-right: 1px solid gray;
	border-left: 1px solid gray;
}

#b9 {
	border-top: 1px solid gray;
	border-left: 1px solid gray;
}
/* Reset Button */
#but {
	box-sizing: border-box;
	width: 95px;
	height: 40px;
	border: 1px solid dodgerblue;
	margin-left: auto;
	border-radius: 8px;
	font-family: Verdana,
		Geneva, Tahoma, sans-serif;

	background-color: whitesmoke;
	color: dodgerblue;
	font-size: 20px;
	cursor: pointer;
}

/* Player turn space */
#print {
	font-family: Verdana,
		Geneva, Tahoma, sans-serif;
	color: dodgerblue;
	font-size: 20px;
}

/* Main Container */
#main {
	text-align: center;
}

/* Game Instruction Text */
#ins {
	font-family: Verdana,Geneva,
					Tahoma, sans-serif;
	color: dodgerblue;
}

</style>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />

 <div class="mt-auto " id="main">
<!--         <h1>TIC TAC TOE</h1> -->
<!--         <p id="ins"> -->
<!--               Game starts by just Tap on -->
<!--             box<br><br>First Player starts as -->
<!--             <b>Player X </b>And Second Player as  -->
<!--             <b>Player 0</b> -->
<!--         </p> -->
        <br><br>
        <div class = "ui">
            <div class="row2">
                <input type="text" id= "b1" 
                       class="cell" onclick="myfunc_3(); myfunc();" 
                       readonly>
                <input type="text" id= "b2" 
                       class="cell" onclick="myfunc_4(); myfunc();" 
                       readonly>
                <input type="text" id= "b3" class="cell" 
                       onclick="myfunc_5(); myfunc();" 
                       readonly>
            </div>
            <div class="row2">
                <input type="text" id= "b4" 
                       class="cell" onclick="myfunc_6(); myfunc();" 
                       readonly>
                <input type="text" id= "b5" 
                       class="cell" onclick="myfunc_7(); myfunc();" 
                       readonly>
                <input type="text" id= "b6" 
                       class="cell" onclick="myfunc_8(); myfunc();" 
                       readonly>
            </div>
            <div class="row2">
                <input type="text" id= "b7" 
                       class="cell" onclick="myfunc_9(); myfunc();" 
                       readonly>
                <input type="text" id= "b8" 
                       class="cell" onclick="myfunc_10();myfunc();" 
                       readonly>
                <input type="text" id= "b9" 
                       class="cell" onclick="myfunc_11();myfunc();" 
                       readonly>
            </div>
        </div>
        <br><br><br>
        
        <button id="but" onclick="myfunc_2()">
            RESET
        </button>
        <br><br>
        <p id="print"></p>
    </div>
	
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
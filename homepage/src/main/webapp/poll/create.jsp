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
<script src="../js/vote_create.js"></script>
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<form action="createProc.jsp">
		<div class="bg-light">
			<div class="container px-6 pb-5 mt-5">
				<div class="row">
					<div class="col">
						<h1 class="h3 mb-2 mt-5">설문조사 생성</h1>
						
						<div class="form-group my-3 input-group">
							<span class="input-group-text shadow-sm col-sm-2 justify-content-center" id="basic-addon1">제목</span> 
							<input type="text" class="form-control shadow-sm" name="title" id="title" placeholder="설문조사 제목을 입력하세요." required/>
						</div>
						<div class="form-group my-3 input-group">
							<span class="input-group-text shadow-sm col-sm-2 justify-content-center">시작일</span> 
							<input type="date" class="form-control shadow-sm" name="sdate" id="sdate" required>
						</div>
						<div class="form-group my-3 input-group">
							<span class="input-group-text shadow-sm col-sm-2 justify-content-center">종료일</span> 
							<input type="date" class="form-control shadow-sm" name="edate" id="edate" required>
						</div>
						<div class="form-group my-3 input-group">
							<span class="input-group-text shadow-sm col-sm-2 justify-content-center">설문 생성</span> 
							<select class="form-select shadow-sm" id="select-box" aria-label=".form-select-lg example">
								<option selected>응답항목 종류를 선택하세요.</option>
								<option value="1">주관식 단답형</option>
								<option value="2">주관식 서술형</option>
								<option value="3">단일 선택형</option>
								<option value="4">복수 선택형</option>
								<!-- <option value="">목록 선택형</option> -->
								<!-- <option value="">선호도형</option> -->
								<!-- <option value="">연락처</option> -->
								<!-- <option value="">날짜</option> -->
								<!-- <option value="">시간</option> -->
								<!-- <option value="">파일</option> -->
							</select>
						</div>
						<div class="row">
							<div class="col">
								<button class="btn btn-primary px-4" type="button" onclick="add()">추가</button>
								<button class="btn btn-primary px-4" type="button" onclick="RS()">초기화</button>
								<button class="btn btn-primary px-4" type="submit">업로드</button>
								<input type="hidden" name="type" id="type"/>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	
		<div class="container py-5">
			<div class="row" id="vote"></div>
			<!-- <div class="container mt-5" onclick="plus()">
	                <div class="row">
	                    <div class="centered-div bg-light">
	                        <p class="fs-1">+</p>
	                    </div>
	                </div>
	            </div> -->
		</div>
	</form>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
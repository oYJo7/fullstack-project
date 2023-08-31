function reset() {
	console.log("실행됨");
    let name = document.getElementById("wname");
    let title = document.getElementById("title");
    let content = document.getElementById("content");
    let pw = document.getElementById("passwd");

    name.value = "";
    title.value = "";
    content.value = "";
    pw.value = "";

    //초기화 버튼이 form 안에 있으면 toastr이 작동 안함(?)
    toastr.success("초기화 되었습니다!", "초기화");
}

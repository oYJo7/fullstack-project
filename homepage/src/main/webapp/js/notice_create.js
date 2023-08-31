function reset() {
    let name = document.getElementById("name");
    let title = document.getElementById("title");
    let content = document.getElementById("content");
    let pw = document.getElementById("pw");

    name.value = null;
    title.value = null;
    content.value = null;
    pw.value = null;

    //초기화 버튼이 form 안에 있으면 toastr이 작동 안함(?)
    toastr.success("초기화 되었습니다!", "초기화");
}

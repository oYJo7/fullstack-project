let count = 0;
function add() {
    let select_box = document.getElementById("select-box");
    let select_text = select_box.options[select_box.selectedIndex].value;

    let parentdiv = document.getElementById("vote");

    //input hidden에 type 넘기기
    let inputType = document.getElementById("type").value;
    let tempType = inputType + select_text;
    document.getElementById("type").value = tempType;

    if (select_text == 1) {
        count++;

        let item = document.createElement("div");
        item.setAttribute("id", "item" + count);
        parentdiv.appendChild(item);

        let title = document.createElement("h3");
        title.setAttribute("class", "text-element mt-5");
        item.appendChild(title);
        title.appendChild(document.createTextNode(count + ". 주관식 단답형"));

        let inputtag = document.createElement("input");
        inputtag.setAttribute("class", "form-control shadow-sm mb-1");
        inputtag.setAttribute("name", "itemTitle");
        inputtag.setAttribute("placeholder", "설문 내용을 입력하세요.");
        inputtag.setAttribute("required", "");
        item.appendChild(inputtag);

        let answer = document.createElement("input");
        answer.setAttribute("class", "form-control shadow-sm mb-2");
        answer.setAttribute("disabled", "true");
        answer.setAttribute("placeholder", "답변");
        item.appendChild(answer);

        let removeBtn = document.createElement("button");
        removeBtn.setAttribute("id", "item" + count + "-removeBtn");
        removeBtn.setAttribute("class", "btn btn-secondary px-4");
        removeBtn.setAttribute("onclick", "removeBtn(this)");
        removeBtn.appendChild(document.createTextNode("삭제"));
        item.appendChild(removeBtn);
    } else if (select_text == 2) {
        count++;

        let item = document.createElement("div");
        item.setAttribute("id", "item" + count);
        parentdiv.appendChild(item);

        let title = document.createElement("h3");
        title.setAttribute("class", "text-element mt-5");
        item.appendChild(title);
        title.appendChild(document.createTextNode(count + ". 주관식 서술형"));

        let inputtag = document.createElement("input");
        inputtag.setAttribute("class", "form-control shadow-sm mb-1");
        inputtag.setAttribute("name", "itemTitle");
        inputtag.setAttribute("placeholder", "설문 내용을 입력하세요.");
        inputtag.setAttribute("required", "");
        item.appendChild(inputtag);

        let textarea = document.createElement("textarea");
        textarea.setAttribute("class", "form-control shadow-sm mb-2");
        textarea.setAttribute("rows", "5");
        textarea.setAttribute("disabled", "true");
        textarea.setAttribute("placeholder", "답변");
        item.appendChild(textarea);

        let removeBtn = document.createElement("button");
        removeBtn.setAttribute("id", "item" + count + "-removeBtn");
        removeBtn.setAttribute("class", "btn btn-secondary px-4");
        removeBtn.setAttribute("onclick", "removeBtn(this)");
        removeBtn.appendChild(document.createTextNode("삭제"));
        item.appendChild(removeBtn);
    } else if (select_text == 3) {
        count++;

        let item = document.createElement("div");
        item.setAttribute("id", "item" + count);
        parentdiv.appendChild(item);

        let title = document.createElement("h3");
        title.setAttribute("class", "text-element mt-5");
        item.appendChild(title);
        title.appendChild(document.createTextNode(count + ". 단일 선택형"));

        let inputtag = document.createElement("input");
        inputtag.setAttribute("class", " form-control shadow-sm mb-2");
        inputtag.setAttribute("placeholder", "설문 내용을 입력하세요.");
        inputtag.setAttribute("required", "");
        inputtag.setAttribute("name", "itemTitle");
        item.appendChild(inputtag);

        //radio 추가 시 radiogroup부터 추가
        let radiogroup = document.createElement("div");
        radiogroup.setAttribute("class", "input-group mb-2");
        radiogroup.setAttribute("id", "item" + count + "-1");
        item.appendChild(radiogroup);

        let inputGroupText = document.createElement("div");
        inputGroupText.setAttribute("class", "input-group-text");
        radiogroup.appendChild(inputGroupText);

        let radio = document.createElement("input");
        radio.setAttribute("type", "radio");
        radio.setAttribute("disabled", "");
        inputGroupText.appendChild(radio);

        let radioinput = document.createElement("input");
        radioinput.setAttribute("type", "text");
        radioinput.setAttribute("class", "form-control shadow-sm");
        radioinput.setAttribute("name", "item" + count + "-1");
        radioinput.setAttribute("placeholder", "답변 내용을 입력하세요.");
        radioinput.setAttribute("required", "");
        radiogroup.appendChild(radioinput);

        let addBtn = document.createElement("button");
        addBtn.setAttribute("class", "btn btn-success px-4");
        addBtn.setAttribute("onclick", "radioAdd(this)");
        addBtn.setAttribute("id", count + "item" + "1");
        addBtn.setAttribute("type", "button");
        addBtn.appendChild(document.createTextNode("추가"));
        radiogroup.appendChild(addBtn);

        let removeBtn = document.createElement("button");
        removeBtn.setAttribute("id", "item" + count + "-removeBtn");
        removeBtn.setAttribute("class", "btn btn-secondary px-4");
        removeBtn.setAttribute("onclick", "removeBtn(this)");
        removeBtn.setAttribute("type", "button");
        removeBtn.appendChild(document.createTextNode("삭제"));
        item.appendChild(removeBtn);
    } else if (select_text == 4) {
        count++;

        let item = document.createElement("div");
        item.setAttribute("id", "item" + count);
        parentdiv.appendChild(item);

        let title = document.createElement("h3");
        title.setAttribute("class", "text-element mt-5");
        item.appendChild(title);
        title.appendChild(document.createTextNode(count + ". 복수 선택형"));

        let inputtag = document.createElement("input");
        inputtag.setAttribute("class", " form-control shadow-sm mb-2");
        inputtag.setAttribute("placeholder", "설문 내용을 입력하세요.");
        inputtag.setAttribute("required", "");
        inputtag.setAttribute("name", "itemTitle");
        item.appendChild(inputtag);

        //radio 추가 시 radiogroup부터 추가
        let radiogroup = document.createElement("div");
        radiogroup.setAttribute("class", "input-group mb-2");
        radiogroup.setAttribute("id", "item" + count + "-1");
        item.appendChild(radiogroup);

        let inputGroupText = document.createElement("div");
        inputGroupText.setAttribute("class", "input-group-text");
        radiogroup.appendChild(inputGroupText);

        let radio = document.createElement("input");
        radio.setAttribute("type", "radio");
        radio.setAttribute("disabled", "");
        inputGroupText.appendChild(radio);

        let radioinput = document.createElement("input");
        radioinput.setAttribute("type", "text");
        radioinput.setAttribute("class", "form-control shadow-sm");
        radioinput.setAttribute("name", "item" + count + "-1");
        radioinput.setAttribute("placeholder", "답변 내용을 입력하세요.");
        radioinput.setAttribute("required", "");
        radiogroup.appendChild(radioinput);

        let addBtn = document.createElement("button");
        addBtn.setAttribute("class", "btn btn-success px-4");
        addBtn.setAttribute("onclick", "radioAdd(this)");
        addBtn.setAttribute("id", count + "item" + "1");
        addBtn.setAttribute("type", "button");
        addBtn.appendChild(document.createTextNode("추가"));
        radiogroup.appendChild(addBtn);

        let removeBtn = document.createElement("button");
        removeBtn.setAttribute("id", "item" + count + "-removeBtn");
        removeBtn.setAttribute("class", "btn btn-secondary px-4");
        removeBtn.setAttribute("onclick", "removeBtn(this)");
        removeBtn.setAttribute("type", "button");
        removeBtn.appendChild(document.createTextNode("삭제"));
        item.appendChild(removeBtn);
    } else if (select_text == 5) {
    } else if (select_text == 6) {
    } else if (select_text == 7) {
        count++;

        let item = document.createElement("div");
        item.setAttribute("id", "item" + count);
        parentdiv.appendChild(item);

        let title = document.createElement("h3");
        title.setAttribute("class", "text-element mt-5");
        item.appendChild(title);
        title.appendChild(document.createTextNode(count + ". 날짜"));

        let inputtag = document.createElement("input");
        inputtag.setAttribute("class", "form-control shadow-sm mb-1");
        inputtag.setAttribute("placeholder", "설문 내용을 입력하세요.");
        item.appendChild(inputtag);

        let answer = document.createElement("input");
        answer.setAttribute("type", "date");
        answer.setAttribute("class", "form-control shadow-sm mb-2");
        item.appendChild(answer);

        let removeBtn = document.createElement("button");
        removeBtn.setAttribute("id", "item" + count + "-removeBtn");
        removeBtn.setAttribute("class", "btn btn-secondary px-4");
        removeBtn.setAttribute("onclick", "removeBtn(this)");
        removeBtn.appendChild(document.createTextNode("삭제"));
        item.appendChild(removeBtn);
    } else if (select_text == 8) {
        count++;

        let item = document.createElement("div");
        item.setAttribute("id", "item" + count);
        parentdiv.appendChild(item);

        let title = document.createElement("h3");
        title.setAttribute("class", "text-element mt-5");
        item.appendChild(title);
        title.appendChild(document.createTextNode(count + ". 시간"));

        let inputtag = document.createElement("input");
        inputtag.setAttribute("class", "form-control shadow-sm mb-1");
        inputtag.setAttribute("placeholder", "설문 내용을 입력하세요.");
        item.appendChild(inputtag);

        let answer = document.createElement("input");
        answer.setAttribute("type", "time");
        answer.setAttribute("class", "form-control shadow-sm mb-2");
        item.appendChild(answer);

        let removeBtn = document.createElement("button");
        removeBtn.setAttribute("id", "item" + count + "-removeBtn");
        removeBtn.setAttribute("class", "btn btn-secondary px-4");
        removeBtn.setAttribute("onclick", "removeBtn(this)");
        removeBtn.appendChild(document.createTextNode("삭제"));
        item.appendChild(removeBtn);
    } else if (select_text == 9) {
    } else if (select_text == 10) {
        count++;

        let item = document.createElement("div");
        item.setAttribute("id", "item" + count);
        parentdiv.appendChild(item);

        let title = document.createElement("h3");
        title.setAttribute("class", "text-element mt-5");
        item.appendChild(title);
        title.appendChild(document.createTextNode(count + ". 파일"));

        let inputtag = document.createElement("input");
        inputtag.setAttribute("class", "form-control shadow-sm mb-1");
        inputtag.setAttribute("placeholder", "설문 내용을 입력하세요.");
        item.appendChild(inputtag);

        let file = document.createElement("input");
        file.setAttribute("type", "file");
        file.setAttribute("class", "form-control shadow-sm mb-2");
        item.appendChild(file);

        let removeBtn = document.createElement("button");
        removeBtn.setAttribute("id", "item" + count + "-removeBtn");
        removeBtn.setAttribute("class", "btn btn-secondary px-4");
        removeBtn.setAttribute("onclick", "removeBtn(this)");
        removeBtn.appendChild(document.createTextNode("삭제"));
        item.appendChild(removeBtn);
    } else {
        toastr.info("응답항목 종류를 선택하세요!", "알림");
    }
}

function RS() {
    count = 0;
    let parentdiv = document.getElementById("vote");
    parentdiv.replaceChildren();
    toastr.success("초기화 되었습니다!", "초기화");
}

function plus() {
    let select_box = document.getElementById("select-box");
    let select_text = select_box.options[select_box.selectedIndex].value;
    if (0 < select_text && select_text < 11) {
        add();
    } else {
        document.getElementById("select-box").focus();
        toastr.info("응답항목 종류를 선택하세요!", "알림");
    }
}

function radioAdd(e) {
    let id = document.getElementById(e.getAttribute("id")).getAttribute("id");

    //radio remove 버튼으로 변경
    document.getElementById(id).setAttribute("onclick", "removeRadio(this)");
    document.getElementById(id).setAttribute("class", "btn btn-secondary px-4");
    document.getElementById(id).replaceChildren();
    document.getElementById(id).appendChild(document.createTextNode("삭제"));

    let temp = id.split("item");
    id = temp[0];
    let num = Number(temp[1]) + 1;

    let parentdiv = document.getElementById("item" + id);

    //radio 추가 시 radiogroup부터 추가
    let radiogroup = document.createElement("div");
    radiogroup.setAttribute("class", "input-group mb-2");
    radiogroup.setAttribute("id", "item" + id + "-" + num);
    parentdiv.appendChild(radiogroup);

    let inputGroupText = document.createElement("div");
    inputGroupText.setAttribute("class", "input-group-text");
    radiogroup.appendChild(inputGroupText);

    let radio = document.createElement("input");
    radio.setAttribute("type", "radio");
    radio.setAttribute("disabled", "");
    inputGroupText.appendChild(radio);

    let radioinput = document.createElement("input");
    radioinput.setAttribute("type", "text");
    radioinput.setAttribute("class", "form-control shadow-sm");
    radioinput.setAttribute("placeholder", "답변 내용을 입력하세요.");
    radioinput.setAttribute("required", "");
    radioinput.setAttribute("name", "item" + id + "-" + num);
    radiogroup.appendChild(radioinput);

    let addBtn = document.createElement("button");
    addBtn.setAttribute("class", "btn btn-success px-4");
    addBtn.setAttribute("id", id + "item" + num);
    addBtn.setAttribute("onclick", "radioAdd(this)");
    addBtn.appendChild(document.createTextNode("추가"));
    addBtn.setAttribute("type", "button");
    radiogroup.appendChild(addBtn);

    //removeBtn을 맨 마지막으로 이동
    parentdiv.appendChild(document.getElementById("item" + id + "-removeBtn"));

    //input id 수정 1~n 순서대로
    //자식 요소 개수(input 박스 개수)(-3 : h3, input(설문 내용을 입력하세요.), button(삭제/추가))
    let eleCount = document.getElementById("item" + id).childElementCount - 3; //자식요소 개수
    let cnt = 0; //cnt가 eleCount와 같을 때까지 반복
    num = 1;
    let edit = 1;
    if (eleCount > 0) {
        while (eleCount != cnt) {
            //해당 id가 존재하면
            if (document.getElementById("item" + id + "-" + num)) {
                document
                    .getElementById("item" + id + "-" + num)
                    .setAttribute("id", "item" + id + "-" + edit);
                document
                    .getElementById(id + "item" + num)
                    .setAttribute("id", id + "item" + edit);
                cnt++;
                num++;
                edit++;
            } else {
                num++;
            }
        }
    }
}

function removeRadio(e) {
    let id = document.getElementById(e.getAttribute("id")).getAttribute("id");
    let temp = id.split("item");
    id = temp[0];
    let num = temp[1];
    document.getElementById("item" + id + "-" + num).remove();

    //input id 수정 1~n 순서대로
    //자식 요소 개수(input 박스 개수)(-3 : h3, input(설문 내용을 입력하세요.), button(삭제/추가))
    let eleCount = document.getElementById("item" + id).childElementCount - 3; //자식요소 개수
    let cnt = 0; //cnt가 eleCount와 같을 때까지 반복
    num = 1;
    let edit = 1;
    if (eleCount > 0) {
        while (eleCount != cnt) {
            //해당 id가 존재하면
            if (document.getElementById("item" + id + "-" + num)) {
                document
                    .getElementById("item" + id + "-" + num)
                    .setAttribute("id", "item" + id + "-" + edit);
                document
                    .getElementById(id + "item" + num)
                    .setAttribute("id", id + "item" + edit);
                cnt++;
                num++;
                edit++;
            } else {
                num++;
            }
        }
    }
}

function removeBtn(e) {
    count--;

    let id = document.getElementById(e.getAttribute("id")).getAttribute("id");
    let temp = id.split("-");
    id = temp[0];
    //id: item1
    document.getElementById(id).remove();

    //element: 배열 각각의 요소, index: 배열 인덱스
    let textElements = document.querySelectorAll(".text-element");
    textElements.forEach((element, index) => {
        const currentText = element.textContent;
        const newText = `${index + 1}. ${currentText.split(". ")[1]}`;
        element.textContent = newText;
    });

    //input hidden type 값 변경
    id = id.split("item");
    id = id[1];
    let tempType = document.getElementById("type").value;
    tempType = tempType.split("");
    tempType.splice(id - 1, 1);
    document.getElementById("type").value = tempType.join("");

    //id 수정 1~n 순서대로
    let eleCount = document.getElementById("vote").childElementCount; //자식요소 개수
    let cnt = 0; //cnt가 eleCount와 같을 때까지 반복
    let num = 1;
    let edit = 1;

    while (eleCount != cnt) {
        //해당 id가 존재하면
        if (document.getElementById("item" + num)) {
            document
                .getElementById("item" + num)
                .setAttribute("id", "item" + edit);
            document
                .getElementById("item" + num + "-removeBtn")
                .setAttribute("id", "item" + edit + "-removeBtn");
            cnt++;
            num++;
            edit++;
        } else {
            num++;
        }
    }
}

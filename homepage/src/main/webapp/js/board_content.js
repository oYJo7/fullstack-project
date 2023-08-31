function commed(e) {
    let id = document.getElementById(e.getAttribute("id")).getAttribute("id");
    let parent = document.getElementById(id);
    let text = parent.textContent;
    text = Number(text.replace(/(\s*)/g, "")) + 1;

    let temp = id.split("-");
    let num = temp[1];

    parent.textContent = text;

    let img = document.createElement("img");
    img.setAttribute("src", "../images/heart.png");
    img.setAttribute("id", "img-heart-" + num);
    img.setAttribute("width", "16");
    img.setAttribute("height", "16");
    img.setAttribute("class", "mb-1 me-2");
    parent.appendChild(img);

    //img 태그 맨 앞으로 이동
    parent.prepend(document.getElementById("img-heart-" + num));
}

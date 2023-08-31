window.onload = function () {
    const tableBody = document.getElementById("tableBody");
    const pagination = document.getElementById("pagination");
    const itemsPerPage = 10; // 한 페이지당 보여줄 아이템 수
    const title = [
        "1: 설문타이틀입니다.",
        "2: 설문타이틀입니다.",
        "3: 설문타이틀입니다.",
        "4: 설문타이틀입니다.",
        "5: 설문타이틀입니다.",
        "6: 설문타이틀입니다.",
        "7: 설문타이틀입니다.",
        "8: 설문타이틀입니다.",
        "9: 설문타이틀입니다.",
        "10: 설문타이틀입니다.",
        "11: 설문타이틀입니다.",
        "12: 설문타이틀입니다.",
        "13: 설문타이틀입니다.",
        "14: 설문타이틀입니다.",
        "15: 설문타이틀입니다.",
        "16: 설문타이틀입니다.",
        "17: 설문타이틀입니다.",
        "18: 설문타이틀입니다.",
        "19: 설문타이틀입니다.",
        "20: 설문타이틀입니다.",
    ];
    const name = "박유진";
    const view = 20;
    const date = "2023-08-10";

    let currentPage = 1;

    function renderPage(pageNumber) {
        tableBody.innerHTML = "";
        const startIndex = (pageNumber - 1) * itemsPerPage;
        const endIndex = startIndex + itemsPerPage;

        for (let i = startIndex; i < endIndex && i < title.length; i++) {
            const row = document.createElement("tr");
            if (i == 0) {
                row.innerHTML = `
                <td>${i + 1}</td>
                <td><a href="../vote/content.jsp">${
                    title[i]
                }</a><span class="badge bg-info ms-3">new</span></td>
                <td>${name}</td>
                <td>${view}</td>
                <td>${date}</td>
            `;
            } else {
                row.innerHTML = `
                <td>${i + 1}</td>
                <td><a href="../vote/content.jsp">${title[i]}</a></td>
                <td>${name}</td>
                <td>${view}</td>
                <td>${date}</td>
            `;
            }

            tableBody.appendChild(row);
        }
    }

    function renderPagination() {
        pagination.innerHTML = "";

        const totalPages = Math.ceil(title.length / itemsPerPage);

        const previousButton = document.createElement("li");
        previousButton.className = "page-item";
        previousButton.innerHTML = `<a class="page-link" href="#">Previous</a>`;
        pagination.appendChild(previousButton);

        previousButton.addEventListener("click", function () {
            if (currentPage > 1) {
                currentPage--;
                renderPage(currentPage);
            }
        });

        for (let i = 1; i <= totalPages; i++) {
            const li = document.createElement("li");
            li.className = "page-item";
            li.innerHTML = `<a class="page-link" href="#">${i}</a>`;
            pagination.appendChild(li);

            li.addEventListener("click", function () {
                currentPage = i;
                renderPage(currentPage);
            });
        }

        const nextButton = document.createElement("li");
        nextButton.className = "page-item";
        nextButton.innerHTML = `<a class="page-link" href="#">Next</a>`;
        pagination.appendChild(nextButton);

        nextButton.addEventListener("click", function () {
            if (currentPage < totalPages) {
                currentPage++;
                renderPage(currentPage);
            }
        });
    }

    renderPage(currentPage); // 초기 페이지 로딩 시 첫 페이지 표시
    renderPagination();
};

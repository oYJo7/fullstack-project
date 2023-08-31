window.onload = function () {
    const tableBody = document.getElementById("tableBody");
    const pagination = document.getElementById("pagination");
    const itemsPerPage = 10; // 한 페이지당 보여줄 아이템 수
    const title = [
        "1: 공지사항 타이틀입니다.",
        "2: 공지사항 타이틀입니다.",
        "3: 공지사항 타이틀입니다.",
        "4: 공지사항 타이틀입니다.",
        "5: 공지사항 타이틀입니다.",
        "6: 공지사항 타이틀입니다.",
        "7: 공지사항 타이틀입니다.",
        "8: 공지사항 타이틀입니다.",
        "9: 공지사항 타이틀입니다.",
        "10: 공지사항 타이틀입니다.",
        "11: 공지사항 타이틀입니다.",
        "12: 공지사항 타이틀입니다.",
        "13: 공지사항 타이틀입니다.",
        "14: 공지사항 타이틀입니다.",
        "15: 공지사항 타이틀입니다.",
        "16: 공지사항 타이틀입니다.",
        "17: 공지사항 타이틀입니다.",
        "18: 공지사항 타이틀입니다.",
        "19: 공지사항 타이틀입니다.",
        "20: 공지사항 타이틀입니다.",
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
                <td><a href="../notice/content.jsp">${
                    title[i]
                }</a><span class="badge bg-info ms-3">new</span></td>
                <td>${name}</td>
                <td>${view}</td>
                <td>${date}</td>
            `;
            } else {
                row.innerHTML = `
                <td>${i + 1}</td>
                <td><a href="../notice/content.jsp">${title[i]}</a></td>
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

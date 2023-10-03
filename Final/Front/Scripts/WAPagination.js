function Pagination() {
}
/**
 * 產生 bootstrap 5 的分頁列
 * @param page
 * @param urlTemplate
 * @param isCurrent
 * @param text
 * @returns {`<li class="page-item active"><a class="page-link" href="${*}">${string}</a></li>`|`<li class="page-item"><a class="page-link" href="${*}">${string}</a></li>`}
 */
Pagination.bootstrap5PageItemGenerator = function (page, urlTemplate, isCurrent, text) {
    let url = urlTemplate.replace("{page}", page);
    text = text || page + 1;
    if (isCurrent) {
        return `<li class="page-item active"><a class="page-link" href="${url}">${text}</a></li>`;
    } else {
        return `<li class="page-item"><a class="page-link" href="${url}">${text}</a></li>`;
    }
}
/**
 * 淺拷貝一份之後回傳
 * @returns {object} Pagination 預設值
 */
Pagination.getDefaultOptions = function () {
    let options = {
        displayPrevious: true,
        displayNext: true,
        displayFirst: true,
        displayLast: true,
        previousText: "上一頁",
        nextText: "下一頁",
        firstText: "第一頁",
        lastText: "最後一頁",
        total: 0, // 總筆數
        current: 0, // 目前頁數, 採用  0-based
        pageSize: 10, // 每頁筆數
        showPages: 5, // 顯示頁數
        containerSelector: "0",
        pageItemGenerator: Pagination.bootstrap5PageItemGenerator,
    };

    return Object.assign({}, options);
}

Pagination.prototype.render = function (options) {
    // 計算總頁數
    let totalPage = Math.ceil(options.total / options.pageSize);
    // 計算分頁列第一個頁碼, 讓 目前頁數在中閶
    let firstPage = options.current - Math.floor(options.showPages / 2);
    if (firstPage < 0) {
        firstPage = 0; // 頁碼是 0-based
    }
    // 計算結束頁碼
    let lastPage = firstPage + options.showPages - 1;
    if (lastPage > totalPage - 1) {
        lastPage = totalPage - 1; // 頁碼是 0-based
    }
    // 產生分頁列
    let html = "";
    if (options.displayFirst && options.current > 0) {
        html += options.pageItemGenerator(0, options.urlTemplate, false, options.firstText);
    }
    if (options.displayPrevious && options.current > 0) {
        html += options.pageItemGenerator(options.current - 1, options.urlTemplate, false, options.previousText);
    }
    for (let i = firstPage; i <= lastPage; i++) {
        html += options.pageItemGenerator(i, options.urlTemplate, i === options.current);
    }
    if (options.displayNext && options.current < totalPage - 1) {
        html += options.pageItemGenerator(options.current + 1, options.urlTemplate, false, options.nextText);
    }
    if (options.displayLast && options.current < totalPage - 1) {
        html += options.pageItemGenerator(totalPage - 1, options.urlTemplate, false, options.lastText);
    }
    // 顯示分頁列
    let container = document.querySelector(options.containerSelector);
    container.innerHTML = html;
}
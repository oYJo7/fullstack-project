window.onload = function () {
                const number = Number(prompt("몇 명이 참가하나요?"));
                const $button = document.querySelector("#btn");
                const $input = document.querySelector("input");
                const $word = document.querySelector("#word");
                const $order = document.querySelector("#order");

                let word; // 제시어, undefined
                let newWord; // 새로 입력한 단어

                const onClickButton = () => {
                    // 제시어가 비어 있거나 제시어 마지막자와 새로입력한 첫자가 같으면
                    if (!word || word[word.length - 1] === newWord[0]) {
                        word = newWord; // 입력한 단어를 제시어에 저장
                        $word.textContent = word; //span의 텍스트로 제시어 표시
                        const order = Number($order.textContent); // 현재 순서
                        if (order + 1 > number) {
                            $order.textContent = 1;
                        } else {
                            $order.textContent = order + 1;
                        }
                    } else {
                        // 올바르지 않은가
                        alert("올바르지 않은 단어입니다!");
                    }
                    $input.value = "";
                    $input.focus();
                };
                const onInput = (event) => {
                    newWord = event.target.value;
                };

                $button.addEventListener("click", onClickButton);
                $input.addEventListener("input", onInput); //value 속성의 값이 바뀔 때마다 발생하는 이벤트
            };
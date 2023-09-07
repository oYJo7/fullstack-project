const $input = document.querySelector('#input');
const $form = document.querySelector('#form');
const $logs = document.querySelector('#logs');
 
const numbers = []; // [1, 2, 3, 4, 5, 6, 7, 8, 9]
for (let n = 0; n < 9; n += 1) {
  numbers.push(n + 1);
}
const answer = []; // [3, 1, 4, 6]
for (let n = 0; n < 4; n += 1) { // 네 번 반복
  const index = Math.floor(Math.random() * numbers.length); // 0~8정수, number 크기는 작아진다.
  answer.push(numbers[index]); //무작위로 생성된 index로 해당하는 값을 number 에서 추출해서 answer에 저장
  numbers.splice(index, 1); //무작위로 생성된 index에 해당하는 값은 number에서 제거 (중복제거)
}
console.log(answer);
 
const tries = [];
function checkInput(input) { // 3146,   314,  3144
  if (input.length !== 4) { // 길이는 4가 아닌가
    return alert('4자리 숫자를 입력해 주세요.');
  }
  if (new Set(input).size !== 4) { // 중복된 숫자가 있는가
    return alert('중복되지 않게 입력해 주세요.');
  }
  if (tries.includes(input)) { // 이미 시도한 값은 아닌가
    return alert('이미 시도한 값입니다.');
  }
  return true;
} // 검사하는 코드

//form태그의 submit 이벤트로 Ender를 눌러 값을 제출할 수 있다.
//submit이벤트는 브라우저가 새로고침이 되는데 , 이것을 막기위해 
//event.preventDefault()를 사용했다. 이는 폼 태그의 기본동작(브라우저 새로고침)을
//취소한다.
 
$form.addEventListener('submit', (event) => {
  event.preventDefault();
  const value = $input.value;
  $input.value = '';
  if (!checkInput(value)) {
    return;
  }
  // 입력값 문제없음
  if (answer.join('') === value) { // [3, 1, 4, 6] -> '3146'
    $logs.textContent = '홈런!';
    return;
  }
  if (tries.length >= 9) {
    const message = document.createTextNode(`패배! 정답은 ${answer.join('')}`);
    $logs.appendChild(message);
    return;
  }
  // 몇 스트라이크 몇 볼인지 검사
  let strike = 0;
  let ball = 0;
  // answer: 3146,  value: 1347
  for (let i = 0; i < answer.length; i++) {
    const index = value.indexOf(answer[i]);
    if (index > -1) { // 일치하는 숫자 발견
      if (index === i) { // 자릿수도 같음
        strike += 1;
      } else { // 숫자만 같음
        ball += 1; 
      }
    }
  }
  $logs.append(`${value}: ${strike} 스트라이크 ${ball} 볼`, document.createElement('br'));
  tries.push(value);
});
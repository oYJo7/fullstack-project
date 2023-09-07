const candidate = Array(45) //new 생략가능, 배열방 45개 생성
  .fill()  //배열요소에 undefine 할당
  .map((v, i) => i + 1); //v: 처리할 현재요소,  i: 현재요소의 인덱스, undefine를 1~45값으로 대체
 
console.log(candidate);
const shuffle = [];
while (candidate.length > 0) {
  const random = Math.floor(Math.random() * candidate.length); // 무작위 인덱스 뽑기
  const spliceArray = candidate.splice(random, 1); // 뽑은 값은 원래 배열에서 제거되면서 새로운 배열에 저장된다.
  const value = spliceArray[0]; // 배열에서 값을 꺼내서
  shuffle.push(value); // shuffle 배열에 넣기
}
console.log(shuffle);
const winBalls = shuffle.slice(0, 6).sort((a, b) => a - b); //오름차순 정렬
const bonus = shuffle[6];
console.log(winBalls, bonus);
 
const $result = document.querySelector("#result");
const drawBall = (number, $parent) => {
  const $ball = document.createElement("div");
  $ball.className = "ball";
  $ball.textContent = number;
  $parent.appendChild($ball);
};
 
for (let i = 0; i < winBalls.length; i++) {
  setTimeout(() => {
    drawBall(winBalls[i], $result);
  }, (i + 1) * 1000);
}
 
const $bonus = document.querySelector("#bonus");
setTimeout(() => {
  drawBall(bonus, $bonus);
}, 7000);
 
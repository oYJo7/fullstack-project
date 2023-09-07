const $wrapper = document.querySelector("#wrapper");
 
const total = 12;
const colors = ["red", "orange", "yellow", "green", "white", "pink"];
let colorCopy = colors.concat(colors);
 
console.log(colors);
console.log(colorCopy);
 
let shuffled = [];
let clicked = [];
let completed = []; //같은 색상의 카드를 저장
let clickable = false; //12개의 색상카드를 보여주고 다시숨기면서 ture 로 변경
 
startGame();
 
function startGame() {
  clickable = false;
  shuffle();
  for (let i = 0; i < total; i += 1) {
    const card = createCard(i); //카드생성함수 호출
    card.addEventListener("click", onClickCard); //카드클릭 이벤트 설정
    $wrapper.appendChild(card); //12개 카드 .card-back 안보이고 .card_front의 카드가 보여진다.(네이비색)
  }
 
  //12개 카드를 시간차를 두고 뒤집어서 .card_back이 보여진다.(12가지 색상)
  document.querySelectorAll(".card").forEach((card, index) => {
    // 초반 12 카드 공개
    setTimeout(() => {
      card.classList.add("flipped");
    }, 1000 + 100 * index); //1초, 1.1, 1.2, ~ 2.1
  });
 
  //12개 카드를 외울시간을 두고 .card_back(여러색상)을 숨기고, 뒤집어서 .card_front 카드가 보여진다.(네이비)
  setTimeout(() => {
    // 카드 감추기
    document.querySelectorAll(".card").forEach((card) => {
      card.classList.remove("flipped");
    });
    clickable = true;
  }, 5000); //5초
}
 
// 피셔-예이츠 셔플 : card color 무작위  섞는다.
function shuffle() {
  for (let i = 0; colorCopy.length > 0; i += 1) {
    const randomIndex = Math.floor(Math.random() * colorCopy.length);
    shuffled = shuffled.concat(colorCopy.splice(randomIndex, 1));
  }
}
 
//카드생성 .card-back 에 백그라운드색상을 랜덤하게 준다.
function createCard(i) {
  // div.card > div.card-inner > (div.card-front + div.card-back)
  const card = document.createElement("div");
  card.className = "card"; // .card 태그 생성
  const cardInner = document.createElement("div");
  cardInner.className = "card-inner"; // .card-inner 태그 생성
  const cardFront = document.createElement("div");
  cardFront.className = "card-front"; // .card-front 태그 생성
  const cardBack = document.createElement("div");
  cardBack.className = "card-back"; // .card-back 태그 생성
  cardBack.style.backgroundColor = shuffled[i];
  cardInner.appendChild(cardFront); //카드 앞
  cardInner.appendChild(cardBack); //카드 뒤
  card.appendChild(cardInner);
  return card;
}
 
// 클릭한 카드를 clicked 배열에 저장
function onClickCard() {
  //열려있는 카드 클릭, 완료된 카드를 클릭, 두카드 색상이 일치하면 그대로 둔다
  if (!clickable || completed.includes(this) || clicked[0] === this) {
    return;
  }
  this.classList.add("flipped"); //카드 뒤집기
  clicked.push(this); //클릭 배열여 추가
  if (clicked.length !== 2) {
    //클릭 카드수가 2개 아니면 종료
    return;
  }
  //두카드의 색상 비교
  const firstBackColor =
    clicked[0].querySelector(".card-back").style.backgroundColor;
  const secondBackColor =
    clicked[1].querySelector(".card-back").style.backgroundColor;
 
  if (firstBackColor === secondBackColor) {
    // 두 카드가 같은 카드면
    completed.push(clicked[0]); // 맞춘 카드는 완료 배열에 저장
    completed.push(clicked[1]); //
    clicked = []; // 완료 배열에 저장 했기 때문에 클릭 배열에선 지운다.
    if (completed.length !== total) {
      //완료된 카드(다 맞춘 카드)가 12개이면 종료한다.
      return;
    }
    setTimeout(() => {
      alert(`축하합니다!`); //1초 후에 축하 메세지
      resetGame(); // 카드게임 초기화 , 다시 게임 시작을 위한 준비
    }, 1000);
    return;
  }
  //두카드가 같지 않으면
  clickable = false;
  setTimeout(() => {
    clicked[0].classList.remove("flipped"); //네이비 색 카드로 뒤집는다. (.card_front)
    clicked[1].classList.remove("flipped"); //네이비 색 카드로 뒤집는다. (.card_front)
    clicked = []; //배열 초기화
    clickable = true;
  }, 500); //0.5초
}
 
function resetGame() {
  $wrapper.innerHTML = "";
  colorCopy = colors.concat(colors);
  shuffled = [];
  completed = [];
  startGame();
}
 
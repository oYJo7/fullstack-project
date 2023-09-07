const $computer = document.querySelector("#computer");
const $score = document.querySelector("#score");
const $rock = document.querySelector("#rock");
const $scissors = document.querySelector("#scissors");
const $paper = document.querySelector("#paper");
const IMG_URL = "../images/rsp.png";
$computer.style.background = `url(${IMG_URL}) -464px 0`;
$computer.style.backgroundSize = "auto 200px";  //배경이미지 크기
 
const rspX = {
  scissors: "0", // 가위
  rock: "-220px", // 바위
  paper: "-440px", // 보
};
 
let computerChoice = "scissors";
const changeComputerHand = () => {
  //컴퓨터의 손이미지 변경하는 함수
  if (computerChoice === "rock") {
    // 바위면
    computerChoice = "scissors";
  } else if (computerChoice === "scissors") {
    // 가위면
    computerChoice = "paper";
  } else if (computerChoice === "paper") {
    // 보면
    computerChoice = "rock";
  }
  $computer.style.background = `url(${IMG_URL}) ${rspX[computerChoice]} 0`;
  $computer.style.backgroundSize = "auto 200px";
};
let intervalId = setInterval(changeComputerHand, 50); //50밀리초(0.05초)
 
const scoreTable = {
  rock: 0,
  scissors: 1,
  paper: -1,
};
 
//가위, 바위, 보 버튼을 클릭하면 점수계산 및 점수 화면 표시를 위해
//화면의 가위, 바위, 보 이미지를 잠깐 멈춘다.
let clickable = true;
let score = 0;
const clickButton = (event) => {
  if (clickable) {
    clearInterval(intervalId);
    clickable = false;
    // 점수 계산 및 화면 표시
    const myChoice =
      event.target.textContent === "바위"
        ? "rock"
        : event.target.textContent === "가위"
        ? "scissors"
        : "paper";
    const myScore = scoreTable[myChoice];
    const computerScore = scoreTable[computerChoice];
    const diff = myScore - computerScore;
 
    let message;
    // 2, -1은 승리조건이고, -2, 1은 패배조건, 점수표 참고
    if ([2, -1].includes(diff)) {
      score += 1;
      message = "승리";
    } else if ([-2, 1].includes(diff)) {
      score -= 1;
      message = "패배";
    } else {
      message = "무승부";
    }
    $score.textContent = `${message} 총: ${score}점`;
    //점수가 화면에 표시 되면 다시 화면의 가위, 바위, 보 이미지를 움직이게 한다.
    setTimeout(() => {
      clickable = true;
      intervalId = setInterval(changeComputerHand, 50);
    }, 1000);
  }
};
 
$rock.addEventListener("click", clickButton);
$scissors.addEventListener("click", clickButton);
$paper.addEventListener("click", clickButton);
 
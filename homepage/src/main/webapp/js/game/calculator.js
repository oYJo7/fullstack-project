let numOne = "";
let operator = "";  //undefine
let numTwo = "";
const $operator = document.querySelector("#operator");
const $result = document.querySelector("#result");
const onClickNumber = (event) => {
  if (!operator) {
    // operator가 비어있다
    numOne += event.target.textContent;  //화면표시 위해 문자를 연결해서 저장한다.
    $result.value += event.target.textContent; //화면표시 위해 문자를 연결해서 보여준다.
    return;
  }
  // operator가 비어있지 않고, numOne이 비어있지 않고 ,  numTwo가 비어있다.
  if (!numTwo) {
    $result.value = ""; //두번째 숫자를 보여주기 위해 화면의 첫번째 숫자를 지운다.
  }
  numTwo += event.target.textContent;
  $result.value += event.target.textContent;
};
document.querySelector("#num-0").addEventListener("click", onClickNumber);
document.querySelector("#num-1").addEventListener("click", onClickNumber);
document.querySelector("#num-2").addEventListener("click", onClickNumber);
document.querySelector("#num-3").addEventListener("click", onClickNumber);
document.querySelector("#num-4").addEventListener("click", onClickNumber);
document.querySelector("#num-5").addEventListener("click", onClickNumber);
document.querySelector("#num-6").addEventListener("click", onClickNumber);
document.querySelector("#num-7").addEventListener("click", onClickNumber);
document.querySelector("#num-8").addEventListener("click", onClickNumber);
document.querySelector("#num-9").addEventListener("click", onClickNumber);
 
const onClickOperator = (op) => () => {
  if (numOne) {
    operator = op;
    $operator.value = op;
  } else {
    alert("숫자를 먼저 입력하세요.");
  }
};
document.querySelector("#plus").addEventListener("click", onClickOperator("+"));
document
  .querySelector("#minus")
  .addEventListener("click", onClickOperator("-"));
document
  .querySelector("#divide")
  .addEventListener("click", onClickOperator("/"));
document
  .querySelector("#multiply")
  .addEventListener("click", onClickOperator("*"));
document.querySelector("#calculate").addEventListener("click", () => {
  if (numTwo) {
    switch (operator) {
      case "+":
        $result.value = parseInt(numOne) + parseInt(numTwo);
        break;
      case "-":
        $result.value = numOne - numTwo;
        break;
      case "*":
        $result.value = numOne * numTwo;
        break;
      case "/":
        $result.value = numOne / numTwo;
        break;
      default:
        break;
    }
  } else { //두번재 숫자를 입력하지 않았을때
    alert("숫자를 먼저 입력하세요.");
  }
});
document.querySelector("#clear").addEventListener("click", () => {
  numOne = "";
  operator = "";
  numTwo = "";
  $operator.value = "";
  $result.value = "";
});
 
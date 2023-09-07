const $table = document.getElementById("table");
const $score = document.getElementById("score");
let data = [];
 
startGame();
// $table -> $fragment -> $tr -> $td
function startGame() {
  const $fragment = document.createDocumentFragment(); //메모리에 4행 4열 표만든다.
  [1, 2, 3, 4].forEach(function () {
    const rowData = [];
    data.push(rowData);
    const $tr = document.createElement("tr");
    [1, 2, 3, 4].forEach(() => {
      rowData.push(0);
      const $td = document.createElement("td");
      $tr.appendChild($td);
    });
    $fragment.appendChild($tr);
  });
  $table.appendChild($fragment);
  put2ToRandomCell(); //무작위 빈칸중에 하나를 선택해서 숫자 2를 넣는다.
  draw(); //화면에 표를 그린다. 각 셀에 텍스트와 클래스를 부여한다.
}
 
//랜덤하게 행,열 위치를 뽑아서 2를 넣는다.
function put2ToRandomCell() {
  const emptyCells = []; // [[0, 0], [0, 1], [0, 2], [0, 3], ~]
  data.forEach(function (rowData, i) {
    rowData.forEach(function (cellData, j) {
      if (!cellData) {
        emptyCells.push([i, j]);
      }
    });
  });
 
  // randomCell === [i, j]
  const randomCell = emptyCells[Math.floor(Math.random() * emptyCells.length)];
  data[randomCell[0]][randomCell[1]] = 2;
}
 
//0보다 큰 셀 데이터를 텍스트에 넣고 테이블과 숫자 텍스트를 화면에 그린다.
function draw() {
  data.forEach((rowData, i) => {
    rowData.forEach((cellData, j) => {
      const $target = $table.children[i].children[j];
      if (cellData > 0) {
        $target.textContent = cellData;
        $target.className = "color-" + cellData;
      } else {
        $target.textContent = "";
        $target.className = "";
      }
    });
  });
}
 
//방향을 판단할 키보드 및 마우스 이벤트를 설정한다
window.addEventListener("keyup", (event) => {
  if (event.key === "ArrowUp") {
    moveCells("up");
  } else if (event.key === "ArrowDown") {
    moveCells("down");
  } else if (event.key === "ArrowLeft") {
    moveCells("left");
  } else if (event.key === "ArrowRight") {
    moveCells("right");
  }
});
 
let startCoord;
window.addEventListener("mousedown", (event) => {
  startCoord = [event.clientX, event.clientY];  //시작 좌표
});
window.addEventListener("mouseup", (event) => {
  const endCoord = [event.clientX, event.clientY]; //끝 좌표
  const diffX = endCoord[0] - startCoord[0]; //x 좌표 바뀐양
  const diffY = endCoord[1] - startCoord[1]; //y 좌표 바뀐양
  if (diffX < 0 && Math.abs(diffX) > Math.abs(diffY)) {
    moveCells("left");
  } else if (diffX > 0 && Math.abs(diffX) > Math.abs(diffY)) {
    moveCells("right");
  } else if (diffY > 0 && Math.abs(diffX) <= Math.abs(diffY)) {
    moveCells("down");
  } else if (diffY < 0 && Math.abs(diffX) <= Math.abs(diffY)) {
    moveCells("up");
  }
});
 
//4개의 방향(위, 아래, 왼쪽, 오른쪽)중 한 방향으로 이동한다.
function moveCells(direction) {
  switch (direction) {
    case "left": {
      //왼쪽으로 기울이면 숫자가 왼쪽으로 이동된다.
      const newData = [[], [], [], []];
      data.forEach((rowData, i) => {
        rowData.forEach((cellData, j) => {
          if (cellData) {//0이 아니면
             // newData = [2, 2, 4]
            const currentRow = newData[i];
            const prevData = currentRow[currentRow.length - 1];
             if (prevData === cellData) {
              // 이전 값과 지금 값이 같으면
              const score = parseInt($score.textContent);
              $score.textContent =
                score + currentRow[currentRow.length - 1] * 2;
              currentRow[currentRow.length - 1] *= -2;
            } else {
              newData[i].push(cellData);
            }
          }
        });
      });
      console.log(newData);
      [1, 2, 3, 4].forEach((rowData, i) => {
        [1, 2, 3, 4].forEach((cellData, j) => {
          data[i][j] = Math.abs(newData[i][j]) || 0; //-1곱한값의 절대값으로 저장한다.
        });
      });
      break;
    }
    case "right": {
      //오른쪽으로 기울면 오른쪽으로 숫자가 이동된다.
      const newData = [[], [], [], []];
      data.forEach((rowData, i) => {
        rowData.forEach((cellData, j) => {
          if (rowData[3 - j]) {
            const currentRow = newData[i];
            const prevData = currentRow[currentRow.length - 1];
            if (prevData === rowData[3 - j]) {
              //이전값과 현재 값이 같을경우
              const score = parseInt($score.textContent);
              $score.textContent =
                score + currentRow[currentRow.length - 1] * 2;
              currentRow[currentRow.length - 1] *= -2;
            } else {
              //같지 않을경우
              newData[i].push(rowData[3 - j]);
            }
          }
        });
      });
      console.log(newData);
      [1, 2, 3, 4].forEach((rowData, i) => {
        [1, 2, 3, 4].forEach((cellData, j) => {
          data[i][3 - j] = Math.abs(newData[i][j]) || 0; //절대값으로 저장
        });
      });
      break;
    }
    case "up": {
      const newData = [[], [], [], []];
      data.forEach((rowData, i) => {
        rowData.forEach((cellData, j) => {
          if (cellData) {
            const currentRow = newData[j];
            const prevData = currentRow[currentRow.length - 1];
            if (prevData === cellData) {
              const score = parseInt($score.textContent);
              $score.textContent =
                score + currentRow[currentRow.length - 1] * 2;
              currentRow[currentRow.length - 1] *= -2;
            } else {
              newData[j].push(cellData);
            }
          }
        });
      });
      console.log(newData);
      [1, 2, 3, 4].forEach((cellData, i) => {
        [1, 2, 3, 4].forEach((rowData, j) => {
          data[j][i] = Math.abs(newData[i][j]) || 0;
        });
      });
      break;
    }
    case "down": {
      const newData = [[], [], [], []];
      data.forEach((rowData, i) => {
        rowData.forEach((cellData, j) => {
          if (data[3 - i][j]) {
            const currentRow = newData[j];
            const prevData = currentRow[currentRow.length - 1];
            if (prevData === data[3 - i][j]) {
              const score = parseInt($score.textContent);
              $score.textContent =
                score + currentRow[currentRow.length - 1] * 2;
              currentRow[currentRow.length - 1] *= -2;
            } else {
              newData[j].push(data[3 - i][j]);
            }
          }
        });
      });
      console.log(newData);
      [1, 2, 3, 4].forEach((cellData, i) => {
        [1, 2, 3, 4].forEach((rowData, j) => {
          data[3 - j][i] = Math.abs(newData[i][j]) || 0;
        });
      });
      break;
    }
  }
  if (data.flat().includes(2048)) {
    // 승리
    draw();
    setTimeout(() => {
      alert("축하합니다. 2048을 만들었습니다!");
    }, 0);
  } else if (!data.flat().includes(0)) {
    // 빈 칸이 없으면 패배
    alert(`패배했습니다... ${$score.textContent}점`);
  } else {
    put2ToRandomCell(); //새로운 2를 화면 무작위로 하나 그려준다
    draw(); //현재까지의 데이터값으로 화면을 그린다.
  }
}